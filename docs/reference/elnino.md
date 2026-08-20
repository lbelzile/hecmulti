# El Nino

Données météorologiques et de surface obtenues à l'aide de bouées
positionnées dans le Pacifique équatorial

## Utilisation

``` r
elnino
```

## Format

Une base de données avec 10000 lignes et 12 variables:

- `obs`:

  numéro d'observation

- `year`:

  année

- `month`:

  mois

- `day`:

  jour

- `date`:

  date

- `latitude`:

  latitude

- `longitude`:

  longitude

- `zon_winds`:

  vents (composante zonale, négatif pour ouest, positive pour est

- `mer_winds`:

  vents (composante méridionale, négatif pour sud, positif pour nord)

- `humidity`:

  pourcentage d'humidité relative

- `air_temp`:

  température ambiante

- `s_s_temp`:

  températures de la surface de la mer

## Source

Diane Cook, sous-ensemble des données disponibles sur le [UCI Machine
Learning repository](https://archive.ics.uci.edu/ml/datasets/El+Nino)
