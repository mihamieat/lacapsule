# Storage with S3

## Instructions
### SERVICE DE STOCKAGE
Le service S3 d’AWS est un service de stockage de données en ligne où on peut uploader (télécharger) des fichiers afin de récupérer une URL unique pour chaque fichier.

C’est un des services les plus populaires de la plateforme, car très utilisé par les développeurs pour stocker facilement les assets d’une application.

👉 À partir du service S3, créez un compartiment de stockage (bucket) en lui donnant le nom de votre choix.

Attention, ce nom doit être unique et ne pas être utilisé par un autre compte AWS.

👉 Lors de la création de votre bucket, laissez les options par défaut à l’exception de l’option "Bloquer tous les accès publics" qui doit être décochée : cela permettra de pouvoir stocker vos fichiers et les rendre accessibles depuis internet.

👉 Récupérez la ressource "storagewiths3.zip" depuis l’onglet dédié sur Ariane.

👉 Parmi toutes les images présentes dans le dossier "wwe", choisissez-en une seule afin de l’uploader vers S3 en laissant les options par défaut afin que le fichier soit public.

 👉 Assurez-vous que chaque objet contenu dans le bucket soit publique en lecture en modifiant la stratégie de compartiment (bucket policy) suivante dans l’onglet "Autorisations".

```javascript
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::BUCKET_NAME/*"
        }
    ]
}
```

👉 Trouvez un moyen de récupérer l’URL publique du fichier précédemment uploadé et vérifiez que vous pouvez visionner l’image en ouvrant une nouvelle fenêtre en navigation privée.

👉 Avant de passer aux étapes suivantes, supprimez le fichier précédemment uploadé

👉 Installez la CLI d’AWS et vérifiez l’installation grâce à la commande suivante.
```sh
aws --version
```

👉 Via la CLI d’AWS, trouvez un moyen d’uploader tout le contenu du dossier "wwe" vers votre bucket.


👉 Vérifiez que l’upload a bien réussi en listant les objets présents, toujours via la CLI d’AWS.

👉 Assurez-vous de résilier et libérer toutes les ressources crées afin d’éviter une surfacturation et de dépasser le tier gratuit d’AWS :

S3 : supprimez tous les objets uploadés pendant ce challenge puis le bucket en lui même

## My answers

## create a storage service
- create a bucket
- give a unique name
- leave everything to default except uncheck ``block all public access`` 
## upload a file
- edit bucket policy to allow all
from ``permissions`` tab
```javascript
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::mihamieat-lacapsule/*"
        }
    ]
}
```
### upload from the ui
- upload the file in aws
- get the public url of the object
#### delete files
- make sure to have all the access rights
- delete objects by emptying bucket
### upload with the cli
[cli documentation](https://docs.aws.amazon.com/cli/latest/reference/s3/)
- upload images
```sh
aws s3 cp ./wwe/ s3://mihamieat-lacapsule/ --resursive # recursive for a directory
```
- check uploaded images
```sh
aws s3 ls s3://mihamieat-lacapsule
```
- delete files
```sh
aws s3 rm s3://mihamieat-lacapsule/ --recursive
```


### delete bucket
