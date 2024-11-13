# Service and load balancer
## instructions
👉 Créez un manifeste "mywebserver-deployment.yml" dédié à un déploiement de pods en suivant les contraintes suivantes :
- Le nom de l’application déployée sera "mywebserver"
- Le nom du manifeste de déploiement sera "mws-deployment"
- Le conteneur déployé sera nommé "nginx-hello", basé sur l’image nginxdemos/hello dans sa dernière version et devra exposer le port 80
- 5 pods devront être utilisés pour le déploiement du conteneur "nginx-hello"

👉 Appliquez le manifeste créé précédemment afin de déployer les pods contenant chacun un seul conteneur "nginx-hello".

```sh
kubectl apply -f mywebserver-deployment.yml
```

LA NOTION DE SERVICE
Comme vu dans les challenges précédents, la commande kubectl port-forward permet de binder un port d’un conteneur sur la machine hôte, ce qui est utile pour comprendre le fonctionnement de Kubernetes et s'entraîner, mais pas vraiment adapté dans un environnement de production.
En effet, la notion de service avec Kubernetes sera plus adaptée car elle permettra de rendre disponible une application web sur internet, mais également de rediriger le trafic équitablement entre les pods afin de répartir la charge, c’est ce que l’on appelle un load balancer.

👉 Créez un nouveau fichier nommé "mywebserver-service.yml" et complétez le service ci-dessous afin de l’adapter à votre déploiement précédemment créé.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: mws-service
  labels:
    app: ???
spec:
  type: LoadBalancer
  ports:
  - name: http
    port: ???
    protocol: TCP
    targetPort: ???
  selector:
    app: ???
  sessionAffinity: None
```

👉 Appliquez le service créé précédemment via la commande kubectl apply.

👉 Trouvez l’option à appliquer à la commande kubectl get afin de vérifier l’état des services.

L’output de cette commande doit afficher une nouvelle ligne contenant "mws-service". Dans un environnement de production, la colonne "EXTERNAL-IP" affiche l’IP publique permettant de joindre le service et donc l’application déployée via Kubernetes.

Fort heureusement, notre meilleur ami minikube permet de rediriger l’hôte local vers le service afin de simuler un contexte dans lequel l’environnement de production (déployé via AWS, par exemple) expose une IP publique. Ça peut paraître compliqué, mais rassurez-vous, Kubernetes se charge de tout !

👉 Utilisez la commande suivante afin d’obtenir une URL censée rediriger, via le service déployé précédemment, vers un pod exposant le port 80 du conteneur qu’il héberge.

```sh
minikube service mws-service --url
```
👉 Ouvrez l’URL affichée par la commande précédente à partir d’un navigateur afin de constater que l’image "nginxdemos/hello" affiche les informations du serveur web ou plus précisément celles du pod hébergeant l’application.

👉 Récupérez le nom du pod affiché sur la ligne "Server name" afin de le supprimer via la commande kubectl delete.

👉 Actualisez la page précédemment ouverte afin de constater qu’un autre pod a pris le relais automatiquement grâce au manifeste de déploiement et au load balancer configuré via le service.

👉 Pour finir, supprimez le manifeste de déploiement ainsi que le service de ce challenge.

```sh
kubectl delete deployment mws-deployment
kubectl delete service mws-service
```

## commands

```sh
kubectl apply -f mywebserver-deployment.yml
kubectl apply -f mywebserver-service.yml
kubectl get all
minikube service msw-service --url
kubectl delete pod mws-deployment-6ff5c44df4-bzt77
kubectl delete deployment mws-deployment
kubectl delete service mws-service 
```
