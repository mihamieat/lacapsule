# Start with Prometheus

## Instructions

### PRÉPARATION DE L’ENVIRONNEMENT

👉 Sur Linode, créez une VM vierge nommée "test-prometheus" qui sera votre terrain de jeu pour découvrir la notion de monitoring :

- Debian 12
- Dedicated 4 GB (Dedicated CPU)

👉 Suivez la documentation afin d’installer Prometheus sur la VM Linode (jusqu’à la fin de l’étape "Starting Prometheus") : First steps | Prometheus

👉 Si ce n’est pas déjà fait, démarrez Prometheus grâce à la commande suivante.

```sh
 ./prometheus --config.file=prometheus.yml
```

Prometheus n’étant pas lancé en tâche de fond, vous devez laisser le terminal actif ouvert (ou bien trouver une méthode permettant d’éviter cela 😉).

N’hésitez pas à ouvrir une seconde connexion via SSH pour la suite du challenge.

### UTILISATION DE PROMETHEUS

👉 Visitez l’interface web exposée par Prometheus via votre navigateur.

Si vous tombez sur une interface un peu austère et peu guidée, vous êtes au bon endroit !

Par défaut, Prometheus n’est capable de récolter que les metrics le concernant.

👉 Visitez l’URL "/metrics" afin de découvrir toutes les informations récoltées par Prometheus.

👉 Depuis l’URL "/graph", exécutez une requête sur la console Prometheus dans le but de récupérer toutes les informations concernant le nombre total de requêtes faîtes sur l’URL /metrics.

Une fois la requête exécutée, vous êtes censé récupérer le nombre de fois où la page /metrics a été chargée par Prometheus ou vous-même.

Vous pouvez vous "amuser" à actualiser plusieurs fois la page "/metrics" afin de voir le nombre de requêtes augmenter.

👉 Trouvez la requête permettant de récupérer la date de démarrage du processus Prometheus (en timestamp)

👉 Ne supprimez pas la VM Linode, elle sera utilisée pour les prochains challenges.

## My Answers

### Commands

```sh
ansible-playbook -i linode-inventory.yml simple-playbook.yml
 ./prometheus --config.file=prometheus.yml
```

- to get total request calls of `/metrics`

```
promhttp_metric_handler_requests_total
```

- to get built info timestamps

```
prometheus_build_info
```
