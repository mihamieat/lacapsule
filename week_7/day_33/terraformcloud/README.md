# Terraform Cloud

## Instructions

### SETUP

👉 Créez un compte Terraform Cloud.

👉 Exécutez la commande suivante pour relier la CLI de Terraform au compte Terraform Cloud.
```sh
terraform login
```

👉 Créez une nouvelle organisation Terraform : Start from scratch > Create a new organization (le nom doit être unique)

👉 Créez un nouveau workspace nommé `ec2-deployment` (CLI-driven workflow)

### DÉPLOIEMENT VIA TERRAFORM CLOUD

👉 Créez un nouveau dossier nommé `terraformcloud`.
 
👉 Reprenez le fichier de configuration Terraform du challenge précédent et ajoutez la section nécessaire afin de le lier avec votre workspace.

👉 Appliquez le fichier de configuration grâce à la commande habituelle.

Si vous avez une erreur de type `no valid credential sources for Terraform AWS Provider`, c’est parce que le déploiement n’est plus effectué en local, mais du côté de Terraform Cloud qui n’a pas connaissance des clés d’accès AWS.

👉 Côté Terraform Cloud, trouvez un moyen de créer les variables d’environnement nécessaires pour l’authentification auprès d’AWS

👉 Appliquez de nouveau le fichier de configuration.

👉 Vérifiez le statut du déploiement de l’instance sur Terraform Cloud puis directement sur AWS.

👉 N’oubliez pas de supprimer toutes les ressources AWS créées via Terraform grâce à la commande suivante.

```sh
terraform destroy
```

## My answers

- create access key if not existing.
```sh
aws iam create-access-key --user-name <user-name>
```
- provide the key to Terraform Cloud
- run terraform
```sh
terraform init
terraform fmt
terraform plan
terraform apply
terraform destroy
```
