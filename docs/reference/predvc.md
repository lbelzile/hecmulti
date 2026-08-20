# Prédictions par validation croisée répétée

Le modèle est ajusté de manière répété sur chaque pli à l'aide de
`update` avec `predict`. Le code est conçu pour les modèles linéaires
généralisés, mais devrait fonctionner avec tout modèle qui définit des
génériques S3.

## Utilisation

``` r
predvc(modele, data = NULL, K = 10L, nrep = 1L, type = NULL)
```

## Arguments

- modele:

  un modèle ajusté de type `lm` ou `glm`

- data:

  `NULL` une base de données `data.frame` si la liste `modele` n'inclut
  pas `data` parmi ses éléments

- K:

  entier, nombre de plis pour la validation croisée

- nrep:

  nombre de réplications

- type:

  type de prédiction; si `NULL`, la valeur par défaut est employée.
  S'assurer que la valeur est à une échelle logique pour le calcul de
  moyennes.

## Valeur de retour

vecteur de prédictions

## Auteur·rice

Léo Belzile
