# Database deployment
## instructions
### DÉPLOIEMENT D’UNE BASE DE DONNÉES
👉 Sur le hub d’images Docker, trouvez l’image adaptée afin de déployer une base de données PostgreSQL.

👉 Créez un nouveau fichier Docker Compose contenant un service nommé "database" et  basé sur l’image précédemment trouvée.
Le service devra être configuré pour respecter ces deux contraintes :
Le mot de passe de l’utilisateur créé par défaut sera "acknowledge_me"
Même si le conteneur lié au service est supprimé, les données devront être persistantes grâce à un volume créé et managé par Docker. Ce volume nommé "db_data" devra être créé et utilisé dans le fichier Docker Compose.

👉 Démarrez le service "database" et vérifiez le statut du conteneur ainsi que la liste des volumes Docker grâce aux commandes suivantes.

```sh
docker-compose ps
docker volume ls
```

👉 Modifiez le service "database" afin de "binder" le port par défaut de PostgreSQL sur la machine hôte.


### VÉRIFICATION DU DÉPLOIEMENT
👉 Trouvez un moyen de récupérer l’adresse IP locale du conteneur lié au service "database". Cette adresse est censée débuter par "172" et vous pouvez la ping afin de vérifier si le conteneur répond bien.

👉 Sur votre machine hôte, utilisez l’utilitaire en ligne de commande psql afin de vous connecter à la base de données PostgreSQL.
Vous devrez préciser l’adresse IP précédemment récupéré (via l’option -h) ainsi que l’utilisateur par défaut postgres (via l’option -U)

👉 Une fois l'interpréteur de commande psql démarré, vérifiez la version utilisée par la base de données grâce à l’instruction suivante.

```mysql
SELECT VERSION();
```

👉 Dans la base de données, créez une nouvelle table qui ne sera utilisée que pour vérifier la persistance des données.
👉 Supprimez puis recréez le conteneur lié au service "database" et connectez-vous à la base de données via psql afin de vérifier si la table créée précédemment est toujours présente.

### BONUS
👉 Créez un nouveau service permettant d’utiliser le gestionnaire de base de données adminer afin d’administrer facilement la base de données PostgreSQL via un navigateur.

## commands
```sh
docker buildx build -t db-deploy0:latest . # if image is not available.
docker compose up -d
docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <container_id> # to check ip
psql -h 127.0.0.1 -U myuser -d mydatabase 
```
