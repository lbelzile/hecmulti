# Analyse factorielle avec composantes principales

Cette fonction calcule une décomposition spectrale d'une matrice de
corrélation ou de covariance des données et extrait les k premières
composantes selon `nfact`, soit un entier ou le critère de Kaiser.

## Utilisation

``` r
factocp(x, nfact = "kaiser", covmat = NULL, cor = TRUE)
```

## Arguments

- x:

  une matrice ou base de données

- nfact:

  entier pour le nombre de facteurs, ou chaîne de caractère `"kaiser"`
  pour le critère des valeurs propres.

- covmat:

  matrice de covariance

- cor:

  logique; si `TRUE`, calculer la décomposition à partir de la matrice
  de corrélation plutôt que la matrice de covariance. Il est fortement
  conseillé de ne pas toucher à cet argument (voir Détails).

## Valeur de retour

une liste avec composante `loadings` contenant les chargements et si le
nombre de facteurs est supérieur à un, la matrice de rotation varimax.

## Détails

Puisque les facteurs sont dérivés à partir des composantes principales,
les facteurs avant rotation sont en ordre décroissant de variance. Ce
n'est plus le cas si on fait la rotation varimax. La sortie retourne les
composantes permutées (mais les étiquettes sont arbitraires).

Il est aussi important de noter que, si l'on peut effectuer une
décomposition en valeurs propres et vecteurs propres de la matrice de
covariance et effectuer une rotation varimax subséquente, les
chargements ne correspondent plus à des corrélations et sont
difficilement interprétables.

## Exemples

``` r
factocp(covmat = cov(fact), nfact = 2)
#> Error: objet 'fact' introuvable
factocp(factor, nfact = "kaiser")
#> 
#> Loadings:
#>     F1     F2     F3     F4    
#> x1                        0.812
#> x2                -0.791       
#> x3   0.793                     
#> x4          0.821              
#> x5                        0.834
#> x6   0.661                     
#> x7                -0.834       
#> x8          0.851              
#> x9   0.751                     
#> x10               -0.787       
#> x11         0.818              
#> x12  0.731                     
#> 
#>                   F1    F2    F3    F4
#> SS loadings    2.175 2.116 1.991 1.388
#> Proportion Var 0.181 0.176 0.166 0.116
#> Cumulative Var 0.181 0.358 0.523 0.639
```
