# 1. Présentation

***Tu aimes l'art ?***
Une offre unique consistant à vous mettre en relation avec les artistes vivants près de chez vous, par le biais d'un service de location.
Découvrez chaque jour de nouvelles oeuvres d'artistes venant du monde entier. Chaque oeuvre présente sur ART FMR est en vente.
Louez des oeuvres d'artistes vivants à proximité de chez vous, et rencontrez les à domicile lors de l'accrochage de l'oeuvre.
louez ou  craquez immédiatement pour une oeuvre que vous ne voulez plus quitter.

***Tu es un artiste ?***
Prenez en main votre activité.
Exposez autant d'oeuvres que vous le souhaitez depuis votre page artiste. Définissez vos tarifs, si vous souhaitez vendre ou louer. 
Géo-localisez vous pour vous rendre visible des clients à proximité. 
Vendez à l'international et louez près de chez vous
Faites vos vente depuis chez vous, envoyez vos oeuvres partout dans le monde. 
Rencontrez votre clientèle .
Exposez vos oeuvres directement chez vos clients. Il se peut que ce soit pour un événement, chez un particulier ou encore au sein d'une entreprise.  

# 2. Parcours utilisateur

Tu cherche une nouvelle oeuvre unique à exposer chez toi , pour ton entreprise , pour un évènement ?

L'utilisateur peut accéder a une page présentant les différentes oeuvres, il pourras décider de la louer ou de l'acheter directement . il pourras également voir les oeuvres par artiste ( consulter la page artistes et voir ses oeuvres ) . 
L'idéal est de créer un système de mapping ou l'utilisateur pourra voir les artistes a proximité de chez lui  .

Les artistes pourront mettre en ligne leurs oeuvres, devront indiquer leur géolocalisation, et vont décider de mettre à la venter et/ou location leur baby selon leur propre tarif.

# 3. Concrètement et techniquement
## 3.1. Base de données
- un model User
- un model Art ( mise en ligne d'une oeuvre d'art)
- une table de jointure pour la location d'oeuvre ( genre "Rent" i don't know)

Un user peut louer une/plusieurs oeuvre(s) et une oeuvre peut avoir plusieurs user (condition de date, l'oeuvre doit etre disponible ). On passera par une table de jointure Rent  . 

## 3.2. Front

- views de devise (formulaires)
- cards des oeuvres
- nav, jumbotron, footer etc
- page profil ( user, artiste, oeuvre )

## 3.3. Backend

- systeme d'authentification (devise)
- mise en place d'un Stripe
- mise en place d'un système de mailing 
- (systeme de mapping)
- (systeme de commentaires, de like)
- (Un outil pour rechercher les artistes ou titre d'une oeuvre )

## 3.4. Mes besoins techniques

Nous somme actuellement trois dans l'equipe, on cherche une ou deux personnes en plus pour le back-end .

> Plus on est de fou plus on rit .

# 4. La version minimaliste mais fonctionnelle qu'il faut avoir livré la première semaine

- mise en place du squelette back-end ( model, controller, views, roots etc)
- mise en place du squellette visuel ( cards, nav,  jumbotron, footer et formulaire, page profil )
- mise en ligne d'une oeuvre 
- devise fonctionnel

# 5. La version que l'on présentera aux jury

- mise en place de stripe
- systeme de like et de commentaires
- mailing fonctionnel ( "inscription validée, bienvenue @name" , "ton oeuvre art.title est bien en ligne " etc ... )
- optimisation ( mapping, barre de recherche, et tout autres idée bonne a prendre : optionnel )

# 6. Le mentor
Notre mentor : OLivier( session 4 THP)

# 7. Heroku :
https://artfmr.herokuapp.com/
