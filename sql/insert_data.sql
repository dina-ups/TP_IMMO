-- insert_data.sql

-- Insertion des données dans la table Client
INSERT INTO Client (IDC, NomPrenom, Age, Salaire) VALUES ('C01', 'Alice Dupont', 30, 2500.00);
INSERT INTO Client (IDC, NomPrenom, Age, Salaire) VALUES ('C02', 'Bob Martin', 45, 3200.00);
INSERT INTO Client (IDC, NomPrenom, Age, Salaire) VALUES ('C03', 'Claire Fontaine', 28, 2800.00);

-- Insertion des données dans la table Agence
INSERT INTO Agence (IDA, Nom, Adresse, Telephone) VALUES ('A01', 'Agence Centre', '123 Rue Principale', '0123456789');
INSERT INTO Agence (IDA, Nom, Adresse, Telephone) VALUES ('A02', 'Agence Nord', '456 Rue du Nord', '0987654321');
INSERT INTO Agence (IDA, Nom, Adresse, Telephone) VALUES ('A03', 'Agence Sud', '789 Rue du Sud', '0147852369');

-- Insertion des données dans la table Bien
INSERT INTO Bien (IDB, Adresse, CodePostal, Type, IDC, IDA, LoyerMensuel, Etat) 
VALUES ('B01', '12 Rue Verte', '75001', 'T2', NULL, 'A01', 1200.00, 'Libre');
INSERT INTO Bien (IDB, Adresse, CodePostal, Type, IDC, IDA, LoyerMensuel, Etat) 
VALUES ('B02', '34 Rue Bleue', '75002', 'T3', 'C01', 'A01', 1500.00, 'Loue');
INSERT INTO Bien (IDB, Adresse, CodePostal, Type, IDC, IDA, LoyerMensuel, Etat) 
VALUES ('B03', '56 Rue Jaune', '75003', 'T4', NULL, 'A02', 1800.00, 'Libre');

-- Insertion des données dans la table Inscrit
INSERT INTO Inscrit (IDC, IDA) VALUES ('C01', 'A01');
INSERT INTO Inscrit (IDC, IDA) VALUES ('C02', 'A02');
INSERT INTO Inscrit (IDC, IDA) VALUES ('C03', 'A01');
