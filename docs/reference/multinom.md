# Satisfaction par rapport à un produit

La satisfaction est mesurée à l’aide d’une échelle de Likert, allant de
très insatisfait (1) à très satisfait (5).

## Utilisation

``` r
multinom
```

## Format

Une base de données avec 1000 lignes et 5 variables:

- `y`:

  échelle de Likert de 1 à 5 représentant le score de satisfaction

- `sexe`:

  sexe de l’individu, homme (`0`) ou femme (`1`)

- `educ`:

  niveau d’éducation le plus élevé complété ; secondaire (`sec`),
  collégial (`cegep`) ou universitaire (`uni`)

- `revenu`:

  variable catégorielle indiquant le revenu, soit faible (`1`), moyen
  (`2`) ou élevé (`3`)

- `age`:

  âge de l’individu (en années)
