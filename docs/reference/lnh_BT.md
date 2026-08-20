# Résultats de la LNH, format Bradley-Terry

Transformation des données
[lnh](https://lbelzile.github.io/hecmulti/reference/lnh.md) pour
l'ajustement d'un modèle de Bradley-Terry. La base de données ne
contient que l'indicateur de l'équipe et une variable binaire indiquant
l'équipe gagnante.

## Utilisation

``` r
lnh_BT
```

## Format

Une base de données avec 1312 lignes et 32 variables:

- `vainqueur`:

  \[logique\] variable binaire, `TRUE` si l'équipe à domicile remporte
  la partie

- `Arizona_Coyotes`:

  \[entier\] 1 si l'équipe joue à domicile, -1 si elle joue à
  l'extérieur, 0 sinon.

- `Boston_Bruins`:

  \[entier\] 1 si l'équipe joue à domicile, -1 si elle joue à
  l'extérieur, 0 sinon.

- `Buffalo_Sabres`:

  \[entier\] 1 si l'équipe joue à domicile, -1 si elle joue à
  l'extérieur, 0 sinon.

- `Calgary_Flames`:

  \[entier\] 1 si l'équipe joue à domicile, -1 si elle joue à
  l'extérieur, 0 sinon.

- `Carolina_Hurricanes`:

  \[entier\] 1 si l'équipe joue à domicile, -1 si elle joue à
  l'extérieur, 0 sinon.

- `Chicago_Blackhawks`:

  \[entier\] 1 si l'équipe joue à domicile, -1 si elle joue à
  l'extérieur, 0 sinon.

- `Colorado_Avalanche`:

  \[entier\] 1 si l'équipe joue à domicile, -1 si elle joue à
  l'extérieur, 0 sinon.

- `Columbus_Blue Jackets`:

  \[entier\] 1 si l'équipe joue à domicile, -1 si elle joue à
  l'extérieur, 0 sinon.

- `Dallas_Stars`:

  \[entier\] 1 si l'équipe joue à domicile, -1 si elle joue à
  l'extérieur, 0 sinon.

- `Detroit_Red_Wings`:

  \[entier\] 1 si l'équipe joue à domicile, -1 si elle joue à
  l'extérieur, 0 sinon.

- `Edmonton_Oilers`:

  \[entier\] 1 si l'équipe joue à domicile, -1 si elle joue à
  l'extérieur, 0 sinon.

- `Florida_Panthers`:

  \[entier\] 1 si l'équipe joue à domicile, -1 si elle joue à
  l'extérieur, 0 sinon.

- `Los_Angeles_Kings`:

  \[entier\] 1 si l'équipe joue à domicile, -1 si elle joue à
  l'extérieur, 0 sinon.

- `Minnesota_Wild`:

  \[entier\] 1 si l'équipe joue à domicile, -1 si elle joue à
  l'extérieur, 0 sinon.

- `Montreal_Canadiens`:

  \[entier\] 1 si l'équipe joue à domicile, -1 si elle joue à
  l'extérieur, 0 sinon.

- `Nashville_Predators`:

  \[entier\] 1 si l'équipe joue à domicile, -1 si elle joue à
  l'extérieur, 0 sinon.

- `New_Jersey_Devils`:

  \[entier\] 1 si l'équipe joue à domicile, -1 si elle joue à
  l'extérieur, 0 sinon.

- `New_York_Islanders`:

  \[entier\] 1 si l'équipe joue à domicile, -1 si elle joue à
  l'extérieur, 0 sinon.

- `New_York_Rangers`:

  \[entier\] 1 si l'équipe joue à domicile, -1 si elle joue à
  l'extérieur, 0 sinon.

- `Ottawa_Senators`:

  \[entier\] 1 si l'équipe joue à domicile, -1 si elle joue à
  l'extérieur, 0 sinon.

- `Philadelphia_Flyers`:

  \[entier\] 1 si l'équipe joue à domicile, -1 si elle joue à
  l'extérieur, 0 sinon.

- `Pittsburgh_Penguins`:

  \[entier\] 1 si l'équipe joue à domicile, -1 si elle joue à
  l'extérieur, 0 sinon.

- `San_Jose_Sharks`:

  \[entier\] 1 si l'équipe joue à domicile, -1 si elle joue à
  l'extérieur, 0 sinon.

- `Seattle_Kraken`:

  \[entier\] 1 si l'équipe joue à domicile, -1 si elle joue à
  l'extérieur, 0 sinon.

- `St._Louis_Blues`:

  \[entier\] 1 si l'équipe joue à domicile, -1 si elle joue à
  l'extérieur, 0 sinon.

- `Tampa_Bay_Lightning`:

  \[entier\] 1 si l'équipe joue à domicile, -1 si elle joue à
  l'extérieur, 0 sinon.

- `Toronto_Maple_Leafs`:

  \[entier\] 1 si l'équipe joue à domicile, -1 si elle joue à
  l'extérieur, 0 sinon.

- `Vancouver_Canucks`:

  \[entier\] 1 si l'équipe joue à domicile, -1 si elle joue à
  l'extérieur, 0 sinon.

- `Vegas_Golden_Knights`:

  \[entier\] 1 si l'équipe joue à domicile, -1 si elle joue à
  l'extérieur, 0 sinon.

- `Washington_Capitals`:

  \[entier\] 1 si l'équipe joue à domicile, -1 si elle joue à
  l'extérieur, 0 sinon.

- `Winnipeg_Jets`:

  \[entier\] 1 si l'équipe joue à domicile, -1 si elle joue à
  l'extérieur, 0 sinon.

## Auteur·rice

Léo Belzile
