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
  `category_order` int(11) NOT NULL,
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

-- Listage de la structure de table EscroMania. doctrine_migration_versions
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Listage des données de la table EscroMania.doctrine_migration_versions : ~1 rows (environ)
INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
	('DoctrineMigrations\\Version20231115103516', '2023-11-15 11:35:21', 37);

-- Listage de la structure de table EscroMania. images
CREATE TABLE IF NOT EXISTS `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E01FBE6A6C8A81A9` (`products_id`),
  CONSTRAINT `FK_E01FBE6A6C8A81A9` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table EscroMania.images : ~150 rows (environ)
INSERT INTO `images` (`id`, `products_id`, `name`) VALUES
	(1, 1, '6874365a8dea67ed79e0aede93cbd5e1.webp'),
	(2, 1, 'e555137afbc6ec838c72f5c8843bc055.webp'),
	(3, 1, '6d2cc0ee44ed2943cba10d13fa4c1ac3.webp'),
	(4, 2, 'cd968a2fac87baa6eed87f6f13ec5e9a.webp'),
	(5, 2, 'b7f7206a67c8b5d09627c9f4db52ce5d.webp'),
	(6, 2, '362abac78b81a012475ec71225651080.webp'),
	(7, 3, '014a0e3ed49db60ae77479c6c993ab7b.webp'),
	(8, 3, '761fe34b587c677ec790d2b3c0e79279.webp'),
	(9, 3, 'e13debf1be66d5d785e5e6f703e7cfb4.webp'),
	(10, 4, '0947060698eaa5f2378a5b4a64a2a183.webp'),
	(11, 4, 'edc8497eb177f5c4144fff552fb3dcfe.webp'),
	(12, 4, 'c46822dac7426e8e989188e461feea41.webp'),
	(13, 5, 'b1410d9773dda2cc82c26e9c066afca1.webp'),
	(14, 5, 'c8b1c93e3b5aa62624cc0c19eef2dd00.webp'),
	(15, 5, '3a30b0cfc72f67218479b1de259a03c3.webp'),
	(16, 6, '9209ef99f758eaa4064d1c6c79fb566f.webp'),
	(17, 6, '67ccc3eb819de2f900fd7c66f56f66ec.webp'),
	(18, 6, '1591cc9adf6d9a5360038c053ffd4d75.webp'),
	(19, 7, '92f77dd8794248d3b3f9f39ce2355382.webp'),
	(20, 7, 'cb59c3d85252fa6c6572e0956cdc475c.webp'),
	(21, 7, '6a05f53fdac0d1e2de78dca7fc8440c2.webp'),
	(22, 8, 'cf0783591c0d6f8e7e2b08fd46038b25.webp'),
	(23, 8, 'e75918460ca192eabe8e2b742d940b76.webp'),
	(24, 8, '1aa7dc44630900474a2a45ff7412c111.webp'),
	(25, 9, '0faabe5719255a5612417334defd1aff.webp'),
	(26, 9, 'bd0ce2b88c39e3ef9ee8c783ed96e8dd.webp'),
	(27, 9, '92af927e85ef327a42af04d20ae3e625.webp'),
	(28, 10, 'ded2f4fcb6813a2c7c1821b48f8d1153.webp'),
	(29, 10, 'ce52555cd7b5be88dea38127db1dcb25.webp'),
	(30, 10, 'f5b8c55d4d0337d97e3984d3ba605bd5.webp'),
	(31, 11, '0924431913e335fa89b52029a07a7474.webp'),
	(32, 11, '5871d23c1dc7dbf9afc1befb8aca670f.webp'),
	(33, 11, '33acdf4fa989e1b88d8678216b446e66.webp'),
	(34, 12, 'f031efd568fdb4bdc58c03935f77b3f2.webp'),
	(35, 12, 'a2676218ef8f3a0fe057bdb1edc90a78.webp'),
	(36, 12, '0b5eeb0eef1a97cb30645e8224aafd7d.webp'),
	(37, 13, '5853be33ce1df81573958fa6c8281d96.webp'),
	(38, 13, '23ed306d5cc5549ad0920d0d8eabcbd8.webp'),
	(39, 13, 'bc974a15a851d99d3c1938f114c6a10e.webp'),
	(40, 14, 'bd4c46b9d18b6585733d1f345fe2221f.webp'),
	(41, 14, '367b4f8f057b265c064b2ff4b8acd278.webp'),
	(42, 14, 'a45d11637666c24fd1b090be5875e27b.webp'),
	(43, 15, '4506eb9b33a331606d582bf82e1501d5.webp'),
	(44, 15, 'fd0c8ee9c45cdf6d11da2c3e6c3ad12b.webp'),
	(45, 15, '98b8680766065059f43311161457e615.webp'),
	(46, 16, 'be2efafcaaa739937c53372f88752586.webp'),
	(47, 16, '31ac6d29c77645e5ae6b3c40e5c0a9f8.webp'),
	(48, 16, '755c7cefe13b2b894c631710425613dd.webp'),
	(49, 17, 'f33d8f8b61d32d099630faaa71812054.webp'),
	(50, 17, '9d318bb740a08fc32c2aedd2a1663b90.webp'),
	(51, 17, '4a7e08cf2f3ef3aee0216197132b89ed.webp'),
	(52, 18, '743857ee4298d92086d0980c56ac11de.webp'),
	(53, 18, '706096ae5814e3cc63c314b9b35a4a32.webp'),
	(54, 18, 'aeaed6b22550f8f856846ed1aac9c472.webp'),
	(55, 19, '413cff9f2fdd4054c292e9311a906df6.webp'),
	(56, 19, 'b49b87705807d67aa9b22a0ca29c4a56.webp'),
	(57, 19, '34aa2e1cc79fb3c742e263b423d90df1.webp'),
	(58, 20, '9d9c3a4210ec85b99ea6b0873545011c.webp'),
	(59, 20, '2b6757ca7ff3542fce7c9ce3177e8e78.webp'),
	(60, 20, '4654a2e1078495b1805df05bd7ebb8ae.webp'),
	(61, 21, 'fdbfcf56c369b4458d42a28b90077a7f.webp'),
	(62, 21, '2506bf10723ccb64d361ff0739c75691.webp'),
	(63, 21, '94803eea3cad98a03c5b80a8e98db3fd.webp'),
	(64, 22, 'bffdd015910cbe84fb632378d8cf32be.webp'),
	(65, 22, 'b872ec08ee2d78a0b3d18b6ce9d4f983.webp'),
	(66, 22, '2e6678bf8f2eb7dc2d21730cf2d7b4f4.webp'),
	(67, 23, '8b5263d3bb5ff1f5625f5585aa869443.webp'),
	(68, 23, 'dd860eabd370653dcdcc497f405db50f.webp'),
	(69, 23, 'a53c1a4bacfdecf8b5783e79ce033eb5.webp'),
	(70, 24, '553640198740d0eed29248e5e7ba2fe4.webp'),
	(71, 24, 'c9dd5d89d2199b106f2f0996dbc7fce4.webp'),
	(72, 24, '5d77f2e95c0815385c0cd233a5dc7f78.webp'),
	(73, 25, '2e6bb1f303e3bc5185f87ee82c7ebf75.webp'),
	(74, 25, '783eafa015c6dfa6e7744b9c021a913e.webp'),
	(75, 25, '255d8a08a720caf52f80f8792d03b1bb.webp'),
	(76, 26, '828b1c87ec15c3ecb7af1e0520ec4622.webp'),
	(77, 26, '82c37ee15d411391b2a68e17c80f7c80.webp'),
	(78, 26, '9a2e62b996958b6caa1e246b3c209e48.webp'),
	(79, 27, '62267895495a35e4df2fb661346a018e.webp'),
	(80, 27, '528356d9cbd6f7faf03063cf9577d87a.webp'),
	(81, 27, '56f48b88576f19d20a2217353b1a1880.webp'),
	(82, 28, '1ef60a62b79293e610fc76397cd3de89.webp'),
	(83, 28, 'f4b891b6f7d62462a4df85c8f057723e.webp'),
	(84, 28, 'cda07cecfa64c6ad85e957230ddc35d1.webp'),
	(85, 29, '5e6ad3c245a5b1e555fdef9631078cff.webp'),
	(86, 29, 'c412de3eba75bbe8d9d37de0f85adeae.webp'),
	(87, 29, '54b3820d56b9cfee157ea7013725cf80.webp'),
	(88, 30, 'fa6255e2d6c075c1b2afa3c766eb1fbe.webp'),
	(89, 30, '56e8ad25b4e56933c5c454cb39e887cf.webp'),
	(90, 30, '49a88d34667084b874d190c5720a68b7.webp'),
	(91, 31, 'f97ce4595784f8c1e7ea30d73b412a41.webp'),
	(92, 31, '256d96c4e4a75430c28b5757f02500f9.webp'),
	(93, 31, 'd3e3ec8a9bf15d2c7400d66a76bde83e.webp'),
	(94, 32, '8c7eb2a5994cf73d6044b474efc1542f.webp'),
	(95, 32, 'af65b0273541a401e1cd30eebe235f57.webp'),
	(96, 32, 'ae8ac667e305e017548ed3ded5d05a20.webp'),
	(97, 33, '51be1877699cd20eeffea07affec604a.webp'),
	(98, 33, '508fcb0b6efad0f993f4a3419caf8907.webp'),
	(99, 33, '31d78d5cbbe75f49ea6c218344936924.webp'),
	(100, 34, '7a3ea2b2913179ee9de3d454b4144e18.webp'),
	(101, 34, '9693e299d962441c5c582af7d5de02e5.webp'),
	(102, 34, '8756a2edd4f3c41c062c50c33dca855c.webp'),
	(103, 35, '06f08bba036570371b0fc3cefa5b96b3.webp'),
	(104, 35, '2da7c577448b0c7920fc41a9560db8b2.webp'),
	(105, 35, 'aef73f4a805b2e5a2bb480600cc918d9.webp'),
	(106, 36, '50028fad860493dbfdb8cae9db6c5927.webp'),
	(107, 36, '34fc747e7158a62e97008f7e57cf2567.webp'),
	(108, 36, 'd4690618d05c15073dfc76de5de62c3d.webp'),
	(109, 37, '83ae66d7f5ed5a0579b26a670b19e3c4.webp'),
	(110, 37, '03d9f8d6274424efa51a1f45e2139a53.webp'),
	(111, 37, 'c631ff0e7b1416f94b7c413920068b8f.webp'),
	(112, 38, '2a053d8183e16b88e036b14f6f0cd363.webp'),
	(113, 38, 'aa9485ebf8596aaa5f24f9e983dccb89.webp'),
	(114, 38, '3729c84d380ecae8eb1f8fbd4edeb045.webp'),
	(115, 39, 'b9f21ec0aa23281e44fd517c96199859.webp'),
	(116, 39, '8f881d3557adc0a6dc3accf237dc0499.webp'),
	(117, 39, '5eec02bfa31b0f7d229b6ae795f9db30.webp'),
	(118, 40, '57467df79c033228009dae2a19de453b.webp'),
	(119, 40, '2dc050251910649765bda28ca19f551b.webp'),
	(120, 40, 'd442a7f0ab9e665f7a6a5d7886e2323e.webp'),
	(121, 41, '7640277bf3ebc48ef054d73f2d4c1c02.webp'),
	(122, 41, 'e8ebdc6492e7c9f2d9f1f668d5d5f69e.webp'),
	(123, 41, '5dcdd897c2a2a2ef862aaefe679726d5.webp'),
	(124, 42, 'af1279817b99bd269f110ecd67121fae.webp'),
	(125, 42, '9325625237c3eeaa7e67dbfd20eff503.webp'),
	(126, 42, '97fe55521adfcb99d0c5acab5124c6e0.webp'),
	(127, 43, 'c067764a350dd96af05b4d9f6ef02f17.webp'),
	(128, 43, '3d074ade2d013acbf39f8c798f942095.webp'),
	(129, 43, '00e6d0527c3ab632695268ae262f5da2.webp'),
	(130, 44, '04e1b86b80cd1cdeda442aa15d44bfa7.webp'),
	(131, 44, '1d38a4f86cb7025a6728c23232250c35.webp'),
	(132, 44, '98b9dca3aba8ca8ab1ba8057fe35886f.webp'),
	(133, 45, 'b0a58883e3f5f256798faa9d07d76b60.webp'),
	(134, 45, 'ade0f53658f7c60b3b570b44be4a5dc5.webp'),
	(135, 45, 'f55600f85e6b0e4a5aca3f9d978d92da.webp'),
	(136, 46, 'd6d92e4cb0ade8eef17b5b3d37ab5ad6.webp'),
	(137, 46, '33fc1949df6182bba6338aa27f5c6b04.webp'),
	(138, 46, 'd696c2dc9038b2ae2da6716188fb17b7.webp'),
	(139, 47, '3ec07674558c8c9e2c0f18193f720e63.webp'),
	(140, 47, 'e242693044334b10f9d7b48a4d4bd32b.webp'),
	(141, 47, 'ff8ee22bcc98bceca35f503e602a1380.webp'),
	(142, 48, '916212fa9fe6f5d2eac646c109039d2f.webp'),
	(143, 48, '2e74fe69b967b9aa9a20d5ccd94bc5fd.webp'),
	(144, 48, 'f728c65ae8514499c2b602db47a3f8ee.webp'),
	(145, 49, 'ba2935d081155f0c7e3748e1bc39e807.webp'),
	(146, 49, '2a6e5009ffa786a93408448688c9111c.webp'),
	(147, 49, 'e421a45ad9397ad3ff6788fd8b334500.webp'),
	(148, 50, '2ab9c4566a574b30725c05c70484bfb4.webp'),
	(149, 50, 'bbc1874307eeeec7152e52bba854739f.webp'),
	(150, 50, '4cc6fe497fbca0f7aa8524698bf718da.webp');

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
) ENGINE=InnoDB AUTO_INCREMENT=305 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table EscroMania.products : ~50 rows (environ)
INSERT INTO `products` (`id`, `categories_id`, `name`, `plateforme`, `descriptionjeux`, `price`, `stock`, `created_at`, `slug`) VALUES
	(1, 10, 'The Legend of Zelda: Breath of the Wild', 'Nintendo Switch', 'Explorez le vaste royaume d\'Hyrule et découvrez ses mystères dans ce jeu d\'action-aventure épique.', 5900, 50, '2023-11-10 12:00:00', 'The-Legend-of-Zelda-Breath-of-the-Wild'),
	(2, 10, 'The Witcher 3: Wild Hunt', 'PlayStation 4', 'Plongez dans un monde ouvert fantastique en incarnant Geralt de Riv, un chasseur de monstres.', 3900, 75, '2023-11-10 12:05:00', 'The-Witcher-3-Wild-Hunt'),
	(3, 9, 'Red Dead Redemption 2', 'Xbox One', 'Vivez l\'épopée sauvage de l\'Ouest américain au tournant du XXe siècle en tant qu\'Arthur Morgan, hors-la-loi.', 4900, 60, '2023-11-10 12:10:00', 'Red-Dead-Redemption-2'),
	(4, 2, 'Dark Souls III', 'PC', 'Affrontez des créatures redoutables et des boss difficiles dans ce jeu de rôle d\'action exigeant.', 2900, 40, '2023-11-10 12:15:00', 'Dark-Souls-III'),
	(5, 5, 'Overwatch', 'Xbox One', 'Participez à des affrontements multijoueurs dynamiques en équipe avec un large choix de héros uniques.', 1900, 80, '2023-11-10 12:20:00', 'Overwatch'),
	(6, 9, 'Uncharted 4: A Thief\'s End', 'PlayStation 4', 'Suivez Nathan Drake dans sa dernière aventure épique à la recherche de trésors perdus.', 3400, 55, '2023-11-10 12:25:00', 'Uncharted-4-A-Thief-s-End'),
	(7, 10, 'Horizon Zero Dawn', 'PlayStation 4', 'Explorez un monde post-apocalyptique regorgeant de créatures mécaniques dans ce jeu de rôle d\'action.', 3900, 70, '2023-11-10 12:30:00', 'Horizon-Zero-Dawn'),
	(8, 10, 'Persona 5', 'PlayStation 4', 'Plongez dans la vie d\'un lycéen à Tokyo qui découvre ses pouvoirs surnaturels dans ce jeu de rôle japonais.', 4900, 65, '2023-11-10 12:35:00', 'Persona-5'),
	(9, 9, 'Grand Theft Auto V', 'PC', 'Explorez la ville de Los Santos et ses environs dans cette aventure criminelle épique en monde ouvert.', 2900, 45, '2023-11-10 12:40:00', 'Grand-Theft-Auto-V'),
	(10, 9, 'God of War (2018)', 'PlayStation 4', 'Incarnant Kratos, le dieu de la guerre, partez dans une quête mythique avec votre fils Atreus dans ce jeu d\'action-aventure.', 4400, 60, '2023-11-10 12:45:00', 'God-of-War-2018'),
	(11, 5, 'Doom (2016)', 'PC', 'Affrontez des hordes démoniaques dans ce jeu de tir à la première personne intense et frénétique.', 3900, 55, '2023-11-10 13:00:00', 'Doom-2016'),
	(12, 9, 'Metal Gear Solid V: The Phantom Pain', 'PlayStation 4', 'Incarnez Big Boss dans ce jeu d\'infiltration captivant se déroulant dans un monde ouvert.', 4900, 65, '2023-11-10 13:05:00', 'Metal-Gear-Solid-V-The-Phantom-Pain'),
	(13, 12, 'Resident Evil 7: Biohazard', 'Xbox One', 'Plongez dans l\'horreur survivaliste alors que vous explorez une demeure sinistre et affrontez des horreurs biologiques.', 2900, 70, '2023-11-10 13:10:00', 'Resident-Evil-7-Biohazard'),
	(14, 2, 'Monster Hunter: World', 'PlayStation 4', 'Chassez des monstres épiques et forgez votre chemin vers la grandeur dans ce jeu de rôle d\'action en monde ouvert.', 4400, 60, '2023-11-10 13:15:00', 'Monster-Hunter-World'),
	(15, 2, 'Final Fantasy XV', 'Xbox One', 'Embarquez pour un voyage épique avec le prince Noctis et ses compagnons dans ce jeu de rôle fantastique.', 3900, 75, '2023-11-10 13:20:00', 'Final-Fantasy-XV'),
	(16, 5, 'Destiny 2', 'PC', 'Plongez dans un monde de science-fiction en tant que Gardien, défendant la dernière cité de la Terre contre des forces mystérieuses.', 2900, 80, '2023-11-10 13:25:00', 'Destiny-2'),
	(17, 9, 'Assassin\'s Creed Odyssey', 'PlayStation 4', 'Explorez la Grèce antique et vivez une aventure épique en tant que mercenaire dans ce jeu d\'action-aventure.', 3400, 55, '2023-11-10 13:30:00', 'Assassin-s-Creed-Odyssey'),
	(18, 2, 'Bloodborne', 'PlayStation 4', 'Affrontez des cauchemars et des créatures terrifiantes dans ce jeu d\'action RPG brutal.', 4400, 65, '2023-11-10 13:35:00', 'Bloodborne'),
	(19, 9, 'Sekiro: Shadows Die Twice', 'PC', 'Devenez le "Loup à un bras" dans ce jeu d\'action aventure intense et exigeant.', 4900, 50, '2023-11-10 13:40:00', 'Sekiro-Shadows-Die-Twice'),
	(20, 8, 'Celeste', 'Nintendo Switch', 'Partez dans un voyage difficile et émotionnel à travers une montagne mystique dans ce jeu de plateforme.', 1900, 75, '2023-11-10 13:45:00', 'Celeste'),
	(21, 8, 'Cuphead', 'PC', 'Plongez dans un monde animé des années 1930 avec Cuphead et Mugman dans ce jeu de plateforme difficile.', 0, 60, '2023-11-10 14:00:00', 'Cuphead'),
	(22, 8, 'Hollow Knight', 'Nintendo Switch', 'Explorez les mystères du Royaume des Insectes dans ce jeu d\'action-aventure atmosphérique.', 0, 70, '2023-11-10 14:05:00', 'Hollow-Knight'),
	(23, 7, 'Stardew Valley', 'PC', 'Échappez à la vie citadine et gérez votre propre ferme dans cette simulation de vie rurale relaxante.', 0, 80, '2023-11-10 14:10:00', 'Stardew-Valley'),
	(24, 2, 'NieR: Automata', 'PlayStation 4', 'Explorez un monde dystopique en incarnant des androïdes dans ce jeu d\'action RPG captivant.', 0, 65, '2023-11-10 14:15:00', 'NieR-Automata'),
	(25, 10, 'Fallout 4', 'Xbox One', 'Survivez dans un monde post-apocalyptique et façonnez votre destin dans ce RPG en monde ouvert.', 0, 55, '2023-11-10 14:20:00', 'Fallout-4'),
	(26, 5, 'Far Cry 5', 'PlayStation 4', 'Affrontez une secte fanatique dans le Montana américain dans ce jeu de tir à la première personne.', 0, 50, '2023-11-10 14:25:00', 'Far-Cry-5'),
	(27, 5, 'Borderlands 3', 'PC', 'Partez pour une aventure délirante et chaotique dans ce jeu de tir à la première personne en coopération.', 0, 60, '2023-11-10 14:30:00', 'Borderlands-3'),
	(28, 10, 'The Outer Worlds', 'Xbox One', 'Explorez des mondes extraterrestres et prenez des décisions qui influent sur le destin de la colonie.', 0, 75, '2023-11-10 14:35:00', 'The-Outer-Worlds'),
	(29, 9, 'Control', 'PlayStation 4', 'Découvrez les mystères d\'un bâtiment surnaturel en tant que Jesse Faden dans ce jeu d\'action surnaturel.', 0, 65, '2023-11-10 14:40:00', 'Control'),
	(30, 9, 'The Last of Us Part II', 'PlayStation 4', 'Vivez une histoire intense et émotionnelle dans un monde post-apocalyptique infesté de dangers.', 0, 55, '2023-11-10 14:45:00', 'The-Last-of-Us-Part-II'),
	(31, 9, 'Ghost of Tsushima', 'PlayStation 4', 'Incarnez le samouraï Jin Sakai et défendez l\'île de Tsushima contre une invasion mongole.', 0, 60, '2023-11-10 15:00:00', 'Ghost-of-Tsushima'),
	(32, 9, 'Jedi: Fallen Order', 'Xbox One', 'Vivez une aventure Star Wars en tant que Jedi survivant, Cal Kestis, dans ce jeu d\'action-aventure.', 0, 75, '2023-11-10 15:05:00', 'Jedi-Fallen-Order'),
	(33, 2, 'Dying Light', 'PC', 'Survivez dans une ville infestée de zombies avec des parcours de parkour et des combats intenses.', 0, 70, '2023-11-10 15:10:00', 'Dying-Light'),
	(34, 2, 'Kingdom Hearts III', 'PlayStation 4', 'Rejoignez Sora, Donald et Dingo dans une aventure épique pour sauver les mondes de Disney et de Final Fantasy.', 0, 55, '2023-11-10 15:15:00', 'Kingdom-Hearts-III'),
	(35, 5, 'Wolfenstein II: The New Colossus', 'PC', 'Luttez contre les forces nazies dans une version alternative des années 1960 dans ce jeu de tir à la première personne.', 0, 60, '2023-11-10 15:20:00', 'Wolfenstein-II-The-New-Colossus'),
	(36, 5, 'Bioshock Infinite', 'Xbox One', 'Explorez la ville flottante de Columbia et découvrez une histoire complexe dans ce jeu de tir à la première personne.', 0, 80, '2023-11-10 15:25:00', 'Bioshock-Infinite'),
	(37, 8, 'Tomb Raider (2013)', 'PlayStation 4', 'Suivez les débuts de l\'aventurière Lara Croft alors qu\'elle lutte pour survivre sur une île mystérieuse.', 0, 65, '2023-11-10 15:30:00', 'Tomb-Raider-2013'),
	(38, 9, 'Batman: Arkham Knight', 'PC', 'Incarnez Batman et affrontez ses ennemis emblématiques dans la conclusion de la trilogie Arkham.', 0, 50, '2023-11-10 15:35:00', 'Batman-Arkham-Knight'),
	(39, 13, 'Star Wars: Battlefront II', 'Xbox One', 'Participez à des batailles épiques dans l\'univers de Star Wars en tant que soldat, héros ou vilain.', 0, 65, '2023-11-10 15:40:00', 'Star-Wars-Battlefront-II'),
	(40, 6, 'Forza Horizon 4', 'Xbox One', 'Plongez dans une expérience de course en monde ouvert avec une variété de voitures et de conditions météorologiques.', 0, 55, '2023-11-10 15:45:00', 'Forza-Horizon-4'),
	(41, 9, 'Gears 5', 'Xbox One', 'Rejoignez Kait Diaz dans une nouvelle aventure intense de tir à la troisième personne dans l\'univers de Gears of War.', 0, 60, '2023-11-10 16:00:00', 'Gears-5'),
	(42, 7, 'Minecraft', 'PC', 'Explorez et construisez dans un monde ouvert pixelisé, en solo ou avec des amis, dans ce jeu bac à sable emblématique.', 0, 75, '2023-11-10 16:05:00', 'Minecraft'),
	(43, 4, 'Rainbow Six Siege', 'PlayStation 4', 'Participez à des combats tactiques en équipe dans ce jeu de tir à la première personne centré sur le multijoueur.', 0, 70, '2023-11-10 16:10:00', 'Rainbow-Six-Siege'),
	(44, 2, 'Nioh', 'PlayStation 4', 'Affrontez des démons et des guerriers samouraïs dans ce jeu d\'action RPG intense et exigeant.', 0, 55, '2023-11-10 16:15:00', 'Nioh'),
	(45, 2, 'Diablo III', 'PC', 'Explorez les terres de Sanctuary et combattez les forces du mal dans ce jeu de rôle d\'action emblématique.', 0, 60, '2023-11-10 16:20:00', 'Diablo-III'),
	(46, 2, 'The Division 2', 'Xbox One', 'Plongez dans un monde post-pandémique en tant qu\'agent de la Division et restaurez l\'ordre à Washington D.C.', 0, 80, '2023-11-10 16:25:00', 'The-Division-2'),
	(47, 9, 'Watch Dogs 2', 'PlayStation 4', 'Incarnez Marcus Holloway, un jeune hacker, et rejoignez DedSec pour lutter contre la surveillance de masse à San Francisco.', 0, 65, '2023-11-10 16:30:00', 'Watch-Dogs-2'),
	(48, 5, 'Metro Exodus', 'PC', 'Survivez dans un monde post-apocalyptique russe infesté de créatures mutantes dans ce jeu de tir à la première personne.', 0, 50, '2023-11-10 16:35:00', 'Metro-Exodus'),
	(49, 9, 'Final Fantasy VII Remake', 'PlayStation 4', 'Revivez l\'épopée de Cloud Strife et ses amis dans cette réinterprétation du classique RPG japonais.', 0, 65, '2023-11-10 16:40:00', 'Final-Fantasy-VII-Remake'),
	(50, 9, 'Devil May Cry 5', 'Xbox One', 'Incarnez Nero, Dante et V dans cette aventure d\'action stylisée et combattez les démons pour sauver le monde.', 0, 55, '2023-11-10 16:45:00', 'Devil-May-Cry-5');

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
	(2, 'iferreira@regnier.com', '["ROLE_PRODUCT_ADMIN"]', '$2y$13$Lh908Rt0mWKIyk6RIcPiVeBchtmdZKTMVdrVu5kmDKgd7xVls0qRO', 'Ferrand', 'Michèle', '772, place Roux', '59320', 'Lesage', '2023-11-09 15:24:55'),
	(3, 'duhamel.audrey@perrin.fr', '["ROLE_user"]', '$2y$13$VYostUbKPhGNw2cin2rvne5HWtt1a2vYqC9m..73JpG8QxHM52VxG', 'Guichard', 'David', '35, chemin Guillot', '23907', 'Lemaitre-sur-Mer', '2023-11-09 15:24:56'),
	(4, 'luc15@free.fr', '["ROLE_user"]', '$2y$13$hJRj0ZuTCQ0cDNFoTEHrsuHsAcjJTG34ATbYWnaazS.AEh/DsC5IG', 'Caron', 'Émile', '6, place Thibault', '22577', 'Gomes', '2023-11-09 15:24:56'),
	(5, 'carpentier.oceane@fischer.fr', '["ROLE_user"]', '$2y$13$X53NZmtKi1PSRTsQRs/TiOHSIMK1v7p58wdV/dTfnbmvYr2oebApi', 'Brun', 'Adélaïde', '6, place Lefort', '66969', 'Richard-sur-Barre', '2023-11-09 15:24:57'),
	(6, 'rodriguez.lucy@gmail.com', '["ROLE_user"]', '$2y$13$3qhVmY4O5.ZSb.OZhpx13eTJdg50ImxrC1pceig/iSwAD44yzW5lm', 'Bonnin', 'Paul', 'chemin Chretien', '25661', 'Tessier', '2023-11-09 15:24:57');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
