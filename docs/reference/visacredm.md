# Données bancaires et solde de la carte Visa Premier

La liste des variables est issue d'une base de données retraçant
l'historique mensuel bancaire et les caractéristiques de tous les
clients. Un sondage a été réalisé afin d'alléger les traitements ainsi
qu'une première sélection de variables.

## Utilisation

``` r
visacredm
```

## Format

Une base de données avec 1014 lignes et 43 variables:

- `matric`:

  identifiant client

- `age`:

  âge (en années)

- `famiq`:

  situation familiale, soit en couple (`cou`) ou seul (`seu`)

- `relat`:

  ancienneté de la relation (en mois)

- `pcspq`:

  catégorie socio-professionnelle (code numérique de l'INSEE)

- `rejets`:

  montant total des rejets en francs

- `opgnb`:

  nombre d'opérations par guichet dans le mois

- `moyrv`:

  moyenne des mouvements nets créditeurs des 3 mois en milliers de
  francs

- `tavep`:

  total des avoirs épargne monétaire en francs

- `endet`:

  taux d'endettement

- `gaget`:

  total des engagements en francs

- `gagec`:

  total des engagements court terme en francs

- `gagem`:

  total des engagements moyen terme en francs

- `kvunb`:

  nombre de comptes à vue

- `qsmoy`:

  moyenne des soldes moyens sur 3 mois

- `qcred`:

  moyenne des mouvements créditeurs en milliers de francs

- `boppn`:

  nombre d'opérations dans le mois précédent

- `facan`:

  montant facturé dans l'année en francs

- `lgagt`:

  engagement long terme

- `vienb`:

  nombre de produits contrats vie

- `viemt`:

  montant des produits contrats vie en francs

- `uemnb`:

  nombre de produits épargne monétaire

- `uemmts`:

  montant des produits d'épargne monétaire en francs

- `xlgnb`:

  nombre de produits d'épargne logement

- `xlgmt`:

  montant des produits d'épargne logement en francs

- `ylvnb`:

  nombre de comptes sur livret

- `ylvmt`:

  montant des comptes sur livret en francs

- `nbelts`:

  nombre de produits d'épargne long terme

- `mtelts`:

  montant des produits d'épargne long terme en francs

- `nbcats`:

  nombre de produits épargne à terme

- `mtcats`:

  montant des produits épargne à terme

- `nbbecs`:

  nombre de produits bons et certificats

- `mtbecs`:

  montant des produits bons et certificats en francs

- `zocnb`:

  nombre d'opérations par cartes

- `ntcas`:

  nombre total de cartes

- `nptag`:

  nombre de cartes point argentN

- `segv2s`:

  segmentation version 2

- `itavc`:

  total des avoirs sur tous les comptes

- `havef`:

  total des avoirs épargne financière en francs

- `carvp`:

  possession de la carte `Visa` Premier, soit oui (`1`) ou non (`0`)

- `sexe`:

  sexe, `0` pour homme, `1` pour femme

- `nbjd`:

  nombre de jours à débit dans les trois mois précédents

- `credm`:

  montant de la carte de crédit Visa Premier

## Détails

Creative Commons Paternity 3.0 France, pas d'utilisation commerciale -
partage avec des conditions initiales à l'identique.

## Auteur

Philippe Besse, Wikistat
