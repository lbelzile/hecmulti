

#' Courbe lift
#'
#' Pour un vecteur de probabilitées (prédictions) d'un modèle, \code{prob},
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
lift <- function(prob,
                 resp,
                 plot = TRUE,
                 levels = seq(0.1, 0.9, by = 0.1)) {
  od <- order(prob, decreasing = TRUE)
  # Réordonner les observations
  resp <- resp[od]
  n <- length(resp)
  prand <- seq(from = 1,
               to = sum(resp),
               length.out = length(resp))
  slift <- cumsum(resp) / prand
  if (plot) {
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
        expand = c(0, 0)
      ) +
      ggplot2::scale_y_continuous(
        breaks = seq(0L, 100L, by = 20L),
        minor_breaks = seq(10L, 90L, by = 10L),
        labels = c("0", "20", "40", "60", "80", "100"),
        limits = c(0, 100),
        expand = c(0, 0)
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
#' @inheritParams lift
#' @return une base de données avec les composantes suivantes:
#' \itemize{
#' \item{\code{coupe}}{points de coupe}
#' \item{\code{VP}}{vrais positifs}
#' \item{\code{VN}}{vrais négatifs}
#' \item{\code{Fp}}{faux positifs}
#' \item{\code{FN}}{faux négatifs}
#' \item{\code{pcorrect}}{taux de bonne classification}
#' \item{\code{sensi}}{sensibilité}
#' \item{\code{speci}}{spécificité}
#' \item{\code{fpos}}{taux de faux positifs}
#' \item{\code{fneg}}{taux de faux négatifs}
#' }
#' @export
perfo_logistique <- function(prob, resp) {
  # VRAI == 1, FAUX == 0
  cuts <- seq(from = 0.01, to = 0.99, by = 0.01)
  tab <- data.frame(coupe = cuts,
                    t(sapply(cuts, function(cut) {
                      nsucces <- sum(resp == 1)
                      nechec <- length(resp) - nsucces
                      n <- length(resp)
                      predy <- ifelse(prob >= cut, 1, 0)
                      c1 <- sum(predy & resp) # Y=1, Yhat=1
                      c0 <- sum(!predy & !resp) # Y=0, Yhat=0
                      i1 <- sum(!predy & resp) # Y=1, Yhat=0
                      i0 <- sum(predy & !resp) # Y=0, Yhat=1
                      c(
                        VP = c1,
                        VN = c0,
                        FP = i1,
                        FN = i0,
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


#' Point de coupure optimal
#'
#' La fonction prend comme argument un modèle de classe
#' \code{glm} et réajuste le modèle de manière répétée pour
#' calculer la performance par validation croisée.
#' Le modèle est réajusté
#'
#' @param model modèle linéaire généralisé pour variables binaires
#' @param c00 coût de classification pour vrai négatif
#' @param c11 coût de classification pour vrai positif
#' @param c01 coût de classification pour faux positif
#' @param c10 coût de classification pour faux négatif
#' @param plot booléen, si \code{TRUE}, produit un graphique du lift. La valeur par défaut est \code{FALSE}.
#' @param nrep entier, nombre de réplication pour la validation croisée
#' @param ncv entier, nombre de plis pour la validation croisée
#' @return un graphique de la performance moyenne en fonction du point de coupure et une liste avec les points de coupure \code{ptcoupe}, la valeur optimale du point de coupure \code{opt} et la performance \code{performance}
#' @export
pcoupe <- function(model,
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
  if (inherits(class(model), what = "glm")) {
    if (!model$family$family == "binomial") {
      stop(
        "Mod\u00e8le lin\u00e9aire g\u00e9n\u00e9ralis\u00e9 n'a pas une variable r\u00e9ponse binomiale."
      )
    }
  } else{
    stop("Mod\u00e8le invalide.")
  }
  if (is.null(nrow(model$data))) {
    stop(
      "Mod\u00e8le ajust\u00e9 devrait contenir une base de donn\u00e9es `data` avec les variables explicatives."
    )
  }
  model$data$y <-
    model$data[, all.vars(formula(model))[attr(terms(formula(model)), "response")]]
  stopifnot(length(unique(model$data$y)) != 2)
  n <- nrow(model$data)
  perfor_cv <- replicate(n = nrep, expr = {
    #Shuffle the indices
    inds <- sample.int(n = n,
                       size = n,
                       replace = FALSE)
    #Split into K groups of ~ equal size (from https://stackoverflow.com/a/16275428)
    form_group <-
      function(x, n) {
        split(x, cut(seq_along(x), n, labels = FALSE))
      }
    groups <- form_group(x = inds, n = ncv)
    probs <- rep(0, n)
    for (j in seq_len(ncv)) {
      probs[groups[[j]]] <- predict(
        glm(
          model$formula,
          family = model$family,
          data = model$data[-groups[[j]], ]
        ),
        newdata = model$data[groups[[j]], ],
        type = "response"
      )
    }
    perfo <- perfo(probs, resp = model$y)
    gain <-
      perfo$c0 * c00 + perfo$c1 * c11 + perfo$i0 * c10 + perfo$i1 * c01
    gain
  })
  meanperfo <- rowMeans(perfor_cv)
  cut <- seq(from = 0.01, to = 0.99, by = 0.01)
  if (plot) {
    g1 <- ggplot2::ggplot(data = data.frame(x = cut,
                                      y = meanperfo),
                    mapping = ggplot2::aes_string(x = "x",
                                                  y = "y")) +
      ggplot2::geom_point() +
      ggplot2::labs(x = "coupe",
                    y = "gain moyen") +
      ggplot2::theme_classic()
    print(g1)
  }
  list(ptcoupe = cut,
       performance = meanperfo,
       opt = cut[which.max(meanperfo)])
}
