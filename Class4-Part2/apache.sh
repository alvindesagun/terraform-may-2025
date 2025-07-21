#!/bin/bash

# This script is used to install Apache on an EC2 instance

sudo apt install -y apache2
sudo systemctl stop apache2


# Create a simple HTML file to serve

cd /var/www/html
sudo echo "<html><h1>Hello Kaizen World</h1></html>" > index.html

# Start apache2
sudo systemctl start apache2