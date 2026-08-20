# Temps d'abonnement (risques compétitifs)

Une entreprise oeuvrant dans le secteur des télécommunications
s’intéresse aux facteurs influençant le temps qu’un client reste abonné
à son service de téléphone cellulaire.

## Utilisation

``` r
survie4
```

## Format

Une base de données avec 500 lignes et 6 variables:

- `temps`:

  temps (en semaines) d'abonnement au service de téléphonie cellulaire

- `censure`:

  entier, `1` si le temps est censuré (l’individu est toujours abonné à
  notre service), `2`/`3` si l'individu a quitté pour aller chez le
  compétiteur A/B, `4` si l'individu a quitté parce qu'il n'a plus
  besoin de cellulaire

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
