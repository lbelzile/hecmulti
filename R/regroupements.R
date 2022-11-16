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
rc_hclust <- function(x, hc, kmax = 10L) {
  stopifnot(inherits(hc, "hclust"))
  if(!hc$method %in% c("ward", "ward.D", "ward.D2")){
    stop("Crit\u00e8re pas pertinent avec la m\u00e9thode choisie: seule la m\u00e9thode de Ward utilise l'homog\u00e9n\u00e9it.")
  }
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
             SCD = TSS.all,
             Rc = 1 - TSS.all / TSS.all[1],
             Rcsp = c(0, -diff(TSS.all) / TSS.all[1]))
}

#' @export
logLik.kmeans <- function(object, ...){
  structure(-object$tot.withinss/2,
            df = length(object$centers),
            nobs = length(object$cluster)
  )
}


#' Coefficient de détermination (semi-partiel)
#'
#' Crée un diagramme du coefficient de détermination et du coefficient de détermination semi-partielle pour les modèles de regroupements hiérarchiques de classe \code{hclust} avec la méthode de Ward ou pour la sortie des $K$-moyennes
#' @export
#' @import ggplot2 patchwork
#' @param scd somme totale du carré des distances intra-groupes pour chaque nombre de regroupements
#' @param rhier objet de classe \code{hclust}; si présent, les valeurs de \code{scd} sont ignorées
#' @param data base de données si l'argument \code{rhier} est fourni
#' @param ngroupes entier indiquant le nombre de regroupements maximum
#' @param which vecteur d'entiers indiquant quels graphiques imprimer, soit \code{1} pour le diagramme du coefficient de déterminationet \code{2} pour le coefficient de détermination semi-partiel
#' @return une matrice de deux objets \code{ggplot}
homogeneite <- function(
    scd = NULL,
    rhier = NULL,
    data = NULL,
    ngroupes = length(scd),
    which = 1:2){
  ngroupes <- as.integer(ngroupes)
  stopifnot(length(ngroupes) == 1L,
            ngroupes > 1)
# Méthodes pour hclust
if(!is.null(rhier)){
  if(!is.null(data)){
    stop("Argument \"data\" manquant.")
  }
  df <- rc_hclust(
    x = data,
    hc = rhier,
    kmax = ngroupes)
} else{
  if(is.null(scd)){
    stop("Vecteur de la somme du carr\u00e9 des distances (intra-groupes) manquant.")
  }
  stopifnot(ngroupes == length(scd))
  sctotal <- scd[1]
   df <- data.frame(
    index = seq_len(ngroupes),
    SCD = scd,
    Rc = 1 - scd / sctotal ,
    Rcsp = c(-diff(scd) / sctotal, NA))
}
  if(isTRUE(any(df$Rcsp < 0))){
    stop("Erreur: la somme du carr\u00e9 des distances (intra-groupes) augmente quand le nombre de regroupements augmente!")
  }

g1 <-  ggplot2::ggplot(
  data = df,
  mapping = ggplot2::aes(
    x = .data$index,
    y = .data$Rc)) +
  ggplot2::geom_line() +
  ggplot2::geom_point() +
  ggplot2::scale_x_continuous(breaks = seq_len(ngroupes)) +
  ggplot2::scale_y_continuous(
    limits = c(0,1),
    breaks = c(0,0.25,0.5,0.75,1),
    labels = c("0", "0.25", "0.5", "0.75", "1")) +
  ggplot2::labs(x = "nombre de regroupements",
                y = "",
                subtitle = "R carr\u00e9") +
  ggplot2::theme_classic()
g2 <-  ggplot2::ggplot(
  data = df[-nrow(df),],
  mapping = ggplot2::aes(x = .data$index,
                         y = .data$Rcsp)) +
  ggplot2::geom_line() +
  ggplot2::geom_point() +
  ggplot2::scale_x_continuous(
    breaks = seq_len(ngroupes)) +
  ggplot2::scale_y_continuous(
    limits = c(0,1),
    breaks = c(0,0.25,0.5,0.75,1),
    labels = c("0", "0.25", "0.5", "0.75", "1")) +
  ggplot2::labs(x = "nombre de regroupements",
                y = "",
                subtitle = "R carr\u00e9 semi-partiel") +
  ggplot2::theme_classic()
stopifnot(isTRUE(all(which %in% c(1, 2))))
if(length(which) == 1){
  if(which == 1){
    print(g1)
  } else if(which == 2){
    print(g2)
  }
} else{
  print(patchwork::wrap_plots(list(g1, g2)))
}
return(invisible(df))
}
