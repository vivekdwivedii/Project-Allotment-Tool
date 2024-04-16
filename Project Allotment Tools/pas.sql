/*
SQLyog Ultimate v8.82 
MySQL - 5.1.45-community : Database - pas
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`pas` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `pas`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `username` varchar(20) DEFAULT NULL,
  `pswd` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `admin` */

insert  into `admin`(`username`,`pswd`) values ('admin','54321');

/*Table structure for table `groups` */

DROP TABLE IF EXISTS `groups`;

CREATE TABLE `groups` (
  `g_id` int(6) NOT NULL,
  `name` varchar(30) NOT NULL,
  `course` varchar(30) NOT NULL,
  `rol` varchar(30) NOT NULL,
  `session` varchar(30) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `groups` */

insert  into `groups`(`g_id`,`name`,`course`,`rol`,`session`,`status`) values (2105,'vatsal','MCA','14785236','2017','1'),(2105,'Raj','MCA','1405214030','2017','1'),(6035,'suresh','MCA','1234543','2017','1'),(6035,'ramesh','MCA','876321345','2017','1'),(2396,'Saumya Garg','MCA','87342334','2017','1'),(2396,'Prakhar Omer','MCA','74788454','2017','1'),(2396,'rohit Mittal','MCA','8125698745','2017','1'),(9824,'vijay singh','MCA','987654321','2017','1'),(9824,'rohit aggarwal','MCA','1405214046','2017','1'),(9824,'JWALA PRASAD ','MCA','1452541452','2017','1'),(9824,'ARUN KUMAR','MCA','11111111','2017','1');

/*Table structure for table `guide` */

DROP TABLE IF EXISTS `guide`;

CREATE TABLE `guide` (
  `g_id` varchar(10) NOT NULL,
  `doj` date DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `spec` varchar(20) DEFAULT NULL,
  `gen` varchar(20) DEFAULT NULL,
  `cont` decimal(10,0) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `exp` varchar(5) DEFAULT 'none',
  UNIQUE KEY `g_id` (`g_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `guide` */

insert  into `guide`(`g_id`,`doj`,`name`,`spec`,`gen`,`cont`,`email`,`exp`) values ('12133','2018-03-14','RAJESH','Mobile Application','Male','12345','aaa@gmail.com','none'),('13213','2015-02-24','amrish','Web Based','Male','87878','amrish@gmail.com','ok'),('6543','2017-05-10','vijay','Web Based','Male','65656','asd@gmail.com','none'),('6546546','2015-03-18','abc','hardware based','Male','867','asd2222@gmail.com','none'),('A12318','2011-05-01','ravi','Windows Based','Male','258','aaa@gmail.com','none'),('AR001','2012-05-01','Saumya Garg','Mobile Application','Female','8765432','saumya@gmail.com','ok');

/*Table structure for table `guide_allot` */

DROP TABLE IF EXISTS `guide_allot`;

CREATE TABLE `guide_allot` (
  `group_id` varchar(30) NOT NULL,
  `pro_name` varchar(80) NOT NULL,
  `g_name` varchar(30) NOT NULL,
  `course` varchar(30) NOT NULL,
  `session` varchar(5) NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `guide_allot` */

insert  into `guide_allot`(`group_id`,`pro_name`,`g_name`,`course`,`session`) values ('2105','PAS','vijay','MCA','2017'),('2396','Chip lavel program','abc','MCA','2017'),('6035','Share it','Saumya Garg','MCA','2017'),('9824','Window module','ravi','MCA','2017');

/*Table structure for table `project` */

DROP TABLE IF EXISTS `project`;

CREATE TABLE `project` (
  `title` varchar(50) NOT NULL,
  `cat` varchar(30) NOT NULL,
  `fend` varchar(30) NOT NULL,
  `bend` varchar(30) NOT NULL,
  `g_id` varchar(30) NOT NULL,
  `session` varchar(4) NOT NULL,
  `mby` varchar(100) NOT NULL,
  `course` varchar(5) NOT NULL,
  `des` mediumtext NOT NULL,
  UNIQUE KEY `p_id` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `project` */

insert  into `project`(`title`,`cat`,`fend`,`bend`,`g_id`,`session`,`mby`,`course`,`des`) values ('admin library','Windows Based','JSP,HTML,CSS','MYSQL,TOMCAT','1234','2017','SUMIT','MCA','asdf'),('exam','Mobile Application','php','mysql,tomcat','1234','2017','abc,xyz','MCA','fdsgfdhgfjhfjfjhfjhfjh'),('library','Web Based','java','MYSQL,TOMCAT','12345678','2017','arjun rawat,vatsal','MCA','This project is the solution for solar system.'),('Library solar','Web Based','JSP,HTML,CSS','MYSQL,TOMCAT','4321','2017','SUMIT','BCA','During the Late Antiquity and Middle Ages periods, there was no Rome of the kind that ruled the Mediterranean for centuries and spawned the culture that produced twenty-eight public libraries in the urbs Roma.[28] The empire had been divided then later re-united again under Constantine the Great who moved the capital of the Roman Empire in 330 AD to the city of Byzantium which was renamed Constantinople.[29] The Roman intellectual culture that flourished in ancient times was undergoing a transformation as the academic world moved from laymen to Christian clergy.[30] As the West crumbled, books and libraries flourished and flowed east toward the Byzantine Empire.[31] There, four different types of libraries were established: imperial, patriarchal, monastic, and private.[32] Each had its own purpose and, as a result, their survival varied.\r\n\r\nChristianity was a new force in Europe and many of the faithful saw Hellenistic culture as pagan. As such, many classical Greek works, written on scrolls, were left to decay as only Christian texts were thought fit for preservation in a codex, the progenitor of the modern book.[33] In the East, however, this was not the case as many of these classical Greek and Roman texts were copied.[34]\r\n\r\nIn Byzantium, much of this work devoted to preserving Hellenistic thought in codex form was performed in scriptoriums by monks.[35] While monastic library scriptoriums flourished throughout the East and West, the rules governing them were generally the same.[36] Barren and sun-lit rooms (because candles were a source of fire) were major features of the scriptorium that was both a model of production and monastic piety.[37] Monks scribbled away for hours a day, interrupted only by meals and prayers.[38] With such production, medieval monasteries began to accumulate large libraries. These libraries were devoted solely to the education of the monks and were seen as essential to their spiritual development.[39] Although most of these texts that were produced were Christian in nature, many monastic leaders saw common virtues in the Greek classics. As a result, many of these Greek works were copied, and thus saved, in monastic scriptoriums.[40]'),('Nawabi guide','Web Based','php','mysql,tomcat','1234','2017','abc,xyz','MCA','Nice project'),('online library','Web Based','java','mysql','Ar001','2017','Ajay,vijay,sumit','MCA','no message');

/*Table structure for table `project_allot` */

DROP TABLE IF EXISTS `project_allot`;

CREATE TABLE `project_allot` (
  `g_id` varchar(6) NOT NULL,
  `pro_name` varchar(40) NOT NULL,
  `pro_cat` varchar(40) NOT NULL,
  `course` varchar(10) NOT NULL,
  `session` varchar(30) NOT NULL,
  `status` varchar(1) DEFAULT '0',
  PRIMARY KEY (`g_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `project_allot` */

insert  into `project_allot`(`g_id`,`pro_name`,`pro_cat`,`course`,`session`,`status`) values ('2105','PAS','Web Based','MCA','2017','1'),('2396','Chip lavel program','Hardware Based','MCA','2017','1'),('6035','Share it','Mobile Application','MCA','2017','1'),('9824','Window module','Windows Based','MCA','2017','1');

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `srno` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `course` varchar(20) NOT NULL,
  `rolno` varchar(10) NOT NULL,
  `session` varchar(20) NOT NULL,
  `year` varchar(20) NOT NULL,
  `semester` int(2) unsigned NOT NULL,
  `cont` decimal(10,0) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `status` int(1) DEFAULT '0',
  PRIMARY KEY (`srno`,`rolno`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=latin1;

/*Data for the table `student` */

insert  into `student`(`srno`,`name`,`course`,`rolno`,`session`,`year`,`semester`,`cont`,`email`,`status`) values (105,'Vatsal Srivastava','MCA','1234567','2019','third',5,'8687974627','sri.vat3@hotmail.com',0),(116,'sdefrtgyhuji','BCA','34567','2017','second',3,'987654321','arunkumar@analyzeinfotech.in',0),(118,'Raj','MCA','1405214030','2017','third',6,'147852369','raj@gmail.com',1),(119,'suresh','MCA','1234543','2017','third',6,'9898777','suresh@gmail.com',1),(120,'ramesh','MCA','876321345','2017','third',6,'683793489','ramesh@gmail.com',1),(121,'Saumya Garg','MCA','87342334','2017','third',6,'8787878787','saumya@gmail.com',1),(122,'Prakhar Omer','MCA','74788454','2017','third',6,'987300000','Prakhar@gmail.com',1),(123,'rohit Mittal','MCA','8125698745','2017','third',6,'877878787','mittal@gmail.com',1),(124,'vijay singh','MCA','987654321','2017','third',6,'8765432','vijaysingh@gmail.com',1),(125,'rohit aggarwal','MCA','1405214046','2017','third',6,'8888888888','aaaa@gmail.com',1),(126,'abc','BCA','98789','2017','third',5,'9898989890','araa@gmail.com',0),(127,'JWALA PRASAD ','MCA','1452541452','2017','second',5,'98586985','arunkumarfrbrah@gmail.com',1),(128,'ARUN KUMAR','MCA','11111111','2017','third',6,'7830985869','arunkumarbrah@gmail.com',1),(129,'Ajay','MCA','124563','2018','third',6,'1245878','ajay@gmail.com',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
