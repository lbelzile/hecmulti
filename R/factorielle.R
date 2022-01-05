# Méthodes S3 de base pour objects de classe "factanal"
#' @import stats
#' @importFrom graphics abline
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
