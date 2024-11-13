# popular cms
## instructions
### DÉPLOIEMENT DE LA BASE DE DONNÉES
Ce challenge est un peu particulier puisqu’il vous permettra de vous préparer au hackathon de demain en déployant un environnement complet pour le fameux CMS WordPress couplé à une base de données et un back-office.

👉 Créez un fichier "docker-compose.wp.yml" qui contiendra tous les services que vous allez créer dans les étapes suivantes.

👉 Au sein de ce fichier Docker Compose, créez un premier service nommé "mariadb" dédié à la base de données du CMS et qui devra respecter les contraintes suivantes :
- Le service sera basé sur l’image Docker officielle du moteur de base de données MariaDB
- Un volume nommé "mariadb" sera créé et utilisé afin de rendre persistantes les données
- Une base de données nommée "wordpress" sera créée par défaut
- Un utilisateur par défaut nommé "admin" avec le mot de passe "changeme123" sera créé par défaut
- Le conteneur lié au service sera systématiquement redémarré (lors d’un crash ou du démarrage de la machine hôte)
- L’ensemble des variables d’environnement utilisées pour le service devront être définies dans un fichier nommé ".wp.env"

👉 Créez un second service nommé "adminer" dédié à la visualisation de la base de données MariaDB (basée sur MySQL) et qui devra respecter les contraintes suivantes :

- Le service sera basé sur l’image Docker officielle de Adminer
- Le port par défaut d’Adminer sera exposé afin d’être joignable à partir du port 8686 sur la machine hôte
- Le conteneur lié au service ne devra démarrer que lorsque que le service "mariadb" sera prêt
- Le conteneur lié au service sera systématiquement redémarré sauf s’il a été manuellement arrêté auparavant

👉 Démarrez les services "mariadb" et "adminer" et visitez l’URL localhost:8686 depuis un navigateur internet sur la machine hôte afin de vous connecter à la base de données MariaDB et vérifier que le service a correctement été configuré.

### DÉPLOIEMENT DU CMS
👉 Créez un dernier service nommé "wordpress" dédié au CMS du même nom et qui devra respecter les contraintes suivantes :

- Le service sera basé sur l’image Docker officielle du CMS WordPress
- Le port par défaut de Wordpress sera exposé afin d’être joignable à partir du port 8585 sur la machine hôte
- Un volume nommé "wordpress" sera créé et utilisé afin de rendre persistantes les données
- Le service devra évidemment être configuré via des variables d’environnement pour communiquer avec la base de données précédemment déployée
- Le conteneur lié au service ne devra démarrer que lorsque que le service "mariadb" sera prêt
- Le conteneur lié au service sera systématiquement redémarré (lors d’un crash ou du démarrage de la machine hôte)
- L’ensemble des variables d’environnement utilisées pour le service devront être définies dans un fichier nommé ".wp.env"

👉 Démarrez tous les services et visitez l’URL localhost:8585 depuis un navigateur internet sur la machine hôte afin de configurer le CMS WordPress et publier un article afin de vérifier que tout est bien configuré.

👉 Connectez-vous de nouveau à l’interface d’Adminer pour modifier directement le titre de l’article précédemment créé en base de données.

👉 Arrêtez l’ensemble des services via la commande docker-compose stop et démarrez-les de nouveau afin de vérifier que les données sont bien persistantes.

## commands
```sh
docker compose up -d
# add wordpres service
docker compose up wordspres -d
```
