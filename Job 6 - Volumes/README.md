# Documentation Volumes

### **Partager un volume entre deux conteneurs (Docker)**
Les volumes permettent à plusieurs conteneurs de partager des fichiers persistants.

#### **Créer un volume Docker**
```sh
docker volume create mon_volume
```
Cela crée un volume nommé `mon_volume`.

#### **Monter le volume dans plusieurs conteneurs**
Démarrer un premier conteneur en utilisant le volume :
```sh
docker run -d --name conteneur1 -v mon_volume:/data alpine sleep 1000
```
Démarrer un second conteneur qui partage le même volume :
```sh
docker run -d --name conteneur2 -v mon_volume:/data alpine sleep 1000
```
👉 Les deux conteneurs peuvent lire/écrire dans `/data`, et les modifications sont visibles par les deux.

---

### **Lister et inspecter les volumes**
- Voir tous les volumes :
  ```sh
  docker volume ls
  ```
- Obtenir des détails sur un volume :
  ```sh
  docker volume inspect mon_volume
  ```

---

### **Supprimer un volume**
- Supprimer un volume spécifique :
  ```sh
  docker volume rm mon_volume
  ```
- Supprimer tous les volumes non utilisés :
  ```sh
  docker volume prune
  ```

---

### **Alternative : utiliser `--volumes-from`**
Si tu veux qu'un conteneur utilise les volumes d'un autre :
```sh
docker run -d --name conteneur3 --volumes-from conteneur1 alpine sleep 1000
```
Cela copie les montages de `conteneur1` dans `conteneur3`.
