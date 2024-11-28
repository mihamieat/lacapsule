# Deploy this VM

## Instructions

### PRÉREQUIS

👉 Commencez par vérifier que la CLI d’AWS est installée sur votre machine hôte grâce à la commande suivante.

```sh
aws --version
```

👉 À partir de la console d’AWS, trouvez un moyen de générer des clés d’accès (`access key id` et `secret access key`)

👉 Exportez les deux variables correspondantes aux clés d’accès en exécutant les commandes suivantes.

```sh
export AWS_ACCESS_KEY_ID=XXXX
export AWS_SECRET_ACCESS_KEY=XXXX
```

Cette étape est nécessaire pour que Terraform puisse s’authentifier auprès d’AWS.

### DÉPLOIEMENT D’UNE INSTANCE EC2

👉 Créez un nouveau dossier nommé `deploythisvm`.

👉 En vous inspirant de la [documentation](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/aws-build) de Terraform, créez un fichier de configuration Terraform nommé `main.tf` qui devra déployer une instance `EC2` chez AWS en respectant les contraintes suivantes :

- Une instance de type `t2.micro` devra être déployée dans le datacenter parisien d’Amazon
- Le système d’exploitation utilisé sera `Debian` dans sa dernière version éligible à l’offre gratuite
- Le nom d’affichage de l’instance EC2 sera `terraform-test`

👉 Initialisez le dossier contenant le fichier de configuration de Terraform.

👉 Avant d’appliquer le fichier de configuration Terraform, formattez et validez-le grâce aux commandes suivantes.

```sh
terraform fmt
terraform validate
```

👉 Appliquez le fichier de configuration Terraform afin de créer l’instance EC2 chez AWS.

👉 Vérifiez que l’instance EC2 a bien été créée sur la console d’AWS et qu’elle respecte les contraintes imposées plus tôt, notamment le système d’exploitation.

👉 Trouvez la commande terraform permettant d’inspecter l’état du déploiement et profitez-en pour récupérer l’adresse IP publique.

### DÉPLOIEMENT AVANCÉ

👉 Tentez de vous connecter en `ssh` à l’instance déployée grâce à l’adresse IP récupérée dans l’étape précédente.

Ça ne fonctionne pas ? C’est tout à fait normal, aucune paire de clé `ssh` n’est associée à l’instance !

👉 Générez une nouvelle paire de clé `ssh` nommée `terraform-aws` sur votre machine hôte.

👉 Depuis la console EC2, créez un nouveau groupe de sécurité nommé `terraform-sg` qui devra autoriser le `ping` et la connexion via `ssh`, seulement depuis l’adresse IP de votre machine hôte.

👉 En modifiant le fichier de configuration Terraform, trouvez un moyen d’appliquer le groupe de sécurité créé précédemment ainsi qu’un moyen de fournir une clé publique afin de s’y connecter en `ssh`.

👉 Appliquez le fichier de configuration Terraform et tentez de vous connecter à l’instance via `ssh` afin de vérifier qu’elle soit bien déployée avec les bons paramètres.

👉 Avant de passer au challenge suivant, n’oubliez pas de supprimer toutes les ressources AWS créées via Terraform grâce à la commande suivante.

```sh
terraform destroy
```

## My answers


### Generate access key

- create

```sh
aws iam create-access-key --user-name <username>
```

- list

```sh
aws iam list-access-keys --user-name <username>
```

### Export access key variables

```sh
export AWS_ACCESS_KEY_ID=XXXX
export AWS_SECRET_ACCESS_KEY=XXXX
```

### Terraform commands

```sh
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
aws ec2 describe-instances
```