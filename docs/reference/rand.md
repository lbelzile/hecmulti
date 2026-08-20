# Indice de Rand

Calcul de la similarité; chaque paire est réduite à un index binaire (0
si les observations sont des regroupements différents, 1 si elles sont
classées dans le même). Ces paires sont comptabilisées dans un tableau
de contingence; l'indice de Rand est le taux de bonne classification.

## Utilisation

``` r
rand(x, y)
```

## Arguments

- x:

  vecteur d'étiquettes A

- y:

  vecteur d'étiquettes B
