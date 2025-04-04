# Installation de Portainer
## Installer Portainer avec Docker
Sur la VM, exécutez ces commandes : 
```
docker volume create portainer_data

docker run -d \
  --name portainer \
  --restart=always \
  -p 8000:8000 \
  -p 9443:9443 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data \
  portainer/portainer-ce:latest
```
## Accéder à l'interface Web
1. Ouvrir un navigateur et accéder à :
```
https://[IP_DE_LA_VM]:9443
```
2. À la première connexion, Portainer te demandera de créer un utilisateur admin.
3. Ensuite, sélectionne "Docker" comme environnement et choisis "Local" pour gérer ton installation Docker locale.
---
# Création d'un conteneur
## 1. Aller dans la gestion des conteneurs
1. Dans le menu de gauche, cliquez sur Containers.
2. Claiquez sur + Add container.
## 2. Configurer le conteneur
1. Nom du conteneur : Choisissez un nom.
2. Image : Entre le nom de l'image Docker.
3. Ports : Sous "Port mapping", faites votre mapping.
## 3. Lancer le conteneur
1. Cliquer sur "Deploy the container".
2. Vérifiez qu'il est bien listé dans Containers.
## 4 Gérer les conteneurs
 - Démarrer/Arrêter/Rebooter : Boutons disponible sous Container.
 - Accéder au terminal : 
  - Cliquez sur le conteneur -> Onglet Console -> Sélectionnez sh ou bash -> Connect.
