/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.5.58 : Database - realestatel
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`realestatel` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `realestatel`;

/*Table structure for table `real_estate` */

DROP TABLE IF EXISTS `real_estate`;

CREATE TABLE `real_estate` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `cardid` varchar(18) NOT NULL,
  `projectname` varchar(50) NOT NULL,
  `address` varchar(200) NOT NULL,
  `hoursetype` varchar(20) NOT NULL,
  `area` int(10) NOT NULL,
  `buildtime` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cardid` (`cardid`),
  CONSTRAINT `real_estate_ibfk_1` FOREIGN KEY (`cardid`) REFERENCES `users` (`cardid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `real_estate` */

insert  into `real_estate`(`id`,`cardid`,`projectname`,`address`,`hoursetype`,`area`,`buildtime`) values (1,'425635636953652361','中南海1号','地中海','三室两厅',500,'2018-04-01'),(2,'425635636953652361','中南海2号','地中海1','三室两厅',200,'2013-04-01'),(3,'425635636953652362','中南海3号','地中海2','三室两厅321',300,'2011-04-01'),(4,'425635636953652361','中南海4号','地中海3','三室两厅1',500,'2012-04-01'),(5,'425635636953652362','中南海5号','地中海4','三室两厅123',1500,'2017-04-01'),(6,'425635636953652362','中南海6号','地中海5','三室两厅123',3500,'2018-04-01'),(7,'425635636953652362','中南海7号','地中海6','三室两厅123',555,'2018-04-27');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `cardid` varchar(18) NOT NULL COMMENT '使用身份证号作为id',
  `name` varchar(50) NOT NULL,
  `gender` int(1) NOT NULL COMMENT '根据身份证号最后一位数判断，单数时该字段填1 （ 表示女），双数时该字段填0(表示男)',
  `createtime` date NOT NULL COMMENT '取服务器端系统当前时间',
  `password` varchar(50) NOT NULL COMMENT '长度6 位（含）以上',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '1 为正常，0 为冻结，默认为1',
  PRIMARY KEY (`cardid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`cardid`,`name`,`gender`,`createtime`,`password`,`status`) values ('425635636953652361','admin',1,'2018-04-01','123123',1),('425635636953652362','wangfei',0,'1985-04-22','123123',1),('425635636953652363','yyyy',1,'2018-04-27','123123',1),('425635636953652364','wwww',0,'2018-04-27','123123',1),('425635636953652365','HHHH',1,'2018-04-27','123123',1),('425635636953652366','MMMM',0,'2018-04-27','123123',1),('425635636953652367','FFFF',1,'2018-04-27','123123',1),('425635636953652368','DDDD',0,'2018-04-27','123123',1),('425635636953652369','VVVV',1,'2018-04-27','123123',1),('425635636953652370','TTTT',0,'2018-04-27','123123',1),('425635636953652371','EEEE',1,'2018-04-27','123123',1),('425635636953652372','RRRR',0,'2018-04-27','123123',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
