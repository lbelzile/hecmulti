# Critères de sélection

Fonction pour calculer le R carré et le R carré semi-partiel pour la
procédure de regroupements hiérarchique (méthode de Ward)

## Utilisation

``` r
rc_hclust(x, hc, kmax = 10L)
```

## Arguments

- x:

  base de données

- hc:

  objet de classe `hclust`

- kmax:

  nombre maximal de regroupements

## Valeur de retour

une base de données avec éléments

- `index`nombre de regroupements

- `Rc`critère du R-carré

- `Rcsp`critère du R-carré semi-partiel
