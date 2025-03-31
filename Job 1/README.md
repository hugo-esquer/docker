# Job 1 Installation VM et docker
## Installation VM Debian Classique
cf. Projet Holodeck
## Installation Docker pour Debian
Documentation sur le site https://docs.docker.com/engine/install/debian/  
### Désinstaller les anciennes versions 
```
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done
```
### Installation via apt
Avant l'installation de Docker Engigne pour la première fois sur la machine hôte, il faut mettre en place le repository Docker.
1. Installer le repository apt de Docker
```
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```
2. Intaller la dernière version de docker
```
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
### Vérifier que l'installation s'est déroullé correctement
```
sudo docker run hello-world
```
Cette commande télécharge et lance l'image de test "hello-world". Quand le conteneur tourne il affiche le message de confirmation puis quitte.
