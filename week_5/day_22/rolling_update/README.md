# Rolling update

## instructions
### get started
👉 Créez et appliquez un manifeste de déploiement en vous assurant que les contraintes suivantes soient respectées :
- Le nom de l’application déployée sera "rollingapp"
- Le nom du manifeste sera "rollingapp-deployment"
- Le conteneur déployé sera nommé "nginx-hello", basé sur l’image "nginxdemos/hello" dans sa dernière version et devra exposer le port 80
- 3 pods devront être utilisés pour le déploiement du conteneur "nginx-hello"


👉 Créez et appliquez un service dédié au load balancing de l’application "rollingapp" déployée précédemment.


👉 Consultez la documentation pour la commande ```kubectl set``` afin de procéder à une mise à jour de l’application déployée en modifiant l’image utilisée par les conteneurs "nginx-hello".
La nouvelle version à déployée est basée sur une autre version de la même image taguée
"plain-text".

Si vous vérifiez la liste des pods pendant que la mise à jour est déployée, vous constaterez que les "anciens" pods sont petit à petit supprimés pour laisser place à des nouveaux dotés de conteneurs basés sur la nouvelle version de l’image.

👉 Vérifiez les informations détaillées de tous les pods en une seule commande afin de vérifier que chacun héberge bien un conteneur basé sur l’image "nginxdemos/hello:plain-text".


###  Rollback update

Vous commencez à vous rendre compte que Kubernetes est un véritable must-have pour la gestion et le déploiement de conteneurs d’applications, surtout à grande échelle.
Imaginez le contexte suivant : suite au déploiement d’une nouvelle version, les développeurs se rendent compte qu’une fonctionnalité n’a pas été recettée (vérifiée) en profondeur et qu’une mise à jour vers la version précédente doit être faite de toute urgence…

👉 Trouvez la commande permettant de revenir sur une version précédente du déploiement et annuler la dernière mise à jour, sans utiliser la commande kubectl set image.


👉 Vérifiez les informations détaillées de tous les pods (en une seule commande) afin de vérifier que chacun héberge bien un conteneur basé sur l’image "nginxdemos/hello:latest".

## commands
### get started
```sh
kubectl apply -f roolingapp-doployment.yml
kubectl apply -f roleansapp-service.yml
```

[set image doc](https://kubernetes.io/docs/reference/kubectl/generated/kubectl_set/kubectl_set_image/)

```sh
kubectl set image deployments/rollingapp-deployment nginx-hello=nginxdemos/hello:plain-text
```
### rollback update
[k8s rollback](https://learnk8s.io/kubernetes-rollbacks)
```sh
kubectl rollout history deployment/rollingapp-deployment # check revisions
kubectl rollout undo deployment/rollingapp-deployment --to-revision=1 # rollback to last revision
```
