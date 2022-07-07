
#' Prix de billets de train
#'
#' Un sous-ensemble de billets de trains pour le trajet entre Madrid et Barcelone
#' vendus par la Renfe pour trois types de trains, soit Alta Velocidad Española (\code{AVE}),
#' soit Alta Velocidad Española conjointement avec TGV (un partenariat entre la SNCF et Renfe
#' pour les trains à destination ou en provenance de Toulouse) \code{AVE-TGV}, soit les trains régionaux \code{REXPRESS};
#'  seuls les trains étiquetés \code{AVE} ou \code{AVE-TGV} sont des trains à grande vitesse.
#'
#' @docType data
#' @format Une base de données de 10000 observations contenant les variables suivantes:
#' \describe{
#'   \item{prix}{prix du billet (en euros)}
#'   \item{dest}{facteur, indicateur binaire du trajet, soit de Barcelone vers Madrid ou de Madrid vers Barcelone}
#'   \item{tarif}{facteur, variable catégorielle indiquant le tarif du billet, un parmi \code{AdultoIda}, \code{Promo} et \code{Flexible}}
#'   \item{classe}{facteur classe du billet, soit  \code{Preferente}, \code{Turista}, \code{TuristaPlus} ou \code{TuristaSolo}}
#'   \item{type}{facteur variable catégorielle indiquant le type de train, \code{AVE-TGV}, \code{AVE} ou \code{REXPRESS}.}
#'   \item{duree}{longueur annoncée du trajet (en minutes)}
#'   \item{jour}{facteur entier indiquant le jour de la semaine du départ allant de dimanche (\code{1}) à samedi (\code{7})}
#' }
#' @source Kaggle \url{https://www.kaggle.com/thegurusteam/spanish-high-speed-rail-system-ticket-pricing}
"renfe"


#' @title Prix de l'action Apple
#' @description Prix de l'action d'Apple
#' @format Une base de données avec 313 lignes et 7 variables:
#' \describe{
#'   \item{\code{Date}}{\code{Date}}
#'   \item{\code{Open}}{double, prix à l'ouverture}
#'   \item{\code{High}}{double, prix maximal quotidien}
#'   \item{\code{Low}}{double, prix minimal quotidien}
#'   \item{\code{Close}}{double, prix à la fermeture}
#'   \item{\code{Volume}}{double,  quantité d'actions transigées représentant volume de transaction}
#'   \item{\code{Adj_Close}}{double, prix ajusté de fermeture}
#'}
"aapl"

#' @title Abonnement de télécommunications
#' @description Données fictives de durées d’abonnement chez un fournisseur de services de télécommunications (télévision, internet, téléphonie fixe et cellulaire).
#' @format Une base de données avec 1000 lignes et 7 variables:
#' \describe{
#'   \item{\code{duree}}{nombre de jours d’abonnement}
#'   \item{\code{tchange}}{nombre de jours d’abonnement au moment du changement de forfait}
#'   \item{\code{actif}}{entier, variable binaire codée 0 si le client est inactif, 1 s’il est encore abonné}
#'   \item{\code{nserv1}}{entier, nombre de services lors du contrat initial}
#'   \item{\code{nserv2}}{entier, nombre de services lors du changement de forfait le cas échéant (valeur manquante sinon)}
#'   \item{\code{age}}{facteur pour la tranche d’âge, soit (18,35], (35,50] et (50,90] ans}
#'   \item{\code{sexe}}{variable indicatrice binaire, soit 0 pour femmes et 1 pour hommes}
#'}
#' @author Léo Belzile
"abonnement"

#' @title Enquête de satisfaction d'une compagnie aérienne
#' @description Sous-ensemble d'une base de données de
#' @format Une base de données avec 129880 lignes et 13 variables:
#' \describe{
#'   \item{\code{service_internet_en_vol}}{entier, niveau de satisfaction pour le service internet en vol (0 si pas applicable)}
#'   \item{\code{temps_arrivee_depart_convenable}}{entier, niveau de satisfaction pour l’heure de départ et d’arrivée}
#'   \item{\code{facilite_reservation_en_ligne}}{entier, niveau de satisfaction en rapport à la facilité d’utilisation du service de réservation en ligne}
#'   \item{\code{localisation_porte}}{entier, niveau de satisfaction en lien avec la localisation de la porte d’embarquement}
#'   \item{\code{nourriture}}{entier, niveau de satisfaction en lien avec la nourriture et les breuvages servis en vol}
#'   \item{\code{preenregistrement_en_ligne}}{entier, niveau de satisfaction en lien avec le pré-enregistrement en ligne}
#'   \item{\code{confort_siege}}{entier, niveau de satisfaction lié au confort du siège}
#'   \item{\code{divertissement_en_vol}}{entier, niveau de satisfaction quant à l’offre de divertissement en vol}
#'   \item{\code{service_embarquement}}{entier, niveau de satisfaction sur l’embarquement du vol}
#'   \item{\code{service_espace_jambes}}{entier, niveau de satisfaction en lien avec l’espace pour les jambes}
#'   \item{\code{service_enregistrement}}{entier, niveau de satisfaction lié au service d’enregistrement à la porte}
#'   \item{\code{service_vol}}{entier, niveau de satisfaction en lien avec le service durant le vol}
#'   \item{\code{proprete}}{entier, niveau de satisfaction pour la propreté de l’appareil}
#'}
#'
#' @details Les variables mesurent la satisfaction (mesurée par une échelle
#' de Likert allant de 1 à 5, où un score plus élevé témoigne d’une plus
#' grande satisfaction. Les valeurs de 0 correspondent à des champs non
#' applicables (une forme de données manquantes).
#'
#' Les données sont mises à disposition sous licence CC0 (domaine public) issues de Kaggle.
#' @author Sayantan Jana
#' @references Kaggle \url{https://www.kaggle.com/sjleshrac/airlines-customer-satisfaction/}
"aerien_facto"


#' @title Classement de bières
#' @format Une base de données avec 35 lignes et 7 variables:
#' \describe{
#'   \item{\code{classement}}{entier, évaluation subjective de la qualité de la bière, soit très bon (1), bon (2) ou correct (3).}
#'   \item{\code{biere}}{facteur, type de bière}
#'   \item{\code{cout}}{double, coût pour 12 onces}
#'   \item{\code{calories}}{double, nombre de calories}
#'   \item{\code{sodium}}{double, sodium en milligrammes}
#'   \item{\code{alcool}}{double, pourcentage d’alcool}
#'}
#' @author Source inconnue, données fournies par Julie Meloche
"biere"


#' @title Douleur comme liant social
#' @description Données tirées de l’article Bastian et al. (2014) et rattachées à une
#' expérience de psychologie visant à corroborer l’hypothèse qu’il y a une coopération
#' accrue entre individus sujets à une expérience traumatisante. La moitié des
#' participant(e)s a dû plonger sa main dans un bain d’eau glacé, tandis que
#' l’autre moitié a dû faire la même chose dans un bain d’eau tiède; les deux groupes
#'  devaient ensuite faire un jeu visant à identifier leur niveau de coopération.
#'  Dans la phase initiale, les participant(e)s devaient évaluer leur état d’esprit
#'  sur une échelle de Likert allant de 1 (peu ou pas du tout) à 5 (extrêmement) en
#'  indiquant leurs émotions.
#' @format Une base de données avec 54 lignes et 21 variables:
#' \describe{
#'  \item{\code{condition}}{entier, indicateur binaire du groupe expérimental (0 pour groupe contrôle, 1 pour douleur)}
#'  \item{\code{interested}}{entier, échelle de Likert pour intéressé(e)}
#'  \item{\code{distressed}}{entier, échelle de Likert pour angoissé(e)}
#'  \item{\code{excited}}{entier, échelle de Likert pour excité(e)}
#'  \item{\code{upset}}{entier, échelle de Likert pour fâché(e)}
#'  \item{\code{strong}}{entier, échelle de Likert pour fort(e)}
#'  \item{\code{guilty}}{entier, échelle de Likert pour coupable}
#'  \item{\code{scared}}{entier, échelle de Likert pour effrayé(e)}
#'  \item{\code{hostile}}{entier, échelle de Likert pour hostirle}
#'  \item{\code{enthusiastic}}{entier, échelle de Likert pour enthousiaste}
#'  \item{\code{proud}}{entier, échelle de Likert pour fier/fière}
#'  \item{\code{irritable}}{entier, échelle de Likert pour irritable}
#'  \item{\code{alert}}{entier, échelle de Likert pour alerte}
#'  \item{\code{ashamed}}{entier, échelle de Likert pour honteux/honteuse}
#'  \item{\code{inspired}}{entier, échelle de Likert pour inspiré(e)}
#'  \item{\code{nervous}}{entier, échelle de Likert pour nerveux/nerveuse}
#'  \item{\code{determined}}{entier, échelle de Likert pour déterminé(e)}
#'  \item{\code{attentive}}{entier, échelle de Likert pour attentif/attentive}
#'  \item{\code{jittery}}{entier, échelle de Likert pour agité(e)}
#'  \item{\code{active}}{entier, échelle de Likert pour actif/active}
#'  \item{\code{afraid}}{entier, échelle de Likert pour craintif/craintive}
#'}
#' @references Bastian, B., Jetten, J., & Ferris, L. J. (2014). \emph{Pain as social glue : Shared pain increases cooperation}. Psychological Science, \bold{25}(11), 2079–2085.
"bjffacto"

#' @title Ventes d'un magasin de chaussures
#' @description Données simulées d'inventaire de chaussures d'un magasin montréalais. Les modèles invendus après 40 mois en magasins sont passés aux pertes et profits. Pour éliminer les invendus lors de l’arrivée de nouveaux modèles, l’entreprise offre une réduction
#' de 20% après 15 mois.
#' @format Une base de données avec 6807 lignes et 4 variables:
#' \describe{
#'  \item{\code{statut}}{entier, variable catégorielle valant 0 si les chaussures sont vendues, 1 si elles sont toujours en stock, 2 si elles sont déstockées.}
#'  \item{\code{temps}}{double temps de stockage de l’article (en mois).}
#'  \item{\code{sexe}}{entier, variable indicatrice binaire, 0 pour modèle pour homme, 1 pour femme.}
#'  \item{\code{prix}}{double prix de vente réelle de l’article (avec rabais si applicable), arrondi à l’unité près.}
#'}
#' @author Léo Belzile
"chaussures"

#' @title Étude sur le chômage
#' @description Dans le cadre d’un programme gouvernemental,
#'  on s’intéresse au nombre de semaines de paiements écoulé
#'  entre une perte d’emploi et un nouvel emploi pour des
#'  chômeurs et chômeuses âgé(e)s entre 18 et 65 ans,
#'  dans le but d’élaborer un programme de formation destiné
#'  au chômage de longue durée. La base de données contient
#'  un échantillon fictif de 2 500 personnes inscrites
#'  à l’assurance emploi entre janvier et novembre 2021
#' @format Une base de données avec 2500 lignes et 8 variables:
#' \describe{
#' \item{\code{duree}}{double, nombre de semaines de prestations payées par le programme d’assurance emploi.}
#' \item{\code{age}}{facteur, variable catégorielle pour la tranche d’âge, soit \code{18,25}, \code{25,50} ou \code{50,65} ans.}
#' \item{\code{formation}}{facteur, variable catégorielle indiquant le niveau de formation, soit \code{aucune}, \code{secondaire}, \code{professionnel}, \code{collegial} ou \code{universitaire}.}
#' \item{\code{sexe}}{entier, variable indicatrice binaire ; 1 pour femmes, 0 pour hommes.}
#' \item{\code{retrait}}{entier, \code{1} si la personne bénéficiaire se désinscrit du programme avant la fin de la période maximale de prestation parce qu’elle cesse de chercher un emploi, \code{2} si elle trouve un emploi, \code{0} sinon.}
#' \item{\code{montant}}{double, montant hebdomadaire des prestations, allant jusqu’à 55 pourcent de la rémunération hebdomadaire avant perte d’emploi jusqu’à concurrence de 547$ par semaine.}
#' \item{\code{nheures}}{entier, nombre d’heures cumulées à l’emploi avant d’être au chômage, soit un minimum de 14 semaines (420 heures) ou 22 semaines (700 heures) dépendamment du taux de chômage de la région et du nombre d’heures d’emploi assurables dans la période de référence.}
#' \item{\code{prestationmax}}{double, durée maximale pour les prestations}
#' }
#' @author Léo Belzile
"chomage"


#' @title Analyse de regroupement
#' @description Données simulées inspirées de Hsu et Lee (2002) pour illustrer l'analyse de regroupement. Les données proviennent de trois
#' groupes, qui sont facilement discernables lorsque représentés
#' graphiquement à l'aide de composantes principales.
#'
#' Les buts de l’étude étaient
#' \itemize{
#' \item Regrouper les gens de 55 et plus qui participent à des voyages organisés en autobus en groupes homogènes selon des caractéristiques reliées au choix de l’opérateur et du voyage.
#' \item Examiner les caractéristiques de ces groupes.
#' \item Examiner les caractéristiques démographiques de ces groupes.
#' }
#' @references Hsu, C. H. C. et Lee E.-J. (2002). \emph{Segmentation of Senior Motorcoach Travelers}. Journal of Travel Research, \bold{40}, 364-373.
#' @format Une base de données avec 150 lignes et 6 variables:
#' \describe{
#'  \item{\code{x1}}{échelle, activités sociales}
#'  \item{\code{x2}}{échelle, politiques de l’opérateur et références}
#'  \item{\code{x3}}{échelle, flexibilité des horaires}
#'  \item{\code{x4}}{échelle, santé et sécurité}
#'  \item{\code{x5}}{échelle, matériel publicitaire}
#'  \item{\code{x6}}{échelle, réputation}
#'}
#' @author Denis Larocque
"regroupements1"


#' @title Données colinéaires
#' @description Données simulées pour illustrer la colinéarité dans le cadre d'une régression logistique
#'
#' @format Une base de données avec 100 lignes et 6 variables:
#' \describe{
#'  \item{\code{y}}{entier, variable réponse binaire}
#'  \item{\code{x1}}{double, variable explicative}
#'  \item{\code{x2}}{double, variable explicative}
#'  \item{\code{x3}}{double, variable explicative}
#'  \item{\code{x4}}{double, variable explicative}
#'  \item{\code{x5}}{double, variable explicative}
#'}
"colinearite"

#' Étude dans un magasin
#'
#' @description Pour les besoins d’une enquête, on a demandé à 200 consommateurs adultes de répondre aux questions suivantes par rapport à un certain type de magasin sur une échelle de Likert de 1 (pas important) à 5 (très important) en jugeant de l'importance de 12 items.
#' @format Une base de données avec 200 lignes et 12 variables:
#' \describe{
#'  \item{\code{x1}}{le magasin offre de bons prix tous les jours?}
#'  \item{\code{x2}}{le magasin accepte les cartes de crédit majeures (Visa, Mastercard)?}
#'  \item{\code{x3}}{le magasin offre des produits de qualité?}
#'  \item{\code{x4}}{les vendeurs connaissent bien les produits?}
#'  \item{\code{x5}}{il y ait des ventes spéciales régulièrement?}
#'  \item{\code{x6}}{les marques connues soient disponibles?}
#'  \item{\code{x7}}{le magasin ait sa propre carte de crédit?}
#'  \item{\code{x8}}{le service soit rapide?}
#'  \item{\code{x9}}{il y ait une vaste sélection de produits?}
#'  \item{\code{x10}}{le magasin accepte le paiement par carte de débit?}
#'  \item{\code{x11}}{le personnel soit courtois?}
#'  \item{\code{x12}}{ le magasin ait en stock les produits annoncés?}
#'}
#' @author Denis Larocque
"factor"


#' @title Envoi de catalogue
#' @description Une entreprise possède une grande base de données client. Elle désire envoyer un catalogue à ses clients mais souhaite maximiser les revenus d’une telle initiative.
#' @format Une base de données avec 101000 lignes et 15 variables:
#' \describe{
#'  \item{\code{x1}}{sexe de l’individu, soit homme (0) ou femme (1)}
#'  \item{\code{x2}}{âge (en année)}
#'  \item{\code{x3}}{variable catégorielle indiquant le revenu, soit moins de 35 000$ (1), entre 35 000$ et 75 000$ (2) ou plus de 75 000$ (3)}
#'  \item{\code{x4}}{variable catégorielle indiquant la région où habite le client (de 1 à 5)}
#'  \item{\code{x5}}{conjoint : le client a-t-il un conjoint (0=non, 1=oui)}
#'  \item{\code{x6}}{nombre d’année depuis que le client est avec la compagnie}
#'  \item{\code{x7}}{nombre de semaines depuis le dernier achat}
#'  \item{\code{x8}}{montant (en dollars) du dernier achat}
#'  \item{\code{x9}}{montant total (en dollars) dépensé depuis un an}
#'  \item{\code{x10}}{nombre d’achats différents depuis un an}
#'  \item{\code{yachat}}{variable indicatrice, \code{1} si a la personne a acheté, \code{0} sinon}
#'  \item{\code{ymontant}}{montant de l'achat}
#'  \item{\code{test}}{variable catégorielle, \code{1} pour échantillon test, \code{0} pour l'échantillon d'apprentissage}
#'}
#' @author Denis Larocque
"dbm"


#' @title Envoi de catalogue
#' @description Une entreprise possède une grande base de données client. Elle désire envoyer un catalogue à ses clients mais souhaite maximiser les revenus d’une telle initiative.
#'
#' Cette version de la base de données contient des valeurs manquantes.
#'
#' @format Une base de données avec 101000 lignes et 15 variables:
#' \describe{
#'  \item{\code{x1}}{sexe de l’individu, soit homme (0) ou femme (1)}
#'  \item{\code{x2}}{âge (en année)}
#'  \item{\code{x3}}{variable catégorielle indiquant le revenu, soit moins de 35 000$ (1), entre 35 000$ et 75 000$ (2) ou plus de 75 000$ (3)}
#'  \item{\code{x4}}{variable catégorielle indiquant la région où habite le client (de 1 à 5)}
#'  \item{\code{x5}}{conjoint : le client a-t-il un conjoint (0=non, 1=oui)}
#'  \item{\code{x6}}{nombre d’année depuis que le client est avec la compagnie}
#'  \item{\code{x7}}{nombre de semaines depuis le dernier achat}
#'  \item{\code{x8}}{montant (en dollars) du dernier achat}
#'  \item{\code{x9}}{montant total (en dollars) dépensé depuis un an}
#'  \item{\code{x10}}{nombre d’achats différents depuis un an}
#'  \item{\code{yachat}}{variable indicatrice, \code{1} si a la personne a acheté, \code{0} sinon}
#'  \item{\code{ymontant}}{montant de l'achat}
#'  \item{\code{test}}{variable catégorielle, \code{1} pour échantillon test, \code{0} pour l'échantillon d'apprentissage}
#'}
#' @author Denis Larocque
#' @aliases dbmmissing
"dbm_manquantes"


#' @title Sondage de satisfaction en entreprise
#' @description Une compagnie fait un sondage auprès de ses employés. Les questions Q8–Q17 retenues pour
#' l’analyse factorielle dans la base de données sont mesurées à l’aide d’échelles de Likert allant de 1
#' (fortement en désaccord) à 5 (fortement d’accord).
#'
#' @format Une base de données avec 482 lignes et 10 variables:
#' \describe{
#'  \item{\code{q8}}{La compagnie se préoccupe de la société}
#'  \item{\code{q9}}{La compagnie est dotée d’un grand sens éthique}
#'  \item{\code{q10}}{La compagnie est un meneur dans l’industrie des TI}
#'  \item{\code{q11}}{La compagnie est innovante}
#'  \item{\code{q12}}{La compagnie a des dirigeants forts, expérimentés et compétent}
#'  \item{\code{q13}}{La compagnie a une base financière saine}
#'  \item{\code{q14}}{Je peux faire confiance à la compagnie}
#'  \item{\code{q15}}{La compagnie a des publicités que j’apprécie particulièrement}
#'  \item{\code{q16}}{La compagnie est reconnue pour le bon traitement de ses employés}
#'  \item{\code{q17}}{La compagnie fait sa part pour aider la société}
#'}
#' @details Source inconnue, données fournies par Julie Meloche
"sondage_entreprise"

#' @title Satisfaction par rapport à un produit
#' @description La satisfaction est mesurée à l’aide d’une échelle de Likert, allant de très insatisfait (1) à très satisfait (5).
#' @format Une base de données avec 1000 lignes et 5 variables:
#' \describe{
#'  \item{\code{y}}{échelle de Likert de 1 à 5 représentant le score de satisfaction}
#'  \item{\code{sexe}}{sexe de l’individu, homme (\code{0}) ou femme (\code{1})}
#'  \item{\code{educ}}{niveau d’éducation le plus élevé complété ; secondaire (\code{sec}), collégial (\code{cegep}) ou universitaire (\code{uni})}
#'  \item{\code{revenu}}{variable catégorielle indiquant le revenu, soit faible (\code{1}), moyen (\code{2}) ou élevé (\code{3})}
#'  \item{\code{age}}{âge de l’individu (en années)}
#'}
"multinom"

#' @title Sélection du degré d'un polynôme
#' @description Un jeu de données simulées issues d'un modèle polynomial d'ordre inconnu de la forme\deqn{y = \sum_{j=0}^{k} \beta_{j}x^{j}.} Le vrai modèle est cubique.
#' @format Une base de données avec 100 lignes et 2 variables:
#' \describe{
#'  \item{\code{x}}{variable explicative}
#'  \item{\code{y}}{variable réponse}
#'}
#' @author Denis Larocque
"polynome"

#' @title Promotion de produits
#' @description Données simulées pour un cas fictif de promotion de produits.
#' @format Une base de données avec 1000 lignes et 4 variables:
#' \describe{
#'  \item{\code{promo}}{variable binaire, 1 si le client s’est prévalue d’une offre promotionnelle, 0 sinon}
#'  \item{\code{nachats}}{nombre d’achats au magasin dans le dernier mois}
#'  \item{\code{sexe}}{variable binaire, 0 pour les femmes, 1 pour les hommes}
#'  \item{\code{tclient}}{variable catégorielle, soit \code{frequent} pour les clients réguliers ou \code{occasionnel} autrement}
#'}
"logistclient"

#' @title Temps d'abonnement
#' @description Une entreprise oeuvrant dans le secteur des télécommunications s’intéresse aux facteurs influençant le temps qu’un client reste abonné à son service de téléphone cellulaire.
#' @format Une base de données avec 500 lignes et 6 variables:
#' \describe{
#'  \item{\code{temps}}{temps (en semaines) d'abonnement au service de téléphonie cellulaire}
#'  \item{\code{censure}}{variable binaire qui indique si \code{temps} est censurée (\code{0} si le client est toujours abonné) ou non (\code{1}, la variable \code{temps} est la durée finale de l’abonnement)}
#'  \item{\code{age}}{âge du client au début de l’abonnement}
#'  \item{\code{sexe}}{variable binaire, soit femme (\code{1}) ou homme (\code{0})}
#'  \item{\code{region}}{région où habite le client en ce moment (valeurs entre 1 et 5)}
#'  \item{\code{service}}{nombre de services en plus du cellulaire auquel le client est abonné parmi internet, téléphone fixe, télévision (câble ou antenne parabolique).}
#'}
#' @author Denis Larocque
"survie1"

#' @title Profils de clients
#' @description Quatre profils de clients pour le calcul de courbes de survie.
#' @format Une base de données avec 4 lignes et 2 variables:
#' \describe{
#'  \item{\code{sexe}}{variable binaire, soit femme (\code{1}) ou homme (\code{0})}
#'  \item{\code{age}}{âge du client au début de l’abonnement}
#'}
#' @author Denis Larocque
"survie2"

#' @title Temps d'abonnement avec changement de forfait
#' @description Une entreprise oeuvrant dans le secteur des télécommunications s’intéresse aux facteurs influençant le temps qu’un client reste abonné à son service de téléphone cellulaire.
#' @format Une base de données avec 500 lignes et 8 variables:
#' \describe{
#'  \item{\code{id}}{entier; identifiant du client}
#'  \item{\code{debut}}{début de la période (en semaines) d'abonnement au service de téléphonie cellulaire}
#'  \item{\code{fin}}{fin de la période (en semaines) d'abonnement au service de téléphonie cellulaire selon l'ensemble de covariables}
#' \item{\code{evenement}}{variable binaire qui indique si \code{temps} est censurée (\code{0} si le client est toujours abonné ou s'il change de nombre de service par la suite) ou non (\code{1}, la variable \code{temps} est la durée finale de l’abonnement)}
#'  \item{\code{age}}{âge du client au début de l’abonnement}
#'  \item{\code{sexe}}{variable binaire, soit femme (\code{1}) ou homme (\code{0})}
#'  \item{\code{region}}{région où habite le client en ce moment (valeurs entre 1 et 5)}
#'  \item{\code{service}}{nombre d’autres services auxquels le client est abonné}
#'}
#' @author Denis Larocque
"survie3"

#' @title Temps d'abonnement (risques compétitifs)
#' @description Une entreprise oeuvrant dans le secteur des télécommunications s’intéresse aux facteurs influençant le temps qu’un client reste abonné à son service de téléphone cellulaire.
#' @format Une base de données avec 500 lignes et 6 variables:
#' \describe{
#'  \item{\code{temps}}{temps (en semaines) d'abonnement au service de téléphonie cellulaire}
#'  \item{\code{censure}}{entier, \code{1} si le temps est censuré (l’individu est toujours abonné à notre service), \code{2}/\code{3} si l'individu a quitté pour aller chez le compétiteur A/B, \code{4} si l'individu a quitté parce qu'il n'a plus besoin de cellulaire}
#'  \item{\code{age}}{âge du client au début de l’abonnement}
#'  \item{\code{sexe}}{variable binaire, soit femme (\code{1}) ou homme (\code{0})}
#'  \item{\code{region}}{région où habite le client en ce moment (valeurs entre 1 et 5)}
#'  \item{\code{service}}{nombre de services en plus du cellulaire auquel le client est abonné parmi internet, téléphone fixe, télévision (câble ou antenne parabolique).}
#'}
#' @author Denis Larocque
"survie4"

#' @title Recommendation du PRCA
#' @description Les auteurs cherchent à voir si le fait qu’un produit soit recommandé par le Professional Rodeo Cowboys Association (PRCA) a un effet sur les intentions d’achats.
#' @author Denis Larocque
#' @references Daneshvary, R. et Schwer, R. K. (2000) \emph{The Association Endorsement and Consumers’ Intention to Purchase}. Journal of Consumer Marketing \bold{17}, 203-213.
#' @format Une base de données avec 500 lignes et 7 variables:
#' \describe{
#'  \item{\code{x1}}{type d'emploi occupé, un parmi à la maison (\code{1}), employé (\code{2}), ventes/services (\code{3}), professionnel (\code{4}) ou agriculture/ferme (\code{5})}
#'  \item{\code{x2}}{revenu familial annuel, un parmi \code{1}: moins de 25 000, \code{2}: 25 000 à 39 999, \code{3}: 40 000 à 59 999, \code{4}: 60 000 à 79 999 et \code{5}: 80 000 et plus}
#'  \item{\code{x3}}{sexe, soit homme (\code{0}) ou femme (\code{1})}
#'  \item{\code{x4}}{avez-vous déjà fréquenté une université? soit oui (\code{1}) ou non (\code{0})}
#'  \item{\code{x5}}{âge (en années)}
#'  \item{\code{x6}}{combien de fois avez-vous assisté à un rodéo au cours de la dernière année? soit \code{1}: 10 fois ou plus, \code{2}: entre six et neuf fois et \code{3}: cinq fois ou moins}
#'  \item{\code{y}}{seriez-vous intéressé à acheter un produit recommandé par le PRCA, soit oui (\code{1}) ou non (\code{0})}
#'}
"logit1"

#' @title Données catégorielles et ordinales
#' @description Cette base de données fictives contient 100 observations obtenues par voie de sondage auprès d’adultes âgés de 18 à 45 ans.
#' @format Une base de données avec 100 lignes et 3 variables:
#' \describe{
#'  \item{\code{x}}{âge du répondant (en années)}
#'  \item{\code{y1}}{quelle a été votre destination vacances l’année dernière: Québec (\code{0}), États-Unis (\code{1}) ou ailleurs (\code{2})?}
#'  \item{\code{y2}}{combien de fois êtes-vous allé au cinéma l’année dernière: moins de 5 fois (\code{1})), entre 5 et 10 fois (\code{2}), ou plus de 10 fois (\code{3}).}
#'}
"logit6"


#' @title Recommendation du PRCA (données manquantes)
#' @description Les auteurs cherchent à voir si le fait qu’un produit soit recommandé par le Professional Rodeo Cowboys Association (PRCA) a un effet sur les intentions d’achats.
#' @author Denis Larocque
#' @references Daneshvary, R. et Schwer, R. K. (2000) \emph{The Association Endorsement and Consumers’ Intention to Purchase}. Journal of Consumer Marketing \bold{17}, 203-213.
#' @format Une base de données avec 500 lignes et 7 variables:
#' \describe{
#'  \item{\code{x1}}{type d'emploi occupé, un parmi à la maison (\code{1}), employé (\code{2}), ventes/services (\code{3}), professionnel (\code{4}) ou agriculture/ferme (\code{5})}
#'  \item{\code{x2}}{revenu familial annuel, un parmi \code{1}: moins de 25 000, \code{2}: 25 000 à 39 999, \code{3}: 40 000 à 59 999, \code{4}: 60 000 à 79 999 et \code{5}: 80 000 et plus}
#'  \item{\code{x3}}{sexe, soit homme (\code{0}) ou femme (\code{1})}
#'  \item{\code{x4}}{avez-vous déjà fréquenté une université? soit oui (\code{1}) ou non (\code{0})}
#'  \item{\code{x5}}{âge (en années)}
#'  \item{\code{x6}}{combien de fois avez-vous assisté à un rodéo au cours de la dernière année? soit \code{1}: 10 fois ou plus, \code{2}: entre six et neuf fois et \code{3}: cinq fois ou moins}
#'  \item{\code{y}}{seriez-vous intéressé à acheter un produit recommandé par le PRCA, soit oui (\code{1}) ou non (\code{0})}
#'}
#' @aliases missing1
"manquantes"


#' @title Données bancaires et solde de la carte Visa Premier
#' @description La liste des variables est issue d'une base de données retraçant l'historique mensuel bancaire et les caractéristiques de tous les clients. Un sondage a été réalisé afin d'alléger les traitements ainsi qu'une première sélection de variables.
#' @format Une base de données avec 1014 lignes et 43 variables:
#' \describe{
#'  \item{\code{matric}}{identifiant client}
#'  \item{\code{age}}{âge (en années)}
#'  \item{\code{famiq}}{situation familiale, soit en couple (\code{cou}) ou seul (\code{seu})}
#'  \item{\code{relat}}{ancienneté de la relation (en mois)}
#'  \item{\code{pcspq}}{catégorie socio-professionnelle (code numérique de l'INSEE)}
#'  \item{\code{rejets}}{montant total des rejets en francs}
#'  \item{\code{opgnb}}{nombre d'opérations par guichet dans le mois}
#'  \item{\code{moyrv}}{moyenne des mouvements nets créditeurs des 3 mois en milliers de francs}
#'  \item{\code{tavep}}{total des avoirs épargne monétaire en francs}
#'  \item{\code{endet}}{taux d'endettement}
#'  \item{\code{gaget}}{total des engagements en francs}
#'  \item{\code{gagec}}{total des engagements court terme en francs}
#'  \item{\code{gagem}}{total des engagements moyen terme en francs}
#'  \item{\code{kvunb}}{nombre de comptes à vue}
#'  \item{\code{qsmoy}}{moyenne des soldes moyens sur 3 mois}
#'  \item{\code{qcred}}{moyenne des mouvements créditeurs en milliers de francs}
#'  \item{\code{boppn}}{nombre d'opérations dans le mois précédent }
#'  \item{\code{facan}}{montant facturé dans l'année en francs}
#'  \item{\code{lgagt}}{engagement long terme}
#'  \item{\code{vienb}}{nombre de produits contrats vie}
#'  \item{\code{viemt}}{ontant des produits contrats vie en francs}
#'  \item{\code{uemnb}}{nombre de produits épargne monétaire}
#'  \item{\code{uemmts}}{montant des produits d'épargne monétaire en francs}
#'  \item{\code{xlgnb}}{nombre de produits d'épargne logement}
#'  \item{\code{xlgmt}}{montant des produits d'épargne logement en francs}
#'  \item{\code{ylvnb}}{nombre de comptes sur livret}
#'  \item{\code{ylvmt}}{montant des comptes sur livret en francs}
#'  \item{\code{nbelts}}{nombre de produits d'épargne long terme}
#'  \item{\code{mtelts}}{montant des produits d'épargne long terme en francs}
#'  \item{\code{nbcats}}{nombre de produits épargne à terme}
#'  \item{\code{mtcats}}{montant des produits épargne à terme}
#'  \item{\code{nbbecs}}{nombre de produits bons et certificats}
#'  \item{\code{mtbecs}}{montant des produits bons et certificats en francs}
#'  \item{\code{zocnb}}{nombre d'opérations par cartes}
#'  \item{\code{ntcas}}{nombre total de cartes}
#'  \item{\code{nptag}}{nombre de cartes point argentN}
#'  \item{\code{segv2s}}{segmentation version 2}
#'  \item{\code{itavc}}{total des avoirs sur tous les comptes}
#'  \item{\code{havef}}{total des avoirs épargne financière en francs}
#'  \item{\code{carvp}}{possession de la carte \code{Visa} Premier, soit oui (\code{1}) ou non (\code{0})}
#'  \item{\code{sexe}}{sexe, \code{0} pour homme, \code{1} pour femme}
#'  \item{\code{nbjd}}{nombre de jours à débit dans les trois mois précédents}
#'  \item{\code{credm}}{montant de la carte de crédit Visa Premier}
#'}
#' @details Creative Commons Paternity 3.0 France, pas d'utilisation commerciale - partage avec des conditions initiales à l'identique.
#' @author Philippe Besse, Wikistat
#'
"visacredm"

#' @title Données bancaires
#' @description Une base de données retraçant l'historique mensuel bancaire et les caractéristiques de clients d'une institution bancaire
#' @format Une base de données avec 1294 lignes et 45 variables:
#' \describe{
#'  \item{\code{matric}}{identifiant client}
#'  \item{\code{age}}{âge (en années)}
#'  \item{\code{famiq}}{situation familiale: un parmi mariée (\code{mar}), célibataire (\code{cel}), divorcée (\code{div}), union libre (\code{uli}),  séparée (\code{sep}) ou veuve (\code{veu})}
#'  \item{\code{relat}}{ancienneté de la relation (en mois)}
#'  \item{\code{pcspq}}{catégorie socio-professionnelle (code numérique de l'INSEE)}
#'  \item{\code{rejets}}{montant total des rejets en francs}
#'  \item{\code{opgnb}}{nombre d'opérations par guichet dans le mois}
#'  \item{\code{moyrv}}{moyenne des mouvements nets créditeurs des 3 mois en milliers de francs}
#'  \item{\code{tavep}}{total des avoirs épargne monétaire en francs}
#'  \item{\code{endet}}{taux d'endettement}
#'  \item{\code{gaget}}{total des engagements en francs}
#'  \item{\code{gagec}}{total des engagements court terme en francs}
#'  \item{\code{gagem}}{total des engagements moyen terme en francs}
#'  \item{\code{kvunb}}{nombre de comptes à vue}
#'  \item{\code{qsmoy}}{moyenne des soldes moyens sur 3 mois}
#'  \item{\code{qcred}}{moyenne des mouvements créditeurs en milliers de francs}
#'  \item{\code{boppn}}{nombre d'opérations dans le mois précédent }
#'  \item{\code{facan}}{montant facturé dans l'année en francs}
#'  \item{\code{lgagt}}{engagement long terme}
#'  \item{\code{vienb}}{nombre de produits contrats vie}
#'  \item{\code{viemt}}{montant des produits contrats vie en francs}
#'  \item{\code{uemnb}}{nombre de produits épargne monétaire}
#'  \item{\code{uemmts}}{montant des produits d'épargne monétaire en francs}
#'  \item{\code{xlgnb}}{nombre de produits d'épargne logement}
#'  \item{\code{xlgmt}}{montant des produits d'épargne logement en francs}
#'  \item{\code{ylvnb}}{nombre de comptes sur livret}
#'  \item{\code{ylvmt}}{montant des comptes sur livret en francs}
#'  \item{\code{nbelts}}{nombre de produits d'épargne long terme}
#'  \item{\code{mtelts}}{montant des produits d'épargne long terme en francs}
#'  \item{\code{nbcats}}{nombre de produits épargne à terme}
#'  \item{\code{mtcats}}{montant des produits épargne à terme}
#'  \item{\code{nbbecs}}{nombre de produits bons et certificats}
#'  \item{\code{mtbecs}}{montant des produits bons et certificats en francs}
#'  \item{\code{zocnb}}{nombre d'opérations par cartes}
#'  \item{\code{ntcas}}{nombre total de cartes}
#'  \item{\code{nptag}}{nombre de cartes point argentN}
#'  \item{\code{segv2s}}{segmentation version 2}
#'  \item{\code{itavc}}{total des avoirs sur tous les comptes}
#'  \item{\code{havef}}{total des avoirs épargne financière en francs}
#'  \item{\code{carvp}}{possession de la carte \code{Visa} Premier, soit oui (\code{1}) ou non (\code{0})}
#'  \item{\code{sexe}}{sexe, \code{0} pour homme, \code{1} pour femme}
#'  \item{\code{nbjd1s}}{nombre de jours à débit dans le mois précédent}
#'  \item{\code{nbjd2s}}{nombre de jours à débit il y a deux mois}
#'  \item{\code{nbjd3s}}{nombre de jours à débit il y a trois mois}
#'  \item{\code{credm}}{montant de la carte de crédit Visa Premier}
#'  \item{\code{impnbs}}{nombre d'impayés en cours}
#'}
#' @details Creative Commons Paternity 3.0 France, pas d'utilisation commerciale - partage avec des conditions initiales à l'identique.
#' @author Philippe Besse, Wikistat
"visaprem"


#' @title Analyse factorielle des données bancaires
#' @description Analyse en composantes principales des données \link{visaprem}; cinq échelles ont été créées. Cette base de données sert à la segmentation des clients.
#' @format Une base de données avec 1027 lignes et 8 variables:
#' \describe{
#'  \item{\code{carvp}}{possession de la carte \code{Visa} Premier, soit oui (\code{1}) ou non (\code{0})}
#'  \item{\code{sexe}}{sexe, \code{0} pour homme, \code{1} pour femme}
#'  \item{\code{ech1}}{niveau d'activité}
#'  \item{\code{ech2}}{niveau d'endetemment}
#'  \item{\code{ech3}}{fortune}
#'  \item{\code{ech4}}{degré d'utilisation du compte}
#'  \item{\code{ech5}}{ancienneté}
#'  \item{\code{id}}{identifiant du client}
#'}
"visaechelles"

#' @title Admission dans un collège
#' @description Données d'admission de collèges et d'universités aux États-Unis
#' @format Une base de données avec 777 lignes et 19 variables:
#' \describe{
#'  \item{\code{prive}}{variable binaire indiquant si l’institution d’enseignement est privée (\code{1}) ou pas (\code{0})}
#'  \item{\code{napplications}}{nombre d’applications pour les études}
#'  \item{\code{nadmission}}{nombre de personnes admises parmi napplications}
#'  \item{\code{ninscrits}}{nombre d’étudiant(e)s inscrit(e)s à l’université}
#'  \item{\code{m10p}}{pourcentage des admis provenant d’une école secondaire classé parmi les 10 pourcent meilleures}
#'  \item{\code{m25p}}{pourcentage des admis provenant d’une école secondaire classé parmi les 25 pourcent meilleures}
#'  \item{\code{tempsplein1c}}{nombre d’étudiant(e)s à temps plein au premier cycle}
#'  \item{\code{tempspart1c}}{nombre d’étudiant(e)s à temps partiel au premier cycle}
#'  \item{\code{fraiscolexternes}}{frais de scolarité pour étudiant(e)s externes (hors état)}
#'  \item{\code{fraisres}}{frais pour les résidences et l’hébergement}
#'  \item{\code{fraislivres}}{frais moyens pour les ouvrages obligatoires}
#'  \item{\code{fraisperso}}{frais pour des dépenses personnelles}
#'  \item{\code{pourcentdoctorat}}{taux de membres du corps enseignant détenteurs d’un Ph.D.}
#'  \item{\code{pourcentterminal}}{taux de membres du corps enseignant détenteurs d’un diplôme terminal}
#'  \item{\code{ratioetudprof}}{rapport du nombre d’étudiant(e)s versus professeur(re)s}
#'  \item{\code{pourcentdonationdiplome}}{pourcentage des diplômé(e)s qui font des dons à l’institution}
#'  \item{\code{depenseparetud}}{dépenses liées à l’enseignement, par étudiant(e)}
#'  \item{\code{tauxdiplom}}{taux de diplomation}
#'  \item{\code{nom}}{nom de l'établissement}
#'}
"college"

#' @title El Nino
#' @description Données météorologiques et de surface obtenues à l'aide de bouées positionnées dans le Pacifique équatorial
#' @format Une base de données avec 10000 lignes et 12 variables:
#' \describe{
#'  \item{\code{obs}}{numéro d'observation}
#'  \item{\code{year}}{année}
#'  \item{\code{month}}{mois}
#'  \item{\code{day}}{jour}
#'  \item{\code{date}}{date}
#'  \item{\code{latitude}}{latitude}
#'  \item{\code{longitude}}{longitude}
#'  \item{\code{zon_winds}}{vents (composante zonale, négatif pour ouest, positive pour est}
#'  \item{\code{mer_winds}}{vents (composante méridionale, négatif pour sud, positif pour nord)}
#'  \item{\code{humidity}}{pourcentage d'humidité relative}
#'  \item{\code{air_temp}}{température ambiante}
#'  \item{\code{s_s_temp}}{températures de la surface de la mer}
#'}
#' @source Diane Cook, sous-ensemble des données disponibles sur le \href{https://archive.ics.uci.edu/ml/datasets/El+Nino}{UCI Machine Learning repository}
"elnino"


#' @title Données de sondage avec valeurs manquantes
#' @description Base de données de service à la clientèle avec valeurs manquantes
#' @format Une base de données avec 1842 lignes et 10 variables:
#' \describe{
#'  \item{\code{wrkstat}}{facteur, occupation}
#'  \item{\code{marital}}{facteur, statut marital}
#'  \item{\code{childs}}{nombre d'enfants}
#'  \item{\code{age}}{âge (en années)}
#'  \item{\code{sex}}{facteur, sexe de l'individu}
#'  \item{\code{rincome}}{facteur, tranche de revenus}
#'  \item{\code{service}}{variable binaire, réponse à la question "avez-vous utilisé nos services dans le dernier mois?", soit oui (\code{1}) ou non (\code{0})}
#'  \item{\code{satisf}}{Si vous avez utilisé nos services, indiquez votre niveau de satisfaction, sur une échelle de 1 à 5 où 1 est très insatisfait et 5 très satisfait.}
#'}
#' @source Julie Meloche
"sondage_manquantes"

#' @title Données de sondage sans valeurs manquantes
#' @description Base de données de service à la clientèle avec valeurs manquantes
#' @format Une base de données avec 1842 lignes et 10 variables:
#' \describe{
#'  \item{\code{wrkstat}}{facteur, occupation}
#'  \item{\code{marital}}{facteur, statut marital}
#'  \item{\code{childs}}{nombre d'enfants}
#'  \item{\code{age}}{âge (en années)}
#'  \item{\code{sex}}{facteur, sexe de l'individu}
#'  \item{\code{rincome}}{facteur, tranche de revenus}
#'  \item{\code{service}}{variable binaire, réponse à la question "avez-vous utilisé nos services dans le dernier mois?", soit oui (\code{1}) ou non (\code{0})}
#'  \item{\code{satisf}}{Si vous avez utilisé nos services, indiquez votre niveau de satisfaction, sur une échelle de 1 à 5 où 1 est très insatisfait et 5 très satisfait.}
#'}
#' @source Julie Meloche
"sondage"


#' @title Données bancaires (régression logistique)
#' @description Base de données de relations bancaires (voir \link{visacredm}) transformées pour le chapitre sur la régression logistique
#' @format Une base de données avec 1027 lignes et 24 variables:
#' \describe{
#'  \item{\code{matric}}{identifiant client}
#'  \item{\code{carvp}}{possession de la carte \code{Visa} Premier, soit oui (\code{1}) ou non (\code{0})}
#'  \item{\code{endet}}{taux d'endettement}
#'  \item{\code{facanl}}{log du montant facturé dans l'année en francs}
#'  \item{\code{itavcl}}{log du total des avoirs sur tous les comptes}
#'  \item{\code{kvunb}}{nombre de comptes à vue}
#'  \item{\code{moyrvl}}{log de la moyenne des mouvements nets créditeurs des 3 mois en milliers de francs}
#'  \item{\code{nbjdl}}{log du nombre de jours à débit des trois derniers mois}
#'  \item{\code{opgnbl}}{log du nombre d'opérations par guichet dans le mois}
#'  \item{\code{qcredl}}{log de la moyenne des mouvements créditeurs en milliers de francs}
#'  \item{\code{qsmoy}}{moyenne des soldes moyens sur 3 mois}
#'  \item{\code{relat}}{ancienneté de la relation (en mois)}
#'  \item{\code{sexe}}{sexe, \code{0} pour homme, \code{1} pour femme}
#'  \item{\code{uemnb}}{nombre de produits épargne monétaire}
#'  \item{\code{viemtl}}{log du montant des produits contrats vie en francs}
#'  \item{\code{vienb}}{nombre de produits contrats vie}
#'  \item{\code{xlgmtl}}{log du montant des produits d'épargne logement en francs}
#'  \item{\code{xlgnb}}{nombre de produits d'épargne logement}
#'  \item{\code{ylvmtl}}{log du montant des comptes sur livret en francs}
#'  \item{\code{ylvnb}}{nombre de comptes sur livret}
#'  \item{\code{zocnbr}}{nombre d'opérations par cartes}
#'  \item{\code{gagel}}{log du total des engagements en francs}
#'  \item{\code{role}}{facteur, étiquette pour données d'entraînement, de validation et de test}
#'}
#' @seealso \link{visacredm}
"visalogist"


#' @title Pourriels
#' @description Données tirées de l'aide SAS servant à la classification de pourriels.
#' @format Une base de données avec 4601 lignes et 59 variables:
#' \describe{
#'   \item{\code{test}}{variable binaire pour données test et entraînement}
#'   \item{\code{make}}{mot}
#'   \item{\code{address}}{mot}
#'   \item{\code{all}}{mot}
#'   \item{\code{_3d}}{chaîne de caractères}
#'   \item{\code{our}}{mot}
#'   \item{\code{over}}{mot}
#'   \item{\code{remove}}{mot}
#'   \item{\code{internet}}{mot}
#'   \item{\code{order}}{mot}
#'   \item{\code{mail}}{mot}
#'   \item{\code{receive}}{mot}
#'   \item{\code{will}}{mot}
#'   \item{\code{people}}{mot}
#'   \item{\code{report}}{mot}
#'   \item{\code{addresses}}{mot}
#'   \item{\code{free}}{mot}
#'   \item{\code{business}}{mot}
#'   \item{\code{email}}{mot}
#'   \item{\code{you}}{mot}
#'   \item{\code{credit}}{mot}
#'   \item{\code{your}}{mot}
#'   \item{\code{font}}{mot}
#'   \item{\code{_000}}{chaîne de caractères}
#'   \item{\code{money}}{mot}
#'   \item{\code{hp}}{mot}
#'   \item{\code{hpl}}{mot}
#'   \item{\code{george}}{mot}
#'   \item{\code{_650}}{chaîne de caractères}
#'   \item{\code{lab}}{mot}
#'   \item{\code{labs}}{mot}
#'   \item{\code{telnet}}{mot}
#'   \item{\code{_857}}{chaîne de caractères}
#'   \item{\code{data}}{mot}
#'   \item{\code{_415}}{chaîne de caractères}
#'   \item{\code{_85}}{chaîne de caractères}
#'   \item{\code{technology}}{mot}
#'   \item{\code{_1999}}{mot}
#'   \item{\code{parts}}{mot}
#'   \item{\code{pm}}{mot}
#'   \item{\code{direct}}{mot}
#'   \item{\code{cs}}{mot}
#'   \item{\code{meeting}}{mot}
#'   \item{\code{original}}{mot}
#'   \item{\code{project}}{mot}
#'   \item{\code{re}}{mot}
#'   \item{\code{edu}}{mot}
#'   \item{\code{table}}{mot}
#'   \item{\code{conference}}{mot}
#'   \item{\code{semicolon}}{point virgule}
#'   \item{\code{paren}}{parenthèses}
#'   \item{\code{bracket}}{crochets}
#'   \item{\code{exclamation}}{point d'exclamation}
#'   \item{\code{dollar}}{signe de dollar}
#'   \item{\code{pound}}{signe de livre sterling}
#'   \item{\code{capavg}}{longueur moyenne des mots en majuscule}
#'   \item{\code{caplong}}{longueur des mots en majuscule}
#'   \item{\code{captotal}}{nombre total de majuscules}
#'   \item{\code{class}}{indicateur binaire, \code{1} pour un pourriel, \code{0} sinon}
#'}
#' @source George Forman et Hewlett-Packard, aide SAS
"junkmail"


#' Participation électorale américaine
#'
#' Données d'un sondage Ipsos réalisé pour FiveThirtyEight visant
#' à étudier les déterminants de la participation électorale lors
#' des élections nationales. Les données ont été couplées à des
#' registres du recensement et pondérées pour refléter la composition
#' de la population américaine dans son ensemble.
#' Pour plus de détails, consultez \href{https://raw.githubusercontent.com/fivethirtyeight/data/master/non-voters/README.md}{la description} et le \href{https://github.com/fivethirtyeight/data/raw/master/non-voters/nonvoters_codebook.pdf}{questionnaire} de l'enquête.
#' Les données sont exploitées dans \href{https://projects.fivethirtyeight.com/non-voters-poll-2020-election/}{l'article \emph{Why Millions of Americans Don't Vote}}.
#'
#' @format Une base de données avec 5837 lignes et 10 variables:
#' \describe{
#' \item{\code{race}}{facteur, soit blanc (\code{Caucasien}), Afro-Américain (\code{Afro-Americain}), Hispanique (\code{Hispanique}) ou autre.}
#' \item{\code{sexe}}{facteur, sexe de l'individu, \code{homme} ou \code{femme}}
#' \item{\code{revenu}}{facteur, variable catégorielle pour la tranche de revenu déclarée}
#' \item{\code{catvote}}{facteur ordonné, fréquence de vote, soit \code{toujours}, \code{sporadiquement}, soit \code{rarement/jamais}.}
#' \item{\code{educ}}{facteur, niveau d'éducation de la personne}
#' \item{\code{poids}}{pondération du sondage}
#' }
#' @source FiveThirtyEight, données \code{non-voters}
#' @note Données partagées sous licence Creative Commons Attribution 4.0 International License
"vote"
