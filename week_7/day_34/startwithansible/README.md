# Start with Ansible

## Instructions

### INSTALLATION D’ANSIBLE

👉 Installez Ansible via le gestionnaire de package Python `pip`.

👉 Enfin, vérifiez l’installation d’Ansible en récupérant sa version.

```sh
ansible --version
```

### INVENTAIRE ANSIBLE

Un inventaire Ansible est une liste d’hôtes sous forme d’adresses IP permettant de simplifier l’exécution des tâches pour un groupe de serveurs.

👉 Sur Linode, créez une VM vierge nommée `test-ansible` qui sera votre terrain de jeu pour découvrir Ansible :

- Debian 11
- Dedicated 4 GB (Dedicated CPU)

👉 Sur votre machine hôte, créez un inventaire Ansible nommé `linode` en ajoutant l’adresse IP du serveur créé précédemment dans le fichier de configuration dédié.

👉 Vérifiez que l’hôte a bien été ajouté dans votre inventaire en exécutant la commande suivante.

```sh
ansible all --list-hosts
```

### EXÉCUTION D’ANSIBLE

Pour exécuter les différentes tâches, Ansible communique avec les hôtes en se connectant via `ssh`.

👉 Vérifiez que vous pouvez vous connecter manuellement au serveur créé dans la partie précédente via `ssh`.

👉 Exécutez un ping sur l’ensemble des machines de l’inventaire (une seule pour le moment) en prenant soin de préciser le chemin vers la clé SSH privée permettant de se connecter au serveur.

```sh
ansible all -m ping -u root --private-key PATH
```

Si le serveur répond `pong`, c’est que tout est bien configuré et que vous êtes prêt à utiliser Ansible 🚀

👉 Ne supprimez pas la VM Linode, elle sera utilisée pour les prochains challenges.

## My Answers

```sh
ansible  -i linode.yml all --list-hosts

# install sshpass
sudo apt update && sudo apt install sshpass -y

# ping distant server with password
ansible -i linode.yml all -m ping --ask-pass

```
