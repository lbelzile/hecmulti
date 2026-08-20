# Temps d'abonnement

Une entreprise oeuvrant dans le secteur des télécommunications
s’intéresse aux facteurs influençant le temps qu’un client reste abonné
à son service de téléphone cellulaire.

## Utilisation

``` r
survie1
```

## Format

Une base de données avec 500 lignes et 6 variables:

- `temps`:

  temps (en semaines) d'abonnement au service de téléphonie cellulaire

- `censure`:

  variable binaire qui indique si `temps` est censurée (`0` si le client
  est toujours abonné) ou non (`1`, la variable `temps` est la durée
  finale de l’abonnement)

- `age`:

  âge du client au début de l’abonnement

- `sexe`:

  variable binaire, soit femme (`1`) ou homme (`0`)

- `region`:

  région où habite le client en ce moment (valeurs entre 1 et 5)

- `service`:

  nombre de services en plus du cellulaire auquel le client est abonné
  parmi internet, téléphone fixe, télévision (câble ou antenne
  parabolique).

## Auteur·rice

Denis Larocque
