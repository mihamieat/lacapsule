# I come to play

## Instructions

### CRÉATION D’UN PLAYBOOK

Un ***playbook*** Ansible est un modèle d’automatisation au format `YAML` utilisé pour configurer un ou plusieurs serveurs à l’aide de tâches définissant les opérations qu’Ansible va mener.

👉 Sur Linode, créez une VM vierge nommée `test-ansible2` qui aura les mêmes caractéristiques et viendra compléter la VM `test-ansible`.

👉 Ajoutez cette nouvelle VM à votre inventaire `linode` et vérifiez qu’elle réponde bien à un ping via Ansible.

👉 Plutôt que de passer par une commande Ansible, créez un playbook dans le fichier `simple-playbook.yml` chargé de ping tous les hôtes de l’inventaire.

👉 Démarrez le playbook grâce à la commande suivante.

```sh
ansible-playbook simple-playbook.yml -u root --private-key PATH
```

Si la partie `RECAP` des tâches vous affiche `ok` pour les deux serveurs, c’est que tout est opérationnel pour vous attaquer à un playbook plus ambitieux !

### MODULE DIFFÉRENT

Sur le premier exemple, nous avons utilisé le module ping, maintenant, nous allons changer de module et utiliser le module copy. Le but est d'envoyer un fichier directement vers notre machine virtuelle cible.

👉Créer un fichier et donnez-lui le nom `fichier.txt`

Nous avons bien vu que, même sans connexion `ssh`, il est possible de configurer les serveurs à distance.

👉Créer un playbook Ansible avec le module copy

👉Sauvegardez ce code dans un fichier, par exemple copie-fichier.yml

👉lancez la commande Ansible pour exécuter le playbook

Pour mieux comprendre ce concept, nous pouvons même ajouter notre propre utilisateur avec des permissions spécifiques. Par exemple, si le fichier est important pour les raisons sécurité.

👉Changer le playbook en ajoutant les permissions lecture, écriture et exécution uniquement à l'utilisateur root, tout en interdisant tout accès aux autres utilisateurs.

👉Relancez le playbook pour appliquer les modifications

### PLAYBOOK AVANCÉ

👉 Créez une nouvelle paire de clés `ssh` nommée `test-ansible` qui sera uniquement dédiée à la connexion aux utilisateurs courants (autre que root) créés via Ansible

👉 En vous inspirant d’exemples trouvés en ligne, créez un nouveau playbook dans le fichier `advanced-playbook.yml` qui devra effectuer les tâches suivantes :
- Création d’un nouvel utilisateur `nginx` avec le mot de passe `ihateapache`
- Ajout de l’utilisateur `nginx` au groupe sudo (en conservant ses autres groupes par défaut)
- Modification du terminal par défaut (bash) pour l’utilisateur `nginx`
- Désactivation de la possibilité de se connecter avec un mot de passe via `ssh` (afin de privilégier l’authentification par paire de clé, car plus sécurisée)
- Configuration de la connexion à l’utilisateur `nginx` via `ssh` et la paire de clés générée précédemment
- Installation du package Nginx

👉N’hésitez pas à lancer plusieurs fois le playbook afin de tester vos tâches : Ansible est plutôt bien fait, parce qu'il est capable d’exécuter plusieurs fois la même tâche sans pour autant provoquer des erreurs.

👉 Vérifiez votre playbook en vous connectant en `ssh` aux 2 serveurs via l’utilisateur `nginx` et la clé privée `test-ansible`, puis en requêtant le serveur en HTTP.

Vous avez maintenant créé plusieurs playbooks pour automatiser des tâches sur vos serveurs via Ansible, y compris la gestion des utilisateurs, des permissions de fichiers, et l'installation de logiciels. Vous pouvez tester et exécuter ces playbooks pour configurer vos serveurs de manière efficace et répétable.

## My answers

### Création d'un playbook

```sh
ansible-playbook -i linode.yml simple-playbook.yml
```

### Module différent

```sh
touch fichier.txt
```

### Playbook avancé

- make sure to have passlib on host installed
```sh
pipx inject ansible passlib
```

### Run ansible playbook

```sh
ansible-playbook -i linode.yml simple-playbook.yml -kK 
```
