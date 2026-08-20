# Billets pour soutien TI

Cette base de données contient des données simulées pour des temps de
résolutions de problèmes TI, selon le niveau de complexité de la
requête, le type de demande.

## Utilisation

``` r
tisupport
```

## Format

Une base de données avec 279 observations et 5 variables:

- `duree`:

  \[entier\] nombre d'heures (jours ouvrables) entre l'ouverture du
  billet et la fermeture ou la période de fin de collecte

- `statut`:

  \[facteur\] statut de la requête, soit `ouvert` ou `ferme`

- `type`:

  \[facteur\] type de demande, soit requête pour services (`requete`),
  soit un problème informatique ou bogue (`probleme`)

- `niveau`:

  \[entier\] niveau de difficulté assigné, une valeur plus élevée
  requiert des compétences plus importantes

- `ncommentaires`:

  \[entier\] nombre de commentaires dans le suivi
