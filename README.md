# TP_IMMO
# README - TP Gestion des Données et Sécurité

## Structure du Projet
Voici les fichiers et dossiers inclus dans le rendu :

```
TP_IMMO/
├── compte_rendu/
│   └── Compte_Rendu_TP_IMMO.pdf   # Document détaillé du TP
├── sql/
│   ├── schema.sql                 # Script de création des tables et des contraintes
│   ├── insert_data.sql            # Script pour insérer les données initiales
│   ├── permissions.sql            # Script pour gérer les droits d'accès
├── php/
│   ├── formulaire.html            # Formulaire HTML
│   └── inscription.php            # Script PHP pour traiter les soumissions
├── captures/
│   ├── test_sqlmap.png            # Capture des résultats SQLmap
│   └── test_permissions.png       # Capture de la vérification des permissions
└── docker/
    └── docker-compose.yml         # Fichier Docker Compose pour lancer les conteneurs
```

---

## Instructions pour le Lancement

### Prérequis
- **Docker** : Assurez-vous que Docker est installé et opérationnel sur votre machine.
- **Docker Compose** : Nécessaire pour gérer plusieurs conteneurs simultanément.

### Étapes pour Lancer les Conteneurs

1. **Cloner ou copier le projet sur votre machine locale**
   ```bash
   git clone https://github.com/dina-ups/TP_IMMO.git
   cd TP_IMMO/docker
   ```

2. **Lancer les conteneurs Docker**
   Utilisez Docker Compose pour démarrer les services MySQL et PHP :
   ```bash
   docker-compose up -d
   ```
   - Cela crée deux conteneurs :
     - `tp_mysql` : Conteneur MySQL pour la base de données.
     - `tp_php` : Conteneur PHP avec Apache pour le serveur web.

3. **Vérifier l'état des conteneurs**
   ```bash
   docker ps
   ```
   Assurez-vous que les conteneurs `tp_mysql` et `tp_php` sont en cours d'exécution.

4. **Accéder à l'application**
   Ouvrez votre navigateur et accédez à l'URL suivante pour tester le formulaire :
   ```
   http://localhost:8080/formulaire.html
   ```

---

## Scripts SQL

### 1. Création de la Base de Données
Le script `schema.sql` crée les tables et les contraintes nécessaires :
```bash
docker exec -i tp_mysql mysql -uroot -pyourpassword TP_IMMO < /path/to/schema.sql
```

### 2. Insertion des Données
Le script `insert_data.sql` insère les données initiales dans la base :
```bash
docker exec -i tp_mysql mysql -uroot -pyourpassword TP_IMMO < /path/to/insert_data.sql
```

### 3. Gestion des Permissions
Le script `permissions.sql` gère les utilisateurs, leurs rôles et permissions :
```bash
docker exec -i tp_mysql mysql -uroot -pyourpassword TP_IMMO < /path/to/permissions.sql
```

---

## Tests de Sécurité

### Test avec SQLmap
Nous avons utilisé SQLmap pour vérifier les vulnérabilités d'injection SQL dans le formulaire. Voici la commande utilisée :
```bash
sqlmap -u "http://localhost:8080/inscription.php" --data="idc=C01&ida=A01" --batch
```

Les résultats montrent que le formulaire est sécurisé grâce à l'utilisation de requêtes préparées.

---

## Points Importants
- **Formulaire Web** : Situé dans `php/formulaire.html` et `php/inscription.php`. Il est connecté à la base de données MySQL via PDO.
- **Docker Compose** : Simplifie le déploiement en gérant automatiquement les dépendances entre les services.
- **Scripts SQL** : Les scripts sont organisés pour permettre une exécution séquentielle facile.

---

Pour toute question, n'hésitez pas à me contacter. Bonne évaluation !
