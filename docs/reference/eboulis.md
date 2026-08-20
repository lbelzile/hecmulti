# Diagramme d'éboulis

Crée un diagramme d'éboulis représentant les valeurs propres d'une
matrice de covariance, soit les corrélations ou les variances des
variables, en ordre décroissant.

## Utilisation

``` r
eboulis(object, which = 1:2)
```

## Arguments

- object:

  objet de classe `eigen`, `princomp` ou `prcomp`

- which:

  vecteur d'entiers indiquant quels graphiques imprimer, soit `1` pour
  le diagramme d'éboulis et `2` pour la variance cumulative

## Valeur de retour

une matrice de deux objets `ggplot`
