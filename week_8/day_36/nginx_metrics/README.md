# Nginx Metrics

## Instructions

### NGINX NODE EXPORTER
Maintenant que vous êtes capable de récolter les metrics du système hôte, il est temps d’aller plus loin en configurant un autre `exporter` capable de communiquer avec un web serveur et plus précisément Nginx et Nginx Prometheus Exporter.

👉 Pour commencer, installez Docker sur la VM Linode.

👉 Vérifiez l’installation de Docker en récupérant sa version via l’option `--version`.

Pour simplifier l’installation du serveur web et l’export des metrics, vous allez utiliser Docker afin de créer des conteneurs qui seront capables de communiquer entre eux et avec Prometheus.

👉 Via la commande docker run, créez et démarrez un conteneur Docker basé sur l’image officielle de Nginx en exposant le port 80 sur le port 8080 de la machine hôte.

👉 Vérifiez que le serveur web a bien été démarré en visitant l’IP publique du serveur, sur le port 8080.

Comme d’habitude, si vous voyez le traditionnel message de bienvenue de Nginx, c’est que tout est opérationnel pour la suite !

👉 Trouvez un moyen d’activer la page de status de Nginx sur l’URL /stub_status en modifiant le fichier `/etc/nginx/conf.d/default.conf` sur le conteneur Nginx.

👉Une fois modifié, redémarrez le conteneur pour appliquer les changements.

👉 Vérifiez que le serveur web expose bien l’URL `/stub_status` en visitant l’IP publique du serveur, sur le port 8080. Vous êtes censés obtenir des informations semblables à la réponse ci-dessous.

👉 En vous inspirant de la documentation de Nginx Prometheus Exporter, démarrez un conteneur basé sur l’image `nginx/nginx-prometheus-exporter` en exposant le port 9113 et en configurant l’exporter afin qu’il puisse communiquer avec l’URL `/stub_status` du serveur web Nginx.

👉 Visitez l’URL `/metrics` (sur le port exposé par Nginx Prometheus Exporter) afin de découvrir toutes les informations récoltées sur le serveur web Nginx.

👉 Assurez-vous que votre instance Prometheus soit configurée afin d’accéder aux metrics de Nginx Prometheus Exporter.

👉 Redémarrez Prometheus avec cette nouvelle configuration.

👉Accédez à l’interface graphique de Prometheus pour vérifier que les métriques de Nginx sont bien collectées.

👉 À partir de l’interface graphique de Prometheus, trouvez les requêtes permettant de vous donner les informations suivantes :

- Le statut du serveur Nginx (1 pour true, 0 pour false)
- Le nombre total de requêtes HTTP reçues sur le serveur web
- Le nombre de personnes connectées en temps réel sur le site (n’hésitez pas à ouvrir le site en navigation privée et sur plusieurs navigateurs pour tester)
Ouvrez plusieurs navigateurs ou utilisez la navigation privée pour simuler plusieurs connexions au serveur.Vous pouvez même utiliser un outil comme ab (Apache Bench) pour envoyer plusieurs requêtes et observer les changements dans les métriques.

```sh
ab -n 1000 -c 10 http://<IP_PUBLIC>:8080/
```

👉 Ne supprimez pas la VM Linode, elle sera utilisée pour le prochain challenge.
