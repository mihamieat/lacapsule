# CDN with CloudFront

## Instructions

### SERVICE DE CDN
Le service CloudFront d’AWS est un CDN (Content Delivery Network) : il fonctionne avec S3 en copiant les fichiers stockés vers la périphérie des serveurs d’Amazon pour une récupération rapide grâce à leurs nombreux data centers.

Ce challenge a pour objectif de déployer un site statique où les fichiers et assets seront stockés par S3 tandis que CloudFront s’occupera d’attribuer une URL unique (en HTTPS), le tout optimisé grâce au réseau de distribution d’AWS.

👉 Récupérez la ressource ``cdnwithcloudfront.zip`` depuis l’onglet dédié sur Ariane.

👉 Créez un nouveau bucket S3 en le paramétrant de la même façon que le challenge précédent et uploadez le contenu du dossier ``ecw-website/`` via la CLI d’AWS.

 👉 Sur votre bucket S3, trouvez l’option permettant d’activer l’hébergement de site Web statique en précisant le document d’index ``index.html``.

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

 👉 Visitez l’URL statique donnée par S3 en prenant soin d’ajouter ``/index.html`` à la fin.

 👉 Sur la console du service CloudFront, créez une nouvelle distribution basée le domaine créé par le service S3. Vous pouvez laisser les paramètres par défaut à l’exception de la redirection forcée de HTTP vers HTTPS. N’activez pas le Web Application Firewall (WAF).

 👉 Après quelques minutes (le temps que la distribution se propage), visitez l’URL statique donnée par CloudFront en prenant soin d’ajouter ``/index.html`` à la fin.

L’URL est censée vous rediriger automatiquement vers HTTPS.

 👉 Assurez-vous de résilier et libérer toutes les ressources crées afin d’éviter une surfacturation et de dépasser le tier gratuit d’AWS :

CloudFront : désactiver la distribution puis supprimez-là quelques minutes plus tard (le bouton "Supprimer" sera grisé le temps que la désactivation fasse effet)

S3 : supprimez tous les objets uploadés pendant ce challenge puis le bucket en lui-même

## my answers

### upload to cloudfront
- cloudfront works with s3
- create an s3 bucket
bucket policy
```javascript
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::<bucket-name>/*"
        }
    ]
}
```
- upload website resource
```sh
aws s3 cp ecw-website s3://<bucket-name>  --recursive
```
- create a distribution in cloudfront
	- add created s3 origin domain
	- redirect http to https
	- do not enable security protection (waf) for now
- check out the ``distribution domaine name`` + ``/index.html``
- delete everything:
	- empty s3 bucket
	- delete s3 bucket
	- disable cloudfront distribution
	- wait for last modified to have a datetime (instead of ``Deploying``)
