
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
#'  \item{\code{duree}}{double, nombre de semaines de prestations payées par le programme d’assurance emploi.}
#'  \item{\code{age}}{facteur, variable catégorielle pour la tranche d’âge, soit \code{18,25}, \code{25,50} ou \code{50,65} ans.}
#'  \item{\code{formation}}{facteur, variable catégorielle indiquant le niveau de formation, soit \code{aucune}, \code{secondaire}, \code{professionnel}, \code{collegial} ou \code{universitaire}.}
#'  \item{\code{sexe}}{entier, variable indicatrice binaire ; 1 pour femmes, 0 pour hommes.}
#'  \item{\code{retrait}}{entier, \code{1} si la personne bénéficiaire se désinscrit du programme avant la fin de la période maximale de prestation parce qu’elle cesse de chercher un emploi, \code{2} si elle trouve un emploi, \code{0} sinon.}
#'  \item{\code{montant}}{double, montant hebdomadaire des prestations, allant jusqu’à 55% de la rémunération hebdomadaire avant perte d’emploi jusqu’à concurrence de 547$ par semaine.}
#'  \item{\code{nheures}}{entier, nombre d’heures cumulées à l’emploi avant d’être au chômage, soit un minimum de 14
#'  semaines (420 heures) ou 22 semaines (700 heures) dépendamment du taux de chômage de la région et du nombre d’heures d’emploi assurables dans la période de référence.}
#'  \item{\code{prestationmax}}{double, durée maximale pour les prestations}
#'}
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
"cluster"


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
"dbmmissing"
