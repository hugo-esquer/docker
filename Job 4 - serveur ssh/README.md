# Créer un Serveur SSH
## Créer le Dockerfile
Dans un dossier sppécifique créer le fichier
```
mkdir serveur_ssh
cd serveur_ssh
vim Dockerfile
```
Dans ce fichier créer la configuration
```
FROM alpine:latest

# Installer OpenSHH
RUN apk add --no-cache openssh \
    && ssh-keygen -A \
    && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && apk cache clean \
    && echo 'root:root123' | chpasswd

# Exposer le port SSH 22
EXPOSE 22

# Lancer SSHD au démarrage du conteneur
CMD ["/usr/sbin/sshd", "-D"]
```
---
### Explications

```dockerfile
FROM alpine:latest
```
Cette ligne définit l'image de base utilisée pour construire le conteneur. Alpine Linux est une distribution Linux légère et minimaliste, idéale pour les conteneurs. La version "latest" indique qu'on utilise la version la plus récente disponible.

```dockerfile
RUN apk add --no-cache openssh \
    && ssh-keygen -A \
    && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && apk cache clean \
    && echo 'root:root123' | chpasswd
```
Cette instruction `RUN` exécute plusieurs commandes en séquence :
- `apk add --no-cache openssh` : installe le serveur SSH sans conserver les fichiers de cache.
- `ssh-keygen -A` : génère automatiquement les clés d'hôte SSH nécessaires.
- `sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config` : modifie le fichier de configuration SSH pour autoriser la connexion en tant que root.
- `apk cache clean` : nettoie le cache d'APK (le gestionnaire de paquets d'Alpine).
- `echo 'root:root123' | chpasswd` : définit le mot de passe "root123" pour l'utilisateur root.

```dockerfile
EXPOSE 22
```
Cette instruction indique que le conteneur écoutera sur le port 22, qui est le port standard pour SSH. Cela n'ouvre pas automatiquement le port, mais documente que le conteneur utilise ce port.

```dockerfile
CMD ["/usr/sbin/sshd", "-D"]
```
Cette instruction définit la commande par défaut qui sera exécutée lorsque le conteneur démarre. Ici, elle lance le démon SSH (`sshd`) avec l'option `-D` qui le fait s'exécuter en avant-plan (au lieu de démarrer en tant que démon en arrière-plan), ce qui est la pratique recommandée pour les conteneurs Docker.

Note de sécurité : Ce Dockerfile crée un conteneur avec un accès SSH root ayant un mot de passe simple et prévisible ("root123"). Dans un environnement de production, cela représenterait un risque de sécurité important.

## Construire le conteneur
```
sudo docker build -t image_ssh .
```
## Lancer le conteneur
```
sudo run -d -p 2222:22 --name conteneur_ssh image_ssh
```
### Explications
Cette commande lance un conteneur Docker avec l'image nommée "image_ssh" et plusieurs options :

- `sudo` : exécute la commande avec des privilèges d'administrateur (nécessaire pour Docker selon la configuration du système)
- `run` : sous-commande Docker pour créer et démarrer un nouveau conteneur
- `-d` : option "detached", fait tourner le conteneur en arrière-plan (comme un démon)
- `-p 2222:22` : mappe le port 22 du conteneur (port SSH interne) vers le port 2222 de la machine hôte, permettant d'accéder au service SSH du conteneur via l'adresse de l'hôte sur le port 2222
- `--name conteneur_ssh` : attribue le nom "conteneur_ssh" au conteneur, facilitant sa référence dans les commandes futures
- `image_ssh` : le nom de l'image Docker à utiliser pour créer le conteneur (probablement l'image que vous avez créée avec le Dockerfile précédent)

Une fois cette commande exécutée, le conteneur SSH sera actif en arrière-plan, et vous pourrez vous y connecter via SSH en utilisant :
```
ssh root@localhost -p 2222
```
(avec le mot de passe "root123" défini dans le Dockerfile)