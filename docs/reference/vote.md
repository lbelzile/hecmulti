# Participation électorale américaine

Données d'un sondage Ipsos réalisé pour FiveThirtyEight visant à étudier
les déterminants de la participation électorale lors des élections
nationales. Les données ont été couplées à des registres du recensement
et pondérées pour refléter la composition de la population américaine
dans son ensemble. Pour plus de détails, consultez [la
description](https://raw.githubusercontent.com/fivethirtyeight/data/master/non-voters/README.md)
et le
[questionnaire](https://github.com/fivethirtyeight/data/raw/master/non-voters/nonvoters_codebook.pdf)
de l'enquête. Les données sont exploitées dans [l'article *Why Millions
of Americans Don't
Vote*](https://projects.fivethirtyeight.com/non-voters-poll-2020-election/).

## Utilisation

``` r
vote
```

## Format

Une base de données avec 5837 lignes et 10 variables:

- `age`:

  âge du participant

- `race`:

  facteur, soit blanc (`Caucasien`), Afro-Américain (`Afro-Americain`),
  Hispanique (`Hispanique`) ou autre.

- `sexe`:

  facteur, sexe de l'individu, `homme` ou `femme`

- `revenu`:

  facteur, variable catégorielle pour la tranche de revenu déclarée

- `catvote`:

  facteur ordonné, fréquence de vote, soit soit `rarement/jamais`,
  `occasionnellement` ou `toujours`.

- `educ`:

  facteur, niveau d'éducation de la personne

- `poids`:

  pondération du sondage

- `affiliation`:

  facteur, affiliation politique, soit Démocrate (`Dem`), Républicain(e)
  (`GOP`), soit non-réponse, indépendants, tiers parti ou aucune
  préférence (`autre`)

## Source

FiveThirtyEight, données `non-voters`

## Note

Données partagées sous licence Creative Commons Attribution 4.0
International License
