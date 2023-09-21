-- Active: 1692710332644@@127.0.0.1@3306@MagasinJeuxVideo


--Sélection de toutes les commandes et de leurs détails associés (y compris les jeux commandés) :
SELECT c.CommandeID, cl.Nom AS NomClient, j.Titre AS TitreJeu, jc.Quantite, p.ModePaiement FROM Commandes c
INNER JOIN Clients cl ON c.ClientID = cl.ClientID INNER JOIN JeuxCommandes jc ON c.CommandeID = jc.CommandeID
INNER JOIN Jeux j ON jc.JeuID = j.JeuID LEFT JOIN Paiements p ON c.CommandeID = p.CommandeID;

--Sélection des commandes passées par un client spécifique (par exemple, le client avec l'ID 1) :
SELECT c.CommandeID, j.Titre AS TitreJeu, jc.Quantite, p.ModePaiement FROM Commandes c
INNER JOIN JeuxCommandes jc ON c.CommandeID = jc.CommandeID INNER JOIN Jeux j ON jc.JeuID = j.JeuID
LEFT JOIN Paiements p ON c.CommandeID = p.CommandeID WHERE c.ClientID = 1;

--Calcul du montant total dépensé par un client spécifique (par exemple, le client avec l'ID 1) :
SELECT SUM(j.Prix * jc.Quantite) AS MontantTotal FROM Commandes c
INNER JOIN JeuxCommandes jc ON c.CommandeID = jc.CommandeID INNER JOIN Jeux j ON jc.JeuID = j.JeuID WHERE c.ClientID = 1;

--Sélectionner les détails d'une commande avec les jeux associés :
SELECT C.*, J.Titre, JC.Quantite FROM Commandes C JOIN JeuxCommandes JC ON C.CommandeID = JC.CommandeID 
JOIN Jeux J ON JC.JeuID = J.JeuID WHERE C.CommandeID = 1;