-- permissions.sql

-- Création des utilisateurs
CREATE USER 'Brisefer'@'%' IDENTIFIED BY 'password123';
CREATE USER 'Rectitude'@'%' IDENTIFIED BY 'password123';
CREATE USER 'Lebut'@'%' IDENTIFIED BY 'password123';
CREATE USER 'Genial'@'%' IDENTIFIED BY 'password123';

-- Permissions pour Brisefer (Administrateur Général)
GRANT ALL PRIVILEGES ON TP_IMMO.* TO 'Brisefer'@'%';

-- Permissions pour Rectitude (Responsable des Agences)
GRANT SELECT, INSERT, UPDATE ON TP_IMMO.Agence TO 'Rectitude'@'%';
GRANT SELECT, INSERT, UPDATE ON TP_IMMO.Client TO 'Rectitude'@'%';
GRANT SELECT, INSERT, UPDATE ON TP_IMMO.Bien TO 'Rectitude'@'%';

-- Permissions pour Lebut (Chargé de Clientèle)
GRANT INSERT, DELETE, UPDATE ON TP_IMMO.Client TO 'Lebut'@'%';
GRANT INSERT, DELETE, UPDATE ON TP_IMMO.Inscrit TO 'Lebut'@'%';
GRANT SELECT ON TP_IMMO.Agence TO 'Lebut'@'%';

-- Permissions pour Genial (Gestionnaire des Biens)
GRANT SELECT, INSERT, DELETE, UPDATE ON TP_IMMO.Bien TO 'Genial'@'%';
GRANT SELECT ON TP_IMMO.Agence TO 'Genial'@'%';

-- Création des rôles
CREATE ROLE AdministrateurGeneral;
CREATE ROLE ResponsableAgences;
CREATE ROLE ChargeClientele;
CREATE ROLE GestionnaireBiens;

-- Attribution des permissions aux rôles
GRANT ALL PRIVILEGES ON TP_IMMO.* TO AdministrateurGeneral;
GRANT SELECT, INSERT, UPDATE ON TP_IMMO.Agence TO ResponsableAgences;
GRANT SELECT, INSERT, UPDATE ON TP_IMMO.Client TO ResponsableAgences;
GRANT SELECT, INSERT, UPDATE ON TP_IMMO.Bien TO ResponsableAgences;
GRANT INSERT, DELETE, UPDATE ON TP_IMMO.Client TO ChargeClientele;
GRANT INSERT, DELETE, UPDATE ON TP_IMMO.Inscrit TO ChargeClientele;
GRANT SELECT ON TP_IMMO.Agence TO ChargeClientele;
GRANT SELECT, INSERT, DELETE, UPDATE ON TP_IMMO.Bien TO GestionnaireBiens;
GRANT SELECT ON TP_IMMO.Agence TO GestionnaireBiens;

-- Attribution des rôles aux utilisateurs
GRANT AdministrateurGeneral TO 'Brisefer'@'%';
GRANT ResponsableAgences TO 'Rectitude'@'%';
GRANT ChargeClientele TO 'Lebut'@'%';
GRANT GestionnaireBiens TO 'Genial'@'%';

-- Activation des rôles
SET DEFAULT ROLE AdministrateurGeneral FOR 'Brisefer'@'%';
SET DEFAULT ROLE ResponsableAgences FOR 'Rectitude'@'%';
SET DEFAULT ROLE ChargeClientele FOR 'Lebut'@'%';
SET DEFAULT ROLE GestionnaireBiens FOR 'Genial'@'%';

-- Vérification des permissions
SHOW GRANTS FOR 'Brisefer'@'%';
SHOW GRANTS FOR 'Rectitude'@'%';
SHOW GRANTS FOR 'Lebut'@'%';
SHOW GRANTS FOR 'Genial'@'%';
