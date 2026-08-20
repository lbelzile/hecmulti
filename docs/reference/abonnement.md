# Abonnement de télécommunications

Données fictives de durées d’abonnement chez un fournisseur de services
de télécommunications (télévision, internet, téléphonie fixe et
cellulaire).

## Utilisation

``` r
abonnement
```

## Format

Une base de données avec 1000 lignes et 7 variables:

- `duree`:

  nombre de jours d’abonnement

- `tchange`:

  nombre de jours d’abonnement au moment du changement de forfait

- `actif`:

  entier, variable binaire codée 0 si le client est inactif, 1 s’il est
  encore abonné

- `nserv1`:

  entier, nombre de services lors du contrat initial

- `nserv2`:

  entier, nombre de services lors du changement de forfait le cas
  échéant (valeur manquante sinon)

- `age`:

  facteur pour la tranche d’âge, soit (18,35\], (35,50\] et (50,90\] ans

- `sexe`:

  variable indicatrice binaire, soit 0 pour femmes et 1 pour hommes

## Auteur·rice

Léo Belzile
