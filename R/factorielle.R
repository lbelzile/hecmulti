# Méthodes S3 de base pour objects de classe "factanal"


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
AIC.factanal <- function(object, ...){
  n <- object$n.obs
  k <- object$factors
  p <- nrow(object$correlation)
  as.numeric(-2*logLik(object) + 2*nobs(object))
}

#' @export
BIC.factanal <- function(object, ...){
  n <- object$n.obs
  k <- object$factors
  p <- nrow(object$correlation)
  as.numeric(-2*logLik(object) + log(n)*nobs(object))
}
