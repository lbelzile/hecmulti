# Prix de billets de train

Un sous-ensemble de billets de trains pour le trajet entre Madrid et
Barcelone vendus par la Renfe pour trois types de trains, soit Alta
Velocidad Española (`AVE`), soit Alta Velocidad Española conjointement
avec TGV (un partenariat entre la SNCF et Renfe pour les trains à
destination ou en provenance de Toulouse) `AVE-TGV`, soit les trains
régionaux `REXPRESS`; seuls les trains étiquetés `AVE` ou `AVE-TGV` sont
des trains à grande vitesse.

## Utilisation

``` r
renfe
```

## Format

Une base de données de 10000 observations contenant les variables
suivantes:

- prix:

  prix du billet (en euros)

- dest:

  facteur, indicateur binaire du trajet, soit de Barcelone vers Madrid
  ou de Madrid vers Barcelone

- tarif:

  facteur, variable catégorielle indiquant le tarif du billet, un parmi
  `AdultoIda`, `Promo` et `Flexible`

- classe:

  facteur classe du billet, soit `Preferente`, `Turista`, `TuristaPlus`
  ou `TuristaSolo`

- type:

  facteur variable catégorielle indiquant le type de train, `AVE-TGV`,
  `AVE` ou `REXPRESS`.

- duree:

  longueur annoncée du trajet (en minutes)

- jour:

  facteur entier indiquant le jour de la semaine du départ allant de
  dimanche (`1`) à samedi (`7`)

## Source

Kaggle
<https://www.kaggle.com/thegurusteam/spanish-high-speed-rail-system-ticket-pricing>
