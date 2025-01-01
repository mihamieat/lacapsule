# Start with Grafana

## Instructions

### INSTALLATION DE GRAFANA

👉 Reprenez votre VM créée sur Linode hier et connectez-vous-y via `ssh`.

👉 Suivez la documentation afin d’installer Grafana : https://grafana.com/docs/grafana/latest/setup-grafana/installation/debian/ 

> ⚠️ Prenez le temps de lire les étapes avant de vous lancer dans le copier-coller des commandes, vous devez installer la version `OSS` (open-source)

👉 Assurez-vous que Grafana est bien installé et démarré grâce aux commandes suivantes.

```sh
sudo systemctl status grafana-server
```

Si vous voyez que le service est en cours d’exécution (statut `active (running)`), vous pouvez continuer. En cas d’erreur, relisez les étapes d’installation.

Contrairement à Prometheus, Grafana est lancé en arrière-plan sur votre serveur et ne nécessite pas de laisser un terminal ouvert.

👉 Visitez l’interface web exposée par Grafana via votre navigateur.

👉Connectez-vous à l’interface.
- Identifiant par défaut : `admin`
- Mot de passe par défaut : `admin` (vous serez invité à le changer au premier accès).

👉 Ajoutez Prometheus en tant que nouvelle source de données (data source) sur Grafana.

> ⚠️Si la connexion échoue, vérifiez que Prometheus est bien en cours d’exécution et que vous avez saisi la bonne URL.

### DÉCOUVERTE DE GRAFANA

Afin de découvrir l’interface de Grafana et la notion de dashboards, vous avez à disposition des métriques fictives que vous pouvez afficher sous la forme de graphiques, listes, compteurs, etc.

👉 Suivez la documentation de Grafana pour créer un dashboard semblable à celui présenté sur le screen ci-dessous (vous pouvez ouvrir l’image dans un nouvel onglet via un clic droit).

Bravo ! vous avez découvert Grafana et d’apprendre à l’utiliser pour visualiser vos données. 😊

## My Answers

### Commands

```sh
ssh-copy-id root@<host-ip>
ansible-playbook -i linode-inventory.yml simple-playbook.yml
ssh-copy-id <custom-user>@<host-ip>
```