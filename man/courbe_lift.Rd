% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/logistique.R
\name{courbe_lift}
\alias{courbe_lift}
\title{Courbe lift}
\usage{
courbe_lift(prob, resp, plot = TRUE, levels = seq(0.1, 0.9, by = 0.1))
}
\arguments{
\item{prob}{vecteur de probabilités estimées}

\item{resp}{variable réponse binaire}

\item{plot}{logique; si \code{TRUE}, retourne un graphique de la courbe lift}

\item{levels}{niveaux des points de coupure}
}
\value{
un graphique \code{ggplot} de la courbe lift et une base de données avec la valeur du lift
}
\description{
Pour un vecteur de probabilités estimées de succès d'un modèle \code{prob},
et une variable binaire \code{resp}, calculer la courbe lift.
}
\details{
Le nombre de données classifiées est arrondi, contrairement au graphique
}
