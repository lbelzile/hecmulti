# Données bancaires (régression logistique)

Base de données de relations bancaires (voir
[visaprem](https://lbelzile.github.io/hecmulti/reference/visaprem.md))
transformées pour le chapitre sur la régression logistique

## Utilisation

``` r
visalogist
```

## Format

Une base de données avec 1027 lignes et 24 variables:

- `matric`:

  identifiant client

- `carvp`:

  possession de la carte `Visa` Premier, soit oui (`1`) ou non (`0`)

- `endet`:

  taux d'endettement

- `facanl`:

  log du montant facturé dans l'année en francs

- `itavcl`:

  log du total des avoirs sur tous les comptes

- `kvunb`:

  nombre de comptes à vue

- `moyrvl`:

  log de la moyenne des mouvements nets créditeurs des 3 mois en
  milliers de francs

- `nbjdl`:

  log du nombre de jours à débit des trois derniers mois

- `opgnbl`:

  log du nombre d'opérations par guichet dans le mois

- `qcredl`:

  log de la moyenne des mouvements créditeurs en milliers de francs

- `qsmoy`:

  moyenne des soldes moyens sur 3 mois

- `relat`:

  ancienneté de la relation (en mois)

- `sexe`:

  sexe, `0` pour homme, `1` pour femme

- `uemnb`:

  nombre de produits épargne monétaire

- `viemtl`:

  log du montant des produits contrats vie en francs

- `vienb`:

  nombre de produits contrats vie

- `xlgmtl`:

  log du montant des produits d'épargne logement en francs

- `xlgnb`:

  nombre de produits d'épargne logement

- `ylvmtl`:

  log du montant des comptes sur livret en francs

- `ylvnb`:

  nombre de comptes sur livret

- `zocnbr`:

  nombre d'opérations par cartes

- `gagel`:

  log du total des engagements en francs

- `role`:

  facteur, étiquette pour données d'entraînement, de validation et de
  test
