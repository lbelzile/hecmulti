# Critère d'information d'Akaike

Cette fonction retourne le critère d'information, tel que calculé pour
le BIC pour un objet de classe `regsubsets`, en supposant que tous les
modèles de 1 à `nvmax` variables sont retournés.

## Utilisation

``` r
# Méthode S3 pour la classe regsubsets
AIC(object, ..., k = 2)
```

## Arguments

- object:

  un objet de classe `regsubsets`

- ...:

  arguments additionnels, actuellement ignorés

- k:

  valeur de pénalité, défaut à 2 par paramètres

## Valeur de retour

vecteur avec critère d'information pour chaque modèle
