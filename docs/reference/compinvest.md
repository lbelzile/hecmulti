# Étude sur le comportement d'investisseurs

Données tirées d'un article scientifique visant à établir les
différences de comportement d'investisseur(e)s en fonction de la façon
dont sont présentées les données. Les données proviennent de l'étude 4A,
une série de question sur des choix (prendre 50\$ maintenant ou avoir 50
de chance de gagner 150\$ si la prédiction / s'avère correcte). Les
participant(e)s devaient prédire si le niveau de retour de l'action
d'Apple dépasserait celui du S&P500; ils et elles voyaient des chartes
montrant une augmentation, diminution ou un niveau constant des actions.
Une question préliminaire a permis de déterminer un profil de risque de
l'investisseur, sur une échelle de 1 à 4 (les valeurs plus faibles
indiquant une aversion au risque). La perception du risque a été mesurée
à l'aide du questionnaire Epistemic-Aleatory Rating Scale (EARS).

Les participant(e)s ont été recruté(e)s sur Amazon MTurk et le devis et
les conclusions ne sont pas causales.

## Utilisation

``` r
compinvest
```

## Format

Une base de données avec 564 lignes et 4 variables:

- `choix`:

  \[entier\] décision d'investissement incertain, soit oui (`1`, 150\$
  si la prédiction est correcte et 0 sinon) ou non (`0`, recevoir 50\$
  pour sûr)

- `risque`:

  \[entier\] score de 1 à 4 pour l'aversion au risque, avec 1 (forte
  aversion) et 4 (en quête de risque) adapté d'une échelle de Barsky et
  al. (1997)

- `epistemique`:

  échelle pour le score moyen, basé sur 3 items du EARS sur le risque
  épistémique allant de 1 (pas du tout) à 7 (beaucoup)

- `aleatoire`:

  échelle pour le score moyen, basé sur 3 items du EARS sur le risque
  aléatoire allant de 1 (pas du tout) à 7 (beaucoup)

## Source

Données extraites de ResearchBox 180, <https://researchbox.org/180>

## Références

Walters, D.J., G. Ulkumen, D. Tannenbaum,C. Erner and C.R. Fox, (2022).
Investor Behavior Under Epistemic versus Aleatory Uncertainty,
<http://dx.doi.org/10.2139/ssrn.3695316>

## Auteur·rice

Léo Belzile
