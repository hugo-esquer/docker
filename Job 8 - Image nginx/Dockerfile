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