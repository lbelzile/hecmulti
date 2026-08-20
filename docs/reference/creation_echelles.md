# Création d'échelles

Calcul de moyennes de colonnes à partir d'une base de données, en
regroupant les variables dont les chargements excèdent le seuil

## Utilisation

``` r
creation_echelles(chargements, data, seuil = 0.4)
```

## Arguments

- chargements:

  matrice de chargements, `loadings`

- data:

  matrice ou base de données

- seuil:

  valeur du seuil pour les chargements

## Valeur de retour

une liste avec les échelles, `echelles`, et les valeurs du alpha de
Cronbach, `alpha`
