# Test de l'installation de Docker
## Installation du conteneur "hello-world"
```
sudo docker run hello-world
```
## Commande docker utiles
### Gestion des conteneurs

- docker run <image> → Démarre un conteneur à partir d’une image.
- docker ps → Liste les conteneurs en cours d’exécution.
- docker ps -a → Liste tous les conteneurs (actifs et arrêtés).
- docker stop <container_id> → Arrête un conteneur.
- docker start <container_id> → Démarre un conteneur arrêté.
- docker restart <container_id> → Redémarre un conteneur.
- docker rm <container_id> → Supprime un conteneur.
- docker logs <container_id> → Affiche les logs d’un conteneur.
- docker run -it --rm <image> </bin/bash> → Lancer une image en mode interactif avec un shell bash (ajuster en fonction du shell)

### Gestion des images
- docker images → Liste les images locales.
- docker pull <image> → Télécharge une image depuis Docker Hub.
- docker rmi <image_id> → Supprime une image.

### Exécution et interaction
- docker exec -it <container_id> bash → Ouvre un shell interactif dans un conteneur.
- docker attach <container_id> → Se connecte à la console d’un conteneur en cours d’exécution.

### Volumes et stockage
- docker volume ls → Liste les volumes Docker.
- docker volume create <nom> → Crée un volume.
- docker volume rm <nom> → Supprime un volume.

### Réseau
- docker network ls → Liste les réseaux Docker.
- docker network create <nom> → Crée un réseau Docker.
- docker network rm <nom> → Supprime un réseau.

### Construction d’images
- docker build -t <nom_image> . → Construit une image à partir d’un Dockerfile.