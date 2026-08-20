# Recommendation du PRCA

Les auteurs cherchent à voir si le fait qu’un produit soit recommandé
par le Professional Rodeo Cowboys Association (PRCA) a un effet sur les
intentions d’achats.

## Utilisation

``` r
logit1
```

## Format

Une base de données avec 500 lignes et 7 variables:

- `x1`:

  type d'emploi occupé, un parmi à la maison (`1`), employé (`2`),
  ventes/services (`3`), professionnel (`4`) ou agriculture/ferme (`5`)

- `x2`:

  revenu familial annuel, un parmi `1`: moins de 25 000, `2`: 25 000 à
  39 999, `3`: 40 000 à 59 999, `4`: 60 000 à 79 999 et `5`: 80 000 et
  plus

- `x3`:

  sexe, soit homme (`0`) ou femme (`1`)

- `x4`:

  avez-vous déjà fréquenté une université? soit oui (`1`) ou non (`0`)

- `x5`:

  âge (en années)

- `x6`:

  combien de fois avez-vous assisté à un rodéo au cours de la dernière
  année? soit `1`: 10 fois ou plus, `2`: entre six et neuf fois et `3`:
  cinq fois ou moins

- `y`:

  seriez-vous intéressé à acheter un produit recommandé par le PRCA,
  soit oui (`1`) ou non (`0`)

## Références

Daneshvary, R. et Schwer, R. K. (2000) *The Association Endorsement and
Consumers’ Intention to Purchase*. Journal of Consumer Marketing **17**,
203-213.

## Auteur·rice

Denis Larocque
