# database depoloyment with kubernetes
## instructions

### SETUP
👉 Créez un manifeste ConfigMap dédié au déploiement d’une base de données PostgreSQL en vous assurant que les contraintes suivantes soient respectées :

- Le ConfigMap sera nommé "mydatabase-config" et dédié à une application nommée "mydatabase"
- Le nom de la base de données par défaut sera "myawesomeapp"
- Le nom d’utilisateur par défaut sera "themiz" avec "IAWAWESOME" comme mot de passe
- Le nom des trois variables d’environnement précédentes devront être conformes à celles utilisées par l’image postgres


👉 Appliquez le manifeste et vérifiez sa création grâce aux commandes habituelles ```kubectl get``` et ```kubectl describe```.

### VOLUME PERSISTANT
👉 Créez un fichier nommé "mydatabase-storage.yml" contenant les manifestes suivants.

```yml
kind: PersistentVolume
apiVersion: v1
metadata:
  name: mydatabase-pv
  labels:
    app: mydatabase
spec:
  storageClassName: manual
  capacity:
    storage: 5M
  accessModes:
    - ReadWriteMany
  hostPath:
    path: "/mnt/mydatabase"
---
kind: PersistentVolumeClaim
apiVersion: v1
metadata:
  name: mydatabase-pvc
  labels:
    app: mydatabase
spec:
  storageClassName: manual
  accessModes:
    - ReadWriteMany
  resources:
    requests:
      storage: 5M
```

Pour commencer, vous pouvez constater que votre fichier ne contient pas un manifeste, mais deux, séparés par ```---```.

Sachez qu’il est techniquement possible de rassembler tous vos manifestes (déploiement, service, etc.) dans un seul fichier, mais ce n’est pas une excellente pratique vous pouvez imaginer qu’on risque d’avoir un seul gros bloc illisible et difficilement maintenable.

👉 Avant d’aller plus loin, prenez connaissance du concept de "persistent volumes" en lisant attentivement l’introduction de la [documentation](https://kubernetes.io/fr/docs/concepts/storage/persistent-volumes)

👉 Appliquez les manifestes et vérifiez leurs états grâce aux commandes suivantes.

```sh
kubectl get persistentvolumes
kubectl get persistentvolumeclaims
```

### DÉPLOIEMENT DE LA BASE DE DONNÉES
Les variables d’environnements et le volume sont prêts à être utilisés, il ne reste plus qu’à déployer la base de données au sein du cluster.

👉 Créez un manifeste de déploiement en vous assurant que les contraintes suivantes soient respectées :

- Le nom de l’application déployée sera "mydatabase"
- Le nom du manifeste sera "mydatabase-deployment"
- Le conteneur déployé sera nommé "postgres" et basé sur la fameuse image officielle de PostgreSQL dans sa dernière version
- Le port par défaut de PostgreSQL sera exposé via "containerPort" dans le tableau "ports"
- Les variables d’environnement définies dans le manifest ConfigMap créé précédemment devront être utilisées pour la configuration de la base de données
- Le volume créé précédemment devra être utilisé pour rendre persistantes les données de PostgreSQL
- Un seul pod sera utilisé pour le déploiement du conteneur "postgres"

👉 Afin de vérifier le déploiement de tout l’environnement de base de données, trouvez un moyen d’exécuter une commande dans le seul pod déployer afin d’utiliser la CLI psql afin de vous connecter à la base de données PostgreSQL.

👉 Une fois l'interpréteur de commande psql démarré, vérifiez la version utilisée par la base de données grâce à l’instruction suivante.

```mysql
postgres=# SELECT VERSION();
```

👉 Dans la base de données, créez une nouvelle table de test qui ne sera utilisée que pour vérifier la persistance des données.

👉 Supprimez le pod dédié à l’hébergement de la base de données et connectez-vous à la CLI psql du pod redéployé afin de vérifier si la table créée précédemment est toujours présente.

```mysql
postgres=# \d
```

## commands

### setup
```sh
kubectl apply -f database-config.yml
kubectl apply -f database-deployment.yml
```

### volume persisant
```sh
kubectl apply -f database-storage.yml
kubectl get persistentvolumes
kubectl get persistentvolumeclaims
# add volumes to deployment
kubectl apply -f database-deployment.yml
kubectl exec -it pods/mydatabase-deployment-5c8976f54c-pd5dz -- /bin/sh  # enter the pod terminal
```
