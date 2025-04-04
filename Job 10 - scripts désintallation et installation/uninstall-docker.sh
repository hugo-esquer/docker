#!/bin/bash

# Script pour désinstaller complètement Docker
# Ce script supprime tous les conteneurs, images, volumes, réseaux et paquets Docker

echo "### Début de la désinstallation complète de Docker ###"

# Arrêt du service Docker
echo "Arrêt du service Docker..."
sudo systemctl stop docker
sudo systemctl stop docker.socket
sudo systemctl stop containerd

# Suppression des conteneurs, images, volumes et réseaux
if command -v docker &> /dev/null; then
    echo "Suppression de tous les conteneurs, images, volumes et réseaux Docker..."
    docker container stop $(docker container ls -aq) 2>/dev/null || true
    docker container rm $(docker container ls -aq) 2>/dev/null || true
    docker image rm $(docker image ls -q) 2>/dev/null || true
    docker volume rm $(docker volume ls -q) 2>/dev/null || true
    docker network rm $(docker network ls -q) 2>/dev/null || true
fi

# Désinstallation des paquets Docker
echo "Désinstallation des paquets Docker..."
sudo apt-get purge -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-compose docker.io containerd runc 2>/dev/null || true

# Suppression des paquets résiduels
echo "Suppression des paquets résiduels..."
sudo apt-get autoremove -y --purge docker-* 2>/dev/null || true

# Suppression des répertoires Docker
echo "Suppression des répertoires Docker..."
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd
sudo rm -rf /etc/docker
sudo rm -rf /etc/containerd
sudo rm -rf ~/.docker

# Suppression du groupe Docker
echo "Suppression du groupe Docker..."
sudo groupdel docker 2>/dev/null || true

echo "### Docker a été complètement désinstallé et le système nettoyé ###"