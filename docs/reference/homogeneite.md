# Coefficient de détermination (semi-partiel)

Crée un diagramme du coefficient de détermination et du coefficient de
détermination semi-partielle pour les modèles de regroupements
hiérarchiques de classe `hclust` avec la méthode de Ward ou pour la
sortie des \$K\$-moyennes

## Utilisation

``` r
homogeneite(
  scd = NULL,
  rhier = NULL,
  data = NULL,
  ngroupes = length(scd),
  which = 1:2
)
```

## Arguments

- scd:

  somme totale du carré des distances intra-groupes pour chaque nombre
  de regroupements

- rhier:

  objet de classe `hclust`; si présent, les valeurs de `scd` sont
  ignorées

- data:

  base de données si l'argument `rhier` est fourni

- ngroupes:

  entier indiquant le nombre de regroupements maximum

- which:

  vecteur d'entiers indiquant quels graphiques imprimer, soit `1` pour
  le diagramme du coefficient de déterminationet `2` pour le coefficient
  de détermination semi-partiel

## Valeur de retour

une matrice de deux objets `ggplot`
