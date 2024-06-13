#!/bin/bash
sudo yum update -y
sudo yul install -y httpd
sudo systemctl start httpd
sudo system enable httpd
echo " Ceci est un environnement de {var.environement}" > /var/www/html/index.html