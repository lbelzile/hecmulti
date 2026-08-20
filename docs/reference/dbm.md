# Envoi de catalogue

Une entreprise possède une grande base de données client. Elle désire
envoyer un catalogue à ses clients mais souhaite maximiser les revenus
d’une telle initiative.

## Utilisation

``` r
dbm
```

## Format

Une base de données avec 101000 lignes et 15 variables:

- `x1`:

  sexe de l’individu, soit homme (0) ou femme (1)

- `x2`:

  âge (en année)

- `x3`:

  variable catégorielle indiquant le revenu, soit moins de 35 000\$ (1),
  entre 35 000\$ et 75 000\$ (2) ou plus de 75 000\$ (3)

- `x4`:

  variable catégorielle indiquant la région où habite le client (de 1 à
  5)

- `x5`:

  conjoint : le client a-t-il un conjoint (0=non, 1=oui)

- `x6`:

  nombre d’année depuis que le client est avec la compagnie

- `x7`:

  nombre de semaines depuis le dernier achat

- `x8`:

  montant (en dollars) du dernier achat

- `x9`:

  montant total (en dollars) dépensé depuis un an

- `x10`:

  nombre d’achats différents depuis un an

- `yachat`:

  variable indicatrice, `1` si a la personne a acheté, `0` sinon

- `ymontant`:

  montant de l'achat

- `test`:

  variable catégorielle, `1` pour échantillon test, `0` pour
  l'échantillon d'apprentissage

## Auteur·rice

Denis Larocque
