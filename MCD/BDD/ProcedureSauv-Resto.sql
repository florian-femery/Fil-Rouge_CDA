-- Active: 1692710332644@@127.0.0.1@3306@MagasinJeuxVideo
DELIMITER //

CREATE PROCEDURE BackupMagasinJeuxVideo()
BEGIN
    SET @backup_file = CONCAT('/home/femeryf/Bureau/Fil Rouge_CDA/MCD/BDD', NOW(), '_backup.sql');
    -- Définissez le chemin complet pour le fichier de sauvegarde avec un horodatage actuel.

    SET @query = CONCAT('mysqldump -uadmin -pAfpa1234 MagasinJeuxVideo > "', @backup_file, '"');
    -- Utilisez mysqldump pour sauvegarder la base de données.

    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END //

DELIMITER ;

CALL BackupMagasinJeuxVideo();

DELIMITER //

CREATE PROCEDURE RestoreMagasinJeuxVideo()
BEGIN
    SET @restore_file = '/home/femeryf/Bureau/Fil Rouge_CDA/MCD/BDD';
    -- Spécifiez le chemin complet vers le fichier de sauvegarde.

    SET @query = CONCAT('mysql -uadmin -pAfpa1234 MagasinJeuxVideo < "', @restore_file, '"');
    -- Utilisez mysql pour restaurer la base de données à partir du fichier de sauvegarde.

    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END //

DELIMITER ;

CALL RestoreMagasinJeuxVideo();