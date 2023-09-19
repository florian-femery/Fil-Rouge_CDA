-- Active: 1692710332644@@127.0.0.1@3306@Escromania
DROP DATABASE `Escromania`;
CREATE DATABASE `Escromania`;
USE `Escromania`;

CREATE TABLE Client(
   id_cli INT AUTO_INCREMENT,
   nom_cli VARCHAR(50) ,
   prenom_cli VARCHAR(50) ,
   addr_cli VARCHAR(50) ,
   mail_cli VARCHAR(50) ,
   telephone_cli VARCHAR(10) ,
   PRIMARY KEY(id_cli)
);

CREATE TABLE Idéntiffication(
   id_compte INT AUTO_INCREMENT,
   mail_compte VARCHAR(50) ,
   mdp_compte VARCHAR(50) ,
   id_cli INT,
   PRIMARY KEY(id_compte),
   FOREIGN KEY(id_cli) REFERENCES Client(id_cli)
);

CREATE TABLE Article(
   id_article INT AUTO_INCREMENT,
   nom_article VARCHAR(50) ,
   description_article VARCHAR(200) ,
   total_article DECIMAL(10,2)  ,
   totalttc_article DECIMAL(15,2)  ,
   tva_article DECIMAL(8,2)  ,
   id_article_1 INT,
   PRIMARY KEY(id_article),
   FOREIGN KEY(id_article_1) REFERENCES Article(id_article)
);

CREATE TABLE Livraisson(
   id_cli INT,
   id_article INT,
   adresse_livraison VARCHAR(50) ,
   adresse_facturation VARCHAR(50) ,
   PRIMARY KEY(id_cli, id_article),
   FOREIGN KEY(id_cli) REFERENCES Client(id_cli),
   FOREIGN KEY(id_article) REFERENCES Article(id_article)
);

CREATE TABLE Stock(
   id_article INT,
   id_article_1 INT,
   quantite_article DECIMAL(10,2)  ,
   PRIMARY KEY(id_article, id_article_1),
   FOREIGN KEY(id_article) REFERENCES Article(id_article),
   FOREIGN KEY(id_article_1) REFERENCES Article(id_article)
);

CREATE TABLE Payement(
   id_cli INT,
   id_article INT,
   num_carte VARCHAR(16) ,
   dateexpi_carte DATE,
   cryptogram_carte VARCHAR(3) ,
   PRIMARY KEY(id_cli, id_article),
   FOREIGN KEY(id_cli) REFERENCES Client(id_cli),
   FOREIGN KEY(id_article) REFERENCES Article(id_article)
);
