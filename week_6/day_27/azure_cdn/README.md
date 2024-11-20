# CDN with Azure

## Instructions

### CRÉATION DU BUCKET
👉 Récupérez la ressource "cdnwithcloudfront.zip" du challenge précédent.

👉 Contrairement aux autres cloud providers vus précédemment , Azure demande des configurations supplémentaires avant de pouvoir créer des containers.

👉 Créez un “storage account” en choisissant un Resource group et en lui donnant un nom. Toutes les autres valeurs peuvent rester par défaut. Cliquez ensuite sur “Review and Create”.

👉 Créez un container dans Azure Blob Storage :

- Nommez le container de manière à ce qu'il soit unique.
- Assurez-vous que l'accès au niveau du container est défini sur "Blob public".

👉 Installez Azure CLI et configurez votre environnement.

👉 Uploadez le contenu du dossier “ecw-website” sur votre bucket en utilisant le CLI d’Azure

👉 ASSUREZ-VOUS QUE LES OBJETS SONT PUBLICS ET RÉCUPÉREZ L'URL D'UN OBJET POUR VÉRIFICATION.

### MISE EN PLACE DU CDN
👉 Créez une instance Azure CDN, en sélectionnant le profil CDN et en le liant à votre container Blob Storage comme origin.

👉 Testez l'accès aux fichiers via l'URL CDN.

👉 Supprimez les ressources pour éviter des frais inutiles après le test.

## my answers

### dowload resources
```sh
wget https://static.lacapsule.academy/programs/devops-full-time/J29/cdnwithcloudfront.zip && \
unzip cdnwithcloudfront.zip && \
rm cdnwithcloudfront.zip && \
rm -r __MACOSX
```

## my answers

- must create a ``storage account`` 
- create a container in ``blob service`` from created ``storage accound``
- allow ``blob anonymous access``
- change access level to ``blob (anonymous read access for blobs only)``
### install azur cli
[azure cli install doc](https://learn.microsoft.com/fr-fr/cli/azure/install-azure-cli)
```sh
az login
```
### send file with cli
[az storage docs](https://learn.microsoft.com/en-us/cli/azure/storage/azcopy/blob?view=azure-cli-latest#az-storage-azcopy-blob-upload)
```sh
az storage azcopy blob upload -c mihamieat-container --account-name mihamieat -s "ecw-website/" --recursive  
```
- also make sure that the files url is publicly available (check url on private browsing)
### create a cdn
- go to Front Door and CDN profiles