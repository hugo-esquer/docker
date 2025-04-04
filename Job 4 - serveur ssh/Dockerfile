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