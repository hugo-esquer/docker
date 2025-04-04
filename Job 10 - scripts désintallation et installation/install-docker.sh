#!/bin/bash

# Script pour installer automatiquement Docker sur Debian
# Ce script installe Docker CE, Docker Compose et configure les permissions

echo "### Début de l'installation automatique de Docker sur Debian ###"

# Mise à jour des paquets
echo "Mise à jour des dépôts et paquets..."
sudo apt-get update
sudo apt-get upgrade -y

# Installation des dépendances requises
echo "Installation des dépendances..."
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release

# Ajout de la clé GPG officielle de Docker
echo "Ajout de la clé GPG Docker..."
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Configuration du dépôt Docker
echo "Configuration du dépôt Docker..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Mise à jour des dépôts avec le nouveau dépôt Docker
echo "Mise à jour des dépôts avec Docker..."
sudo apt-get update

# Installation de Docker
echo "Installation de Docker Engine, CLI, Containerd, et plugins..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Démarrage et activation du service Docker
echo "Démarrage et activation du service Docker..."
sudo systemctl start docker
sudo systemctl enable docker

# Ajout de l'utilisateur courant au groupe Docker
echo "Ajout de l'utilisateur actuel ($(whoami)) au groupe docker..."
sudo usermod -aG docker $(whoami)

# Installation de Docker Compose
echo "Installation de Docker Compose..."
sudo apt-get install -y docker-compose-plugin

# Test de l'installation
echo "Test de l'installation avec l'image hello-world..."
sudo docker run hello-world

echo "### Installation de Docker terminée ###"
echo "Note: Vous devrez vous déconnecter et vous reconnecter pour que les changements de groupe prennent effet."
echo "Pour vérifier que tout fonctionne, exécutez 'docker info' après vous être reconnecté."