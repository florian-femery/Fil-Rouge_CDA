-- Active: 1692710332644@@127.0.0.1@3306@MagasinJeuxVideo

--Sélectionner les commandes non soldées (en cours de livraison) :
DELIMITER //

CREATE PROCEDURE SelectCommandesNonSoldees()
BEGIN
    SELECT Commandes.CommandeID, Clients.Nom, Clients.Prenom, Commandes.DateCommande
    FROM Commandes
    JOIN Clients ON Commandes.ClientID = Clients.ClientID
    LEFT JOIN Paiements ON Commandes.CommandeID = Paiements.CommandeID
    WHERE Paiements.CommandeID IS NULL;
END //

DELIMITER ;

CALL `SelectCommandesNonSoldees`()


--Calculer le délai moyen entre la date de commande et la date de facturation :
DELIMITER //

CREATE PROCEDURE CalculateDelaiMoyenFacturation()
BEGIN
    SELECT AVG(DATEDIFF(Paiements.DatePaiement, Commandes.DateCommande)) AS DelaiMoyenFacturation
    FROM Commandes
    JOIN Paiements ON Commandes.CommandeID = Paiements.CommandeID;
END //

DELIMITER ;

CALL `CalculateDelaiMoyenFacturation`()