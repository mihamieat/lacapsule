# CDN with Google

## Instructions

### CRÉATION DU BUCKET
👉 Récupérez la ressource "cdnwithcloudfront.zip" du challenge précédent.

👉 À partir de Google Cloud Console, créez un bucket dans Google Cloud Storage :
- Nommez le bucket de manière unique.
- Laissez les options par défaut, mais assurez-vous que l'option "Uniform bucket-level access" est activée pour faciliter l'accès public.

👉 Uploadez le contenu du dossier “ecw-website” sur votre bucket en utilisant le CLI de Google Cloud SDK


👉 ASSUREZ-VOUS QUE LES OBJETS SONT PUBLICS ET RÉCUPÉREZ L'URL D'UN OBJET POUR VÉRIFICATION.


### MISE EN PLACE DU CDN
👉 Configurez votre bucket afin d’activer l'hébergement de site statique.

👉 Utilisez Google Cloud Load Balancer pour créer un CDN avec Google Cloud CDN activé. Assurez-vous que le backend service est connecté à votre bucket.

👉 Accédez à l'URL fournie par le Load Balancer pour tester le CDN.

👉 Supprimez toutes les ressources créées après vérification pour éviter les coûts supplémentaires.

## my answers

### create a bucket
- create a unique name for the bucket
- leave default settings except unless untick: 
	- [ ] ``enforce public access prevention on this bucket`` for now
### upload files to bucket
- checkout [gcloud storage cli docs](https://cloud.google.com/sdk/gcloud/reference/storage)
```sh
gcloud storage cp ecw-website/ gs://mihamieat-lacapsule-bucket/ --recursive 
```
### allow public access in bucket permissions
- add allUsers in ``permissions`` > ``grant access``
### cdn hosting
- configure the bucket in order to activate static website hosting
	- go to ``buckets`` > find the bucket > ... > ``edit website configuration``
	- go to ``network services`` > ``cloud cdn`` > ``new origin`` 
		- create load balancer or add existing one
	- go to ``load balancer`` and get the ``frontend ip``/index.html
	- note: make sure that the source files are at the root of bucket.
- delete all
