# Network and port forwarding with k8s

## instructions

👉 Via la commande kubectl run, démarrez un pod nommé "httpd-server" contenant un seul conteneur, basé sur l’image officielle de httpd et en exposant le port 80.
👉 Après quelques secondes, vérifiez l’état du pod via la commande permettant de lister les pods liés au cluster minikube.

👉 À partir de la documentation de kubectl, trouvez une commande permettant d’obtenir toutes les informations détaillées d’une ressource Kubernetes et exécutez-là afin de décrire le pod "httpd-server".
👉 Grâce à la commande précédente, vous êtes censé pouvoir récupérer l’adresse IP locale du pod. Tentez de faire une requête HTTP via curl à partir de cette adresse.

curl http://172.17.X.X
La requête n’aboutit pas ? C’est tout à fait normal ! Rappelez-vous que les conteneurs Docker sont isolés, y compris au niveau du réseau.
C’est le même principe pour Kubernetes : les conteneurs inclus dans un pod peuvent communiquer entre eux, mais il faut explicitement rediriger (forward) un port de la machine hôte vers un conteneur afin de communiquer avec lui, y compris si le port en question a déjà été exposé lors de la création du pod.
👉 Afin de mieux comprendre le fonctionnement de l’isolation réseau de Kubernetes, trouvez une commande permettant de rediriger le port 8080 de la machine hôte vers le port 80 du conteneur "httpd-server”.
👉 Gardez ouvert le terminal où la commande précédente a été exécutée et à partir d’un nouveau terminal, tentez une requête HTTP via curl sur localhost (ou 127.0.0.1), en précisant le port 8080.

curl -v http://localhost:8080
👉 Pour finir, assurez-vous de supprimer le pod créé au début de ce challenge.

## commands

```sh
kubectl run httpd-server --image=httpd:latest --port=80
kubectl port-forward pod/httpd-server 8080:80
curl -v http://localhost:8080
```

##
