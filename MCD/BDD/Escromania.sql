-- Active: 1692710332644@@127.0.0.1@3306@MagasinJeuxVideo
-- Créer la base de données
CREATE DATABASE MagasinJeuxVideo;
USE MagasinJeuxVideo;
DROP DATABASE MagasinJeuxVideo;

-- Table pour les utilisateurs
CREATE TABLE Utilisateurs (
    UtilisateurID INT PRIMARY KEY AUTO_INCREMENT,
    NomUtilisateur VARCHAR(50) UNIQUE NOT NULL,
    MotDePasse VARCHAR(255) NOT NULL,
    Role ENUM('Client', 'Administrateur') NOT NULL
);

-- Table pour les jeux
CREATE TABLE Jeux (
    JeuID INT PRIMARY KEY AUTO_INCREMENT,
    Titre VARCHAR(255) NOT NULL,
    Plateforme VARCHAR(50) NOT NULL,
    Genre VARCHAR(50),
    Prix DECIMAL(10, 2) NOT NULL
);

-- Table pour les clients
CREATE TABLE Clients (
    ClientID INT PRIMARY KEY AUTO_INCREMENT,
    Nom VARCHAR(100) NOT NULL,
    Prenom VARCHAR(100) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Telephone VARCHAR(10),
    Adresse VARCHAR(255)
);

-- Table pour les commandes
CREATE TABLE Commandes (
    CommandeID INT PRIMARY KEY AUTO_INCREMENT,
    ClientID INT,
    UtilisateurID INT,
    DateCommande DATE NOT NULL,
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    FOREIGN KEY(UtilisateurID) REFERENCES Utilisateurs(UtilisateurID)
);

-- Table de liaison pour les jeux commandés
CREATE TABLE JeuxCommandes (
    JeuCommandeID INT PRIMARY KEY AUTO_INCREMENT,
    CommandeID INT,
    JeuID INT,
    Quantite INT NOT NULL,
    FOREIGN KEY (CommandeID) REFERENCES Commandes(CommandeID),
    FOREIGN KEY (JeuID) REFERENCES Jeux(JeuID)
);

-- Table pour les paiements
CREATE TABLE Paiements (
    PaiementID INT PRIMARY KEY AUTO_INCREMENT,
    CommandeID INT,
    Montant DECIMAL(10, 2) NOT NULL,
    DatePaiement DATE NOT NULL,
    ModePaiement VARCHAR(50) NOT NULL,
    FOREIGN KEY (CommandeID) REFERENCES Commandes(CommandeID)
);

-- Exemple d'insertion de données
INSERT INTO Utilisateurs (NomUtilisateur, MotDePasse, Role) VALUES
    ('admin', 'motdepasseadmin', 'Administrateur'),
    ('client1', 'motdepasseclient1', 'Client');

-- Exemple d'insertion de données
INSERT INTO Jeux (Titre, Plateforme, Genre, Prix) VALUES
    ('The Witcher 3: Wild Hunt', 'PC', 'RPG', 29.99),
    ('Grand Theft Auto V', 'PS4', 'Action', 39.99),
    ('The Legend of Zelda: Breath of the Wild', 'Nintendo Switch', 'Adventure', 49.99);

INSERT INTO Clients (Nom, Prenom, Email, Telephone, Adresse) VALUES
    ('Dupont', 'Jean', 'jean.dupont@email.com', '0654976231', '123 Rue de la République'),
    ('Martin', 'Marie', 'marie.martin@email.com', '0755319402', '456 Avenue des Roses');

-- Vous pouvez maintenant créer des commandes en utilisant les tables Commandes et JeuxCommandes.

-- Exemple de création de commande
INSERT INTO Commandes (ClientID, DateCommande) VALUES
    (1, '2023-09-20');

-- Exemple d'ajout de jeux à une commande
INSERT INTO JeuxCommandes (CommandeID, JeuID, Quantite) VALUES
    (1, 1, 2),
    (1, 2, 1);
    
-- Ajout d'un paiement
INSERT INTO Paiements (CommandeID, Montant, DatePaiement, ModePaiement) VALUES
    (1, 109.97, '2023-09-20', 'Carte de crédit');