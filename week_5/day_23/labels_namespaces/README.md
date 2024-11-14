# Labels and Namespaces

## Instructions

### LABELS
Les labels sont des données de type clé/valeur qui sont attachés aux objets permettant de les identifier plus facilement.

Si vous regardez d’un peu plus près le contenu d’un des fichiers de déploiement que vous avez créé, vous remarquerez que la partie "metadata" contient un tableau "labels" possédant une étiquette "app".

```sh
apiVersion: apps/v1
kind: Deployment
metadata:
  name: httpd-server-deployment
  labels:
    app: httpd-server
spec:
  replicas: 4
  selector:
    matchLabels:
      app: httpd-server
  template:
    metadata:
      labels:
        app: httpd-server
    spec:
      containers:
      - name: httpd-server
        image: httpd:latest
        imagePullPolicy: Always
        ports:
        - containerPort: 80
```

👉 Déployez le manifeste ci-dessus et listez tous les pods du cluster avec l’option "--show-labels".
Le label "app=httpd-server" est censé s’afficher à côté de chaque pod lié au manifeste de déploiement.

👉 Trouvez la commande kubectl permettant de lister les pods en appliquant un filtre sur le label "app" afin de ne voir que les pods liés à notre application "httpd-server".


👉 Trouvez la commande kubectl permettant d’afficher les logs en direct de tous les pods liés à notre application "httpd-server".



### NAMESPACES

Kubernetes est capable de prendre en charge plusieurs clusters virtuels présents sur le même cluster physique, ces clusters virtuels sont appelés des namespaces.

Les namespaces vont plus loin que la notion de labels, car ils permettent de gérer plusieurs applications ou environnements sur le même cluster, auprès du même master node et en les isolant afin d’assurer un maximum de sécurité, bien évidemment.

👉 Listez les namespaces du cluster grâce à la commande ci-dessous.

```sh
kubectl get namespaces
```

L’output de cette commande est censée vous montrer quatres namespaces initiaux créés par Kubernetes, notamment "defaut" qui sera sans grande surprise le namespace par défaut pour les objets (déploiements, services, etc.) créés sans namespace.

👉 Trouvez la commande kubectl permettant de créer un nouveau namespace nommé "webapp-prod".

👉 Démarrez un pod contenant un seul conteneur nommé "httpd-server", basé sur l’image officielle de httpd et en exposant le port 80.

Ce pod devra être créé en mode impératif (sans passer par un manifeste) et appartiendra au namespace créé précédemment.


👉 Listez les pods liés à un namespace en particulier grâce à la commande ci-dessous.

```sh
kubectl get pods -n webapp-prod
```

Si vous tentez de lister les pods sans préciser de namespace, kubectl vous affichera les pods du namespace "default" et votre pod créé précédemment ne sera pas affiché.

👉 Supprimez le pod créé précédemment via la commande kubectl delete.

👉 Récupérez le manifeste partagé au début de ce challenge (httpd-server-deployment) et appliquez-le au namespace "webapp-prod".


👉 Vérifiez les informations des pods déployés, notamment leur namespace, grâce à la commande suivante.

```sh
kubectl describe pods -n webapp-prod
```

Une nouvelle fois, si vous tentez d’obtenir des informations sur tous les pods sans préciser de namespace, kubectl vous affichera les pods du namespace "default" et vos pods déployés précédemment ne seront pas affichés.

## Commands

### labels
```sh
kubectl apply -f my-httpd-server-deployment.yml 
kubectl get pods --selector app=httpd-server  --show-labels
kubectl lots -l app=httpd-server # log of my app pods
```

### namespaces
```sh
kubectl get namespaces
kubectl creaet namespace webapp-prod # create a new namespace
kubectl run httpd-server --image=httpd --port=80 --namespace=webapp-prod # imperative command to run an httpd server
kubectl delete pods -n webapp-prod httpd-server # delete the created pod specified with the namespace
```

### add namespace to deployment
```sh
kubectl delete deployments.apps httpd-server-deployment
kubectl apply -f my-httpd-server-deployment.yml
```
