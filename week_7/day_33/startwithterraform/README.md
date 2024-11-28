# Start with Terraform

## Instructions

### INSTALLATION DE TERRAFORM
👉 Installez le package Terraform en suivant la documentation (section "Install Terraform", onglet "Linux") : https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

👉 Vérifiez l’installation de Terraform grâce à la commande suivante.

```sh
terraform -version
```

## FICHIER DE CONFIGURATION TERRAFORM
Même si Terraform est un outil d’IaC généralement utilisé pour déployer des infrastructures auprès des fournisseurs de cloud (AWS par exemple), il est théoriquement possible de l’utiliser pour déployer des conteneurs Docker, de la même manière qu’un Docker Compose.

C’est l’exemple parfait pour vous familiariser avec le concept de fichier de configuration Terraform !

👉 Étant donné que chaque fichier de configuration Terraform doit être dans son propre dossier, créez un nouveau dossier nommé `startwithterraform/`.

👉 En vous inspirant de la documentation (section "*Quick start tutorial*"), créez un fichier de configuration Terraform nommé `main.tf` qui devra créer un conteneur basé sur l’image officielle de `httpd` et rediriger le port `8888` vers le port `80` du conteneur.

👉 Initialisez le dossier contenant le fichier de configuration de Terraform grâce à la commande suivante.

```sh
terraform init
```

👉 planiffier le fichier de configuration Terraform afin de visualiser un plan d'exécution détaillé pour validation.
terraform plan

👉 Appliquez le fichier de configuration Terraform afin de provisionner le conteneur Docker basé sur l’image httpd grâce à la commande suivante.

```sh
terraform apply
```

👉 Vérifiez le lancement du conteneur en visitant l’URL /localhost:8888 et en exécutant la commande `docker ps`.

👉 Pour finir, arrêtez le conteneur, mais sans passer par une commande docker, en utilisant la commande terraform.

## My answers

### Commands

```sh
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform destroy
```