# Étude sur le chômage

Dans le cadre d’un programme gouvernemental, on s’intéresse au nombre de
semaines de paiements écoulé entre une perte d’emploi et un nouvel
emploi pour des chômeurs et chômeuses âgé(e)s entre 18 et 65 ans, dans
le but d’élaborer un programme de formation destiné au chômage de longue
durée.

La base de données contient un échantillon fictif de 2 500 personnes
inscrites à l’assurance emploi entre mars 2020 et décembre 2021.

## Utilisation

``` r
chomage
```

## Format

Une base de données avec 2500 lignes et 8 variables:

- `duree`:

  double, nombre de semaines d'inscription au programme d’assurance
  emploi.

- `dureemin`:

  double, nombre de semaines écoulées au début de la période de collecte
  de données.

- `age`:

  facteur, variable catégorielle pour la tranche d’âge, soit `18,25`,
  `25,50` ou `50,65` ans.

- `formation`:

  facteur, variable catégorielle indiquant le niveau de formation, soit
  `aucune`, `secondaire`, `professionnel`, `collegial` ou
  `universitaire`.

- `sexe`:

  facteur pour le sexe de l'individu

- `retrait`:

  entier, `1` si la personne bénéficiaire se désinscrit du programme
  avant la fin de la période maximale de prestation parce qu’elle cesse
  de chercher activement un emploi, `2` si elle retrouve un emploi, `0`
  sinon.

- `montant`:

  double, montant hebdomadaire des prestations, allant jusqu’à 55
  pourcent de la rémunération hebdomadaire avant perte d’emploi jusqu’à
  concurrence de 547\$ par semaine.

- `nheures`:

  entier, nombre d’heures cumulées à l’emploi avant d’être au chômage,
  soit un minimum de 14 semaines (420 heures) ou 22 semaines (700
  heures) dépendamment du taux de chômage de la région et du nombre
  d’heures d’emploi assurables dans la période de référence.

- `prestationmax`:

  double, durée maximale pour les prestations

## Auteur·rice

Léo Belzile
