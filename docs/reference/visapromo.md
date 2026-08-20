# Données bancaires avec offre promotionnelle

Une base de données retraçant l'historique mensuel bancaire et les
caractéristiques de clients d'une institution bancaire

## Utilisation

``` r
visapromo
```

## Format

Une base de données avec 1255 lignes et 45 variables:

- `matric`:

  identifiant client

- `age`:

  âge (en années)

- `famiq`:

  situation familiale: un parmi mariée (`mar`), célibataire (`cel`),
  divorcée (`div`), union libre (`uli`), séparée (`sep`) ou veuve
  (`veu`)

- `relat`:

  ancienneté de la relation avec la banque (en mois)

- `pcspq`:

  catégorie socio-professionnelle [(code numérique de
  l'INSEE)](https://www.insee.fr/fr/metadonnees/pcs2003/categorieSocioprofessionnelleAgregee/1?champRecherche=false)

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

  nombre de cartes point argent

- `itavc`:

  total des avoirs sur tous les comptes

- `havef`:

  total des avoirs épargne financière en francs

- `carvp`:

  possession de la carte `Visa` Premier, soit oui (`1`) ou non (`0`)

- `sexe`:

  sexe de la personne, `homme`, `femme` ou `inc` pour inconnu

- `nbjd1s`:

  nombre de jours à débit dans le mois précédent

- `nbjd2s`:

  nombre de jours à débit il y a deux mois

- `nbjd3s`:

  nombre de jours à débit il y a trois mois

- `impnbs`:

  nombre d'impayés en cours

- `promo`:

  offre promotionnelle acceptée, oui (`1`) ou non (`0`)

## Détails

Creative Commons Paternity 3.0 France, pas d'utilisation commerciale -
partage avec des conditions initiales à l'identique.

## Auteur·rice

Philippe Besse, Wikistat
