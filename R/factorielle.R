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

#' @export
nobs.factanal <- function(object, ...){
  k <- object$factors
  p <- nrow(object$correlation)
  p*(k+1)-k*(k-1)/2
}

#' @export
AIC.factanal <- function(object, k = 2, ...){
  n <- object$n.obs
  k <- object$factors
  p <- nrow(object$correlation)
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
#' @return alpha de Cronbach
#' @export
alpha_Cronbach <- function(x){
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
crit_emv_factanal <- function(factors, ...){
 stopifnot("Nombre de facteurs manquants" = !missing(factors))
factors <- sort(as.integer(factors))
emv_crit <- function(k, ...){
  fai <- factanal(factors = k, ...)
  stopifnot("Pas de nombre d'observations" = !is.null(fai$n.obs))
  c(k,
    AIC(fai),
    BIC = BIC(fai),
    as.numeric(fai$PVAL),
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
           heywood = res[,6])
}

#' Diagramme d'éboulis
#'
#' Crée un diagramme d'éboulis pour les
#' objets de class \code{eigen}
#' @export
#' @import ggplot2 patchwork
#' @param object objet de classe \code{eigen}
#' @param which vecteur d'entiers indiquant quels graphiques imprimer, soit \code{1} pour le diagramme d'éboulis et \code{2} pour la variance cumulative
#' @return une matrice de deux objets \code{ggplot}
eboulis <- function(object, which = 1:2){
  stopifnot(isTRUE(inherits(x = object, what = "eigen")),
            isTRUE(length(object$values) > 1))
  valpropres <- object$values
  df <- data.frame(y = valpropres,
                  x = seq_along(valpropres))
  g1 <-  ggplot2::ggplot(data = df,
                mapping = ggplot2::aes_string(x = "x",
                                              y = "y")) +
    ggplot2::geom_line() +
    ggplot2::geom_point() +
    ggplot2::scale_x_continuous(breaks = seq_along(valpropres)) +
    ggplot2::labs(x = "nombre de composantes",
         y = "valeurs propres",
         subtitle = "diagramme d'\u00e9boulis") +
    ggplot2::theme_classic()
  g2 <-  ggplot2::ggplot(data = data.frame(y = cumsum(valpropres),
                                           x = seq_along(valpropres)),
                         mapping = ggplot2::aes_string(x = "x", y = "y")) +
    ggplot2::geom_line() +
    ggplot2::geom_point() +
    ggplot2::scale_x_continuous(breaks = seq_along(valpropres)) +
    ggplot2::labs(x = "nombre de composantes",
                  y = "variance cumulative") +
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

