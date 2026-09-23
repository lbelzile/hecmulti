# Courbe précision rappel

Cette fonction calcule l'aire sous la courbe et crée un graphique de la
fonction de précision rappel. L'aire sous la courbe est approximée en
calculant la hauteur sous la fonction escalier.

## Utilisation

``` r
courbe_pr(prob, resp, plot = TRUE, cmax = TRUE)
```

## Arguments

- prob:

  vecteur de probabilités estimées

- resp:

  variable réponse binaire

- plot:

  logique; si `TRUE`, retourne un graphique de la courbe lift

- cmax:

  valeur logique; si `TRUE`, retourne la courbe précision-rappel de
  hauteur maximle

## Détails

Si la longueur des valeurs uniques du vecteur prob excède 10 000, alors
le graphique et l'aire sont approximées en calculant des points de
coupure équidistants entre 0 et 1. Puisqu'il peut y avoir plusieurs
valeurs de rappel ayant des précisions différentes, il est possible de
calculer la valeur maximale ou minimale pour chacune.

Cette fonction retourne une liste invisible avec des méthodes `S3`

## Exemples

``` r
n <- 100L
x <- runif(n)
prob <- plogis(5*(x-0.5))
y <- rbinom(n = n, prob = prob, size = 1)
mod <- glm(y ~ x, family = binomial)
prob <- predict(mod, type = "response")
courbe_pr(prob = prob, resp = y)
```
