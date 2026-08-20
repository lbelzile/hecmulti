# Critère parallèle de Horn

Cette fonction calcule par Monte Carlo les quantiles de la distribution
des valeurs propres pour une matrice de corrélation de données
indépendantes de dimension p, par le biais de tirages d'une loi de
Wishart

## Utilisation

``` r
horn_parallele(n, p, niveau = 0.95, nsim = 1000L)
```

## Arguments

- n:

  nombre d'observations

- p:

  nombre de variables explicatives

- niveau:

  niveau pour le quantile

- nsim:

  nombre de simulations

## Valeur de retour

un vecteur de quantiles pour les valeurs propres
