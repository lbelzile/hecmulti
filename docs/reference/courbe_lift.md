# Courbe lift

Pour un vecteur de probabilités estimées de succès d'un modèle `prob`,
et une variable binaire `resp`, calculer la courbe lift.

## Utilisation

``` r
courbe_lift(prob, resp, plot = TRUE, levels = seq(0.1, 0.9, by = 0.1))
```

## Arguments

- prob:

  vecteur de probabilités estimées

- resp:

  variable réponse binaire

- plot:

  logique; si `TRUE`, retourne un graphique de la courbe lift

- levels:

  niveaux des points de coupure

## Valeur de retour

un graphique `ggplot` de la courbe lift et une base de données avec la
valeur du lift

## Détails

Le nombre de données classifiées est arrondi, contrairement au graphique
