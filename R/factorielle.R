# Méthodes S3 de base pour objects de classe "factanal"
#' @import stats
#' @export
logLik.factanal <- function(object, ...) {
  # Log-vraisemblance de la loi de Wishart
  n <- object$n.obs
  L <- object$loadings
  psi <- object$uniquenesses
  V <- tcrossprod(L) + diag(psi)
  #Johnson & Wichern, eq. 9.35
  -n/2*(as.numeric(determinant(V, logarithm = TRUE)$modulus) + sum(diag(solve(V) %*% object$correlation)))
}

#' Coefficients du score pour analyse factorielle
#'
#' Calcul des coefficients de régression
#' associés aux scores factoriels.
#'
#' @param object objet de class \code{factanal}
#' @param ... actuellement ignoré
#' @export
coefscore_factanal <- function(object, ...){
  if(!isTRUE(inherits(object, what = "factanal"))){
    stop("M\u00e9thode valide uniquement pour les objets de classe `factanal`")
  }
  stopifnot(is.list(object),
            !is.null(object$correlation),
            !is.null(object$loadings))
  solve(object$correlation) %*% object$loadings
}

#' @export
nobs.factanal <- function(object, ...){
  k <- object$factors
  p <- nrow(object$correlation)
  p*(k+1)-k*(k-1)/2
}

#' @export
AIC.factanal <- function(object, k = 2, ...){
  # n <- object$n.obs
  # k <- object$factors
  # p <- nrow(object$correlation)
  as.numeric(-2*logLik(object) + k*nobs(object))
}

#' @export
BIC.factanal <- function(object, ...){
  AIC.factanal(object, k = log(object$n.obs))
}

#' Alpha de Cronbach
#'
#' Calcul de la mesure de cohérence interne
#' pour la création d'échelles
#'
#' @param x matrice de variables numériques
#' @param na.rm logique; si \code{TRUE}, les valeurs manquantes sont enlevées avant le calcul
#' @return alpha de Cronbach
#' @export
alphaC <- function(x, na.rm = FALSE){
  if(isTRUE(na.rm[1])){
    x <- na.omit(x)
  }
  S2 <- var(rowSums(x))
  ncol(x)/(ncol(x)-1)*(S2-sum(apply(x, 2, var)))/S2
}


#' Correction de Bartlett pour analyse factorielle
#'
#' Calcule une correction de Bartlett pour l'analyse factorielle
#' @param object objet de class \code{factanal}
#' @return une liste avec les éléments suivants:
#' \describe{
#' \item{\code{statistic}}{ statistique du rapport de vraisemblance fois correction de Bartlett}
#' \item{\code{pvalue}}{valeur-p pour la statistique modifiée}
#'}
#' @export
bartlettcorr_factanal <- function(object){
  if(!isTRUE(inherits(object, what = "factanal"))){
    stop("M\u00e9thode valide uniquement pour les objets de classe `factanal`")
  }
p <- length(object$uniquenesses)
k <- object$factors
n <- object$n.obs
lrt <- object$STATISTIC *
  (1 - (2*p + 5 + 4* k)/(6 * n - 1))
pval <- pchisq(lrt,
               object$dof,
               lower.tail = FALSE)
list(statistic = as.numeric(lrt),
     pvalue = as.numeric(pval))
}


#' Critères d'information pour analyse factorielle
#'
#' Cette fonction calcule les estimation
#' du maximum de vraisemblance pour une
#' analyse factorielle.
#'
#' @export
#' @param factors le nombre de facteurs à ajuster (vecteur)
#' @param ... autres arguments passés à factanal
ajustement_factanal <- function(factors, ...){
 stopifnot("Nombre de facteurs manquants" = !missing(factors))
factors <- sort(as.integer(factors))
emv_crit <- function(k, ...){
  fai <- factanal(factors = k, ...)
  stopifnot("Pas de nombre d'observations" = !is.null(fai$n.obs))
  c(k,
    AIC(fai),
    BIC = BIC(fai),
    bartlettcorr_factanal(fai)$pvalue,# as.numeric(fai$PVAL),
    nobs(fai),
    isTRUE(any(fai$uniquenesses == 0.005)))
}
res <- t(sapply(X = factors,
                FUN = emv_crit,
                ... = ...))
data.frame(k = as.integer(res[,1]),
           AIC = res[,2],
           BIC = res[,3],
           pval = base::format.pval(res[,4], digits = 4),
           npar = as.integer(res[,5]),
           heywood = ifelse(res[,6] == 1, "oui", "non"))
}




#' Diagramme d'éboulis
#'
#' Crée un diagramme d'éboulis représentant les valeurs propres d'une matrice de covariance, soit les corrélations ou les variances des variables, en ordre décroissant.
#' @export
#' @import ggplot2 patchwork
#' @param object objet de classe \code{eigen}, \code{princomp} ou \code{prcomp}
#' @param which vecteur d'entiers indiquant quels graphiques imprimer, soit \code{1} pour le diagramme d'éboulis et \code{2} pour la variance cumulative
#' @return une matrice de deux objets \code{ggplot}
eboulis <- function(object, which = 1:2){
  if(isTRUE(inherits(x = object, what = "eigen"))){
    stopifnot(isTRUE(length(object$values) > 1))
    valpropres <- object$values
  } else if(isTRUE(inherits(x = object, what = "princomp"))){
    valpropres <-
      as.numeric(object$sdev)^2*object$n.obs/(object$n.obs - 1L)
  } else if(isTRUE(inherits(x = object, what = "prcomp"))){
    valpropres <-  object$sdev^2
  } else{
    stop("Objet de classe inconnue.")
  }

  df <- data.frame(y = valpropres,
                   x = seq_along(valpropres))
  g1 <-  ggplot2::ggplot(data = df,
                mapping = ggplot2::aes(x = .data$x,
                                              y = .data$y)) +
    ggplot2::geom_line() +
    ggplot2::geom_point() +
    ggplot2::scale_x_continuous(breaks = seq_along(valpropres)) +
    ggplot2::labs(x = "nombre de composantes",
         y = "valeurs propres",
         subtitle = "diagramme d'\u00e9boulis") +
    ggplot2::theme_classic()
  g2 <-  ggplot2::ggplot(data = data.frame(y = cumsum(valpropres)/sum(valpropres),
                                           x = seq_along(valpropres)),
                         mapping = ggplot2::aes(x = .data$x, y = .data$y)) +
    ggplot2::geom_line() +
    ggplot2::geom_point() +
    ggplot2::scale_x_continuous(breaks = seq_along(valpropres)) +
    ggplot2::labs(x = "nombre de composantes",
                  y = "variance cumulative (%)") +
    ggplot2::theme_classic()
  stopifnot(isTRUE(all(which %in% c(1, 2))))
  if(length(which) == 1){
   if(which == 1){
    g1
  } else if(which == 2){
    g2
  }
  } else{
    patchwork::wrap_plots(list(g1, g2))
  }
}

#' Analyse factorielle avec composantes principales
#'
#' Cette fonction calcule une décomposition spectrale d'une matrice de corrélation ou de covariance des données et extrait les k premières composantes selon \code{nfact}, soit un entier ou le critère de Kaiser.
#'
#' @param x une matrice ou base de données
#' @param nfact entier pour le nombre de facteurs, ou chaîne de caractère \code{"kaiser"} pour le critère des valeurs propres.
#' @param covmat matrice de covariance
#' @param cor logique; si \code{TRUE}, calculer la décomposition à partir de la matrice de corrélation plutôt que la matrice de covariance. Il est fortement conseillé de ne pas toucher à cet argument (voir Détails).
#' @details Puisque les facteurs sont dérivés à partir des composantes principales, les facteurs avant rotation sont en ordre décroissant de variance. Ce n'est plus le cas si on fait la rotation varimax. La sortie retourne les composantes permutées (mais les étiquettes sont arbitraires).
#'
#' Il est aussi important de noter que, si l'on peut effectuer une décomposition en valeurs propres et vecteurs propres de la matrice de covariance et effectuer une rotation varimax subséquente, les chargements ne correspondent plus à des corrélations et sont difficilement interprétables.
#' @return une liste avec composante \code{loadings} contenant les chargements et si le nombre de facteurs est supérieur à un, la matrice de rotation varimax.
#' @export
#' @examples
#' factocp(covmat = cov(fact), nfact = 2)
#' factocp(factor, nfact = "kaiser")
factocp <- function(x,
                    nfact = "kaiser",
                    covmat = NULL,
                    cor = TRUE){
  col.names <- NULL
  if(is.null(covmat)){
    col.names <- colnames(x)
    x <- try(as.matrix(x))
    if(inherits(x, "try-error")){
      stop("Argument invalide: pas de donn\u00e9es num\u00e9riques en intrant.")
    }
  if(isTRUE(cor)){
    decompo <- eigen(cor(x))
  } else{
    decompo <- eigen(cov(x))
  }
  } else{
    if(isTRUE(cor)){
      covmat <- cov2cor(covmat)
    }
    decompo <- eigen(covmat)
  }
  # Extraire les valeurs propres
  valpropres <- decompo$values
  variance_cumu <- cumsum(valpropres)/sum(valpropres)
  if(nfact == "kaiser"){
  # Critère de Kaiser
  nfact <- sum(valpropres > 1)
  } else{
    nfact <- as.integer(nfact)
    if(nfact > length(valpropres) | nfact < 0){
      stop("Nombre de facteurs invalide.")
    }
  }
  # Extraire les premiers vecteurs propres
  Gamma_est <- t(t(decompo$vectors[,seq_len(nfact), drop = FALSE]) * sqrt(decompo$values[seq_len(nfact)]))
 # browser()
  if(!is.null(col.names)){
    stopifnot(length(col.names) == nrow(Gamma_est))
    row.names(Gamma_est) <- col.names
  }
  if(nfact == 1L){
    colnames(Gamma_est) <- paste0("F", seq_len(nfact))
    facto_cp <- list(loadings = Gamma_est)
  } else {
  # Solution (chargements) avec rotation varimax
  facto_cp <- varimax(Gamma_est)
    # Réordonner en ordre décroissant de variance
  od <- order(colSums(facto_cp$loadings^2),
              decreasing = TRUE)
  facto_cp$loadings <- facto_cp$loadings[,od]
  # facto_cp <- as.matrix(facto_cp)
  colnames(facto_cp$loadings) <- paste0("F", seq_len(nfact))
  }

  facto_cp$var_cumul <- variance_cumu
  class(facto_cp$loadings) <- "loadings"
  class(facto_cp) <- "factanalcp"
  return(facto_cp)
}

#' @export
print.factanalcp <- function(x, ...){
  args <- list(...)
  cutoff <- args$cutoff
  if(is.null(cutoff)){
    cutoff <- 0.3
  }
  print(x$loadings, cutoff = cutoff)
}

#' Création d'échelles
#'
#' Calcul de moyennes de colonnes à partir d'une base de données,
#' en regroupant les variables dont les chargements excèdent le seuil
#'
#' @param chargements matrice de chargements, \code{loadings}
#' @param data matrice ou base de données
#' @param seuil valeur du seuil pour les chargements
#' @return une liste avec les échelles, \code{echelles}, et les valeurs du alpha de Cronbach, \code{alpha}
#' @export
creation_echelles <- function(chargements, data, seuil = 0.4){
  stopifnot(length(seuil) == 1, seuil > 0, seuil < 1)
  if(class(chargements) %in% c("princomp", "factanalcp","factanal")){
    chargements <- stats::loadings(chargements)
  }
    nc <- ncol(chargements)
    echelles <- matrix(nrow = nrow(data), ncol = nc)
  alpha <- numeric(nc)
  for(j in seq_len(nc)){
    signif <- abs(chargements[,j]) > seuil
    if(length(unique(sign(chargements[signif(j), j]))) != 1L){
      warning("Certains chargements ont des signes inverses.")
    }
    echelles[,j] <- rowMeans(data[,signif])
    alpha[j] <- alphaC(data[,signif])
    colnames(echelles) <- names(alpha) <- paste0("E", 1:nc)
  }
  return(list(echelles = echelles, alpha = alpha))
}


#' Critère parallèle de Horn
#'
#' Cette fonction calcule par Monte Carlo les quantiles de la
#' distribution des valeurs propres pour une matrice de corrélation
#' de données indépendantes de dimension p, par le biais de tirages
#' d'une loi de Wishart
#' @param n nombre d'observations
#' @param p nombre de variables explicatives
#' @param niveau niveau pour le quantile
#' @param nsim nombre de simulations
#' @return un vecteur de quantiles pour les valeurs propres
horn_parallele <- function(n, p, niveau = 0.95, nsim = 1000L){
  n <- nrow(data)
  p <- ncol(data)
  apply(
    X = apply(
      X = rWishart(n = nsim,
               df = n - 1,
               Sigma = diag(p)),
      MARGIN = 3,
      FUN = function(x){
      eigen(cov2cor(x),
            symmetric = TRUE,
            only.values = TRUE)$values}),
    MARGIN = 1,
    FUN = quantile,
    probs = niveau)
}
