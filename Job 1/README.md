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
Intaller la dernière version de docker
```
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
### Vérifier que l'installation s'est déroullé correctement
```
sudo docker run hello-world
```
Cette commande télécharge et lance l'image de test "hello-world". Quand le conteneur tourne il affiche le message de confirmation puis quitte.
