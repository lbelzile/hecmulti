% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/donnees.R
\docType{data}
\name{dbm_manquantes}
\alias{dbm_manquantes}
\alias{dbmmissing}
\title{Envoi de catalogue}
\format{
Une base de données avec 101000 lignes et 15 variables:
\describe{
 \item{\code{x1}}{sexe de l’individu, soit homme (0) ou femme (1)}
 \item{\code{x2}}{âge (en année)}
 \item{\code{x3}}{variable catégorielle indiquant le revenu, soit moins de 35 000$ (1), entre 35 000$ et 75 000$ (2) ou plus de 75 000$ (3)}
 \item{\code{x4}}{variable catégorielle indiquant la région où habite le client (de 1 à 5)}
 \item{\code{x5}}{conjoint : le client a-t-il un conjoint (0=non, 1=oui)}
 \item{\code{x6}}{nombre d’année depuis que le client est avec la compagnie}
 \item{\code{x7}}{nombre de semaines depuis le dernier achat}
 \item{\code{x8}}{montant (en dollars) du dernier achat}
 \item{\code{x9}}{montant total (en dollars) dépensé depuis un an}
 \item{\code{x10}}{nombre d’achats différents depuis un an}
 \item{\code{yachat}}{variable indicatrice, \code{1} si a la personne a acheté, \code{0} sinon}
 \item{\code{ymontant}}{montant de l'achat}
 \item{\code{test}}{variable catégorielle, \code{1} pour échantillon test, \code{0} pour l'échantillon d'apprentissage}
}
}
\usage{
dbm_manquantes
}
\description{
Une entreprise possède une grande base de données client. Elle désire envoyer un catalogue à ses clients mais souhaite maximiser les revenus d’une telle initiative.

Cette version de la base de données contient des valeurs manquantes.
}
\author{
Denis Larocque
}
\keyword{datasets}
