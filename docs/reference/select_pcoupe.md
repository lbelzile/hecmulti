# Sélection du point de coupure selon le gain

La fonction calcule le gain pour une variable réponse binaire et calcule
le gain (par défaut, le taux de bonne classification). Elle retourne le
point de coupure optimal. La fonction prend comme argument un modèle de
classe `glm` et réajuste le modèle de manière répétée pour calculer la
performance par validation croisée. Le modèle est réajusté `nrep` fois.

## Utilisation

``` r
select_pcoupe(
  modele,
  c00 = 1,
  c11 = 1,
  c01 = 0,
  c10 = 0,
  plot = FALSE,
  nrep = 10L,
  ncv = 10L
)
```

## Arguments

- modele:

  modèle linéaire généralisé pour variables binaires

- c00:

  coût de classification pour vrai négatif

- c11:

  coût de classification pour vrai positif

- c01:

  coût de classification pour faux positif

- c10:

  coût de classification pour faux négatif

- plot:

  booléen, si `TRUE`, produit un graphique du lift. La valeur par défaut
  est `FALSE`.

- nrep:

  entier, nombre de réplications pour la validation croisée

- ncv:

  entier, nombre de groupes pour la validation croisée

## Valeur de retour

un graphique de la performance moyenne en fonction du point de coupure
et une liste avec les éléments suivants:

- `optim`: point de coupure qui maximise le gain

- `gainmax`: gain maximal enregistré

- `pcoupe`points de coupe

- `gain`gain moyen pour chaque point de coupe

- `c00`: poids associé aux vrais négatifs

- `c11`: poids associé aux vrais positifs

- `c01`: poids associé aux faux négatifs

- `c10`: poids associé aux faux positifs
