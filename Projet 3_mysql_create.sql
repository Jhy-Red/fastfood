CREATE TABLE `restaurant` (
	`id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`code_postal` INT NOT NULL UNIQUE,
	`Nb_places` INT NOT NULL,
	`serv_rapide` BOOLEAN NOT NULL,
	`children` BOOLEAN NOT NULL,
	`handicap` BOOLEAN NOT NULL,
	`parking` BOOLEAN NOT NULL,
	`nom_directeur` varchar(50) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `employee` (
	`id_employee` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`nom` varchar(255) NOT NULL,
	`prenom` varchar(255) NOT NULL,
	`date_entre` DATETIME NOT NULL,
	`adresse_postale` varchar(255) NOT NULL,
	`note` FLOAT,
	PRIMARY KEY (`id_employee`)
);

CREATE TABLE `item` (
	`id_item` INT NOT NULL AUTO_INCREMENT,
	`id_carte` INT NOT NULL,
	`type_item` varchar(255) NOT NULL,
	`nom_items` varchar(50) NOT NULL,
	`prix_vente` FLOAT NOT NULL,
	PRIMARY KEY (`id_item`)
);

CREATE TABLE `ingredient` (
	`id_ingredient` INT NOT NULL AUTO_INCREMENT,
	`prix_achat` FLOAT NOT NULL,
	`nom_ingredient` varchar(50) NOT NULL,
	PRIMARY KEY (`id_ingredient`)
);

CREATE TABLE `pays` (
	`id_pays` varchar(2) NOT NULL,
	`id_restaurant` INT NOT NULL,
	`id_carte` INT NOT NULL,
	`pays` varchar(50) NOT NULL,
	PRIMARY KEY (`id_pays`)
);

CREATE TABLE `commande` (
	`id_item` INT NOT NULL,
	`id_restaurant` INT NOT NULL,
	`id_facture` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`heure` DATETIME NOT NULL,
	`moyen_payement` varchar(10) NOT NULL,
	`total` FLOAT NOT NULL,
	PRIMARY KEY (`id_facture`)
);

CREATE TABLE `stock` (
	`id_ingredient` INT NOT NULL,
	`id_restaurant` INT NOT NULL,
	`stock` FLOAT NOT NULL
);

CREATE TABLE `poste` (
	`id_restaurant` INT NOT NULL,
	`id_employee` INT NOT NULL,
	`nom_poste` varchar(200) NOT NULL,
	`experience` BOOLEAN NOT NULL
);

CREATE TABLE `caisse` (
	`id_facture` INT NOT NULL,
	`id_employee` INT NOT NULL,
	`vendeur` BOOLEAN NOT NULL
);

CREATE TABLE `payement` (
	`id_employee` INT NOT NULL,
	`date` DATE NOT NULL,
	`salaire` FLOAT NOT NULL
);

CREATE TABLE `fomule` (
	`Types` varchar(255) NOT NULL,
	`id_item` INT NOT NULL,
	`id_ingredient` INT NOT NULL
);

ALTER TABLE `item` ADD CONSTRAINT `item_fk0` FOREIGN KEY (`id_carte`) REFERENCES `carte`(`id_carte`);

ALTER TABLE `pays` ADD CONSTRAINT `pays_fk0` FOREIGN KEY (`id_restaurant`) REFERENCES `restaurant`(`id`);

ALTER TABLE `pays` ADD CONSTRAINT `pays_fk1` FOREIGN KEY (`id_carte`) REFERENCES `carte`(`id_carte`);

ALTER TABLE `commande` ADD CONSTRAINT `commande_fk0` FOREIGN KEY (`id_item`) REFERENCES `item`(`id_item`);

ALTER TABLE `commande` ADD CONSTRAINT `commande_fk1` FOREIGN KEY (`id_restaurant`) REFERENCES `restaurant`(`id`);

ALTER TABLE `stock` ADD CONSTRAINT `stock_fk0` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient`(`id_ingredient`);

ALTER TABLE `stock` ADD CONSTRAINT `stock_fk1` FOREIGN KEY (`id_restaurant`) REFERENCES `restaurant`(`id`);

ALTER TABLE `poste` ADD CONSTRAINT `poste_fk0` FOREIGN KEY (`id_restaurant`) REFERENCES `restaurant`(`id`);

ALTER TABLE `poste` ADD CONSTRAINT `poste_fk1` FOREIGN KEY (`id_employee`) REFERENCES `employee`(`id_employee`);

ALTER TABLE `caisse` ADD CONSTRAINT `caisse_fk0` FOREIGN KEY (`id_facture`) REFERENCES `commande`(`id_facture`);

ALTER TABLE `caisse` ADD CONSTRAINT `caisse_fk1` FOREIGN KEY (`id_employee`) REFERENCES `employee`(`id_employee`);

ALTER TABLE `payement` ADD CONSTRAINT `payement_fk0` FOREIGN KEY (`id_employee`) REFERENCES `employee`(`id_employee`);

ALTER TABLE `fomule` ADD CONSTRAINT `fomule_fk0` FOREIGN KEY (`id_item`) REFERENCES `item`(`id_item`);

ALTER TABLE `fomule` ADD CONSTRAINT `fomule_fk1` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient`(`id_ingredient`);

