# Moyenne de modèles avec sélection séquentielle

Cette fonction crée une copie du jeu de données par autoamorçage
nonparamétrique. La procédure `stepAIC` de MASS est utilisée avec le
modèle maximal spécifié dans `formula` est considéré. Le modèle
sélectionné est celui avec la plus petite valeur du critère
d'information selon la pénalité `ks`; la valeur par défaut correspond au
critère d'Akaike.

## Utilisation

``` r
moyenne_modeles_stepAIC(data, formula, aic = TRUE, B = 100L, ks = 2)
```

## Arguments

- data:

  base de données de type `data.frame`

- formula:

  formule du modèle maximal considéré

- aic:

  logique; si `TRUE`, retourner le modèle qui retourne le plus petit
  critère d'Akaike

- B:

  entier, le nombre de réplications

- ks:

  valeur de la pénalisation pour le dernier modèle de `stepAIC`

## Valeur de retour

une liste avec

- `coefs`vecteur des coefficients

- `nselect`nombre de coefficients non-nuls
