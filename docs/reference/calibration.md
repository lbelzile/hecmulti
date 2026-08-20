# Test de calibration de Spiegelhalter

Le test de Spiegelhalter est approximativement standard normal en grand
échantillon et est basé sur une décomposition d'un critère de score.

## Utilisation

``` r
calibration(prob, resp, ...)
```

## Arguments

- prob:

  vecteur de prédictions (probabilités)

- resp:

  vecteur d'observations (variables binaires) ou facteur avec niveaux 0
  et 1.

- ...:

  autres arguments, actuellement ignorés

## Valeur de retour

une liste avec éléments

- `stat`: statistique du score

- `pval`: valeur-p

## Références

D.J. Spiegelhalter (1986). *Probabilistic prediction in patient
management and clinical trials*, Statistics in Medecine, **5**(5), pp.
421-433,
[doi:10.1002/sim.4780050506](https://doi.org/10.1002/sim.4780050506) .

## Auteur·rice

Leo Belzile
