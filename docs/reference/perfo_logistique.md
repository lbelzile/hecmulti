# Performance d'un modèle logistique

Calculer les statistiques d'ajustement (sensibilité, spécificité, taux
de bonne classification, etc.) en fonction de points de coupures

## Utilisation

``` r
perfo_logistique(prob, resp)
```

## Arguments

- prob:

  vecteur de probabilités estimées

- resp:

  variable réponse binaire

## Valeur de retour

une base de données avec les composantes suivantes:

- `coupe`points de coupe

- `VP`: vrais positifs

- `VN`: vrais négatifs

- `FP`: faux positifs

- `FN`: faux négatifs

- `pcorrect`: taux de bonne classification

- `sensi`: sensibilité

- `speci`: spécificité

- `fpos`: taux de faux positifs

- `fneg`: taux de faux négatifs
