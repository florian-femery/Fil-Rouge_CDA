-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           10.6.12-MariaDB-0ubuntu0.22.04.1 - Ubuntu 22.04
-- SE du serveur:                debian-linux-gnu
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour EscroMania
CREATE DATABASE IF NOT EXISTS `EscroMania` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `EscroMania`;

-- Listage de la structure de table EscroMania. categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `category_order` int(11) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3AF34668727ACA70` (`parent_id`),
  CONSTRAINT `FK_3AF34668727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table EscroMania.categories : ~19 rows (environ)
INSERT INTO `categories` (`id`, `parent_id`, `name`, `category_order`, `slug`) VALUES
	(1, NULL, 'Game', 1, 'game'),
	(2, 1, 'Action', 2, 'action'),
	(3, 1, 'Aventure', 3, 'aventure'),
	(4, 1, 'Stratégie', 4, 'strategie'),
	(5, 1, 'FPS', 5, 'fps'),
	(6, 1, 'Sport', 6, 'sport'),
	(7, 1, 'Sandbox', 7, 'sandbox'),
	(8, 1, 'Plateforme', 8, 'plateforme'),
	(9, 1, 'Action Adventure', 9, 'action-adventure'),
	(10, 1, 'RPG', 10, 'rpg'),
	(11, 1, 'Battle Royal', 11, 'battle-royal'),
	(12, 1, 'Survival Horror', 12, 'survival-horror'),
	(13, 1, 'Combat', 13, 'combat'),
	(14, 1, 'Party', 14, 'party'),
	(15, NULL, 'Console', 15, 'console'),
	(16, 15, 'Sega', 16, 'sega'),
	(17, 15, 'Nintendo', 17, 'nintendo'),
	(18, 15, 'Sony', 18, 'sony'),
	(19, 15, 'Microsoft', 19, 'microsoft');

-- Listage de la structure de table EscroMania. coupons
CREATE TABLE IF NOT EXISTS `coupons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coupons_types_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `descriptioncoup` longtext NOT NULL,
  `discount` int(11) NOT NULL,
  `max_usage` int(11) NOT NULL,
  `validity` datetime NOT NULL DEFAULT current_timestamp() COMMENT '(DC2Type:datetime_immutable)',
  `is_valid` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_F564111877153098` (`code`),
  KEY `IDX_F56411183DDD47B7` (`coupons_types_id`),
  CONSTRAINT `FK_F56411183DDD47B7` FOREIGN KEY (`coupons_types_id`) REFERENCES `coupons_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table EscroMania.coupons : ~0 rows (environ)

-- Listage de la structure de table EscroMania. coupons_types
CREATE TABLE IF NOT EXISTS `coupons_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table EscroMania.coupons_types : ~0 rows (environ)

-- Listage de la structure de table EscroMania. images
CREATE TABLE IF NOT EXISTS `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E01FBE6A6C8A81A9` (`products_id`),
  CONSTRAINT `FK_E01FBE6A6C8A81A9` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table EscroMania.images : ~60 rows (environ)
INSERT INTO `images` (`id`, `products_id`, `name`) VALUES
	(1, 1, 'the-legend-of-zelda-breath-of-the-wild-cover.jpg'),
	(2, 1, 'the-legend-of-zelda-breath-of-the-wild-image.jpg'),
	(3, 1, 'the-legend-of-zelda-breath-of-the-wild-Jaquette.jpg'),
	(4, 2, 'the_witcher_3_wild_hunt_cover.jpg'),
	(5, 2, 'the-witcher-3-wild-hunt-image.jpg'),
	(6, 2, 'the-witcher-3-wild-hunt-jaquete.jpeg'),
	(7, 3, 'red-dead-redemption-2-cover.jpg'),
	(8, 3, 'red-dead-redemption-2-image.jpg'),
	(9, 3, 'red-dead-redemption-2-jaquette.jpg'),
	(10, 4, 'dark-souls-iii-cover.jpg'),
	(11, 4, 'dark-souls-iii-image.jpg'),
	(12, 4, 'dark-souls-iii-jaquette.jpg'),
	(13, 5, 'overwatch-jaquete.png'),
	(14, 5, 'overwatch-image.png'),
	(15, 5, 'overwatch-jaquete.png'),
	(16, 6, 'uncharted-4-a-thiefs-end-cover.jpg'),
	(17, 6, 'uncharted-4-a-thiefs-end-image.jpg'),
	(18, 6, 'uncharted-4-a-thiefs-end-jaquete.jpg'),
	(19, 7, 'horizon-zero-dawn-cover.jpg'),
	(20, 7, 'horizon-zero-dawn-image.jpg'),
	(21, 7, 'horizon-zero-dawn-jaquete.jpg'),
	(22, 8, 'persona-5-cover.jpg'),
	(23, 8, 'persona-5-image.png'),
	(24, 8, 'persona-5-jaquete.jpg'),
	(25, 9, 'grand-theft-auto-v-cover.jpg'),
	(26, 9, 'grand-theft-auto-v-image.png'),
	(27, 9, 'grand-theft-auto-v-jaquete.jpg'),
	(28, 10, 'god-of-war-2018-cover.jpg'),
	(29, 10, 'god-of-war-2018-image.jpg'),
	(30, 10, 'god-of-war-2018-jaquete.jpg'),
	(31, 11, 'doom-2016-cover.jpg'),
	(32, 11, 'doom-2016-image.jpg'),
	(33, 11, 'doom-2016-jaquette.jpg'),
	(34, 12, 'metal-gear-solid-v-the-phantom-pain-cover.jpg'),
	(35, 12, 'metal-gear-solid-v-the-phantom-pain-image.jpg'),
	(36, 12, 'metal-gear-solid-v-the-phantom-pain-jaquete.jpg'),
	(37, 13, 'resident-evil-7-biohazard-cover.jpg'),
	(38, 13, 'resident-evil-7-biohazard-image.jpg'),
	(39, 13, 'resident-evil-7-biohazard-jaquete.jpg'),
	(40, 14, 'monster-hunter-world-cover.jpg'),
	(41, 14, 'monster-hunter-world-image.jpg'),
	(42, 14, 'monster-hunter-world-jaquete.jpg'),
	(43, 15, 'final-fantasy-xv-cover.jpg'),
	(44, 15, 'final-fantasy-xv-image.jpg'),
	(45, 15, 'final-fantasy-xv-jaquete.jpg'),
	(46, 16, 'destiny-2-cover.jpg'),
	(47, 16, 'destiny-2-image.jpg'),
	(48, 16, 'destiny-2-jaquete.jpg'),
	(49, 17, 'assassins-creed-odyssey-cover.jpg'),
	(50, 17, 'assassins-creed-odyssey-image.jpg'),
	(51, 17, 'assassins-creed-odyssey-jaquete.jpg'),
	(52, 18, 'bloodborne-cover.jpg'),
	(53, 18, 'bloodborne-image.png'),
	(54, 18, 'bloodborne-jaquete.jpg'),
	(55, 19, 'sekiro-shadows-die-twice-cover.jpg'),
	(56, 19, 'sekiro-shadows-die-twice-image.jpg'),
	(57, 19, 'sekiro-shadows-die-twice-jaquete.jpg'),
	(58, 20, 'celeste-cover.jpg'),
	(59, 20, 'celeste-image.jpg'),
	(60, 20, 'celeste-jaquete.jpg');

-- Listage de la structure de table EscroMania. messenger_messages
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table EscroMania.messenger_messages : ~0 rows (environ)

-- Listage de la structure de table EscroMania. orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coupons_id` int(11) DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  `reference` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_E52FFDEEAEA34913` (`reference`),
  KEY `IDX_E52FFDEE6D72B15C` (`coupons_id`),
  KEY `IDX_E52FFDEE67B3B43D` (`users_id`),
  CONSTRAINT `FK_E52FFDEE67B3B43D` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_E52FFDEE6D72B15C` FOREIGN KEY (`coupons_id`) REFERENCES `coupons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table EscroMania.orders : ~0 rows (environ)

-- Listage de la structure de table EscroMania. orders_details
CREATE TABLE IF NOT EXISTS `orders_details` (
  `orders_id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`orders_id`,`products_id`),
  KEY `IDX_835379F1CFFE9AD6` (`orders_id`),
  KEY `IDX_835379F16C8A81A9` (`products_id`),
  CONSTRAINT `FK_835379F16C8A81A9` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FK_835379F1CFFE9AD6` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table EscroMania.orders_details : ~0 rows (environ)

-- Listage de la structure de table EscroMania. products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categories_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `plateforme` varchar(50) NOT NULL,
  `descriptionjeux` longtext NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT '(DC2Type:datetime_immutable)',
  `slug` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B3BA5A5AA21214B7` (`categories_id`),
  CONSTRAINT `FK_B3BA5A5AA21214B7` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table EscroMania.products : ~20 rows (environ)
INSERT INTO `products` (`id`, `categories_id`, `name`, `plateforme`, `descriptionjeux`, `price`, `stock`, `created_at`, `slug`) VALUES
	(1, 10, 'The Legend of Zelda: Breath of the Wild', 'Nintendo Switch', 'Explorez le vaste royaume d\'Hyrule et découvrez ses mystères dans ce jeu d\'action-aventure épique.', 5999, 50, '2023-11-10 12:00:00', 'the-legend-of-zelda-breath-of-the-wild'),
	(2, 10, 'The Witcher 3: Wild Hunt', 'PlayStation 4', 'Plongez dans un monde ouvert fantastique en incarnant Geralt de Riv, un chasseur de monstres.', 3999, 75, '2023-11-10 12:05:00', 'the-witcher-3-wild-hunt'),
	(3, 9, 'Red Dead Redemption 2', 'Xbox One', 'Vivez l\'épopée sauvage de l\'Ouest américain au tournant du XXe siècle en tant qu\'Arthur Morgan, hors-la-loi.', 4999, 60, '2023-11-10 12:10:00', 'red-dead-redemption-2'),
	(4, 2, 'Dark Souls III', 'PC', 'Affrontez des créatures redoutables et des boss difficiles dans ce jeu de rôle d\'action exigeant.', 2999, 40, '2023-11-10 12:15:00', 'dark-souls-iii'),
	(5, 5, 'Overwatch', 'Xbox One', 'Participez à des affrontements multijoueurs dynamiques en équipe avec un large choix de héros uniques.', 1999, 80, '2023-11-10 12:20:00', 'overwatch'),
	(6, 9, 'Uncharted 4: A Thief\'s End', 'PlayStation 4', 'Suivez Nathan Drake dans sa dernière aventure épique à la recherche de trésors perdus.', 3499, 55, '2023-11-10 12:25:00', 'uncharted-4-a-thiefs-end'),
	(7, 10, 'Horizon Zero Dawn', 'PlayStation 4', 'Explorez un monde post-apocalyptique regorgeant de créatures mécaniques dans ce jeu de rôle d\'action.', 3999, 70, '2023-11-10 12:30:00', 'horizon-zero-dawn'),
	(8, 10, 'Persona 5', 'PlayStation 4', 'Plongez dans la vie d\'un lycéen à Tokyo qui découvre ses pouvoirs surnaturels dans ce jeu de rôle japonais.', 4999, 65, '2023-11-10 12:35:00', 'persona-5'),
	(9, 9, 'Grand Theft Auto V', 'PC', 'Explorez la ville de Los Santos et ses environs dans cette aventure criminelle épique en monde ouvert.', 2999, 45, '2023-11-10 12:40:00', 'grand-theft-auto-v'),
	(10, 9, 'God of War (2018)', 'PlayStation 4', 'Incarnant Kratos, le dieu de la guerre, partez dans une quête mythique avec votre fils Atreus dans ce jeu d\'action-aventure.', 4499, 60, '2023-11-10 12:45:00', 'god-of-war-2018'),
	(11, 5, 'Doom (2016)', 'PC', 'Affrontez des hordes démoniaques dans ce jeu de tir à la première personne intense et frénétique.', 3999, 55, '2023-11-10 13:00:00', 'doom-2016'),
	(12, 9, 'Metal Gear Solid V: The Phantom Pain', 'PlayStation 4', 'Incarnez Big Boss dans ce jeu d\'infiltration captivant se déroulant dans un monde ouvert.', 4999, 65, '2023-11-10 13:05:00', 'metal-gear-solid-v-the-phantom-pain'),
	(13, 12, 'Resident Evil 7: Biohazard', 'Xbox One', 'Plongez dans l\'horreur survivaliste alors que vous explorez une demeure sinistre et affrontez des horreurs biologiques.', 2999, 70, '2023-11-10 13:10:00', 'resident-evil-7-biohazard'),
	(14, 2, 'Monster Hunter: World', 'PlayStation 4', 'Chassez des monstres épiques et forgez votre chemin vers la grandeur dans ce jeu de rôle d\'action en monde ouvert.', 4499, 60, '2023-11-10 13:15:00', 'monster-hunter-world'),
	(15, 2, 'Final Fantasy XV', 'Xbox One', 'Embarquez pour un voyage épique avec le prince Noctis et ses compagnons dans ce jeu de rôle fantastique.', 3999, 75, '2023-11-10 13:20:00', 'final-fantasy-xv'),
	(16, 5, 'Destiny 2', 'PC', 'Plongez dans un monde de science-fiction en tant que Gardien, défendant la dernière cité de la Terre contre des forces mystérieuses.', 2999, 80, '2023-11-10 13:25:00', 'destiny-2'),
	(17, 9, 'Assassin\'s Creed Odyssey', 'PlayStation 4', 'Explorez la Grèce antique et vivez une aventure épique en tant que mercenaire dans ce jeu d\'action-aventure.', 3499, 55, '2023-11-10 13:30:00', 'assassins-creed-odyssey'),
	(18, 2, 'Bloodborne', 'PlayStation 4', 'Affrontez des cauchemars et des créatures terrifiantes dans ce jeu d\'action RPG brutal.', 4499, 65, '2023-11-10 13:35:00', 'bloodborne'),
	(19, 9, 'Sekiro: Shadows Die Twice', 'PC', 'Devenez le "Loup à un bras" dans ce jeu d\'action aventure intense et exigeant.', 4999, 50, '2023-11-10 13:40:00', 'sekiro-shadows-die-twice'),
	(20, 8, 'Celeste', 'Nintendo Switch', 'Partez dans un voyage difficile et émotionnel à travers une montagne mystique dans ce jeu de plateforme.', 1999, 75, '2023-11-10 13:45:00', 'celeste');

-- Listage de la structure de table EscroMania. users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) NOT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `addresse` varchar(255) NOT NULL,
  `zipcode` varchar(5) NOT NULL,
  `city` varchar(150) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1483A5E9E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table EscroMania.users : ~6 rows (environ)
INSERT INTO `users` (`id`, `email`, `roles`, `password`, `lastname`, `firstname`, `addresse`, `zipcode`, `city`, `created_at`) VALUES
	(1, 'florianfemery1@gmail.com', '["ROLE_ADMIN"]', '$2y$13$.8chS0l0NsUYwd3QU7N9OOOixo6a4ulG0m8V7jlNZK.HTTVcMLb6.', 'ADMIN', 'Afpa', '69 rue du Finister', '80080', 'Amiens', '2023-11-09 15:24:55'),
	(2, 'iferreira@regnier.com', '["ROLE_user"]', '$2y$13$Lh908Rt0mWKIyk6RIcPiVeBchtmdZKTMVdrVu5kmDKgd7xVls0qRO', 'Ferrand', 'Michèle', '772, place Roux', '59320', 'Lesage', '2023-11-09 15:24:55'),
	(3, 'duhamel.audrey@perrin.fr', '["ROLE_user"]', '$2y$13$VYostUbKPhGNw2cin2rvne5HWtt1a2vYqC9m..73JpG8QxHM52VxG', 'Guichard', 'David', '35, chemin Guillot', '23907', 'Lemaitre-sur-Mer', '2023-11-09 15:24:56'),
	(4, 'luc15@free.fr', '["ROLE_user"]', '$2y$13$hJRj0ZuTCQ0cDNFoTEHrsuHsAcjJTG34ATbYWnaazS.AEh/DsC5IG', 'Caron', 'Émile', '6, place Thibault', '22577', 'Gomes', '2023-11-09 15:24:56'),
	(5, 'carpentier.oceane@fischer.fr', '["ROLE_user"]', '$2y$13$X53NZmtKi1PSRTsQRs/TiOHSIMK1v7p58wdV/dTfnbmvYr2oebApi', 'Brun', 'Adélaïde', '6, place Lefort', '66969', 'Richard-sur-Barre', '2023-11-09 15:24:57'),
	(6, 'rodriguez.lucy@gmail.com', '["ROLE_user"]', '$2y$13$3qhVmY4O5.ZSb.OZhpx13eTJdg50ImxrC1pceig/iSwAD44yzW5lm', 'Bonnin', 'Paul', 'chemin Chretien', '25661', 'Tessier', '2023-11-09 15:24:57');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
