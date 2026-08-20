# Analyse factorielle des données bancaires

Analyse en composantes principales des données
[visaprem](https://lbelzile.github.io/hecmulti/reference/visaprem.md);
cinq échelles ont été créées. Cette base de données sert à la
segmentation des clients.

## Utilisation

``` r
visaechelles
```

## Format

Une base de données avec 1027 lignes et 8 variables:

- `carvp`:

  possession de la carte `Visa` Premier, soit oui (`1`) ou non (`0`)

- `sexe`:

  sexe, `0` pour homme, `1` pour femme

- `ech1`:

  niveau d'activité

- `ech2`:

  niveau d'endetemment

- `ech3`:

  fortune

- `ech4`:

  degré d'utilisation du compte

- `ech5`:

  ancienneté

- `id`:

  identifiant du client
