# Résultats de la LNH, 2021-2022

Cette base de données contient les résultats des 32 équipes de la Ligue
national de hockey (LNH) pour chaque partie avec le nombre de but par
équipe.

## Utilisation

``` r
lnh
```

## Format

Une base de données avec 1312 lignes et 6 variables:

- `date`:

  \[Date\] date de la partie

- `domicile`:

  \[facteur\] nom de l'équipe jouant à domicile

- `visiteur`:

  \[facteur\] nom de l'équipe en visite

- `but_domicile`:

  \[entier\] nombre de buts de l'équipe à domicile

- `but_visiteur`:

  \[entier\] nombre de buts de l'équipe en visite

- `type`:

  \[facteur\] type de partie, soit `regulier`, soit temps supplémentaire
  si le match va en prolongation (`temps supp.`, soit `tirs au but` si
  l'égalité est brisée en tirs de barrage).

## Source

Données extraites de
<https://www.hockey-reference.com/leagues/NHL_2022_games.html> le 21
octobre 2022.
