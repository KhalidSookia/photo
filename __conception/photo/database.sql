DROP DATABASE IF EXISTS photo;
CREATE DATABASE photo;
USE photo;

DROP TABLE IF EXISTS photo_achat;
CREATE TABLE photo_achat
(
	id_achat 			INT NOT NULL AUTO_INCREMENT,
	id_user  			INT NOT NULL?
	created_at 			DATETIME NOT NULL,
	nb_telecharger 		NUMERIC(11,0) NOT NULL,
	PRIMARY KEY(id_achat)
);

DROP TABLE IF EXISTS album;
CREATE TABLE album
(
	id 			INT NOT NULL AUTO_INCREMENT,
	id_cat 		INT NOT NULL,
	prix		DECIMAL,
	nb_vue
)
