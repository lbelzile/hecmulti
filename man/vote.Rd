% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/donnees.R
\docType{data}
\name{vote}
\alias{vote}
\title{Participation électorale américaine}
\format{
Une base de données avec 5837 lignes et 10 variables:
\describe{
\item{\code{age}}{âge du participant}
\item{\code{race}}{facteur, soit blanc (\code{Caucasien}), Afro-Américain (\code{Afro-Americain}), Hispanique (\code{Hispanique}) ou autre.}
\item{\code{sexe}}{facteur, sexe de l'individu, \code{homme} ou \code{femme}}
\item{\code{revenu}}{facteur, variable catégorielle pour la tranche de revenu déclarée}
\item{\code{catvote}}{facteur ordonné, fréquence de vote, soit soit \code{rarement/jamais}, \code{occasionnellement} ou \code{toujours}.}
\item{\code{educ}}{facteur, niveau d'éducation de la personne}
\item{\code{poids}}{pondération du sondage}
\item{\code{affiliation}}{facteur, affiliation politique, soit Démocrate (\code{Dem}), Républicain(e) (\code{GOP}), soit non-réponse, indépendants, tiers parti ou aucune préférence (\code{autre})}
}
}
\source{
FiveThirtyEight, données \code{non-voters}
}
\usage{
vote
}
\description{
Données d'un sondage Ipsos réalisé pour FiveThirtyEight visant
à étudier les déterminants de la participation électorale lors
des élections nationales. Les données ont été couplées à des
registres du recensement et pondérées pour refléter la composition
de la population américaine dans son ensemble.
Pour plus de détails, consultez \href{https://raw.githubusercontent.com/fivethirtyeight/data/master/non-voters/README.md}{la description} et le \href{https://github.com/fivethirtyeight/data/raw/master/non-voters/nonvoters_codebook.pdf}{questionnaire} de l'enquête.
Les données sont exploitées dans \href{https://projects.fivethirtyeight.com/non-voters-poll-2020-election/}{l'article \emph{Why Millions of Americans Don't Vote}}.
}
\note{
Données partagées sous licence Creative Commons Attribution 4.0 International License
}
\keyword{datasets}
