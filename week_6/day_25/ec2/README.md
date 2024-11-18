# my first vps

## instructions

### CRÉATION D’UNE INSTANCE EC2

Le service EC2 permet de louer des serveurs virtuels sur lesquels vous pouvez par exemple héberger des applications web en production, on parle alors de serveur de production.
Le fonctionnement de AWS est basé sur un système de régions basé sur les différents centres de données (data center) d’Amazon partout dans le monde.
La plupart du temps, lorsque vous louez ou utilisez un service AWS, il est rattaché à une région.

👉 Même si vous disposez de l’offre gratuite, comparez les tarifs des instances EC2 en Europe afin de choisir la région la moins chère pour une instance de type "t3.micro".

👉 Sur la console AWS, en haut à droite, sélectionnez la région choisie dans l’étape précédente.

Veillez à toujours vérifier quelle région est sélectionnée sur la console, car une instance EC2 créée dans une région ne sera pas visible pour une autre région, tout est compartimenté.

👉 Préparez le lancement d’une instance EC2 en sélectionnant et remplissant les informations suivantes :

- Nom : myfirstvps
- Système d’exploitation : Debian 12, 64 bits (x86)
- Type d’instance : t3.micro
- Paramètres réseau : "Sélectionner un groupe de sécurité existant" > "default"
- Configurer le stockage : 15 Gio
- Nombre d’instances : 1

👉 Pour la partie "Paire de clés (connexion)", créez une nouvelle paire de clés SSH portant le même nom que l’instance que vous vous apprêtez à créer, avec les options par défaut.

Gardez bien de côté le fichier .pem (clé privée) qui se télécharge à la création de la paire de clé, il vous sera utile pour vous connecter au serveur.

👉 Consultez le résumé puis lancez l’instance EC2. Cela ne devrait prendre que quelques secondes grâce à la magie du cloud ☁️

👉 Vérifiez que l’instance a bien été créée et que son état est bien "En cours d’exécution" à partir du menu "Instances".

### UTILISATION D’UNE INSTANCE EC2
👉 Récupérez l’adresse IPv4 publique de l’instance.

Ne confondez pas avec le DNS IPv4 public qui est une adresse web en .com censée rediriger vers votre instance.

👉 Tentez d’exécuter la commande ping sur cette adresse IP.

Rien ne se passe ? C’est tout à fait normal. Par défaut et pour des raisons de sécurité, tous les accès entrant sont bloqués, pour tous les ports et les protocoles (y compris ICMP pour ping).

👉 Modifiez le groupe de sécurité par défaut afin d’autoriser tout le trafic entrant, pour tous les protocoles et à partir de n’importe quelle adresse IP.
Cette modification est évidemment temporaire, les règles seront davantage sécurisées dans le challenge suivant.

👉 À l’aide d’un terminal, connectez-vous au serveur via SSH en spécifiant le chemin vers la clé privée téléchargée précédemment.

Pour ce faire, vous devez trouver le nom de l’utilisateur par défaut créé par AWS lors de la configuration de l’instance et vous assurer que la clé corresponde aux exigences de OpenSSH en matière de permissions.

👉 Une fois connecté au serveur, vérifiez l’utilisateur courant grâce à la commande suivante.

```sh
whoami
```

### ADMINISTRATION D’UNE INSTANCE EC2
👉 Depuis l’interface de la console EC2, arrêtez complètement l’instance en sélectionnant "Arrêter l’instance" puis démarrez-là de nouveau.

👉 Tentez de vous connecter au serveur via SSH en reprenant la commande que vous avez précédemment exécutée.
Rien ne se passe ? De nouveau, c’est tout à fait normal. Par défaut, lors de la création d’une instance EC2, une adresse IP publique dynamique est attribuée et celle-ci est libérée à chaque arrêt de l’instance.

👉 Trouvez un moyen d’allouer et attribuer un adresse IP publique statique à votre instance via les adresses IP élastiques.
Ce service est inclus dans le prix d’une instance EC2, mais peut être facturé si l’adresse IP commandée n’est pas attribuée ou bien si elle est attachée à une instance arrêtée.

👉 Une fois la nouvelle adresse IP publique statique rattachée à votre instance, tentez de l’utiliser pour vous connecter via SSH.

👉 Pour terminer ce challenge, assurez-vous de résilier et libérer toutes les ressources crées afin d’éviter une surfacturation et de dépasser le tier gratuit d’AWS :
Adresses IP élastiques : dissociez puis libérez l’adresse IP publique précédemment réservée
Instances : résiliez (terminate) l’instance "myfirstvps"


## comands

### utilisation d'une instance ec2

```sh
ssh -i ~/.ssh/myfirstvps.pem admin@34.245.156.128
```

- create elastic ip
- associate elastic ip to instance
- delete instance
- release elastic ip