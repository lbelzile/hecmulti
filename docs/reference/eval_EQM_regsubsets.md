# Calcul de la racine de l'erreur quadratique moyenne

Pour un objet de class `regsubsets`, calculer l'erreur quadratique
moyenne de validation pour une base de données externe. Le modèle
calcule la matrice du modèle pour extraire les colonnes.

## Utilisation

``` r
eval_EQM_regsubsets(model, select = c("AIC", "BIC"), formula, data, newdata)
```

## Arguments

- model:

  objet de classe `regsubsets`

- select:

  vecteur des modèles sélectionnés

- formula:

  formule désignant le modèle maximal ajusté par la procédure de
  sélection

- data:

  base de données d'entraînement servant à l'ajustement des coefficients

- newdata:

  base de données de validation pour le calcul de l'erreur moyenne
  quadratique

## Valeur de retour

estimation de la racine de l'erreur quadratique moyenne
