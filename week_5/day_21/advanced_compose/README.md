# advanced docker compose
## instructions
### LE FICHIER DOCKER-COMPOSE.YML
Vous allez commencer tranquillement la découverte des fonctionnalités avancées de Docker Compose par un détour sur le fameux fichier YAML responsable de la configuration des services.

👉 Créez un fichier nommé "docker-compose.prod.yml" contenant un service "hello" basé sur la célèbre image hello-world.
👉 Trouvez un moyen de démarrer ce service via la commande docker-compose up.

### L’INSTRUCTION "RESTART"
👉 Créez une image Docker nommée "errorimg" à partir du Dockerfile ci-dessous.

FROM debian:latest
CMD exit 1

Vous constaterez que cette image est un peu particulière, car elle se contente d’exécuter la commande "exit 1". L’idée est de simuler un conteneur qui crash subitement.
👉 Créez un fichier Docker Compose doté d’un service basé sur l’image créée précédemment et démarrez-le.
👉 Exécutez la commande docker-compose ps afin de constater que le conteneur est en statut "Exited".
👉 Trouvez une instruction à ajouter dans le fichier Docker Compose capable de redémarrer automatiquement le conteneur lorsqu’il est arrêté suite à une erreur / un crash.
👉 Démarrez le service et exécutez la commande docker-compose ps afin de constater que le conteneur se redémarre automatiquement en boucle.

Sachez qu’il existe d’autres instructions de redémarrage, notamment "always" qui est capable de redémarrer le service en cas d’erreur, mais également au démarrage du service Docker (ou de la machine hôte).

### L’INSTRUCTION "DEPENDS_ON"

👉 Créez une image Docker nommée "what-time-is-it" à partir du Dockerfile ci-dessous.

FROM debian:latest
CMD date

Vous constatez que cette image se contente d’exécuter la commande date.
👉 Créez un fichier Docker Compose doté de deux services distincts nommés "service-alpha" et "service-beta" basés sur l’image créée précédemment.
👉Démarrez les deux services en mode attaché (sans l’option -d) afin de constater que chacun affiche la date du jour, à la seconde près.

Si vous démarrez plusieurs fois de suite les services, vous constaterez qu’ils ne démarrent pas toujours dans le même ordre, car techniquement, ils sont démarrés quasiment en même temps.
👉 Trouvez une instruction à ajouter dans le fichier Docker Compose capable de démarrer le service "service-alpha" uniquement lorsque le service "service-beta" a été démarré.

## commands

### ficher docker compose
```sh
docker compose -f docker-compose.prod.yml up hello -d
```

### l'instruction restart
```sh
docker buildx build -f Dockerfile.error -t erroring:latest .
docker compose -f docker-compose.prod.yml down
# add restart: on_failure
docker compose -f docker-compose.prod.yml up -d
```

### l'instructions depends_on
```sh
docker buildx build -f Dockerfile.date -t what-time-is-it:latest .
# add depends_on: 
#   - service-alpha
docker compose -f docker-compose.date.yml up
```
