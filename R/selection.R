#' Moyenne de modèles avec sélection séquentielle
#'
#' Cette fonction crée une copie du jeu de données par
#' autoamorçage nonparamétrique. La procédure \code{stepAIC}
#' de \pkg{MASS} est utilisée avec le modèle maximal spécifié dans
#' \code{formula} est considéré. Le modèle sélectionné est celui avec la plus
#' petite valeur du critère d'information selon la pénalité \code{ks};
#' la valeur par défaut correspond au critère d'Akaike.
#'
#' @importFrom MASS stepAIC
#' @export
#' @param data base de données de type \code{data.frame}
#' @param formula formule du modèle maximal considéré
#' @param aic logique; si \code{TRUE}, retourner le modèle qui retourne le plus petit critère d'Akaike
#' @param B entier, le nombre de réplications
#' @param ks valeur de la pénalisation pour le dernier modèle de \code{stepAIC}
#' @return une liste avec
#' \itemize{
#' \item{\code{coefs}}{vecteur des coefficients}
#' \item{\code{nselect}}{nombre de coefficients non-nuls}
#' }
moyenne_modeles_stepAIC <- function(
      data,
      formula,
      aic = TRUE,
      B = 100L,
      ks = 2){
   B <- as.integer(B)
   stopifnot(is.logical(aic),
             length(aic) == 1L,
             inherits(formula, "formula"),
             B > 1,
             ks >= 0,
             inherits(data, "data.frame"))
   ks <- ks[1]
   N <- nrow(data)
   # Faire une expansion pour obtenir colonnes
   matmod <- model.matrix(formula, data = data)
   # Nombre de variables explicatives
   p <- ncol(matmod) - 1L
   # formulaule du modèle complet
   fmod <- formula(paste0("y ~", paste0("x", seq_len(p), collapse = "+")))
   # Sauvegarder les noms
   noms <- colnames(matmod)
   xnoms <- paste0("x", seq_len(p))
   # Extraire le nom de la variable réponse
   nom_reponse <- all.vars(formula)[attr(terms(formula), "response")]
   # Créer une base de données avec la réponse
   # moins l'ordonnée à l'origine
   matmod <- data.frame(cbind(
      y = get(nom_reponse, data),
      matmod[,-1]))
   colnames(matmod) <- c("y", xnoms)
   # Contenant pour params/ nb de sélections
   params <- nselect <- rep(0, p + 1)
   names(params) <-
      names(nselect) <-
      c("(Intercept)", xnoms)

   # Boucle
   for(b in seq_len(B)){
      # Procédure de sélection avec AIC ou BIC
      modselect <- MASS::stepAIC(
         # Valeurs de départ
         object = lm(formula = y ~ 1,
                     # Rééchantillonner données (avec remplacement)
                     data = matmod[sample.int(n = N,
                                              size = N,
                                              replace = TRUE),]),
         # Modèle maximal additif considéré
         scope = fmod,
         # pénalité pour critère d'information
         # k = ifelse(aic, 2, log(N)),
         direction = "both",
         trace = FALSE,
         keep = function(mod, AIC, ...){
            # autres sorties des modèles à conserver
            list(IC = AIC(mod, k = ifelse(aic, 2, log(N))),
                 coef = coef(mod))},
         k = ks)
      min_IC <- which.min(unlist(modselect$keep['IC',]))
      coefsv <- modselect$keep[2,min_IC]$coef
      # Trouver quelles colonnes représentent
      #  un coefficient non-nul
      colind <- match(names(coefsv),
                      names(params))
      # Incrémenter paramètres non-nuls
      params[colind] <- params[colind] +
         as.numeric(coefsv)
      nselect[colind] <- nselect[colind] + 1L
   }

   names(nselect) <- noms
   names(params) <- noms
   return(list(coefs = params / B,
               nselect = nselect[-1] / B))
}



#' Calcul de la racine de l'erreur quadratique moyenne
#'
#' Pour un objet de class \code{regsubsets},
#' calculer l'erreur quadratique moyenne de validation
#' pour une base de données externe. Le modèle calcule
#' la matrice du modèle pour extraire les colonnes.
#'
#' @export
#' @param model objet de classe \code{regsubsets}
#' @param select vecteur des modèles sélectionnés
#' @param formula formule désignant le modèle maximal ajusté par la procédure de sélection
#' @param data base de données d'entraînement servant à l'ajustement des coefficients
#' @param newdata base de données de validation pour le calcul de l'erreur moyenne quadratique
#' @return estimation de la racine de l'erreur quadratique moyenne
eval_EQM_regsubsets <-
  function(
      model,
      select = c("AIC", "BIC"),
      formula,
      data,
      newdata){
   stopifnot(inherits(model, "regsubsets"),
             inherits(formula, "formula"),
             is.vector(select),
             inherits(data, "data.frame"),
             inherits(newdata, "data.frame"),
             isTRUE(ncol(data) == ncol(newdata)),
             isTRUE(all(colnames(data) == colnames(newdata))))

   if(isTRUE(any(!select %in% c("AIC", "BIC")))){
      # Either we find the model with the smallest AIC and BIC
      # Else evaluate particular models from the path
      stopifnot(is.integer(select))
      select_ic <- FALSE
   }  else{
      select_ic <- TRUE
   }
   # Extraire matrice du modèle, plus variable réponse
   frame <- model.frame(formula, data = data)
   response_name <- as.character(formula)[[2]]
   reponse <- get(pos = data, x = response_name)
   resume <- summary(model, matrix.logical = TRUE)

   if(select_ic){
      nobs <- model$nn
      bic <- resume$bic
      aic <- resume$bic - (log(nobs)+2)*rowSums(resume$which)
      select_id <- c(which.min(aic), which.min(bic))[c("AIC" %in% select,"BIC" %in% select)]
      select <- sort(select)
   } else{
      select_id <- select
   }
   var_names <- colnames(resume$which)
   model_matrix <- as.data.frame(
      model.matrix(formula, data = data))
   valid_matrix <- as.data.frame(
      model.matrix(formula, data = newdata))
   valid_resp <- model.response(
      model.frame(formula, data = newdata))
   # Check formula is correct
   stopifnot(all(colnames(model_matrix) == var_names),
             var_names[1] == "(Intercept)")
   model_matrix$reponse <- reponse
   eqm <- rep(0, length(select))
   names(eqm) <- select
   for(i in seq_along(select_id)){
      vlist <- which(resume$which[select_id[i],])[-1]
      new_formula <- paste0("reponse~",
                            paste(var_names[vlist],
                                  collapse = "+"))
      linmod <- lm(new_formula,
                   data = model_matrix)
      pred <- predict(linmod,
                      newdata = valid_matrix)
      eqm[i] <- mean(x = (valid_resp - pred)^2, na.rm = TRUE)
   }
   return(sqrt(eqm))
}

#' Prédiction pour regsubsets
#'
#' Cette fonction calcule les prédictions d'un modèle linéaire ajusté
#' contenant \code{id} variables et multiplie les coefficients par la matrice du modèle
#' pour retourner des prédictions.
#' @param object objet de classe \code{regsubsets}
#' @param newdata base de données (\code{data.frame}) contenant les variables explicatives
#' @param id [entier] numéro du modèle ajusté par \code{regsubsets} pour lequel obtenir des prédictions
#' @param ... autres arguments, actuellement ignorés
#' @return un vecteur de prédictions
#' @author R. Jordan Crouser
#' @export
predict.regsubsets <- function(object, newdata, id, ...) {
  id <- as.integer(id)
  stopifnot(isTRUE(inherits(object, "regsubsets")),
            isTRUE(inherits(newdata, "data.frame")),
            id >= 1,
            id <= object$nvmax)
  form <- as.formula(get(object$call[[2]])) # Extract the formula used when we called regsubsets()
  mat <- model.matrix(form, newdata)    # Build the model matrix
  coefi <- coef(object, id = id)          # Extract the coefficients of the ith model
  xvars <- names(coefi)                # Pull out the names of the predictors used in the ith model
  pred <-
    as.numeric(mat[, xvars] %*% coefi)        # Make predictions using matrix multiplication
  if (isTRUE(any(is.na(pred)))) {
    warning("Valeurs manquantes dans les pr\u00e9dictions")
  }
  return(pred)
}

