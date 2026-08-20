# Temps d'abonnement avec changement de forfait

Une entreprise oeuvrant dans le secteur des télécommunications
s’intéresse aux facteurs influençant le temps qu’un client reste abonné
à son service de téléphone cellulaire.

## Utilisation

``` r
survie3
```

## Format

Une base de données avec 500 lignes et 8 variables:

- `id`:

  entier; identifiant du client

- `debut`:

  début de la période (en semaines) d'abonnement au service de
  téléphonie cellulaire

- `fin`:

  fin de la période (en semaines) d'abonnement au service de téléphonie
  cellulaire selon l'ensemble de covariables

- `evenement`:

  variable binaire qui indique si `temps` est censurée (`0` si le client
  est toujours abonné ou s'il change de nombre de service par la suite)
  ou non (`1`, la variable `temps` est la durée finale de l’abonnement)

- `age`:

  âge du client au début de l’abonnement

- `sexe`:

  variable binaire, soit femme (`1`) ou homme (`0`)

- `region`:

  région où habite le client en ce moment (valeurs entre 1 et 5)

- `service`:

  nombre d’autres services auxquels le client est abonné

## Auteur·rice

Denis Larocque
