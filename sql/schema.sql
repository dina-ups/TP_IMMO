-- Creation des tables pour le TP CDSI

-- Table Client
CREATE TABLE Client (
    IDC CHAR(3) PRIMARY KEY,
    NomPrenom VARCHAR(50) NOT NULL,
    Age INT NOT NULL,
    Salaire DECIMAL(10, 2) NOT NULL
);

-- Table Agence
CREATE TABLE Agence (
    IDA CHAR(3) PRIMARY KEY,
    Nom VARCHAR(50) NOT NULL,
    Adresse VARCHAR(100) NOT NULL,
    Telephone VARCHAR(15) NOT NULL
);

-- Table Bien
CREATE TABLE Bien (
    IDB CHAR(3) PRIMARY KEY,
    Adresse VARCHAR(100) NOT NULL,
    CodePostal CHAR(5) NOT NULL,
    Type VARCHAR(10) NOT NULL, -- Exemple: T1, T2, T3...
    IDC CHAR(3), -- Référence au client, peut être NULL si non loué
    IDA CHAR(3), -- Référence à l'agence, peut être NULL si non loué
    LoyerMensuel DECIMAL(10, 2) NOT NULL,
    Etat VARCHAR(10) CHECK (Etat IN ('Louer', 'Libre')), -- Contraintes pour l'état
    FOREIGN KEY (IDC) REFERENCES Client(IDC),
    FOREIGN KEY (IDA) REFERENCES Agence(IDA)
);

-- Table Inscrit
CREATE TABLE Inscrit (
    IDC CHAR(3),
    IDA CHAR(3),
    PRIMARY KEY (IDC, IDA),
    FOREIGN KEY (IDC) REFERENCES Client(IDC),
    FOREIGN KEY (IDA) REFERENCES Agence(IDA)
);

-- Requetes preparatoires pour les tests du TP
-- Ajout de quelques donnees pour tester les requetes

-- Insertion des clients
INSERT INTO Client (IDC, NomPrenom, Age, Salaire) VALUES
('C01', 'Alice Dupont', 30, 2500.00),
('C02', 'Bob Martin', 45, 3200.00),
('C03', 'Charlie Durand', 25, 1800.00);

-- Insertion des agences
INSERT INTO Agence (IDA, Nom, Adresse, Telephone) VALUES
('A01', 'Agence Centre', '123 Rue Principale', '0123456789'),
('A02', 'Agence Nord', '456 Rue du Nord', '0987654321');

-- Insertion des biens
INSERT INTO Bien (IDB, Adresse, CodePostal, Type, IDC, IDA, LoyerMensuel, Etat) VALUES
('B01', '12 Rue Verte', '75001', 'T2', NULL, 'A01', 1200.00, 'Libre'),
('B02', '34 Rue Bleue', '75002', 'T3', 'C01', 'A01', 1500.00, 'Louer'),
('B03', '56 Rue Jaune', '75003', 'T1', NULL, 'A02', 900.00, 'Libre');

-- Insertion des inscriptions
INSERT INTO Inscrit (IDC, IDA) VALUES
('C01', 'A01'),
('C02', 'A01'),
('C02', 'A02'),
('C03', 'A02');
