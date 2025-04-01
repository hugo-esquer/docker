# Création des alias 
## Création du scritp
```
vim aliases.sh
```
Contenue du script :
```
#!/bin/bash

echo "alias dimages='sudo docker images'" >> ~/.bashrc
echo "alias drun='sudo docker run'" >> ~/.bashrc
echo "alias dps='sudo docker ps'" >> ~/.bashrc
echo "alias dpsa='sudo docker ps -a'" >> ~/.bashrc
echo "alias dstart='sudo docker start'" >> ~/.bashrc
echo "alias dstop='sudo docker stop'" >> ~/.bashrc
echo "alias drm='sudo docker rm'" >> ~/.bashrc
echo "alias drmi='sudo docker rmi'" >> ~/.bashrc
echo "alias dbuild='sudo docker build -t'" >> ~/.bashrc
```
## Donner les droits d'exécutions
```
sudo chmod +x aliases.sh
```
## lancer le script
```
./aliases.sh
```
## Recharger la source bashrc
```
source ~/.bashrc
```