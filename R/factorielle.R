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
#' Crée un diagramme d'éboulis représentant les valeurs propres d'une matrice de covariance, soit les ou les variances des variables, en ordre décroissant.
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
                mapping = ggplot2::aes_string(x = "x",
                                              y = "y")) +
    ggplot2::geom_line() +
    ggplot2::geom_point() +
    ggplot2::scale_x_continuous(breaks = seq_along(valpropres)) +
    ggplot2::labs(x = "nombre de composantes",
         y = "valeurs propres",
         subtitle = "diagramme d'\u00e9boulis") +
    ggplot2::theme_classic()
  g2 <-  ggplot2::ggplot(data = data.frame(y = cumsum(valpropres)/sum(valpropres),
                                           x = seq_along(valpropres)),
                         mapping = ggplot2::aes_string(x = "x", y = "y")) +
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
#' @param covmat matrice de covariance
#' @param cor logique; si \code{TRUE}, calculer la décomposition à partir de la matrice de corrélation plutôt que la matrice de covariance
#' @param nfact entier pour le nombre de facteurs, ou chaîne de caractère \code{"kaiser"} pour le critère des valeurs propres.
#' @return une liste avec composante \code{loadings} contenant les chargements et si le nombre de facteurs est supérieur à un, la matrice de rotation varimax.
#' @export
#' @examples
#' factocp(covmat = cov(factor), nfact = 2)
#' factocp(factor, nfact = "kaiser", cor = FALSE)
factocp <- function(x,
                    covmat = NULL,
                    cor = TRUE,
                    nfact = "kaiser"){
  col.names <- NULL
  std <- TRUE
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
    etype <- sqrt(diag(covmat))
    std <- FALSE
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
  if(!is.null(col.names)){
    stopifnot(length(col.names) == nrow(Gamma_est))
    row.names(Gamma_est) <- col.names
  }
  colnames(Gamma_est) <-
    paste0("F", seq_len(ncol(Gamma_est)))
  # Solution (chargements) avec rotation varimax
  facto_cp <- varimax(Gamma_est)
  #Ne fonctionne pas avec vecteur (m=1)
  if(nfact == 1L){
    class(Gamma_est) <- "loadings"
    facto_cp <- list(loadings = Gamma_est)
  }
  if(!std){
    # Si matrice de covariance,
    # standardiser les chargements pour qu'on obtienne
    # néanmoins la corrélation entre facteurs
    # et variables explicatives
    facto_cp$loadings <- facto_cp$loadings / etype
  }
  facto_cp$var_cumul <- variance_cumu
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
