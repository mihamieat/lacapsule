# SQL database in the cloud

## instructions

### CONFIGURATION DU SERVICE RDS
👉 À partir du service Relational Database Service (RDS) d’AWS, créez une base de données PostgreSQL configurée comme suit :
- Modèle : Offre gratuite
- Identifiant d'instance de base de données : myfirstdatabaseincloud
- Identifiant principal : postgres
- Mot de passe : Généré automatiquement par RDS
- Classe d’instance : db.t3.micro
- Stockage alloué : Désactiver la "Mise à l'échelle automatique du stockage"
- Connectivité : Ne pas se connecter à une ressource de calcul EC2
- Accès public : Oui
- Port de base de données : 5499
- Analyse des performances : Désactiver "Performance Insights"
- Configuration supplémentaire : Désactiver la "Mise à niveau automatique des versions mineures"

Les options de configuration qui ne sont pas précisées seront laissées à leur valeur par défaut.

👉 Pendant la création de la base de données, n’oubliez pas de récupérer les informations d’identifications, notamment le mot de passe généré automatiquement par RDS.

👉 Une fois la base de données déployée, créez un nouveau groupe de sécurité nommé ``firstdatabase`` à partir de la console EC2 afin d’autoriser le trafic entrant sur le port de la base de données PostgreSQL uniquement à partir de votre adresse IP.

👉 Modifiez les paramètres de l’instance de base de données afin d’utiliser le nouveau groupe de sécurité "firstdatabase". Appliquez immédiatement les modifications de la configuration.

### UTILISATION DU SERVICE
👉 Récupérez le point de terminaison afin de vous connecter à la base de données via la CLI psql.

👉 Une fois l'interpréteur de commande psql démarré, vérifiez la version utilisée par la base de données grâce à l’instruction suivante.

```sh
postgres=# SELECT VERSION();
```

👉 Modifiez les paramètres de la base de données afin de :
Sauvegarder automatiquement la base de données à 4h du matin
Conserver les sauvegardes automatiques pendant 1 jour (au lieu de 7 par défaut)

👉 Appliquez immédiatement les modifications de la configuration.
Le service RDS est basé sur un concept de sauvegarde nommé "instantanés" (ou snapshot). Ce système permet de restaurer rapidement une sauvegarde de base de données en créant une nouvelle instance en quelques clics.
Malheureusement, cette fonctionnalité n’est pas incluse dans l’offre gratuite d’AWS.
👉 Assurez-vous de résilier et libérer toutes les ressources crées afin d’éviter une surfacturation et de dépasser le tier gratuit d’AWS :
Base de données RDS : supprimez l’instance "myfirstdatabaseincloud"
Instantanés : supprimez tous les éventuels snapshots restants

J'ai fini cette partie
CONFIGURATION DU SERVICE GOOGLE CLOUD SQL
👉 À partir du service Google Cloud SQL, créez une instance de base de données PostgreSQL configurée comme suit :
Modèle : Offre standard
Identifiant d'instance de base de données : myfirstdatabaseincloud
Mot de passe : Généré automatiquement par Google Cloud
Classe d’instance : db-f1-micro
Stockage alloué : 10 Go
Connectivité : Accès public activé
Port de base de données : 5432

J'ai fini cette partie
UTILISATION DU SERVICE
👉 Récupérez le point de terminaison afin de vous connecter à la base de données via la CLI psql.
psql -h [endpoint] -U postgres -d postgres

👉 Une fois l'interpréteur de commande psql démarré, vérifiez la version utilisée par la base de données grâce à l’instruction suivante.

postgres=# SELECT VERSION();
👉 Modifiez les paramètres de la base de données pour configurer les sauvegardes automatiques à 4h du matin et les conserver pendant 1 jour.
👉 Supprimez l'instance à la fin pour éviter toute surfacturation.

J'ai fini cette partie
CONFIGURATION DU SERVICE AZURE SQL DATABASE
👉 Créez une base de données SQL sur Azure SQL Database avec les paramètres suivants :
Modèle : Offre standard
Nom de la base de données : myfirstdatabaseincloud
Serveur : Créez un nouveau serveur avec authentification SQL
Mot de passe : Généré automatiquement par Azure
Performance : Basic
Taille de stockage : 2 Go

J'ai fini cette partie
UTILISATION DU SERVICE
👉 Récupérez le point de terminaison afin de vous connecter à la base de données via la CLI psql.

psql -h [endpoint] -U postgres -d postgres

👉 Une fois l'interpréteur de commande psql démarré, vérifiez la version utilisée par la base de données grâce à l’instruction suivante.
postgres=# SELECT VERSION();
👉 Modifiez les paramètres de la base de données pour configurer les sauvegardes automatiques à 4h du matin et les conserver pendant 1 jour.
👉 Supprimez l'instance à la fin pour éviter toute surfacturation.

## my answers and notes

### configuration d'un service rds

- [x] Modèle : Offre gratuite OK
- [x] Identifiant d'instance de base de données : myfirstdatabaseincloud OK
- [x] Identifiant principal : postgres OK
- [x] Mot de passe : Généré automatiquement par RDS OK
- [x] Classe d’instance : db.t3.micro OK
- [x] Stockage alloué : Désactiver la "Mise à l'échelle automatique du stockage"
- [x] Connectivité : Ne pas se connecter à une ressource de calcul EC2
- [x] Accès public : Oui
- [x] Port de base de données : 5499
- [x] Analyse des performances : Désactiver "Performance Insights"
- [x] Configuration supplémentaire : Désactiver la "Mise à niveau automatique des versions mineures"

You can view your credentials after you create your database. Click the 'View credential details' in the database creation banner to view the password.

password ``vMopI5pl2odhpeEvXVp2``

- [x] created a new securit group to allow access to port 5499 from my computer
- [x] apply new security group in db instance
- [x] suppression  