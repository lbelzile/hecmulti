# Prédiction pour regsubsets

Cette fonction calcule les prédictions d'un modèle linéaire ajusté
contenant `id` variables et multiplie les coefficients par la matrice du
modèle pour retourner des prédictions.

## Utilisation

``` r
# Méthode S3 pour la classe regsubsets
predict(object, newdata, id, ...)
```

## Arguments

- object:

  objet de classe `regsubsets`

- newdata:

  base de données (`data.frame`) contenant les variables explicatives

- id:

  \[entier\] numéro du modèle ajusté par `regsubsets` pour lequel
  obtenir des prédictions

- ...:

  autres arguments, actuellement ignorés

## Valeur de retour

un vecteur de prédictions

## Auteur·rice

R. Jordan Crouser
