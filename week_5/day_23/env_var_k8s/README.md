# Environments variables with Kubernetes
## instructions

### SETUP
👉 Créez un manifeste de déploiement en vous assurant que les contraintes suivantes soient respectées :

- Le nom de l’application déployée sera ```motd```
- Le nom du manifeste sera ```motd-deployment```
- Le conteneur déployé sera nommé ```alpine``` et basé sur l’image alpine dans sa dernière version
- 5 pods devront être utilisés pour le déploiement du conteneur ```alpine```

Si vous tentez d’appliquer ce manifeste de déploiement, vos pods seront en erreur et c’est tout à fait normal : le conteneur basé sur l’image alpine s’arrête après son lancement, car il n’a aucune action à effectuer.

### CONFIGMAPS

De la même façon qu’il existe des manifestes pour le déploiement et pour les services, la configuration des variables d’environnement peut également se faire avec un simple fichier grâce au concept de ConfigMaps.

👉 Créez un fichier nommé ```motd-config.yml``` contenant le manifeste suivant.

```yml
apiVersion: v1
kind: ConfigMap
metadata:
  name: motd-config
  labels:
    app: motd
data:
  MESSAGE: "Hi i'm a simple container inside a pod"
  OTHER_MESSAGE: "You can't see me!"
```

Si vous prenez le temps d’analyser ce fichier, vous pouvez voir que les metadata sont semblables à un manifeste de déploiement et que les variables d’environnement sont simplement définies dans la tableau "data".

👉 Appliquez ce manifeste grâce à la commande habituelle donnée ci-dessous.

```sh
kubectl apply -f motd-config.yml
```

👉 Trouvez la commande kubectl capable d’afficher tous les manifestes ConfigMaps du cluster afin de vérifier que ```motd-config``` a bien été créé.

👉 Trouvez la commande kubectl capable de lister chaque variable d'environnement créé dans un manifeste ConfigMap précis.


👉 Modifiez le manifeste de déploiement créé au début de ce challenge afin de faire en sorte que tous les conteneurs affichent la variable d’environnement ```MESSAGE```.

Si vos pods sont en erreur, c’est tout à fait normal : le conteneur basé sur l’image alpine s’arrête après son lancement et l’exécution de la commande echo, car il n’a aucune autre action à effectuer.

👉 Après avoir appliqué le manifeste de déploiement, vérifiez que le message soit affiché par chaque conteneur grâce à la commande suivante.

```sh
kubectl logs -f -l app=motd
```

Si vous voyez 5 fois le message "Hi i'm a simple container inside a pod", c’est que les manifestes ont bien été développés et appliqués, bravo ! 🎉

👉 Pour finir, modifiez la variable d’environnement "MESSAGE" et re-déployez l’application "motd" afin de voir si ce nouveau message s’affiche correctement.

## Commands
### setup
```sh
kubectl apply -f motd-deployment.yml
```

### configmaps
```sh
kubectl apply -f motd-config.yml
kubectl get configmaps -A -o yaml # display all manifests of ConfigMaps
kubectl describe configmap motd-config  # list all environment variables
kubectl get configmaps -o yaml motd-config 
kubectl logs -f -l app=motd --max-log-requests 7
kubectl apply -f motd-config.yml
# env var are left unchanged even after apply, we need to restart deployment
kubectl rollout restart deployment/motd-deployment
kubectl logs -f -l app=motd --max-log-requests 10
```
