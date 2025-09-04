/*
SQLyog Community v12.4.0 (64 bit)
MySQL - 10.4.32-MariaDB : Database - db_sistema
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_sistema` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `db_sistema`;

/*Table structure for table `persona` */

DROP TABLE IF EXISTS `persona`;

CREATE TABLE `persona` (
  `idpersona` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp(),
  `status` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `persona` */

insert  into `persona`(`idpersona`,`nombre`,`apellido`,`telefono`,`email`,`datecreated`,`status`) values 

(1,'Abel','OSH','648978','info@abelosh.com','2025-09-01 10:18:48',1),

(2,'Enrique','Castillo','45657987','enrique@info.com','2025-09-01 10:25:13',1),

(3,'Fernando','Pérez','46897878','info@abelosh.com','2021-07-21 00:00:00',1),

(5,'Jairo','Cadena','995939899','cadenaemerson1@gmail.com','2025-09-01 11:13:13',1),

(6,'Gabriela','Cayambe','999088267','gabrielacayambe12@gmail.com','2025-09-01 11:14:57',1),

(7,'Walter','Cuero','985833993','cuerovinicio5@gmail.com','2025-09-01 11:16:50',1),

(8,'Octavio','Chicaiza','994650683','walterin008@gmail.com','2025-09-01 11:18:06',1),

(9,'Marlene','Chicaiza','997187146','mariachicaiza744@gmail.com','2025-09-01 11:18:58',1),

(12,'Nicolás','Escobar','45657987','nico.escobar@info.com','2025-09-03 06:24:32',1),

(13,'Gustavo Germán','Benavides Ortiz','593987708053','germang.benavides@educacion.gob.ec','2025-09-03 06:25:27',1),

(16,'Gonzalo Nicolás','Peñaherrera Escobar','984893415','chalo_quito@hotmail.com','2025-09-03 12:59:27',1),

(18,'William Oswaldo','Trujillo Realpe','1234567890','william@example.com','2025-09-03 13:09:25',1);

/*Table structure for table `tarea` */

DROP TABLE IF EXISTS `tarea`;

CREATE TABLE `tarea` (
  `idtarea` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombretarea` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `fecha_inicio` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_fin` datetime DEFAULT NULL,
  `personaid` bigint(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`idtarea`),
  KEY `tarea_persona_fk` (`personaid`),
  CONSTRAINT `tarea_persona_fk` FOREIGN KEY (`personaid`) REFERENCES `persona` (`idpersona`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tarea` */

insert  into `tarea`(`idtarea`,`nombretarea`,`descripcion`,`fecha_inicio`,`fecha_fin`,`personaid`,`status`) values 

(2,'Maquetar Web','Maquetar con HTML y CSS','2021-08-26 00:00:00',NULL,1,'Activo');

/* Procedure structure for procedure `delete_persona` */

/*!50003 DROP PROCEDURE IF EXISTS  `delete_persona` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `delete_persona`(personaid bigint)
begin
		declare existe_persona int;
		DECLARE id INT;
		set existe_persona = (select count(*) from persona where idpersona = personaid);
		if existe_persona > 0 then
			delete from persona where idpersona = personaid;
			set id = 1;
		else 
			set id = 0;
		end if;
		select id;
	end */$$
DELIMITER ;

/* Procedure structure for procedure `insert_persona` */

/*!50003 DROP PROCEDURE IF EXISTS  `insert_persona` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `insert_persona`(nom VARCHAR(100),ape VARCHAR(100),tel BIGint,emailp varchar(100))
begin
		declare existe_persona int;
		declare id int;
		set existe_persona = (select count(*) from persona where email = emailp);
		if existe_persona = 0 then
			insert into persona(nombre,apellido,telefono,email) values(nom,ape,tel,emailp);
			set id = last_insert_id();
		else 
			set id = 0;
		end if;
		select id;
	end */$$
DELIMITER ;

/* Procedure structure for procedure `search_persona` */

/*!50003 DROP PROCEDURE IF EXISTS  `search_persona` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `search_persona`(busqueda VARCHAR(100))
begin
		select idpersona,nombre,apellido,telefono,email from persona WHERE 
		(nombre like concat('%',busqueda,'%') or
		apellido LIKE CONCAT('%',busqueda,'%') OR
		telefono LIKE CONCAT('%',busqueda,'%') OR
		email LIKE CONCAT('%',busqueda,'%')) 
		and status != '0';
	end */$$
DELIMITER ;

/* Procedure structure for procedure `select_persona` */

/*!50003 DROP PROCEDURE IF EXISTS  `select_persona` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `select_persona`(id BIGINT)
begin
		select idpersona,nombre,apellido,telefono,email from persona WHERE idpersona=id AND status != '0';
	end */$$
DELIMITER ;

/* Procedure structure for procedure `select_personas` */

/*!50003 DROP PROCEDURE IF EXISTS  `select_personas` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `select_personas`()
begin

		select idpersona,nombre,apellido,telefono,email from persona where status != '0' order by idpersona desc;

	end */$$
DELIMITER ;

/* Procedure structure for procedure `update_persona` */

/*!50003 DROP PROCEDURE IF EXISTS  `update_persona` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `update_persona`(id bigint, nom VARCHAR(100),ape VARCHAR(100),tel BIGint,emailp varchar(100))
begin
		declare existe_persona int;
		DECLARE existe_email INT;
		declare idp int;
		set existe_persona = (select count(*) from persona where idpersona = id);
		if existe_persona > 0 then
			SET existe_email = (SELECT COUNT(*) FROM persona WHERE email = emailp and idpersona != id);
			if existe_email = 0 then
				update persona set nombre=nom, apellido=ape, telefono=tel, email=emailp where idpersona = id;
				set idp = id;
			else 
				set idp = 0;
			end if;
			
		else 
			set idp = 0;
		end if;
		select idp;
	end */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
