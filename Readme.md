# Configuration d'un serveur web EC2 avec Terraform

Ce projet utilise Terraform pour configurer une instance EC2 sur AWS avec un serveur web Apache (httpd).

J'ai déployé deux serveurs en deux zone differnets 

eu-west-1 : http://54.217.138.143/
eu-west-2 : http://18.134.207.186/

Quesion 1 : comment ajouter du CICD a ce projet 
           On pouura implementer un pipeline sue jenkins ou githubactions , les principaux satges seront : 
                           1 - recuperation du code osurce terraform 
                           2 - terraform init : initialisation du worksapce , installation des modules , plugoins ...
                           3 - terraform apply ( ajouter une option pour cliquer sur yes si tout est ok pour ne pas auto approve ) 
Question 2 : comment lancer le code 
    1 - initialisation de terraform : terraform init 
        pour avoir le plan d'executoion : terraform plan -var-file="envs/<environement>/main.tfvars"
        pour appliquer le plan d'execution : terraform apply -var-file="envs/<environement>/main.tfvars"


Question 3 : design decison if needed 
             
Question 4 :  anything beyond the scope of this task if we are in a real production env 