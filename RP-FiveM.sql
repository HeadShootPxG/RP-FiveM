CREATE TABLE `addon_inventory` (
	`name` varchar(60) NOT NULL,
	`label` varchar(255) NOT NULL,
	`shared` int(11) NOT NULL,

	PRIMARY KEY (`name`)
);

CREATE TABLE `addon_inventory_items` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`inventory_name` varchar(255) NOT NULL,
	`name` varchar(255) NOT NULL,
	`count` int(11) NOT NULL,
	`owner` varchar(60) DEFAULT NULL,

	PRIMARY KEY (`id`)
);

CREATE TABLE `billing` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`identifier` varchar(255) NOT NULL,
	`sender` varchar(255) NOT NULL,
	`target_type` varchar(50) NOT NULL,
	`target` varchar(255) NOT NULL,
	`label` varchar(255) NOT NULL,
	`amount` int(11) NOT NULL,

	PRIMARY KEY (`id`)
);

CREATE TABLE `society_moneywash` (
  
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) NOT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL,
  
  PRIMARY KEY (`id`)
);

CREATE TABLE `licenses` (
	`type` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`type`)
);

CREATE TABLE `user_licenses` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`type` varchar(60) NOT NULL,
	`owner` varchar(60) NOT NULL,

	PRIMARY KEY (`id`)
);

CREATE TABLE `datastore` (
	`name` varchar(60) NOT NULL,
	`label` varchar(255) NOT NULL,
	`shared` int(11) NOT NULL,

	PRIMARY KEY (`name`)
);

CREATE TABLE `datastore_data` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`owner` varchar(60),
	`data` longtext,

	INDEX index_datastore_name (`name`),
	CONSTRAINT unique_datastore_owner_name UNIQUE (`owner`, `name`),

	PRIMARY KEY (`id`)
);

ALTER TABLE `users`
  ADD COLUMN `last_property` VARCHAR(255) NULL
;

INSERT INTO `addon_account` (name, label, shared) VALUES
  ('property_black_money','Argent Sale Propriété',0)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
  ('property','Propriété',0)
;

INSERT INTO `datastore` (name, label, shared) VALUES
  ('property','Propriété',0)
;

CREATE TABLE `owned_properties` (

  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `rented` int(11) NOT NULL,
  `owner` varchar(60) NOT NULL,

  PRIMARY KEY (`id`)
);

CREATE TABLE `properties` (

  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `entering` varchar(255) DEFAULT NULL,
  `exit` varchar(255) DEFAULT NULL,
  `inside` varchar(255) DEFAULT NULL,
  `outside` varchar(255) DEFAULT NULL,
  `ipls` varchar(255) DEFAULT '[]',
  `gateway` varchar(255) DEFAULT NULL,
  `is_single` int(11) DEFAULT NULL,
  `is_room` int(11) DEFAULT NULL,
  `is_gateway` int(11) DEFAULT NULL,
  `room_menu` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL,

  PRIMARY KEY (`id`)
);

INSERT INTO `properties` VALUES
  (1,'WhispymoundDrive','2677 Whispymound Drive','{\"y\":564.89,\"z\":182.959,\"x\":119.384}','{\"x\":117.347,\"y\":559.506,\"z\":183.304}','{\"y\":557.032,\"z\":183.301,\"x\":118.037}','{\"y\":567.798,\"z\":182.131,\"x\":119.249}','[]',NULL,1,1,0,'{\"x\":118.748,\"y\":566.573,\"z\":175.697}',1500000),
  (2,'NorthConkerAvenue2045','2045 North Conker Avenue','{\"x\":372.796,\"y\":428.327,\"z\":144.685}','{\"x\":373.548,\"y\":422.982,\"z\":144.907},','{\"y\":420.075,\"z\":145.904,\"x\":372.161}','{\"x\":372.454,\"y\":432.886,\"z\":143.443}','[]',NULL,1,1,0,'{\"x\":377.349,\"y\":429.422,\"z\":137.3}',1500000),
  (3,'RichardMajesticApt2','Richard Majestic, Apt 2','{\"y\":-379.165,\"z\":37.961,\"x\":-936.363}','{\"y\":-365.476,\"z\":113.274,\"x\":-913.097}','{\"y\":-367.637,\"z\":113.274,\"x\":-918.022}','{\"y\":-382.023,\"z\":37.961,\"x\":-943.626}','[]',NULL,1,1,0,'{\"x\":-927.554,\"y\":-377.744,\"z\":112.674}',1700000),
  (4,'NorthConkerAvenue2044','2044 North Conker Avenue','{\"y\":440.8,\"z\":146.702,\"x\":346.964}','{\"y\":437.456,\"z\":148.394,\"x\":341.683}','{\"y\":435.626,\"z\":148.394,\"x\":339.595}','{\"x\":350.535,\"y\":443.329,\"z\":145.764}','[]',NULL,1,1,0,'{\"x\":337.726,\"y\":436.985,\"z\":140.77}',1500000),
  (5,'WildOatsDrive','3655 Wild Oats Drive','{\"y\":502.696,\"z\":136.421,\"x\":-176.003}','{\"y\":497.817,\"z\":136.653,\"x\":-174.349}','{\"y\":495.069,\"z\":136.666,\"x\":-173.331}','{\"y\":506.412,\"z\":135.0664,\"x\":-177.927}','[]',NULL,1,1,0,'{\"x\":-174.725,\"y\":493.095,\"z\":129.043}',1500000),
  (6,'HillcrestAvenue2862','2862 Hillcrest Avenue','{\"y\":596.58,\"z\":142.641,\"x\":-686.554}','{\"y\":591.988,\"z\":144.392,\"x\":-681.728}','{\"y\":590.608,\"z\":144.392,\"x\":-680.124}','{\"y\":599.019,\"z\":142.059,\"x\":-689.492}','[]',NULL,1,1,0,'{\"x\":-680.46,\"y\":588.6,\"z\":136.769}',1500000),
  (7,'LowEndApartment','Appartement de base','{\"y\":-1078.735,\"z\":28.4031,\"x\":292.528}','{\"y\":-1007.152,\"z\":-102.002,\"x\":265.845}','{\"y\":-1002.802,\"z\":-100.008,\"x\":265.307}','{\"y\":-1078.669,\"z\":28.401,\"x\":296.738}','[]',NULL,1,1,0,'{\"x\":265.916,\"y\":-999.38,\"z\":-100.008}',562500),
  (8,'MadWayneThunder','2113 Mad Wayne Thunder','{\"y\":454.955,\"z\":96.462,\"x\":-1294.433}','{"x":-1289.917,"y":449.541,"z":96.902}','{\"y\":446.322,\"z\":96.899,\"x\":-1289.642}','{\"y\":455.453,\"z\":96.517,\"x\":-1298.851}','[]',NULL,1,1,0,'{\"x\":-1287.306,\"y\":455.901,\"z\":89.294}',1500000),
  (9,'HillcrestAvenue2874','2874 Hillcrest Avenue','{\"x\":-853.346,\"y\":696.678,\"z\":147.782}','{\"y\":690.875,\"z\":151.86,\"x\":-859.961}','{\"y\":688.361,\"z\":151.857,\"x\":-859.395}','{\"y\":701.628,\"z\":147.773,\"x\":-855.007}','[]',NULL,1,1,0,'{\"x\":-858.543,\"y\":697.514,\"z\":144.253}',1500000),
  (10,'HillcrestAvenue2868','2868 Hillcrest Avenue','{\"y\":620.494,\"z\":141.588,\"x\":-752.82}','{\"y\":618.62,\"z\":143.153,\"x\":-759.317}','{\"y\":617.629,\"z\":143.153,\"x\":-760.789}','{\"y\":621.281,\"z\":141.254,\"x\":-750.919}','[]',NULL,1,1,0,'{\"x\":-762.504,\"y\":618.992,\"z\":135.53}',1500000),
  (11,'TinselTowersApt12','Tinsel Towers, Apt 42','{\"y\":37.025,\"z\":42.58,\"x\":-618.299}','{\"y\":58.898,\"z\":97.2,\"x\":-603.301}','{\"y\":58.941,\"z\":97.2,\"x\":-608.741}','{\"y\":30.603,\"z\":42.524,\"x\":-620.017}','[]',NULL,1,1,0,'{\"x\":-622.173,\"y\":54.585,\"z\":96.599}',1700000),
  (12,'MiltonDrive','Milton Drive','{\"x\":-775.17,\"y\":312.01,\"z\":84.658}',NULL,NULL,'{\"x\":-775.346,\"y\":306.776,\"z\":84.7}','[]',NULL,0,0,1,NULL,0),
  (13,'Modern1Apartment','Appartement Moderne 1',NULL,'{\"x\":-784.194,\"y\":323.636,\"z\":210.997}','{\"x\":-779.751,\"y\":323.385,\"z\":210.997}',NULL,'[\"apa_v_mp_h_01_a\"]','MiltonDrive',0,1,0,'{\"x\":-766.661,\"y\":327.672,\"z\":210.396}',1300000),
  (14,'Modern2Apartment','Appartement Moderne 2',NULL,'{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}','{\"x\":-781.808,\"y\":315.866,\"z\":186.913}',NULL,'[\"apa_v_mp_h_01_c\"]','MiltonDrive',0,1,0,'{\"x\":-795.735,\"y\":326.757,\"z\":186.313}',1300000),
  (15,'Modern3Apartment','Appartement Moderne 3',NULL,'{\"x\":-774.012,\"y\":342.042,\"z\":195.686}','{\"x\":-779.057,\"y\":342.063,\"z\":195.686}',NULL,'[\"apa_v_mp_h_01_b\"]','MiltonDrive',0,1,0,'{\"x\":-765.386,\"y\":330.782,\"z\":195.08}',1300000),
  (16,'Mody1Apartment','Appartement Mode 1',NULL,'{\"x\":-784.194,\"y\":323.636,\"z\":210.997}','{\"x\":-779.751,\"y\":323.385,\"z\":210.997}',NULL,'[\"apa_v_mp_h_02_a\"]','MiltonDrive',0,1,0,'{\"x\":-766.615,\"y\":327.878,\"z\":210.396}',1300000),
  (17,'Mody2Apartment','Appartement Mode 2',NULL,'{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}','{\"x\":-781.808,\"y\":315.866,\"z\":186.913}',NULL,'[\"apa_v_mp_h_02_c\"]','MiltonDrive',0,1,0,'{\"x\":-795.297,\"y\":327.092,\"z\":186.313}',1300000),
  (18,'Mody3Apartment','Appartement Mode 3',NULL,'{\"x\":-774.012,\"y\":342.042,\"z\":195.686}','{\"x\":-779.057,\"y\":342.063,\"z\":195.686}',NULL,'[\"apa_v_mp_h_02_b\"]','MiltonDrive',0,1,0,'{\"x\":-765.303,\"y\":330.932,\"z\":195.085}',1300000),
  (19,'Vibrant1Apartment','Appartement Vibrant 1',NULL,'{\"x\":-784.194,\"y\":323.636,\"z\":210.997}','{\"x\":-779.751,\"y\":323.385,\"z\":210.997}',NULL,'[\"apa_v_mp_h_03_a\"]','MiltonDrive',0,1,0,'{\"x\":-765.885,\"y\":327.641,\"z\":210.396}',1300000),
  (20,'Vibrant2Apartment','Appartement Vibrant 2',NULL,'{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}','{\"x\":-781.808,\"y\":315.866,\"z\":186.913}',NULL,'[\"apa_v_mp_h_03_c\"]','MiltonDrive',0,1,0,'{\"x\":-795.607,\"y\":327.344,\"z\":186.313}',1300000),
  (21,'Vibrant3Apartment','Appartement Vibrant 3',NULL,'{\"x\":-774.012,\"y\":342.042,\"z\":195.686}','{\"x\":-779.057,\"y\":342.063,\"z\":195.686}',NULL,'[\"apa_v_mp_h_03_b\"]','MiltonDrive',0,1,0,'{\"x\":-765.525,\"y\":330.851,\"z\":195.085}',1300000),
  (22,'Sharp1Apartment','Appartement Persan 1',NULL,'{\"x\":-784.194,\"y\":323.636,\"z\":210.997}','{\"x\":-779.751,\"y\":323.385,\"z\":210.997}',NULL,'[\"apa_v_mp_h_04_a\"]','MiltonDrive',0,1,0,'{\"x\":-766.527,\"y\":327.89,\"z\":210.396}',1300000),
  (23,'Sharp2Apartment','Appartement Persan 2',NULL,'{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}','{\"x\":-781.808,\"y\":315.866,\"z\":186.913}',NULL,'[\"apa_v_mp_h_04_c\"]','MiltonDrive',0,1,0,'{\"x\":-795.642,\"y\":326.497,\"z\":186.313}',1300000),
  (24,'Sharp3Apartment','Appartement Persan 3',NULL,'{\"x\":-774.012,\"y\":342.042,\"z\":195.686}','{\"x\":-779.057,\"y\":342.063,\"z\":195.686}',NULL,'[\"apa_v_mp_h_04_b\"]','MiltonDrive',0,1,0,'{\"x\":-765.503,\"y\":331.318,\"z\":195.085}',1300000),
  (25,'Monochrome1Apartment','Appartement Monochrome 1',NULL,'{\"x\":-784.194,\"y\":323.636,\"z\":210.997}','{\"x\":-779.751,\"y\":323.385,\"z\":210.997}',NULL,'[\"apa_v_mp_h_05_a\"]','MiltonDrive',0,1,0,'{\"x\":-766.289,\"y\":328.086,\"z\":210.396}',1300000),
  (26,'Monochrome2Apartment','Appartement Monochrome 2',NULL,'{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}','{\"x\":-781.808,\"y\":315.866,\"z\":186.913}',NULL,'[\"apa_v_mp_h_05_c\"]','MiltonDrive',0,1,0,'{\"x\":-795.692,\"y\":326.762,\"z\":186.313}',1300000),
  (27,'Monochrome3Apartment','Appartement Monochrome 3',NULL,'{\"x\":-774.012,\"y\":342.042,\"z\":195.686}','{\"x\":-779.057,\"y\":342.063,\"z\":195.686}',NULL,'[\"apa_v_mp_h_05_b\"]','MiltonDrive',0,1,0,'{\"x\":-765.094,\"y\":330.976,\"z\":195.085}',1300000),
  (28,'Seductive1Apartment','Appartement Séduisant 1',NULL,'{\"x\":-784.194,\"y\":323.636,\"z\":210.997}','{\"x\":-779.751,\"y\":323.385,\"z\":210.997}',NULL,'[\"apa_v_mp_h_06_a\"]','MiltonDrive',0,1,0,'{\"x\":-766.263,\"y\":328.104,\"z\":210.396}',1300000),
  (29,'Seductive2Apartment','Appartement Séduisant 2',NULL,'{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}','{\"x\":-781.808,\"y\":315.866,\"z\":186.913}',NULL,'[\"apa_v_mp_h_06_c\"]','MiltonDrive',0,1,0,'{\"x\":-795.655,\"y\":326.611,\"z\":186.313}',1300000),
  (30,'Seductive3Apartment','Appartement Séduisant 3',NULL,'{\"x\":-774.012,\"y\":342.042,\"z\":195.686}','{\"x\":-779.057,\"y\":342.063,\"z\":195.686}',NULL,'[\"apa_v_mp_h_06_b\"]','MiltonDrive',0,1,0,'{\"x\":-765.3,\"y\":331.414,\"z\":195.085}',1300000),
  (31,'Regal1Apartment','Appartement Régal 1',NULL,'{\"x\":-784.194,\"y\":323.636,\"z\":210.997}','{\"x\":-779.751,\"y\":323.385,\"z\":210.997}',NULL,'[\"apa_v_mp_h_07_a\"]','MiltonDrive',0,1,0,'{\"x\":-765.956,\"y\":328.257,\"z\":210.396}',1300000),
  (32,'Regal2Apartment','Appartement Régal 2',NULL,'{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}','{\"x\":-781.808,\"y\":315.866,\"z\":186.913}',NULL,'[\"apa_v_mp_h_07_c\"]','MiltonDrive',0,1,0,'{\"x\":-795.545,\"y\":326.659,\"z\":186.313}',1300000),
  (33,'Regal3Apartment','Appartement Régal 3',NULL,'{\"x\":-774.012,\"y\":342.042,\"z\":195.686}','{\"x\":-779.057,\"y\":342.063,\"z\":195.686}',NULL,'[\"apa_v_mp_h_07_b\"]','MiltonDrive',0,1,0,'{\"x\":-765.087,\"y\":331.429,\"z\":195.123}',1300000),
  (34,'Aqua1Apartment','Appartement Aqua 1',NULL,'{\"x\":-784.194,\"y\":323.636,\"z\":210.997}','{\"x\":-779.751,\"y\":323.385,\"z\":210.997}',NULL,'[\"apa_v_mp_h_08_a\"]','MiltonDrive',0,1,0,'{\"x\":-766.187,\"y\":328.47,\"z\":210.396}',1300000),
  (35,'Aqua2Apartment','Appartement Aqua 2',NULL,'{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}','{\"x\":-781.808,\"y\":315.866,\"z\":186.913}',NULL,'[\"apa_v_mp_h_08_c\"]','MiltonDrive',0,1,0,'{\"x\":-795.658,\"y\":326.563,\"z\":186.313}',1300000),
  (36,'Aqua3Apartment','Appartement Aqua 3',NULL,'{\"x\":-774.012,\"y\":342.042,\"z\":195.686}','{\"x\":-779.057,\"y\":342.063,\"z\":195.686}',NULL,'[\"apa_v_mp_h_08_b\"]','MiltonDrive',0,1,0,'{\"x\":-765.287,\"y\":331.084,\"z\":195.086}',1300000),
  (37,'IntegrityWay','4 Integrity Way','{\"x\":-47.804,\"y\":-585.867,\"z\":36.956}',NULL,NULL,'{\"x\":-54.178,\"y\":-583.762,\"z\":35.798}','[]',NULL,0,0,1,NULL,0),
  (38,'IntegrityWay28','4 Integrity Way - Apt 28',NULL,'{\"x\":-31.409,\"y\":-594.927,\"z\":79.03}','{\"x\":-26.098,\"y\":-596.909,\"z\":79.03}',NULL,'[]','IntegrityWay',0,1,0,'{\"x\":-11.923,\"y\":-597.083,\"z\":78.43}',1700000),
  (39,'IntegrityWay30','4 Integrity Way - Apt 30',NULL,'{\"x\":-17.702,\"y\":-588.524,\"z\":89.114}','{\"x\":-16.21,\"y\":-582.569,\"z\":89.114}',NULL,'[]','IntegrityWay',0,1,0,'{\"x\":-26.327,\"y\":-588.384,\"z\":89.123}',1700000),
  (40,'DellPerroHeights','Dell Perro Heights','{\"x\":-1447.06,\"y\":-538.28,\"z\":33.74}',NULL,NULL,'{\"x\":-1440.022,\"y\":-548.696,\"z\":33.74}','[]',NULL,0,0,1,NULL,0),
  (41,'DellPerroHeightst4','Dell Perro Heights - Apt 28',NULL,'{\"x\":-1452.125,\"y\":-540.591,\"z\":73.044}','{\"x\":-1455.435,\"y\":-535.79,\"z\":73.044}',NULL,'[]','DellPerroHeights',0,1,0,'{\"x\":-1467.058,\"y\":-527.571,\"z\":72.443}',1700000),
  (42,'DellPerroHeightst7','Dell Perro Heights - Apt 30',NULL,'{\"x\":-1451.562,\"y\":-523.535,\"z\":55.928}','{\"x\":-1456.02,\"y\":-519.209,\"z\":55.929}',NULL,'[]','DellPerroHeights',0,1,0,'{\"x\":-1457.026,\"y\":-530.219,\"z\":55.937}',1700000)
;

INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('society_realestateagent','Agent immobilier', 1),
	('society_ambulance', 'Ambulance', 1),
	('society_avocat','Avocat',1),
	('society_bahama','bahama', 1),
	('society_banker','Banque',1),
  	('bank_savings','Livret Bleu', 0),
  	('society_cardealer','Concessionnaire', 1),
  	('society_gouvernor','Gouvernement', 1),
  	('society_mecano', 'Mécano', 1),
  	('society_police','Police', 1),
  	('society_taxi','Taxi', 1),
  	('society_unicorn', 'Unicorn', 1),
  	('society_vigne','Vigneron', 1)
;

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('society_ambulance', 'Ambulance', 1),
	('society_avocat', 'Avocat', 1),
	('society_bahama','bahama', 1),
  	('society_bahama_fridge', 'bahama (frigo)', 1),
  	('society_cardealer', 'Concesionnaire', 1),
  	('society_gouvernor', 'Gouvernement', 1),
  	('society_mecano', 'Mécano', 1),
  	('society_police','Police', 1),
  	('society_taxi','Taxi', 1),
  	('society_unicorn', 'Unicorn', 1),
  	('society_unicorn_fridge', 'Unicorn (frigo)', 1),
  	('society_vigne','Vigneron', 1)
;

INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES 
    ('society_avocat','Avocat', 1),
    ('society_bahama','bahama', 1),
    ('society_police', 'Police', 1),
    ('society_unicorn', 'Unicorn', 1),
    ('society_vigne', 'Vigneron', 1)
;

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('realestateagent','Agent immobilier', 0),
	('ambulance','Ambulance', 0),
	('avocat', 'Avocat', 0),
	('bahama','bahama', 0),
	('banker','Banquier', 0),
	('cardealer', 'Concessionnaire', 0),
	('eboueur', 'Little Pricks', 0),
	('gouvernor','Gouvernement', 0),
	('mecano', 'Mécano', 0),
	('police','LSPD', 0),
	('taxi','Taxi', 0),
	('unicorn', 'Unicorn', 0),
	('vigne', 'Vigneron', 0)
;

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	('realestateagent',0,'location','Location',10,'{}','{}'),
	('realestateagent',1,'vendeur','Vendeur',25,'{}','{}'),
	('realestateagent',2,'gestion','Gestion',40,'{}','{}'),
	('realestateagent',3,'boss','Patron',0,'{}','{}'),
	('ambulance',0,'ambulance','Ambulancier',20,'{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}','{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
  	('ambulance',1,'doctor','Medecin',40,'{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}','{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
  	('ambulance',2,'chief_doctor','Medecin-chef',60,'{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}','{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
  	('ambulance',3,'boss','Chirurgien',80,'{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}','{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
  	('avocat', 0, 'boss', 'Patron', 500, '{}', '{}'),
  	('bahama', 0, 'barman', 'Barman', 300, '{}', '{}'),
  	('bahama', 1, 'dj', 'DJ', 300, '{}', '{}'),
	('bahama', 2, 'secu', 'Sécurité', 300, '{}', '{}'),
	('bahama', 3, 'viceboss', 'Co-gérant', 500, '{}', '{}'),
	('bahama', 4, 'boss', 'Gérant', 600, '{}', '{}'),
	('banker',0,'advisor','Conseiller',10,'{}','{}'),
  	('banker',1,'banker','Banquier',20,'{}','{}'),
  	('banker',2,'business_banker','Banquier d\'affaire',30,'{}','{}'),
  	('banker',3,'trader','Trader',40,'{}','{}'),
  	('banker',4,'boss','Patron',0,'{}','{}'),
  	('cardealer',0,'recruit','Recrue',10,'{}','{}'),
  	('cardealer',1,'novice','Novice',25,'{}','{}'),
  	('cardealer',2,'experienced','Experimente',40,'{}','{}'),
  	('cardealer',3,'boss','Patron',0,'{}','{}'),
  	('eboueur', 0, 'interim', 'Intérimaire', 250, '{}', '{}'),
  	('gouvernor',0,'security_gouvernor','Garde du Corps',2500,'{}','{}'),
	('gouvernor',1,'boss','Président',5000,'{}','{}'),
	('mecano',0,'recrue','Recrue',12,'{}','{}'),
	('mecano',1,'novice','Novice',24,'{}','{}'),
	('mecano',2,'experimente','Experimente',36,'{}','{}'),
	('mecano',3,'chief','Chef d\'équipe',48,'{}','{}'),
	('mecano',4,'boss','Patron',0,'{}','{}'),
	('police',0,'recruit','Recrue',20,'{\"tshirt_1\":57,\"torso_1\":55,\"arms\":0,\"pants_1\":35,\"glasses\":0,\"decals_2\":0,\"hair_color_2\":0,\"helmet_2\":0,\"hair_color_1\":5,\"face\":19,\"glasses_2\":1,\"torso_2\":0,\"shoes\":24,\"hair_1\":2,\"skin\":34,\"sex\":0,\"glasses_1\":0,\"pants_2\":0,\"hair_2\":0,\"decals_1\":0,\"tshirt_2\":0,\"helmet_1\":8}','{\"tshirt_1\":34,\"torso_1\":48,\"shoes\":24,\"pants_1\":34,\"torso_2\":0,\"decals_2\":0,\"hair_color_2\":0,\"glasses\":0,\"helmet_2\":0,\"hair_2\":3,\"face\":21,\"decals_1\":0,\"glasses_2\":1,\"hair_1\":11,\"skin\":34,\"sex\":1,\"glasses_1\":5,\"pants_2\":0,\"arms\":14,\"hair_color_1\":10,\"tshirt_2\":0,\"helmet_1\":57}'),
	('police',4,'officer','Officier',40,'{\"tshirt_1\":58,\"torso_1\":55,\"shoes\":24,\"pants_1\":35,\"pants_2\":0,\"decals_2\":1,\"hair_color_2\":0,\"face\":19,\"helmet_2\":0,\"hair_2\":0,\"arms\":0,\"decals_1\":8,\"torso_2\":0,\"hair_1\":2,\"skin\":34,\"sex\":0,\"glasses_1\":0,\"glasses_2\":1,\"hair_color_1\":5,\"glasses\":0,\"tshirt_2\":0,\"helmet_1\":11}','{\"tshirt_1\":35,\"torso_1\":48,\"arms\":14,\"pants_1\":34,\"pants_2\":0,\"decals_2\":1,\"hair_color_2\":0,\"shoes\":24,\"helmet_2\":0,\"hair_2\":3,\"decals_1\":7,\"torso_2\":0,\"face\":21,\"hair_1\":11,\"skin\":34,\"sex\":1,\"glasses_1\":5,\"glasses_2\":1,\"hair_color_1\":10,\"glasses\":0,\"tshirt_2\":0,\"helmet_1\":57}'),
	('police',1,'sergeant','Sergent',60,'{\"tshirt_1\":58,\"torso_1\":55,\"shoes\":24,\"pants_1\":35,\"pants_2\":0,\"decals_2\":1,\"hair_color_2\":0,\"face\":19,\"helmet_2\":0,\"hair_2\":0,\"arms\":0,\"decals_1\":8,\"torso_2\":0,\"hair_1\":2,\"skin\":34,\"sex\":0,\"glasses_1\":0,\"glasses_2\":1,\"hair_color_1\":5,\"glasses\":0,\"tshirt_2\":0,\"helmet_1\":11}','{\"tshirt_1\":35,\"torso_1\":48,\"arms\":14,\"pants_1\":34,\"pants_2\":0,\"decals_2\":1,\"hair_color_2\":0,\"shoes\":24,\"helmet_2\":0,\"hair_2\":3,\"decals_1\":7,\"torso_2\":0,\"face\":21,\"hair_1\":11,\"skin\":34,\"sex\":1,\"glasses_1\":5,\"glasses_2\":1,\"hair_color_1\":10,\"glasses\":0,\"tshirt_2\":0,\"helmet_1\":57}'),
	('police',2,'lieutenant','Lieutenant',85,'{\"tshirt_1\":58,\"torso_1\":55,\"shoes\":24,\"pants_1\":35,\"pants_2\":0,\"decals_2\":2,\"hair_color_2\":0,\"face\":19,\"helmet_2\":0,\"hair_2\":0,\"glasses\":0,\"decals_1\":8,\"hair_color_1\":5,\"hair_1\":2,\"skin\":34,\"sex\":0,\"glasses_1\":0,\"glasses_2\":1,\"torso_2\":0,\"arms\":41,\"tshirt_2\":0,\"helmet_1\":11}','{\"tshirt_1\":35,\"torso_1\":48,\"arms\":44,\"pants_1\":34,\"hair_2\":3,\"decals_2\":2,\"hair_color_2\":0,\"hair_color_1\":10,\"helmet_2\":0,\"face\":21,\"shoes\":24,\"torso_2\":0,\"glasses_2\":1,\"hair_1\":11,\"skin\":34,\"sex\":1,\"glasses_1\":5,\"pants_2\":0,\"decals_1\":7,\"glasses\":0,\"tshirt_2\":0,\"helmet_1\":57}'),
	('police',3,'boss','Commandant',100,'{\"tshirt_1\":58,\"torso_1\":55,\"shoes\":24,\"pants_1\":35,\"pants_2\":0,\"decals_2\":3,\"hair_color_2\":0,\"face\":19,\"helmet_2\":0,\"hair_2\":0,\"arms\":41,\"torso_2\":0,\"hair_color_1\":5,\"hair_1\":2,\"skin\":34,\"sex\":0,\"glasses_1\":0,\"glasses_2\":1,\"decals_1\":8,\"glasses\":0,\"tshirt_2\":0,\"helmet_1\":11}','{\"tshirt_1\":35,\"torso_1\":48,\"arms\":44,\"pants_1\":34,\"pants_2\":0,\"decals_2\":3,\"hair_color_2\":0,\"face\":21,\"helmet_2\":0,\"hair_2\":3,\"decals_1\":7,\"torso_2\":0,\"hair_color_1\":10,\"hair_1\":11,\"skin\":34,\"sex\":1,\"glasses_1\":5,\"glasses_2\":1,\"shoes\":24,\"glasses\":0,\"tshirt_2\":0,\"helmet_1\":57}'),
  	('taxi',0,'recrue','Recrue',12,'{}','{}'),
  	('taxi',1,'novice','Novice',24,'{}','{}'),
  	('taxi',2,'experimente','Experimente',36,'{}','{}'),
  	('taxi',3,'uber','Uber',48,'{}','{}'),
  	('taxi',4,'boss','Patron',0,'{}','{}'),
  	('unicorn', 0, 'barman', 'Barman', 300, '{}', '{}'),
  	('unicorn', 1, 'dancer', 'Danseur', 300, '{}', '{}'),
  	('unicorn', 2, 'viceboss', 'Co-gérant', 500, '{}', '{}'),
  	('unicorn', 3, 'boss', 'Gérant', 600, '{}', '{}'),
	('vigne',0,'recrue','Intérimaire', 500, '{"tshirt_1":59,"tshirt_2":0,"torso_1":12,"torso_2":5,"shoes_1":7,"shoes_2":2,"pants_1":9, "pants_2":7, "arms":1, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}','{"tshirt_1":0,"tshirt_2":0,"torso_1":56,"torso_2":0,"shoes_1":27,"shoes_2":0,"pants_1":36, "pants_2":0, "arms":63, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}'),
	('vigne',1,'novice','Vigneron', 750, '{"tshirt_1":57,"tshirt_2":0,"torso_1":13,"torso_2":5,"shoes_1":7,"shoes_2":2,"pants_1":9, "pants_2":7, "arms":11, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}','{"tshirt_1":0,"tshirt_2":0,"torso_1":56,"torso_2":0,"shoes_1":27,"shoes_2":0,"pants_1":36, "pants_2":0, "arms":63, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}'),
	('vigne',2,'cdisenior','Chef de chai', 1200, '{"tshirt_1":57,"tshirt_2":0,"torso_1":13,"torso_2":5,"shoes_1":7,"shoes_2":2,"pants_1":9, "pants_2":7, "arms":11, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}','{"tshirt_1":0,"tshirt_2":0,"torso_1":56,"torso_2":0,"shoes_1":27,"shoes_2":0,"pants_1":36, "pants_2":0, "arms":63, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}'),
	('vigne',3,'boss','Patron', 1600,'{"tshirt_1":57,"tshirt_2":0,"torso_1":13,"torso_2":5,"shoes_1":7,"shoes_2":2,"pants_1":9, "pants_2":7, "arms":11, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}','{"tshirt_1":15,"tshirt_2":0,"torso_1":14,"torso_2":15,"shoes_1":12,"shoes_2":0,"pants_1":9, "pants_2":5, "arms":1, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}')
;

INSERT INTO `items` (`name`, `label`, `limit`) VALUES
	('bandage','Bandage', 20),
	('medikit','Medikit', 5),
	('pills', 'Pills', 10),
	('raisin', 'Raisin', -1),
	('jus_raisin', 'Jus de raisin', -1),
	('grand_cru', 'Grand cru', -1),
	('vine', 'Vin', -1),
	('jager', 'Jägermeister', 5),
    ('coffee', 'Café', 5),
    ('vodka', 'Vodka', 5),
    ('rhum', 'Rhum', 5),
    ('whisky', 'Whisky', 5),
    ('tequila', 'Tequila', 5),
    ('martini', 'Martini blanc', 5),
    ('soda', 'Soda', 5),
    ('jusfruit', 'Jus de fruits', 5),
    ('icetea', 'Ice Tea', 5),
    ('energy', 'Energy Drink', 5),
    ('drpepper', 'Dr. Pepper', 5),
    ('limonade', 'Limonade', 5),
    ('bolcacahuetes', 'Bol de cacahuètes', 5),
    ('bolnoixcajou', 'Bol de noix de cajou', 5),
    ('bolpistache', 'Bol de pistaches', 5),
    ('bolchips', 'Bol de chips', 5),
    ('saucisson', 'Saucisson', 5),
    ('grapperaisin', 'Grappe de raisin', 5),
    ('jagerbomb', 'Jägerbomb', 5),
    ('golem', 'Golem', 5),
    ('whiskycoca', 'Whisky-coca', 5),
    ('vodkaenergy', 'Vodka-energy', 5),
    ('vodkafruit', 'Vodka-jus de fruits', 5),
    ('rhumfruit', 'Rhum-jus de fruits', 5),
    ('teqpaf', "Teq'paf", 5),
    ('rhumcoca', 'Rhum-coca', 5),
    ('mojito', 'Mojito', 5),
    ('ice', 'Glaçon', 5),
    ('mixapero', 'Mix Apéritif', 3),
    ('metreshooter', 'Mètre de shooter', 3),
    ('jagercerbere', 'Jäger Cerbère', 3),
    ('menthe', 'Feuille de menthe', 10),
    ('poubelle', 'Poubelle', -1),
    ('gazbottle', 'bouteille de gaz', 16),
	('fixtool', 'outils réparation', 16),
	('carotool', 'outils carosserie', 16),
	('blowpipe', 'Chalumeaux', 10),
	('fixkit', 'Kit réparation', 5),
	('carokit', 'Kit carosserie', 10)
;
CREATE TABLE `fine_types` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`label` varchar(255) DEFAULT NULL,
	`amount` int(11) DEFAULT NULL,
	`category` int(11) DEFAULT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `fine_types` (`label`, `amount`, `category`) VALUES
	('Usage abusif du klaxon',30,0),
	('Franchir une ligne continue',40,0),
	('Circulation à contresens',250,0),
	('Demi-tour non autorisé',250,0),
	('Circulation hors-route',170,0),
	('Non-respect des distances de sécurité',30,0),
	('Arrêt dangereux / interdit',150,0),
	('Stationnement gênant / interdit',70,0),
	('Non respect  de la priorité à droite',70,0),
	('Non-respect à un véhicule prioritaire',90,0),
	('Non-respect d\'un stop',105,0),
	('Non-respect d\'un feu rouge',130,0),
	('Dépassement dangereux',100,0),
	('Véhicule non en état',100,0),
	('Conduite sans permis',1500,0),
	('Délit de fuite',800,0),
	('Excès de vitesse < 5 kmh',90,0),
	('Excès de vitesse 5-15 kmh',120,0),
	('Excès de vitesse 15-30 kmh',180,0),
	('Excès de vitesse > 30 kmh',300,0),
	('Entrave de la circulation',110,1),
	('Dégradation de la voie publique',90,1),
	('Trouble à l\'ordre publique',90,1),
	('Entrave opération de police',130,1),
	('Insulte envers / entre civils',75,1),
	('Outrage à agent de police',110,1),
	('Menace verbale ou intimidation envers civil',90,1),
	('Menace verbale ou intimidation envers policier',150,1),
	('Manifestation illégale',250,1),
	('Tentative de corruption',1500,1),
	('Arme blanche sortie en ville',120,2),
	('Arme léthale sortie en ville',300,2),
	('Port d\'arme non autorisé (défaut de license)',600,2),
	('Port d\'arme illégal',700,2),
	('Pris en flag lockpick',300,2),
	('Vol de voiture',1800,2),
	('Vente de drogue',1500,2),
	('Fabriquation de drogue',1500,2),
	('Possession de drogue',650,2),
	('Prise d\'ôtage civil',1500,2),
	('Prise d\'ôtage agent de l\'état',2000,2),
	('Braquage particulier',650,2),
	('Braquage magasin',650,2),
	('Braquage de banque',1500,2),
	('Tir sur civil',2000,3),
	('Tir sur agent de l\'état',2500,3),
	('Tentative de meurtre sur civil',3000,3),
	('Tentative de meurtre sur agent de l\'état',5000,3),
	('Meurtre sur civil',10000,3),
	('Meurte sur agent de l\'état',30000,3),
	('Meurtre involontaire',1800,3),
	('Escroquerie à l\'entreprise',2000,2)
;

CREATE TABLE `fine_types_ambulance` (
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL
);

INSERT INTO `fine_types_ambulance` (`label`, `amount`, `category`) VALUES
	('Soin pour membre de la police', 400, 0),
	('Soin de base', 500, 0),
	('Soin longue distance', 750, 0),
	('Soin patient inconscient', 800, 0)
;

CREATE TABLE `cardealer_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `owned_vehicles` (

  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` longtext NOT NULL,
  `owner` varchar(60) NOT NULL,

  PRIMARY KEY (`id`)
);

CREATE TABLE `rented_vehicles` (

  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(10) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(255) NOT NULL,

  PRIMARY KEY (`id`)
);

CREATE TABLE `vehicle_categories` (

  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,

  PRIMARY KEY (`id`)
);

INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
  ('compacts','Compacts'),
  ('coupes','Coupés'),
  ('sedans','Sedans'),
  ('sports','Sports'),
  ('sportsclassics','Sports Classics'),
  ('super','Super'),
  ('muscle','Muscle'),
  ('offroad','Off Road'),
  ('suvs','SUVs'),
  ('vans','Vans'),
  ('motorcycles','Motos')
;

CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
  ('Blade','blade',15000,'muscle'),
  ('Buccaneer','buccaneer',18000,'muscle'),
  ('Buccaneer Rider','buccaneer2',24000,'muscle'),
  ('Chino','chino',15000,'muscle'),
  ('Chino Luxe','chino2',19000,'muscle'),
  ('Coquette BlackFin','coquette3',55000,'muscle'),
  ('Dominator','dominator',35000,'muscle'),
  ('Dukes','dukes',28000,'muscle'),
  ('Gauntlet','gauntlet',30000,'muscle'),
  ('Hotknife','hotknife',125000,'muscle'),
  ('Faction','faction',20000,'muscle'),
  ('Faction Rider','faction2',30000,'muscle'),
  ('Faction XL','faction3',40000,'muscle'),
  ('Nightshade','nightshade',65000,'muscle'),
  ('Phoenix','phoenix',12500,'muscle'),
  ('Picador','picador',18000,'muscle'),
  ('Sabre Turbo','sabregt',20000,'muscle'),
  ('Sabre GT','sabregt2',25000,'muscle'),
  ('Slam Van','slamvan3',11500,'muscle'),
  ('Tampa','tampa',16000,'muscle'),
  ('Virgo','virgo',14000,'muscle'),
  ('Vigero','vigero',12500,'muscle'),
  ('Voodoo','voodoo',7200,'muscle'),
  ('Blista','blista',8000,'compacts'),
  ('Brioso R/A','brioso',18000,'compacts'),
  ('Issi','issi2',10000,'compacts'),
  ('Panto','panto',10000,'compacts'),
  ('Prairie','prairie',12000,'compacts'),
  ('Bison','bison',45000,'vans'),
  ('Bobcat XL','bobcatxl',32000,'vans'),
  ('Burrito','burrito3',19000,'vans'),
  ('Burrito','gburrito2',29000,'vans'),
  ('Camper','camper',42000,'vans'),
  ('Gang Burrito','gburrito',45000,'vans'),
  ('Journey','journey',6500,'vans'),
  ('Minivan','minivan',13000,'vans'),
  ('Moonbeam','moonbeam',18000,'vans'),
  ('Moonbeam Rider','moonbeam2',35000,'vans'),
  ('Paradise','paradise',19000,'vans'),
  ('Rumpo','rumpo',15000,'vans'),
  ('Rumpo Trail','rumpo3',19500,'vans'),
  ('Surfer','surfer',12000,'vans'),
  ('Youga','youga',10800,'vans'),
  ('Youga Luxuary','youga2',14500,'vans'),
  ('Asea','asea',5500,'sedans'),
  ('Cognoscenti','cognoscenti',55000,'sedans'),
  ('Emperor','emperor',8500,'sedans'),
  ('Fugitive','fugitive',12000,'sedans'),
  ('Glendale','glendale',6500,'sedans'),
  ('Intruder','intruder',7500,'sedans'),
  ('Premier','premier',8000,'sedans'),
  ('Primo Custom','primo2',14000,'sedans'),
  ('Regina','regina',5000,'sedans'),
  ('Schafter','schafter2',25000,'sedans'),
  ('Stretch','stretch',90000,'sedans'),
  ('Super Diamond','superd',130000,'sedans'),
  ('Tailgater','tailgater',30000,'sedans'),
  ('Warrener','warrener',4000,'sedans'),
  ('Washington','washington',9000,'sedans'),
  ('Baller','baller2',40000,'suvs'),
  ('Baller Sport','baller3',60000,'suvs'),
  ('Cavalcade','cavalcade2',55000,'suvs'),
  ('Contender','contender',70000,'suvs'),
  ('Dubsta','dubsta',45000,'suvs'),
  ('Dubsta Luxuary','dubsta2',60000,'suvs'),
  ('Fhantom','fq2',17000,'suvs'),
  ('Grabger','granger',50000,'suvs'),
  ('Gresley','gresley',47500,'suvs'),
  ('Huntley S','huntley',40000,'suvs'),
  ('Landstalker','landstalker',35000,'suvs'),
  ('Mesa','mesa',16000,'suvs'),
  ('Mesa Trail','mesa3',40000,'suvs'),
  ('Patriot','patriot',55000,'suvs'),
  ('Radius','radi',29000,'suvs'),
  ('Rocoto','rocoto',45000,'suvs'),
  ('Seminole','seminole',25000,'suvs'),
  ('XLS','xls',32000,'suvs'),
  ('Btype','btype',62000,'sportsclassics'),
  ('Btype Luxe','btype3',85000,'sportsclassics'),
  ('Btype Hotroad','btype2',155000,'sportsclassics'),
  ('Casco','casco',30000,'sportsclassics'),
  ('Coquette Classic','coquette2',40000,'sportsclassics'),
  ('Manana','manana',12800,'sportsclassics'),
  ('Monroe','monroe',55000,'sportsclassics'),
  ('Pigalle','pigalle',20000,'sportsclassics'),
  ('Stinger','stinger',80000,'sportsclassics'),
  ('Stinger GT','stingergt',75000,'sportsclassics'),
  ('Stirling GT','feltzer3',65000,'sportsclassics'),
  ('Z-Type','ztype',220000,'sportsclassics'),
  ('Bifta','bifta',12000,'offroad'),
  ('Bf Injection','bfinjection',16000,'offroad'),
  ('Blazer','blazer',6500,'offroad'),
  ('Blazer Sport','blazer4',8500,'offroad'),
  ('Brawler','brawler',45000,'offroad'),
  ('Bubsta 6x6','dubsta3',120000,'offroad'),
  ('Dune Buggy','dune',8000,'offroad'),
  ('Guardian','guardian',45000,'offroad'),
  ('Rebel','rebel2',35000,'offroad'),
  ('Sandking','sandking',55000,'offroad'),
  ('The Liberator','monster',210000,'offroad'),
  ('Trophy Truck','trophytruck',60000,'offroad'),
  ('Trophy Truck Limited','trophytruck2',80000,'offroad'),
  ('Cognoscenti Cabrio','cogcabrio',55000,'coupes'),
  ('Exemplar','exemplar',32000,'coupes'),
  ('F620','f620',40000,'coupes'),
  ('Felon','felon',42000,'coupes'),
  ('Felon GT','felon2',55000,'coupes'),
  ('Jackal','jackal',38000,'coupes'),
  ('Oracle XS','oracle2',35000,'coupes'),
  ('Sentinel','sentinel',32000,'coupes'),
  ('Sentinel XS','sentinel2',40000,'coupes'),
  ('Windsor','windsor',95000,'coupes'),
  ('Windsor Drop','windsor2',125000,'coupes'),
  ('Zion','zion',36000,'coupes'),
  ('Zion Cabrio','zion2',45000,'coupes'),
  ('9F','ninef',65000,'sports'),
  ('9F Cabrio','ninef2',80000,'sports'),
  ('Alpha','alpha',60000,'sports'),
  ('Banshee','banshee',70000,'sports'),
  ('Bestia GTS','bestiagts',55000,'sports'),
  ('Buffalo','buffalo',12000,'sports'),
  ('Buffalo S','buffalo2',20000,'sports'),
  ('Carbonizzare','carbonizzare',75000,'sports'),
  ('Comet','comet2',65000,'sports'),
  ('Coquette','coquette',65000,'sports'),
  ('Drift Tampa','tampa2',80000,'sports'),
  ('Elegy','elegy2',38500,'sports'),
  ('Feltzer','feltzer2',55000,'sports'),
  ('Furore GT','furoregt',45000,'sports'),
  ('Fusilade','fusilade',40000,'sports'),
  ('Jester','jester',65000,'sports'),
  ('Jester(Racecar)','jester2',135000,'sports'),
  ('Khamelion','khamelion',38000,'sports'),
  ('Kuruma','kuruma',30000,'sports'),
  ('Lynx','lynx',40000,'sports'),
  ('Mamba','mamba',70000,'sports'),
  ('Massacro','massacro',65000,'sports'),
  ('Massacro(Racecar)','massacro2',130000,'sports'),
  ('Omnis','omnis',35000,'sports'),
  ('Penumbra','penumbra',28000,'sports'),
  ('Rapid GT','rapidgt',35000,'sports'),
  ('Rapid GT Convertible','rapidgt2',45000,'sports'),
  ('Schafter V12','schafter3',50000,'sports'),
  ('Seven 70','seven70',39500,'sports'),
  ('Sultan','sultan',15000,'sports'),
  ('Surano','surano',50000,'sports'),
  ('Tropos','tropos',40000,'sports'),
  ('Verlierer','verlierer2',70000,'sports'),
  ('Adder','adder',900000,'super'),
  ('Banshee 900R','banshee2',255000,'super'),
  ('Bullet','bullet',90000,'super'),
  ('Cheetah','cheetah',375000,'super'),
  ('Entity XF','entityxf',425000,'super'),
  ('ETR1','sheava',220000,'super'),
  ('FMJ','fmj',185000,'super'),
  ('Infernus','infernus',180000,'super'),
  ('Osiris','osiris',160000,'super'),
  ('Pfister','pfister811',85000,'super'),
  ('RE-7B','le7b',325000,'super'),
  ('Reaper','reaper',150000,'super'),
  ('Sultan RS','sultanrs',65000,'super'),
  ('T20','t20',300000,'super'),
  ('Turismo R','turismor',350000,'super'),
  ('Tyrus','tyrus',600000,'super'),
  ('Vacca','vacca',120000,'super'),
  ('Voltic','voltic',90000,'super'),
  ('X80 Proto','prototipo',2500000,'super'),
  ('Zentorno','zentorno',1500000,'super'),
  ('Akuma','AKUMA',7500,'motorcycles'),
  ('Avarus','avarus',18000,'motorcycles'),
  ('Bagger','bagger',13500,'motorcycles'),
  ('Bati 801','bati',12000,'motorcycles'),
  ('Bati 801RR','bati2',19000,'motorcycles'),
  ('BF400','bf400',6500,'motorcycles'),
  ('BMX (velo)','bmx',160,'motorcycles'),
  ('Carbon RS','carbonrs',18000,'motorcycles'),
  ('Chimera','chimera',38000,'motorcycles'),
  ('Cliffhanger','cliffhanger',9500,'motorcycles'),
  ('Cruiser (velo)','cruiser',510,'motorcycles'),
  ('Daemon','daemon',11500,'motorcycles'),
  ('Daemon High','daemon2',13500,'motorcycles'),
  ('Defiler','defiler',9800,'motorcycles'),
  ('Double T','double',28000,'motorcycles'),
  ('Enduro','enduro',5500,'motorcycles'),
  ('Esskey','esskey',4200,'motorcycles'),
  ('Faggio','faggio',1900,'motorcycles'),
  ('Vespa','faggio2',2800,'motorcycles'),
  ('Fixter (velo)','fixter',225,'motorcycles'),
  ('Gargoyle','gargoyle',16500,'motorcycles'),
  ('Hakuchou','hakuchou',31000,'motorcycles'),
  ('Hakuchou Sport','hakuchou2',55000,'motorcycles'),
  ('Hexer','hexer',12000,'motorcycles'),
  ('Innovation','innovation',23500,'motorcycles'),
  ('Manchez','manchez',5300,'motorcycles'),
  ('Nemesis','nemesis',5800,'motorcycles'),
  ('Nightblade','nightblade',35000,'motorcycles'),
  ('PCJ-600','pcj',6200,'motorcycles'),
  ('Ruffian','ruffian',6800,'motorcycles'),
  ('Sanchez','sanchez',5300,'motorcycles'),
  ('Sanchez Sport','sanchez2',5300,'motorcycles'),
  ('Sanctus','sanctus',25000,'motorcycles'),
  ('Scorcher (velo)','scorcher',280,'motorcycles'),
  ('Sovereign','sovereign',22000,'motorcycles'),
  ('Shotaro Concept','shotaro',320000,'motorcycles'),
  ('Thrust','thrust',24000,'motorcycles'),
  ('Tri bike (velo)','tribike3',520,'motorcycles'),
  ('Vader','vader',7200,'motorcycles'),
  ('Vortex','vortex',9800,'motorcycles'),
  ('Woflsbane','wolfsbane',9000,'motorcycles'),
  ('Zombie','zombiea',9500,'motorcycles'),
  ('Zombie Luxuary','zombieb',12000,'motorcycles')
;