# Création image Nginx
créer un dockerfile et deux fichiers de configurations.
## Dockerfile
```
# Utilisation d'Alpine Linux comme base légère
FROM alpine:latest

# Installation de Nginx et nettoyage du cache en une seule couche
RUN apk update && \
    apk add --no-cache nginx && \
    mkdir -p /run/nginx && \
    mkdir -p /var/cache/nginx && \
    mkdir -p /var/log/nginx && \
    # On crée un dossier pour notre contenu web
    mkdir -p /var/www/html && \
    # Nettoyage pour réduire la taille de l'image
    rm -rf /var/cache/apk/*

# Copie d'une configuration Nginx par défaut
# Vous pouvez remplacer ce fichier par votre propre configuration
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf

# Fichier HTML de test (optionnel)
RUN echo "<html><body><h1>Nginx sur Alpine fonctionne!</h1></body></html>" > /var/www/html/index.html

# Exposition des ports
EXPOSE 80

# Définition du répertoire de travail
WORKDIR /var/www/html

# Démarrage de Nginx en premier plan
CMD ["nginx", "-g", "daemon off;"]
```
## Le fichier nginx.conf
```
user nginx;
worker_processes auto;
error_log /var/log/nginx/error.log warn;
pid /var/run/nginx.pid;

events {
    worker_connections 1024;
}

http {
    include /etc/nginx/mime.types;
    default_type application/octet-stream;
    
    log_format main '$remote_addr - $remote_user [$time_local] "$request" '
                    '$status $body_bytes_sent "$http_referer" '
                    '"$http_user_agent" "$http_x_forwarded_for"';
    
    access_log /var/log/nginx/access.log main;
    
    sendfile on;
    keepalive_timeout 65;
    
    include /etc/nginx/conf.d/*.conf;
}
```
## Le fichier default.conf
```
server {
    listen 80;
    server_name localhost;
    
    location / {
        root /var/www/html;
        index index.html index.htm;
    }
    
    error_page 500 502 503 504 /50x.html;
    location = /50x.html {
        root /usr/share/nginx/html;
    }
}
```
## Lancer le conteneur et se connecter au site
Pour utiliser ce Dockerfile :

1. Créez un répertoire pour votre projet
2. Placez-y le Dockerfile et les fichiers de configuration (nginx.conf et default.conf)
3. Construisez l'image avec la commande :
   ```
   docker build -t nginx-alpine .
   ```
4. Exécutez un conteneur avec :
   ```
   docker run -d -p 8080:80 nginx-alpine
   ```
5. Accédez à http://hostIp:8080 pour vérifier que Nginx fonctionne.