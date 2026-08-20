# Fonction d'efficacité du récepteur

Cette fonction calcule l'aire sous la courbe et crée un graphique de la
fonction d'efficacité du récepteur (courbe ROC). L'aire sous la courbe
est approximée en calculant la hauteur sous la fonction escalier.

## Utilisation

``` r
courbe_roc(prob, resp, plot = TRUE)
```

## Arguments

- prob:

  vecteur de probabilités estimées

- resp:

  variable réponse binaire

- plot:

  logique; si `TRUE`, retourne un graphique de la courbe lift

## Détails

Si la longueur des valeurs uniques du vecteur prob excède 10 000, alors
le graphique et l'aire sont approximées en calculant des points de
coupure équidistants entre 0 et 1.

Cette fonction retourne une liste invisible avec des méthodes `S3`
