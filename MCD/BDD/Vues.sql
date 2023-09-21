-- Active: 1692710332644@@127.0.0.1@3306@MagasinJeuxVideo
--Vue pour la jointure Jeux - Fournisseurs :
CREATE VIEW VueJeuxFournisseurs AS SELECT J.JeuID, J.Titre, J.Plateforme, J.Description, J.Prix,
    F.NomFournisseur, F.Adresse AS AdresseFournisseur, F.Telephone AS TelephoneFournisseur, F.Email AS EmailFournisseur
    FROM Jeux J JOIN Fournisseurs F ON J.FournisseurID = F.FournisseurID;

SELECT * FROM VueJeuxFournisseurs;

--Vue pour la jointure Jeux - Catégorie/Sous-catégorie :
CREATE VIEW VueJeuxCategories AS SELECT J.JeuID, J.Titre, J.Plateforme, J.Description, J.Prix, C.NomCategorie,
    C.Description AS DescriptionCategorie FROM Jeux J JOIN Categories C ON J.CategorieID = C.CategorieID;

SELECT * FROM VueJeuxCategories;