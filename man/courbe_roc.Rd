% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/logistique.R
\name{courbe_roc}
\alias{courbe_roc}
\title{Fonction d'efficacité du récepteur}
\usage{
courbe_roc(prob, resp, plot = TRUE)
}
\arguments{
\item{prob}{vecteur de probabilités estimées}

\item{resp}{variable réponse binaire}

\item{plot}{logique; si \code{TRUE}, retourne un graphique de la courbe lift}
}
\description{
Cette fonction calcule l'aire sous la courbe et
crée un graphique de la fonction d'efficacité du
récepteur (courbe ROC). L'aire sous la courbe est
approximée en calculant la hauteur sous la fonction
escalier.
}
\details{
Si la longueur des valeurs uniques du vecteur prob excède 10 000, alors le graphique et l'aire sont approximées en calculant des points de coupure équidistants entre 0 et 1.

Cette fonction retourne une liste invisible avec des méthodes \code{S3}
}
