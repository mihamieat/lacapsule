# nosql database in the cloud

## instructions

### CONFIGURATION DU SERVICE AMAZON DYNAMODB
👉 À partir du service Amazon DynamoDB, créez une table nommée ``myfirstdatabaseincloud`` configurée comme suit :
- Partition key : id (String)
- Classe de lecture/écriture : Utilisez le modèle gratuit
- Accès public : Oui

Les options de configuration qui ne sont pas précisées seront laissées à leur valeur par défaut.

👉 Installez AWS CLI sur votre poste de travail afin de faciliter les interactions futures avec les services d’AWS.

👉 Après la création de la base de données, récupérez l'ARN de la table pour vous connecter à celle-ci via AWS CLI.

### UTILISATION DU SERVICE
👉 Utilisez AWS CLI pour insérer des données dans votre nouvelle base de données.

👉 Utilisez AWS CLI pour lire des données dans votre nouvelle base de données.

👉 Modifiez les paramètres de la table pour ajuster les capacités de lecture/écriture selon l'usage.

👉 Supprimez toutes les données et la table à la fin pour éviter une surfacturation.

### CONFIGURATION DU SERVICE GOOGLE CLOUD FIRESTORE
👉 À partir de Google Cloud Console, créez une base de données Firestore configurée comme suit :
- Mode : Native
- Accès public : Oui

👉 Créez une collection nommée ``myfirstdatabaseincloud`` avec un document dont l'ID est id.

👉 Installez Google Cloud SDK sur votre poste de travail pour faciliter les interactions futures avec les services de Google Cloud.

### UTILISATION DU SERVICE

👉 Utilisez Google Cloud SD CLI pour insérer et lire des données dans votre nouvelle collection Firestore.

👉 Supprimez toutes les données et la collection à la fin pour éviter une surfacturation.

### CONFIGURATION DU SERVICE AZURE COSMOS DB
👉 À partir de Azure Portal, créez une instance de Cosmos DB configurée avec l'API MongoDB comme suit :
- Nom de la base de données : ``myfirstdatabaseincloud``
- API : MongoDB
- Accès public : Activé

👉 Assurez-vous d'avoir MongoDB installé localement pour utiliser mongo shell ou un client GUI comme Compass.

👉 Après la création de la base de données, récupérez la chaîne de connexion pour vous connecter à votre base de données via MongoDB CLI ou un outil GUI.

Azure Cosmos DB utilise l’API de MongoDB, ce qui le rend plus accessible que d’autres outils propriétaires. Vous pouvez donc vous référer à la documentation générale de MongoDB pour toutes les actions à effectuer sur cette instance.

### UTILISATION DU SERVICE
👉 Utilisez MongoDB CLI pour vous connecter et insérer des données dans votre nouvelle base de données.

👉 Utilisez MongoDB CLI pour lire des données dans votre nouvelle base de données.

👉 Supprimez toutes les données et la collection à la fin pour éviter une surfacturation.


## my answers

### configurationq du service amazon dynamodb

[installer les lignes de command aws](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

create access key
- [x] access key
- [x] secret access key 
- [x] default region ``us-eat-1``
- [x] output format ``json``

### add allow policy to dynamodb

### list tables

```sh
aws dynamodb list-tables --region us-east-1
```

### add item
```sh
aws dynamodb put-item \
    --table-name myfirstdatabaseincloud \
    --item '{"id": {"S": "1"}, "title": {"S": "matrix"}}'
```

### check added item

```sh
aws dynamodb scan --table-name myfirstdatabaseincloud 
```

### coufiguration du service google firestore

#### install google sdk comman lines
[installation instructions](https://cloud.google.com/sdk/docs/install-sdk)

#### list databases

```sh
gcloud auth login
gcloud services enable firestore.googleapis.com
gcloud firestore databases list
```

#### [gcloud firestore commands](https://cloud.google.com/sdk/gcloud/reference/firestore)

#### get data
```sh
curl -X GET \                                              
  -H "Authorization: Bearer $(gcloud auth application-default print-access-token)" \
  "https://firestore.googleapis.com/v1/projects/<project-id>/databases/<database>/documents/myfirstdatabaseincloud"
```
