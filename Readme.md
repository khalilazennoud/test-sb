# Configuration d'un serveur web EC2 avec Terraform

Ce projet utilise Terraform pour configurer une instance EC2 sur AWS avec un serveur web Apache (httpd).

J'ai déployé deux serveurs dans deux zones différentes :

- eu-west-1 : [http://54.217.138.143/](http://54.217.138.143/)
- eu-west-2 : [http://18.134.207.186/](http://18.134.207.186/)

## Question 1 : Comment ajouter du CI/CD à ce projet ?

On peut implémenter un pipeline sur Jenkins ou GitHub Actions, les principaux stages seront :
1. Récupération du code source Terraform.
2. `terraform init` : initialisation du workspace, installation des modules, plugins...
3. `terraform apply` (ajouter une option pour cliquer sur "yes" si tout est OK pour ne pas auto-approuver).

## Question 2 : Comment lancer le code ?

- Initialisation de Terraform : `terraform init`
- Pour obtenir le plan d'exécution : `terraform plan -var-file="envs/<environnement>/main.tfvars"`
- Pour appliquer le plan d'exécution : `terraform apply -var-file="envs/<environnement>/main.tfvars"`

## Question 3 : Décisions de conception si nécessaire

- Utilisation des groupes de sécurité AWS pour les accès au serveur (port 22 pour SSH et port 80 pour HTTP).
- Automatisation de la configuration du serveur web par l'ajout d'un script `webserver.sh`.

## Question 4 : Au-delà de la portée de cette tâche si nous sommes dans un environnement de production réel

- Sécurité avancée : ajout de politiques IAM strictes, utilisation de VPC isolés, utilisation de Vault pour les keypairs.
- Monitoring et gestion des logs : Utilisation de services comme AWS CloudWatch pour surveiller les performances et les logs des serveurs.
