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
    Description TEXT,
    Prix DECIMAL(10, 2) NOT NULL,
    FournisseurID INT,
    CategorieID INT,
    FOREIGN KEY (FournisseurID) REFERENCES Fournisseurs(FournisseurID),
    FOREIGN KEY (CategorieID) REFERENCES Categories(CategorieID)
);

CREATE TABLE ImagesJeux (
    ImageID INT PRIMARY KEY AUTO_INCREMENT,
    JeuID INT,
    CheminImage VARCHAR(255),
    FOREIGN KEY (JeuID) REFERENCES Jeux(JeuID)
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

-- Table pour les fournisseurs
CREATE TABLE Fournisseurs (
    FournisseurID INT PRIMARY KEY AUTO_INCREMENT,
    NomFournisseur VARCHAR(255) NOT NULL,
    Adresse VARCHAR(255),
    Telephone VARCHAR(15),
    Email VARCHAR(255) UNIQUE
);

-- Table pour les catégories
CREATE TABLE Categories (
    CategorieID INT PRIMARY KEY AUTO_INCREMENT,
    NomCategorie VARCHAR(255) NOT NULL,
    Description TEXT
);

-- Exemple d'insertion de données
INSERT INTO Utilisateurs (NomUtilisateur, MotDePasse, Role) VALUES
    ('admin', 'motdepasseadmin', 'Administrateur'),
    ('client1', 'motdepasseclient1', 'Client');

-- Exemple d'insertion de données
INSERT INTO Jeux (Titre, Plateforme, Description, Prix, FournisseurID, CategorieID) VALUES
    ('The Witcher 3: Wild Hunt', 'PC', 'The Witcher 3: Wild Hunt is a 2015 action role-playing game developed and published by CD Projekt.
    It is the sequel to the 2011 game The Witcher 2: Assassins of Kings and the third game in The Witcher video game series,
    played in an open world with a third-person perspective.', 29.99, 1, 1),
    ('Grand Theft Auto V', 'PS4', 'Grand Theft Auto V (plus communément GTA V ou GTA 5) est un jeu vidéo d`action-aventure,
    développé par Rockstar North et édité par Rockstar Games. Il est sorti en 2013 sur PlayStation 3 et Xbox 360, en 2014 sur PlayStation 4 et Xbox One,
    en 2015 sur PC puis en 2022 sur PlayStation 5 et Xbox Series. Le jeu fait partie de la série vidéoludique Grand Theft Auto.', 39.99, 2, 1),
    ('The Legend of Zelda: Breath of the Wild', 'Nintendo Switch', 'The Legend of Zelda: Breath of the Wild (ou simplement Breath of the Wild,
    parfois abrégé BotW) est un jeu d`action-aventure développé par la division Nintendo EPD, assisté par Monolith Soft,
    et publié par Nintendo le 3 mars 2017 sur Nintendo Switch lors du lancement de la console,
    ainsi que sur Wii U dont il est le dernier jeu produit par Nintendo. C`est le dix-neuvième jeu de la franchise The Legend of Zelda.', 49.99, 2, 2),
    ('Assassin''s Creed Valhalla', 'Xbox Series X', 'Assassin`s Creed Valhalla est un jeu vidéo d`action-aventure et de rôle,
    développé par Ubisoft Montréal et édité par Ubisoft, sorti en novembre 2020 sur Microsoft Windows, PlayStation 4, Xbox One, Xbox Series,
    Google Stadia et PlayStation 5. Il appartient à la série Assassin`s Creed et en est le douzième opus canonique.
    L`action principale du jeu se déroule pendant l`ère viking.', 49.99, 1, 5),
    ('FIFA 23', 'PS5', 'FIFA 23 est un jeu vidéo de simulation de football développé par EA Vancouver et édité par Electronic Arts. 
    Il s`agit du 30e volet de la série FIFA. Il est sorti sur Microsoft Windows, 
    Nintendo Switch, PlayStation 4, PlayStation 5, Xbox One, Xbox Series et Google Stadia le 30 septembre 20221.', 59.99, 2, 6),
    ('Minecraft', 'Nintendo Switch', 'Minecraft est un jeu vidéo de type aventure « bac à sable » (construction complètement libre)
    développé par le Suédois Markus Persson, alias Notch, puis par la société Mojang Studios.
    Il s`agit d`un univers composé de voxels et généré de façon procédurale, qui intègre un système d`artisanat axé sur l`exploitation
    puis la transformation de ressources naturelles (minéralogiques, fossiles, animales et végétales).ndbox', 29.99, 1, 7),
    ('Cyberpunk 2078', 'PC', 'Cyberpunk 2077 est un jeu vidéo d`action-RPG en vue à la première personne développé par CD Projekt RED,
    inspiré du jeu de rôle sur table Cyberpunk 2020 conçu par Mike Pondsmith. Le jeu présente un monde futuriste dystopique de type cyberpunk
    dans lequel la technologie coexiste avec une société humaine dégénérée.', 59.99, 1, 4),
    ('Super Mario Odyssey', 'Nintendo Switch', 'Super Mario Odyssey (スーパーマリオ オデッセイ, Sūpā Mario Odessei?)
    est un jeu vidéo de plates-formes développé par Nintendo EPD Tokyo et édité par Nintendo.
    Il est sorti mondialement le 27 octobre 2017 sur Nintendo Switch.', 44.99, 2, 8),
    ('Halo Infinite', 'Xbox Series X', 'Halo Infinite est un jeu vidéo de tir à la première personne développé par 343 Industries
    et édité par Xbox Game Studios, sorti le 8 décembre 2021 sur Windows, Xbox One et Xbox Series.
    C`est le sixième jeu principal de la série Halo, faisant suite à Halo 5: Guardians sorti en 2015.', 59.99, 2, 9),
    ('Resident Evil Village', 'PS5', 'Resident Evil Village, stylisé Resident Evil VII.I.age
    et connu au Japon sous le nom Biohazard Village (バイオハザード ヴィレッジ, Baiohazādo Virejji?),
    est un jeu vidéo d`horreur en vue à la première personne développé et édité par Capcom. Il est sorti le 7 mai 2021 sur Windows,
    PlayStation 4, PlayStation 5, Xbox One, Xbox Series et Google Stadia. 
    l constitue le douzième épisode majeur de la série Resident Evil et fait suite à Resident Evil 7: Biohazard sorti en 2017.', 49.99, 1, 10),
    ('Super Smash Bros. Ultimate', 'Nintendo Switch', 'Super Smash Bros. Ultimate (大乱闘スマッシュブラザーズ SPECIAL, Dairantō Sumasshu Burazāzu Supesharu?)
    est un jeu vidéo de combat et de plates-formes développé par Sora Ltd. et Bandai Namco et édité par Nintendo.
    Il s`agit du cinquième épisode de la série Super Smash Bros.. Annoncé lors du Nintendo Direct du 8 mars 2018,
    il est sorti mondialement le 7 décembre 2018 exclusivement sur Nintendo Switch.', 54.99, 2, 11),
    ('Final Fantasy VII Remake', 'PS4', 'Final Fantasy VII Remake, parfois abrégé en FF7 ou FFVII avec la mention Remake,
    est un jeu vidéo développé par Square Enix Business Division 1 et édité par Square Enix.
    Il s`agit de la première partie de la trilogie de remake du jeu Final Fantasy VII sorti sur PlayStation et PC en 1997', 49.99, 2, 4),
    ('The Elder Scrolls V: Skyrim', 'PC', 'The Elder Scrolls est une série de jeux vidéo de rôle se déroulant dans un univers de fantasy,
    créée par Bethesda Softworks et publiée pour la première fois en 1994. Elle est connue pour la richesse mythopoïétique
    de son univers ainsi que pour la grande liberté donnée au joueur dans l`exploration et la progression de son personnage.
    Elle compte à ce jour cinq épisodes principaux (dont trois possèdent deux à trois extensions) et plusieurs épisodes dérivés.', 39.99, 2, 4),
    ('Call of Duty: Warzone', 'PC', 'Call of Duty: Warzone, renommé en novembre 2022 Warzone Caldera,
    est un jeu vidéo de battle royale jouable gratuitement développé par Infinity Ward et Raven Software et édité par Activision,
    sorti le 10 mars 2020 sur Xbox One, PlayStation 4 et Microsoft Windows1.', 0.00, 2, 12),
    ('Among Us', 'PC', 'Among Us (litt. « Parmi nous » en anglais) est un jeu vidéo d`ambiance multijoueur en ligne développé
    et édité par le studio InnerSloth. Il est sorti en 2018 sur Android, iOS, Chrome OS puis Windows,
    en 2020 sur Nintendo Switch et en 2021 sur PlayStation 4, PlayStation 5, Xbox One et Xbox Series.', 4.99, 1, 13);
    
INSERT INTO ImagesJeux (JeuID, CheminImage) VALUES
(1, 'chemin/vers/l/image_jeu1.jpg'),
(2, 'chemin/vers/l/image_jeu2.jpg');

INSERT INTO Clients (Nom, Prenom, Email, Telephone, Adresse) VALUES
    ('Dupont', 'Jean', 'jean.dupont@email.com', '0654976231', '123 Rue de la République'),
    ('Martin', 'Marie', 'marie.martin@email.com', '0755319402', '456 Avenue des Roses'),
    ('Gagnon', 'Pierre', 'pierre.gagnon@email.com', '0687654321', '789 Rue de la Liberté'),
    ('Lavoie', 'Sophie', 'sophie.lavoie@email.com', '0712345678', '123 Avenue des Roses'),
    ('Roy', 'Martin', 'martin.roy@email.com', '0665432190', '456 Boulevard des Arbres');

-- Vous pouvez maintenant créer des commandes en utilisant les tables Commandes et JeuxCommandes.

-- Exemple de création de commande
INSERT INTO Commandes (ClientID, UtilisateurID, DateCommande) VALUES
    (1, 2, '2023-09-20'),
    (3, 2, '2023-09-22'),
    (4, 2, '2023-09-23'),
    (5, 2, '2023-09-24'),
    (1, 2, '2023-09-25'),
    (2, 2, '2023-09-26'),
    (3, 2, '2023-09-27');

-- Exemple d'ajout de jeux à une commande
INSERT INTO JeuxCommandes (CommandeID, JeuID, Quantite) VALUES
    (1, 1, 2),
    (3, 2, 1),
    (7, 3, 2),
    (2, 4, 1),
    (4, 5, 3),
    (5, 6, 2),
    (6, 7, 1),    
    (1, 8, 2),
    (2, 9, 1),
    (3, 10, 3),
    (4, 11, 2),
    (5, 12, 1),
    (7, 13, 4);
    
-- Ajout d'un paiement
INSERT INTO Paiements (CommandeID, Montant, DatePaiement, ModePaiement) VALUES
    (1, 109.97, '2000-09-20', 'Carte de crédit'),
    (2, 159.97, '2005-08-22', 'Carte de crédit'),
    (3, 209.98, '2010-04-23', 'PayPal'),
    (4, 124.98, '2015-12-24', 'Carte de débit');

--Ajout des Fournisseur
INSERT INTO Fournisseurs (NomFournisseur, Adresse, Telephone, Email)
VALUES
    ('Fournisseur 1', '789 Rue des Fournisseurs', '0644763128', 'fournisseur1@email.com'),
    ('Fournisseur 2', '456 Avenue des Fournitures', '0769310581', 'fournisseur2@email.com');

--Ajout des catégories
INSERT INTO Categories (NomCategorie, Description)
VALUES
    ('Action', 'Jeux d\'action avec beaucoup d\'adrénaline'),
    ('Aventure', 'Jeux d\'aventure avec des histoires passionnantes'),
    ('Stratégie', 'Jeux de stratégie qui nécessitent de la réflexion'),
    ('Rpg', 'Un genre de jeu vidéo s`inspirant des codes et du principe des jeux de rôle sur table.'),
    ('Action-adventure', 'Le jeu d`action-aventure est un genre de jeu vidéo qui combine les éléments du jeu d`aventure
    avec certains éléments du jeu d`action. '),
    ('Sport', 'Un jeu vidéo de sport est un genre de jeu vidéo qui simule un sport. Les jeux vidéo de course sont des jeux de sport très représentés,
    tout comme les jeux de football, basket-ball, hockey sur glace…'),
    ('Sandbox', 'Le jeu sandbox (« jeu bac à sable » en français) est un genre de jeu vidéo dont le gameplay est non linéaire et émergent,
    et qui fait principalement appel à la curiosité et à la créativité du joueur, le tout avec ou sans objectif prédéfini.'),
    ('Plateforme', 'Un jeu de plates-formes ou jeu de plateformes (ou platformer) est un genre de jeu vidéo,
    sous-genre du jeu d`action. Dans les jeux de plates-formes, le joueur contrôle un avatar qui doit sauter sur des plates-formes suspendues
    dans les airs et éviter des obstacles.'),
    ('Fps', 'Le jeu de tir à la première personne (en anglais FPS pour First-person shooter) ou en vue subjective,
    aussi appelé Doom-like est un genre de jeu vidéo de tir fondé sur des combats en vision subjective (« à la première personne »),
    c`est-à-dire que le joueur voit l`action à travers les yeux du protagoniste.'),
    ('Survival Horror' ,'Le survival horror est un genre de jeu vidéo, sous-genre du jeu d`action-aventure, inspiré des fictions d`horreur.'),
    ('Combat', 'Le jeu de combat (ou fighting game), parfois appelé abusivement en France VS fighting (pour versus fighting)
    ou plus familièrement jeu de baston, est un genre de jeu vidéo opposant un nombre limité de personnages (deux le plus souvent).'),
    ('Battle Royal', 'Le terme anglophone battle royale fait référence à un genre de jeux vidéo particulier mêlant jeu de survie et jeu de tir,
    basé sur la mécanique dite du last man standing (« dernier homme survivant »)1,2.'),
    ('Party', 'Un party game ou jeu vidéo de type party game (en anglais party video game,
    littéralement jeu vidéo de soirée, ou jeu vidéo de fête) est un jeu censé rassembler de nombreux joueurs autour d`un concept simple,
    amusant et accessible. Généralement le party game est composé de plusieurs sous-parties proposant des phases de mini-jeux en alternance.');
