# Ventes d'un magasin de chaussures

Données simulées d'inventaire de chaussures d'un magasin montréalais.
Les modèles invendus après 40 mois en magasins sont passés aux pertes et
profits. Pour éliminer les invendus lors de l’arrivée de nouveaux
modèles, l’entreprise offre une réduction de 20 pourcent après 15 mois.

## Utilisation

``` r
chaussures
```

## Format

Une base de données avec 6807 lignes et 4 variables:

- `statut`:

  entier, variable catégorielle valant 0 si les chaussures sont vendues,
  1 si elles sont toujours en stock, 2 si elles sont déstockées.

- `temps`:

  double temps de stockage de l’article (en mois).

- `sexe`:

  entier, variable indicatrice binaire, 0 pour modèle pour homme, 1 pour
  femme.

- `prix`:

  double prix de vente réelle de l’article (avec rabais si applicable),
  arrondi à l’unité près.

## Auteur·rice

Léo Belzile
