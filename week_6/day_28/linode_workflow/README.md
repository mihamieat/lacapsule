# Docker in production
## Instructions
### PRÉPARATION DU DOCKER COMPOSE
👉 Créez un fichier `docker-compose.yml` chargé de déployer une plateforme collaborative d’hébergement de fichiers Nextcloud en respectant les contraintes suivantes :
- Le conteneur sera basé sur l’image officielle de `nextcloud:latest`
- Le port par défaut de Nextcloud sera exposé afin d’être joignable à partir du port `8585` sur la machine hôte
- Un volume nommé `nextcloud` (managé par Docker) sera créé afin de rendre persistant le dossier `/var/www/html` du conteneur

👉 Démarrez le service `nextcloud` via la commande docker-compose afin de le tester en local avant de le déployer dans la partie suivante.

👉 Visitez l’URL `localhost:8585` afin de vérifier que la solution 

Nextcloud a bien été déployée.

👉 Configurez Nextcloud via son interface avec les paramètres de base et uploadez un simple fichier texte afin de vérifier la persistance des données.

👉 Stoppez puis supprimez le conteneur lié au service `nextcloud`.

👉 Redémarrez le service `nextcloud` afin de vérifier que le fichier texte précédemment uploadé est toujours présent.

👉 Créez un répertoire GitLab public afin d’y héberger votre fichier `docker-compose.yml`.

👉 Récupérez le lien direct vers le fichier brut (raw). L’URL est censée ressemble à ceci : `https://gitlab.com/NOM_COMPTE/NOM_REPO/-/raw/main/docker-compose.yml`

Cette dernière étape est essentielle pour la suite, car Linode a besoin d’un lien vers le fichier Docker Compose afin de déployer un conteneur en production.

### DÉPLOIEMENT EN PRODUCTION
👉 À partir de la marketplace de Linode, sélectionnez l’application Docker.

Vous devez sélectionner une instance `Nanode 1 GB` dans `Shared CPU`, le tout sous Ubuntu 22.04.

👉 Vous avez désormais accès à une machine pre-configurée avec Linode installée. Par l’intermediaire de SSH, copiez votre docker-compose puis lancez le.

👉 Vérifiez ensuite le démarrage de Nextcloud en visitant l’URL sur le port 8585.

👉 Configurez Nextcloud via son interface avec les paramètres de base et uploadez un simple fichier texte afin de vérifier la persistance des données.

👉 Redémarrez le serveur via l’interface de Linode (option `Reboot`) puis vérifiez que le fichier texte précédemment uploadé est toujours présent.
Félicitations, vous avez déployé votre premier conteneur en production ! 🎉

👉 Assurez-vous de résilier toutes les ressources créées afin d’éviter une surfacturation et de dépasser le crédit offert par Linode, notamment le serveur Linode dédié au déploiement de votre application Docker.


## My answers

### repositories
- `git@github.com:mihamieat/nextcloud-compose.git`
- `git@gitlab.com:la-capsule8594343/nextcloud-compose.git`

### linode
- create an account
- generate an pair of ssh keys with an empty passphrase
```sh
ssh-keygen -f linode -N ""
mv linode* ~/.ssh/
```
- create a `linode`
- pw: `kormef-sycroN-fecwo9` | `mezjup-gorcic-6qiXfa`
- try to connect to ssh
- copy compose file
```
scp  docker-compose.yml root@<host>:/root/    
```
- compose the freshly copied docker
- check url now with generated host ip
