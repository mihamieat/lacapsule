# Variable in the vault

## Instructions

### LA NOTION DE VARIABLES

Ansible est capable de gérer des variables afin de stocker des valeurs pouvant être utilisées dans les playbooks en remplaçant la variable par sa valeur lorsqu’une tâche est exécutée.

Ces variables peuvent être définies directement dans des fichiers `yaml` placés dans deux répertoires spécifiques : `host_vars` pour les variables propres à un hôte particulier, et group_vars pour les variables partagées par un groupe d’hôtes.

👉 En reprenant le répertoire de travail du challenge précédent, créer un fichier de variables pour le groupe d’hôtes `linode` qui contiendra les variables suivantes.

```sh
linux_username: paige
linux_password: "{{ 'il0v3AEW' | password_hash('sha512') }}"
```

N’hésitez pas à parcourir la documentation d’Ansible pour comprendre l’importance du nom du fichier de variables.

👉 Modifiez le playbook du challenge précédent afin que la tâche chargée de créer un nouvel utilisateur Linux utilise les variables `linux_username` et `linux_password`.

👉 Démarrez votre playbook puis vérifiez-le en vous connectant en `ssh` aux 2 serveurs via l’utilisateur `paige` et la clé privée `test-ansible`.

Si vous arrivez à vous connecter à ce nouvel utilisateur, c’est que vos variables sont bien mises en place, mais pas pour autant sécurisées…

### ANSIBLE VAULT

Ansible Vault permet de chiffrer et gérer des données sensibles telles que des mots de passe qui peuvent être stockés dans des fichiers de variables, par exemple.

👉 Trouvez un moyen de chiffrer le contenu du fichier de variables créé précédemment via la commande ansible vault spécifiant le mot de passe de votre choix.

Une fois le fichier chiffré, vous n’êtes pas censé directement l’ouvrir avec un éditeur de texte, mais vous pouvez passer par ces deux commandes afin de le visionner ou l’éditer.

```sh
ansible-vault view VARIABLE_FILE
ansible-vault edit VARIABLE-FILE
```

👉 Démarrez votre playbook puis vérifiez-le en vous connectant en `ssh` aux 2 serveurs via l’utilisateur `paige` et la clé privée `test-ansible`.

## My answers

```sh
ansible-playbook -i linode-inventory.yml simple-playbook.yml -kK
ansible vault group_vars/all.yml
ansible-playbook -i linode-inventory.yml simple-playbook.yml -kK --ask-vault-pass
```
