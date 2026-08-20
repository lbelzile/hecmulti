# Dons à un organisme de charité

Données simulées correspondant aux donations et sollications d'un
organisme de charité auprès d'employés de compagnies associées à
l'organisme.

## Utilisation

``` r
dons
```

## Format

Une base de données avec 19353 lignes et 16 variables:

- `ndons`:

  nombre de dons

- `recence`:

  nombre de mois depuis le dernier don, `NA` si la personne n'a jamais
  fait de dons

- `anciennete`:

  nombre de mois depuis le premier don, le cas échéant

- `vdons`:

  valeur monétaire de tous les dons, en dollars

- `vdonsmax`:

  don de valeur maximale

- `vdonsmin`:

  don de valeur minimale

- `npromesse`:

  nombre de promesses de dons

- `vpromesse`:

  valeur totale de promesse

- `nradiations`:

  nombre de radiations de promesses

- `vradiations`:

  valeur de la promesse non versée

- `ddons`:

  temps moyen écoulé (en mois) entre deux dons, si dons multiple

- `ddonsmax`:

  temps maximum écoulé entre deux dons (en mois)

- `ddonsmin`:

  temps minimum écoulé entre deux dons (en mois)

- `nrefus`:

  nombre de refus de donner

- `nrefusconsec`:

  nombre de refus consécutifs

- `nindecis`:

  nombre de décisions indécisives, mesurées à partir de formulaires
  partiellement complétés
