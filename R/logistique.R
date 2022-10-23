
#' Vérifications d'usage pour une variable binaire
#'
#' @param resp un vecteur numérique, binaire, logique ou un facteur
#' @return un message d'erreur ou vecteur entier avec valeurs 0L ou 1L
#' @keywords internal
.check_resp <- function(resp){
  if(is.factor(resp)){
    if(isTRUE(all(levels(resp) %in% c("0","1")))){
      resp <- ifelse(resp == "1", 1L, 0L)
    } else{
      stop("Niveaux inconnus pour le facteur \"resp\".")
    }
  } else{
    stopifnot("\"resp\" doit \u00eatre un vecteur num\u00e9rique ou entier." =
                isTRUE(any(is.numeric(resp),
                    is.integer(resp),
                    is.logical(resp))))
    resp <- as.integer(resp)
    stopifnot(isTRUE(all(resp %in% c(0L, 1L))))
  }
  return(resp)
}

#' Fonction d'efficacité du récepteur
#'
#' Cette fonction calcule l'aire sous la courbe et
#' crée un graphique de la fonction d'efficacité du
#' récepteur (courbe ROC). L'aire sous la courbe est
#' approximée en calculant la hauteur sous la fonction
#' escalier.
#'
#' Si la longueur des valeurs uniques du vecteur prob excède 10 000, alors le graphique et l'aire sont approximées en calculant des points de coupure équidistants entre 0 et 1.
#'
#' Cette fonction retourne une liste invisible avec des méthodes \code{S3}
#' @export
#' @inheritParams courbe_lift
courbe_roc <-
  function(prob, resp, plot = TRUE){
    resp <- .check_resp(resp)
    stopifnot(length(resp) == length(prob))
    # Si le nombre de valeurs uniques
    # est trop grand, potentiellement coûteux....
    pcoup <- sort(unique(c(0, prob, 1)))
    if(length(pcoup) > 1e4L){
      pcoup <- seq(0, 1, length.out = 1e4L)
    }
    n <- length(resp)
    nsucces <- sum(resp == 1L)
    nechec <- n - nsucces

    specif <- sensib <- numeric(length(pcoup))
    # Calculer vecteur de sensibilite et specificite
    # aux valeurs uniques de points de coupure
    for(i in seq_along(pcoup)){
      predy <- ifelse(prob >= pcoup[i], 1, 0)
      sensib[i] <- sum(predy & resp) / nsucces
      specif[i] <- sum(!predy & !resp) / nechec
    }
    # Aire sous la courbe
    auc <- sum(diff(specif)*sensib[-1])
    ret <-
      list(aire = auc,
           coupure = pcoup,
           sensib = sensib,
           specif = specif)
    class(ret) <- "hecmulti_roc"

    if(isTRUE(plot)){
     autoplot(ret)
    }
    invisible(ret)
  }

#' @export
autoplot.hecmulti_roc <- function(x, ...){
  graph <- ggplot2::ggplot(
    data = data.frame(x = rev(1-x$specif),
                      y = rev(x$sensib)),
    mapping = ggplot2::aes_string(x = "x",
                                  y = "y")) +
    ggplot2::geom_abline(slope = 1,
                         intercept = 0,
                         alpha = 0.5,
                         color = "grey") +
    ggplot2::geom_step(direction = "vh") +
    ggplot2::scale_x_continuous(
      breaks = seq(0,1, by = 0.25),
      labels = c("1","0.75","0.5","0.25","0"),
      limits = c(0, 1),
      expand = c(0.01, 0.01),
      name = "sp\u00e9cificit\u00e9") +
    ggplot2::scale_y_continuous(
      breaks = seq(0,1, by = 0.25),
      labels = c("0","0.25","0.5","0.75","1"),
      limits = c(0, 1),
      expand = c(0.01, 0.01),
      name = "sensibilit\u00e9") +
    ggplot2::theme_minimal() +
    ggplot2::labs(
      subtitle = "fonction d'efficacit\u00e9 du r\u00e9cepteur",
      caption = paste("aire sous la courbe:", round(x$aire,3)))
  print(graph)
  return(NULL)
}

#' @export
print.hecmulti_roc <- function(x, digits = 3, ...){
  cat("Fonction d'efficacit\u00e9 du r\u00e9cepteur\n")
  cat(paste("Aire sous la courbe:", round(x$aire, digits = 3)))
}


#' Test de calibration de Spiegelhalter
#'
#' Le test de Spiegelhalter est approximativement
#' standard normal en grand échantillon et
#'  est basé sur une décomposition d'un
#'  critère de score.
#'
#' @param prob vecteur de prédictions (probabilités)
#' @param resp vecteur d'observations (variables binaires) ou facteur avec niveaux 0 et 1.
#' @param ... autres arguments, actuellement ignorés
#' @return une liste avec éléments
#' \itemize{
#' \item{\code{stat}: }{statistique du score}
#' \item{\code{pval}: }{valeur-p}
#' }
#' @export
#' @author Leo Belzile
#' @references D.J. Spiegelhalter (1986). \emph{Probabilistic prediction in patient management and clinical trials}, Statistics in Medecine, \bold{5}(5), pp. 421-433, \doi{10.1002/sim.4780050506}.
calibration <- function(
    prob,
    resp,
    ...){

resp <- .check_resp(resp)
stopifnot(isTRUE(all(prob >= 0)),
          isTRUE(all(prob <= 1)),
          length(prob) == length(resp)
          )
	Bmoy <- mean((resp-prob)^2)
	E0 <- mean(prob*(1-prob))
	var0 <- sum(prob*(1-prob)*((1-2*prob)^2))/length(prob)^2
	Z <- (Bmoy - E0)/sqrt(var0)
	pval <- 2*pnorm(abs(Z), lower.tail = FALSE)
	result <- list(stat = Z, pval = pval)
	class(result) <- "hecmulti_spiegelhalter"
	return(result)
}

#' @export
print.hecmulti_spiegelhalter <-
  function(
    x,
    digits = 2,
    ...){
  cat("Test de calibration de Spiegelhalter (1986)\n")
  cat(paste("Statistique de test:",
            round(x$stat, digits),
            "\n")
      )
 cat(paste("valeur-p:",
           format.pval(x$pval, digits = 3))
     )
 return(invisible(x))
}

#' Courbe lift
#'
#' Pour un vecteur de probabilités estimées de succès d'un modèle \code{prob},
#' et une variable binaire \code{resp}, calculer la courbe lift.
#'
#' @param prob vecteur de probabilités estimées
#' @param resp variable réponse binaire
#' @param plot logique; si \code{TRUE}, retourne un graphique de la courbe lift
#' @param levels niveaux des points de coupure
#' @return un graphique \code{ggplot} de la courbe lift et une base de données avec la valeur du lift
#'
#'@details Le nombre de données classifiées est arrondi, contrairement au graphique
#' @export
courbe_lift <- function(prob,
                 resp,
                 plot = TRUE,
                 levels = seq(0.1, 0.9, by = 0.1)) {
  resp <- .check_resp(resp)
  # Réordonner les observations
  stopifnot(length(prob) == length(resp))
  n <- length(resp)
  od <- order(prob, decreasing = TRUE)
  prob <- prob[od]
  stopifnot(prob[1] <= 1, prob[n] >= 0)
  # Réordonner les observations
  resp <- resp[od]
  prand <- seq(from = 1,
               to = sum(resp),
               length.out = length(resp))
  slift <- cumsum(resp) / prand
  if (isTRUE(plot)) {
    g1 <- ggplot2::ggplot(
      data.frame(
        x = 100 * prand / sum(resp),
        y = 100 * cumsum(resp) / sum(resp)
      ),
      mapping = ggplot2::aes_string(x = "x",
                                    y = "y")
    ) +
      ggplot2::geom_abline(slope = 1,
                           intercept = 0,
                           linetype = 2) +
      ggplot2::geom_line() +
      ggplot2::geom_point() +
      ggplot2::scale_x_continuous(
        breaks = seq(0L, 100L, by = 20L),
        minor_breaks = seq(10L, 90L, by = 10L),
        labels = c("0", "20", "40", "60", "80", "100"),
        limits = c(0, 100),
        expand = c(0, 1)
      ) +
      ggplot2::scale_y_continuous(
        breaks = seq(0L, 100L, by = 20L),
        minor_breaks = seq(10L, 90L, by = 10L),
        labels = c("0", "20", "40", "60", "80", "100"),
        limits = c(0, 100),
        expand = c(0, 1)
      ) +
      ggplot2::labs(x = "pourcentage de positifs correctement class\u00e9s",
                    y = "pourcentage de positifs d\u00e9tect\u00e9s",
                    subtitle = "courbe lift") +
      ggplot2::theme_classic()
    print(g1)
  }
  # Calcul du lift
  qu <- quantile(seq_along(resp), levels)
  hasard <- round(qu * mean(resp))
  modele <- cumsum(resp)[round(qu)]
  data.frame(
    pourcent = as.integer(seq(10L, 90L, by = 10L)),
    hasard = as.integer(hasard),
    modele = as.integer(modele),
    lift = modele / hasard
  )
}



#' Performance d'un modèle logistique
#'
#' Calculer les statistiques d'ajustement (sensibilité, spécificité, taux de bonne classification, etc.) en fonction de points de coupures
#'
#' @inheritParams courbe_lift
#' @return une base de données avec les composantes suivantes:
#' \itemize{
#' \item{\code{coupe}}{points de coupe}
#' \item{\code{VP}: }{vrais positifs}
#' \item{\code{VN}: }{vrais négatifs}
#' \item{\code{FP}: }{faux positifs}
#' \item{\code{FN}: }{faux négatifs}
#' \item{\code{pcorrect}: }{taux de bonne classification}
#' \item{\code{sensi}: }{sensibilité}
#' \item{\code{speci}: }{spécificité}
#' \item{\code{fpos}: }{taux de faux positifs}
#' \item{\code{fneg}: }{taux de faux négatifs}
#' }
#' @export
perfo_logistique <- function(prob, resp) {
  # Gérer les facteurs
  if(is.factor(resp)){
    resp <- factor(resp) #retirer niveaux inutilises
    warning("\"resp\" est un facteur: conversion binaire implicite.")
    modalites <- levels(resp)
    if(length(modalites) != 2L){
      stop("Le nombre de niveaux de \"resp\" n'est pas deux.")
    }
    resp <- as.integer(factor(resp)) - 1L
  }
  # VRAI == 1, FAUX == 0
  cuts <- seq(from = 0.01, to = 0.99, by = 0.01)
  nsucces <- sum(resp == 1)
  nechec <- length(resp) - nsucces
  n <- length(resp)
  tab <- data.frame(coupe = cuts,
                    t(sapply(cuts, function(cut) {
                      predy <- ifelse(prob >= cut, 1, 0)
                      c1 <- sum(predy & resp) # Y=1, Yhat=1
                      c0 <- sum(!predy & !resp) # Y=0, Yhat=0
                      i1 <- sum(!predy & resp) # Y=1, Yhat=0
                      i0 <- sum(predy & !resp) # Y=0, Yhat=1
                      c(
                        VP = c1,
                        VN = c0,
                        FP = i0,
                        FN = i1,
                        pcorrect = 100 * (c0 + c1) / n,
                        sensi = 100 * c1 / (c1 + i1),
                        # Y=1 & Yhat=1 / # Y=1
                        speci = 100 * c0 / (c0 + i0),
                        # Y=0 & Yhat=0 / # Y=0
                        fpos = 100 * i0 / (c1 + i0),
                        # Y=0 & Yhat=1 / # Yhat=1
                        fneg = 100 * i1 / (c0 + i1)
                      ) # Y=1 & Yhat=0 / # Yhat=0
                    })))
  tab
}


#' Sélection du point de coupure selon gain
#'
#' La fonction calcule le gain pour une variable réponse binaire et calcule le gain (par défaut, le taux de bonne classification). Elle retourne le point de coupure optimal.
#' La fonction prend comme argument un modèle de classe
#' \code{glm} et réajuste le modèle de manière répétée pour
#' calculer la performance par validation croisée.
#' Le modèle est réajusté \code{nrep} fois.
#'
#' @param modele modèle linéaire généralisé pour variables binaires
#' @param c00 coût de classification pour vrai négatif
#' @param c11 coût de classification pour vrai positif
#' @param c01 coût de classification pour faux positif
#' @param c10 coût de classification pour faux négatif
#' @param plot booléen, si \code{TRUE}, produit un graphique du lift. La valeur par défaut est \code{FALSE}.
#' @param nrep entier, nombre de réplications pour la validation croisée
#' @param ncv entier, nombre de groupes pour la validation croisée
#' @return un graphique de la performance moyenne en fonction du point de coupure et une liste avec les points de coupure \code{ptcoupe}, la valeur optimale du point de coupure \code{opt} et la performance \code{performance}
#' @export
select_pcoupe <- function(modele,
                   c00 = 1,
                   c11 = 1,
                   c01 = 0,
                   c10 = 0,
                   plot = FALSE,
                   nrep = 10L,
                   ncv = 10L) {

  nrep <- as.integer(nrep)
  ncv <- as.integer(ncv)
  stopifnot(nrep > 0, ncv > 1)
  # Vérifier qu'on modélise des données binaires
  if (inherits(modele, what = "glm")) {
    if (family(modele)$family != "binomial") {
      stop(
        "La famille du mod\u00e8le lin\u00e9aire g\u00e9n\u00e9ralis\u00e9 (\"modele\") n'est pas ad\u00e9quate pour les donn\u00e9es binaires."
      )
    }
    if(length(as.integer(unique(modele$y))) != 2L){
      stop("Plus de deux modalit\u00e9s pour la variable r\u00e9ponse.")
    }
  } else{
    stop("Mod\u00e8le invalide: doit \u00eatre obtenu \u00e0 partir de la fonction \"glm\".")
  }
  if (is.null(nrow(modele$data))) {
    stop(
      "Mod\u00e8le ajust\u00e9 devrait contenir une base de donn\u00e9es `data` avec les variables explicatives."
    )
  }
  n <- nobs(modele)
  stopifnot("Le nombre de r\u00e9plications doit \u00eatre positif." = nrep > 0,
            "Le nombre de groupes pour la validation crois\u00e9e est nul ou n\u00e9gatif." = ncv > 0,
            "Le nombre de groupes pour la validation crois\u00e9e est sup\u00e9rieur au nombre d'observations." = ncv <= nobs(modele))
  perfor_cv <- replicate(n = nrep, expr = {
    #Shuffle the indices
    inds <- sample.int(n = n,
                       size = n,
                       replace = FALSE)
    # Split into K groups of ~ equal size
    # (from https://stackoverflow.com/a/16275428)
    form_group <-
      function(x, n) {
        split(x, cut(seq_along(x), n, labels = FALSE))
      }
    groups <- form_group(x = inds, n = ncv)
    probs <- rep(0, n)
    for (j in seq_len(ncv)) {
      probs[groups[[j]]] <- predict(
        glm(
          modele$formula,
          family = family(modele),
          data = modele$data[-groups[[j]], ]
        ),
        newdata = modele$data[groups[[j]], ],
        type = "response"
      )
    }
    perfo <- perfo_logistique(prob = probs,
                              resp = modele$y)
    gain <- perfo$VN * c00 +
      perfo$VP * c11 +
      perfo$FN * c10 +
      perfo$FP * c01
    gain
  })
  meanperfo <- rowMeans(perfor_cv)/n
  cut <- seq(from = 0.01, to = 0.99, by = 0.01)
  output <- list(optim = cut[which.max(meanperfo)],
                 pcoupe = cut,
                 gain = meanperfo,
                 c00 = c00,
                 c11 = c11,
                 c01 = c01,
                 c10 = c10,
                 probs = probs
                )
  class(output) <- "hecmulti_ptcoupe"


  if (isTRUE(plot)) {
    autoplot(output)
  }
  return(invisible(output))
}

#' @export
print.hecmulti_ptcoupe <- function(x, digits = 2, ...){
  cat(paste("Point de coupure optimal:", round(x$optim, digits = 2),"\n"))
}

#' @export
autoplot.hecmulti_ptcoupe <- function(x, ...){
  graph <- ggplot2::ggplot(
    data = data.frame(x = x$pcoup,
                      y = x$gain),
    mapping = ggplot2::aes_string(x = "x",
                                  y = "y")) +
    ggplot2::geom_line() +
    ggplot2::geom_vline(xintercept = x$optim,
                        alpha = 0.5,
                        linetype = "dashed") +
    ggplot2::labs(x = "point de coupe",
                  y = "gain moyen") +
    ggplot2::theme_classic()
  print(graph)
}


#' Prédictions par validation croisée répétée
#'
#' Le modèle est ajusté de manière répété sur chaque pli à l'aide de \code{update} avec \code{predict}.
#' Le code est conçu pour les modèles linéaires généralisés, mais devrait fonctionner avec tout modèle qui définit des génériques S3.
#' @author Léo Belzile
#' @param modele un modèle ajusté de type \code{lm} ou \code{glm}
#' @param data \code{NULL} une base de données \code{data.frame} si la liste \code{modele} n'inclut pas \code{data} parmi ses éléments
#' @param K entier, nombre de plis pour la validation croisée
#' @param nrep nombre de réplications
#' @param type type de prédiction; si \code{NULL}, la valeur par défaut est employée. S'assurer que la valeur est à une échelle logique pour le calcul de moyennes.
#' @return vecteur de prédictions
#' @export
predvc <- function(
    modele,
    data = NULL,
    K = 10L,
    nrep = 10L,
    type = NULL){
  if(!is.null(data)){
    stopifnot(is.data.frame(data))
  } else{
    stopifnot(!is.null(modele$data))
    data <- modele$data
  }
  if(is.null(type)){
    if(inherits(modele, "glm")){
      type <- "response"
    } else if(inherits(modele, "lm")){
      type <- "response"
    } else if(inherits(modele, "train")){
      type <- "raw"
    }
  }
  n <- nrow(data)
  cvpred <- matrix(nrow = n, ncol = nrep)
  for(i in seq_len(nrep)){
    inds <- sample.int(n = n, size = n, replace = FALSE)
    form_group <- function(x, n) {
      split(x, cut(seq_along(x), n, labels = FALSE))
    }
    groups <- form_group(x = inds, n = K)
    for (j in seq_len(K)) {
      if(!is.null(type)){
      cvpred[groups[[j]], i] <- predict(
        update(modele,
               data = data[-groups[[j]],]),
        newdata = data[groups[[j]], ],
        type = type)
      } else{ #use default prediction type
        cvpred[groups[[j]], i] <- predict(
          update(modele,
                 data = data[-groups[[j]],]),
          newdata = data[groups[[j]], ])
      }
    }
  }
  return(rowMeans(cvpred))
}
