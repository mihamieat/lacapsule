# Linux metrics

## Instructions

### LINUX NODE EXPORTER

Prometheus est maintenant configuré, mais il n’est capable de récolter que des metrics le concernant, ce qui n’est pas du plus excitant, on peut se l’avouer !

Évidemment, Prometheus est capable d’aller plus loin et de récolter des metrics de la machine Linux (espace disque disponible, trafic réseau, etc.) grâce au Node Exporter.

Voici les étapes pour installer et configurer Node Exporter afin que Prometheus puisse collecter ces données système.

### INSTALLATION DE NODE EXPORTER
👉 En vous inspirant de la documentation de Prometheus, installez et démarrez le Node Exporter. Généralement, vous pouvez le télécharger depuis le site de Prometheus ou l'installer via un gestionnaire de paquets selon votre distribution.

Après l'installation, commencez le service Node Exporter. Par défaut, il exposera les métriques sur le port 9100.

### CONFIGURATION DE PROMETHEUS

Pour permettre à Prometheus de collecter les métriques fournies par Node Exporter, il est nécessaire de configurer le fichier prometheus.yml, situé dans le répertoire `/etc/prometheus/`. Ce fichier sert à définir les différentes sources de données ainsi que la fréquence d'interrogation (scraping) des métriques par 
Prometheus.

👉 Assurez-vous que votre instance Prometheus soit configurée afin d’accéder aux metrics de Node Exporter.

👉Une fois la configuration modifiée, redémarrez le service Prometheus pour qu'il prenne en compte les changements.

### VÉRIFICATION DE LA COLLECTE DES MÉTRIQUES

👉 visitez l’URL `/metrics` (sur le port  exposé par Node Exporter) afin de découvrir toutes les informations récoltées sur le système.

👉 Une fois que Prometheus collecte les métriques de Node Exporter, vous pouvez utiliser l'interface de Prometheus pour effectuer des requêtes et obtenir des informations spécifiques.

1.Quantité totale de ram sur le serveur (en bytes)
                
        
2.Nombre de coeurs CPU sur le serveur        

👉Vérifiez le nombre de cœurs sur l'interface de votre serveur Linode pour vous assurer que cette donnée est correcte.

3 L’espace disque disponible sur le système (en bytes)
                        
4.La moyenne du trafic réseau transmis sur l’interface `eth0` (en bytes), par seconde et sur les 5 dernières minutes
        
Une fois toutes ces étapes complétées, vous aurez configuré avec succès Node Exporter pour que Prometheus puisse collecter des métriques sur votre machine Linux. Vous pourrez suivre des informations détaillées sur l'état de votre système, ce qui vous aidera à mieux surveiller les ressources disponibles.

👉 Ne supprimez pas la VM Linode, elle sera utilisée pour les prochains challenges.

## My Answers

### Commands

- In the remote server side.
  - add to `prometheus.yml`
```yml
scrape_configs:
- job_name: node
  static_configs:
  - targets: ['localhost:9100']
```

```sh
./prometheus --config.file prometheus.yml
./node_exporter
```
