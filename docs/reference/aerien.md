# Enquête de satisfaction d'une compagnie aérienne

Résultats d'une enquête de satisfaction sur des clients de compagnie
aérienne. Les variables des colonnes 7 à 20 sont tirées des résultats du
questionnaire, les autres encodent des informations démographiques sur
les clients et sur le vol.

## Utilisation

``` r
aerien
```

## Format

Une base de données avec 129880 lignes et 23 variables:

- `sexe`:

  facteur, sexe (`homme` ou `femme`)

- `loyaute_consommateur`:

  facteur, est-ce que la personne a un compte fidélité

- `age`:

  entier, âge de la personne

- `type_deplacement`:

  facteur, motif du déplacement (`affaires` ou `personnel`)

- `classe`:

  facteur, classe du vol (`affaire`, `eco` ou `ecoplus`)

- `distance_vol`:

  double, distance du vol (en km)

- `service_internet_en_vol`:

  entier, niveau de satisfaction pour le service internet en vol (0 si
  pas applicable)

- `temps_arrivee_depart_convenable`:

  entier, niveau de satisfaction pour l’heure de départ et d’arrivée

- `facilite_reservation_en_ligne`:

  entier, niveau de satisfaction en rapport à la facilité d’utilisation
  du service de réservation en ligne

- `localisation_porte`:

  entier, niveau de satisfaction en lien avec la localisation de la
  porte d’embarquement

- `nourriture`:

  entier, niveau de satisfaction en lien avec la nourriture et les
  breuvages servis en vol

- `preenregistrement_en_ligne`:

  entier, niveau de satisfaction en lien avec le pré-enregistrement en
  ligne

- `confort_siege`:

  entier, niveau de satisfaction lié au confort du siège

- `divertissement_en_vol`:

  entier, niveau de satisfaction quant à l’offre de divertissement en
  vol

- `service_embarquement`:

  entier, niveau de satisfaction sur l’embarquement du vol

- `service_espace_jambes`:

  entier, niveau de satisfaction en lien avec l’espace pour les jambes

- `service_enregistrement`:

  entier, niveau de satisfaction lié au service d’enregistrement à la
  porte

- `service_vol`:

  entier, niveau de satisfaction en lien avec le service durant le vol

- `proprete`:

  entier, niveau de satisfaction pour la propreté de l’appareil

- `delai_depart_min`:

  entier, retard du vol au départ (en minutes)

- `delai_arrivee_min`:

  entier, retard du vol à l'arrivée (en minutes)

- `satisfaction`:

  facteur, indice binaire de satisfaction globale

## Détails

Les variables mesurent la satisfaction (mesurée par une échelle de
Likert allant de 1 à 5, où un score plus élevé témoigne d’une plus
grande satisfaction. Les valeurs de 0 correspondent à des champs non
applicables (une forme de données manquantes).

Les données sont mises à disposition sous licence CC0 (domaine public)
issues de Kaggle.

## Références

Kaggle
<https://www.kaggle.com/sjleshrac/airlines-customer-satisfaction/>

## Auteur·rice

Sayantan Jana
