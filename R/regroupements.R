#' Critères de sélection
#'
#'  Fonction pour calculer le R carré et le
#'  R carré semi-partiel pour la procédure de
#'  regroupements hiérarchique (méthode de Ward)
#'
#' @param x base de données
#' @param hc objet de classe \code{hclust}
#' @param kmax nombre maximal de regroupements
#' @return une base de données avec éléments
#'\itemize{
#' \item{\code{index}}{nombre de regroupements}
#' \item{\code{Rc}}{critère du R-carré}
#' \item{\code{Rcsp}}{critère du R-carré semi-partiel}
#'}
#'@export
rc_hclust <- function(x, hc, kmax = 10L) {
  stopifnot(inherits(hc, "hclust"))
  # doit être un object de classe hclust
  k <- as.integer(kmax)
  stopifnot(k > 2, nrow(x) < kmax)
  groups <- cutree(hc, k = seq_len(k))
  TSS <- function(x, g) {
    sum(aggregate(x, by = list(g), function(x)
      sum(scale(x, scale = FALSE) ^ 2))[, -1])
  }
  TSS.all <- apply(groups, 2, function(g)
    TSS(x, g))
  data.frame(index = 1:kmax,
             Rc = 1 - TSS.all / TSS.all[1],
             Rcsp = c(0, -diff(TSS.all) / TSS.all[1]))
}
