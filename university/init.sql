/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.57 : Database - my_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`my_db` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `my_db`;

/*Table structure for table `chat` */

CREATE TABLE `chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `pos` varchar(20) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `text` text,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `type` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

/*Data for the table `chat` */

insert  into `chat`(`id`,`user_id`,`pos`,`course_id`,`text`,`time`,`type`) values (1,2,'student',NULL,'What is dummy?','2017-10-07 03:54:08',NULL);
insert  into `chat`(`id`,`user_id`,`pos`,`course_id`,`text`,`time`,`type`) values (2,5,'teacher',NULL,'Dummy is a binary tree used for sort and search.','2017-10-07 03:55:33',NULL);
insert  into `chat`(`id`,`user_id`,`pos`,`course_id`,`text`,`time`,`type`) values (3,2,'teacher',NULL,'Hello, how can I downgrade MySQL server?','2017-10-07 11:24:15',NULL);
insert  into `chat`(`id`,`user_id`,`pos`,`course_id`,`text`,`time`,`type`) values (4,29,'student',NULL,'You can uninstall present server and then download previous version of MySQL server and install.','2017-10-07 11:27:49',NULL);
insert  into `chat`(`id`,`user_id`,`pos`,`course_id`,`text`,`time`,`type`) values (5,1,'student',NULL,'How can I install MacOS on my computer.','2017-10-09 10:42:59',NULL);
insert  into `chat`(`id`,`user_id`,`pos`,`course_id`,`text`,`time`,`type`) values (6,10,'student',NULL,'sdaf','2017-10-09 22:13:36',NULL);
insert  into `chat`(`id`,`user_id`,`pos`,`course_id`,`text`,`time`,`type`) values (7,10,'student',NULL,'asdf','2017-10-09 22:13:37',NULL);
insert  into `chat`(`id`,`user_id`,`pos`,`course_id`,`text`,`time`,`type`) values (8,10,'student',NULL,'asdf','2017-10-09 22:13:37',NULL);
insert  into `chat`(`id`,`user_id`,`pos`,`course_id`,`text`,`time`,`type`) values (9,10,'student',NULL,'asdf','2017-10-09 22:13:38',NULL);
insert  into `chat`(`id`,`user_id`,`pos`,`course_id`,`text`,`time`,`type`) values (10,10,'student',NULL,'asdf','2017-10-09 22:13:38',NULL);
insert  into `chat`(`id`,`user_id`,`pos`,`course_id`,`text`,`time`,`type`) values (11,10,'student',NULL,'asdf','2017-10-09 22:13:38',NULL);
insert  into `chat`(`id`,`user_id`,`pos`,`course_id`,`text`,`time`,`type`) values (12,10,'student',NULL,'asdf','2017-10-09 22:13:39',NULL);
insert  into `chat`(`id`,`user_id`,`pos`,`course_id`,`text`,`time`,`type`) values (13,2,'teacher',42,'AdminLTE.min.css','2017-10-12 03:29:10',1);
insert  into `chat`(`id`,`user_id`,`pos`,`course_id`,`text`,`time`,`type`) values (14,2,'teacher',42,'hello','2017-10-12 04:35:02',0);
insert  into `chat`(`id`,`user_id`,`pos`,`course_id`,`text`,`time`,`type`) values (15,2,'teacher',42,'gerg','2017-10-12 04:42:07',0);
insert  into `chat`(`id`,`user_id`,`pos`,`course_id`,`text`,`time`,`type`) values (16,2,'teacher',42,'oweiuroiuxcov','2017-10-12 04:42:16',0);
insert  into `chat`(`id`,`user_id`,`pos`,`course_id`,`text`,`time`,`type`) values (17,2,'teacher',42,'zxvwef','2017-10-12 04:46:06',0);
insert  into `chat`(`id`,`user_id`,`pos`,`course_id`,`text`,`time`,`type`) values (18,2,'teacher',42,'wefc','2017-10-12 09:39:19',0);
insert  into `chat`(`id`,`user_id`,`pos`,`course_id`,`text`,`time`,`type`) values (19,2,'teacher',42,'ergvb','2017-10-12 09:40:01',0);
insert  into `chat`(`id`,`user_id`,`pos`,`course_id`,`text`,`time`,`type`) values (20,2,'teacher',42,'xcvewf','2017-10-12 09:52:16',0);
insert  into `chat`(`id`,`user_id`,`pos`,`course_id`,`text`,`time`,`type`) values (21,2,'teacher',42,'wefcvwef','2017-10-12 09:54:10',0);
insert  into `chat`(`id`,`user_id`,`pos`,`course_id`,`text`,`time`,`type`) values (22,2,'teacher',42,'efsdf','2017-10-12 09:54:16',0);
insert  into `chat`(`id`,`user_id`,`pos`,`course_id`,`text`,`time`,`type`) values (23,2,'teacher',42,'zxcvwetewr','2017-10-12 09:54:22',0);
insert  into `chat`(`id`,`user_id`,`pos`,`course_id`,`text`,`time`,`type`) values (24,2,'teacher',42,'wurlsdfkdsgjweof','2017-10-12 09:54:30',0);
insert  into `chat`(`id`,`user_id`,`pos`,`course_id`,`text`,`time`,`type`) values (25,2,'teacher',42,'Master Android App Development eBook Version 1.2.pdf','2017-10-12 10:34:55',1);
insert  into `chat`(`id`,`user_id`,`pos`,`course_id`,`text`,`time`,`type`) values (26,2,'teacher',42,'hello','2017-10-12 10:35:08',0);
insert  into `chat`(`id`,`user_id`,`pos`,`course_id`,`text`,`time`,`type`) values (27,2,'teacher',42,'ewoifjxcvwef','2017-10-12 10:35:16',0);
insert  into `chat`(`id`,`user_id`,`pos`,`course_id`,`text`,`time`,`type`) values (28,2,'teacher',42,'c','2017-10-12 10:35:24',0);
insert  into `chat`(`id`,`user_id`,`pos`,`course_id`,`text`,`time`,`type`) values (29,2,'teacher',42,'wefxvwef','2017-10-12 10:37:40',0);
insert  into `chat`(`id`,`user_id`,`pos`,`course_id`,`text`,`time`,`type`) values (30,2,'teacher',42,'init.sql','2017-10-12 10:37:54',1);
insert  into `chat`(`id`,`user_id`,`pos`,`course_id`,`text`,`time`,`type`) values (31,5,'teacher',44,'awefxcvwef','2017-10-12 10:38:25',0);
insert  into `chat`(`id`,`user_id`,`pos`,`course_id`,`text`,`time`,`type`) values (32,2,'teacher',NULL,'weoifjkxcvewf','2017-10-12 10:44:10',0);
insert  into `chat`(`id`,`user_id`,`pos`,`course_id`,`text`,`time`,`type`) values (33,2,'teacher',42,'wefzxvwef','2017-10-12 10:45:21',0);
insert  into `chat`(`id`,`user_id`,`pos`,`course_id`,`text`,`time`,`type`) values (34,2,'teacher',42,'weoifnxvweif','2017-10-12 10:46:37',0);
insert  into `chat`(`id`,`user_id`,`pos`,`course_id`,`text`,`time`,`type`) values (35,2,'teacher',42,'zzzzzzz','2017-10-12 10:46:45',0);
insert  into `chat`(`id`,`user_id`,`pos`,`course_id`,`text`,`time`,`type`) values (36,2,'teacher',42,'asfefdd','2017-10-12 10:47:35',0);
insert  into `chat`(`id`,`user_id`,`pos`,`course_id`,`text`,`time`,`type`) values (37,2,'teacher',42,'wwwwwwwwwwwwww','2017-10-12 10:49:17',0);
insert  into `chat`(`id`,`user_id`,`pos`,`course_id`,`text`,`time`,`type`) values (38,2,'teacher',42,'treq','2017-10-12 10:50:14',0);
insert  into `chat`(`id`,`user_id`,`pos`,`course_id`,`text`,`time`,`type`) values (39,2,'teacher',42,'woeifjxcv','2017-10-12 10:57:24',0);
insert  into `chat`(`id`,`user_id`,`pos`,`course_id`,`text`,`time`,`type`) values (40,2,'teacher',42,'woeifhjxcv','2017-10-12 11:13:27',0);

/*Table structure for table `cj10244` */

CREATE TABLE `cj10244` (
  `std_id` int(11) NOT NULL,
  `24_hw` text,
  `24_score` double DEFAULT NULL,
  `1_hw` text,
  `1_score` double DEFAULT NULL,
  `0_hw` text,
  `0_score` double DEFAULT NULL,
  PRIMARY KEY (`std_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `cj10244` */

insert  into `cj10244`(`std_id`,`24_hw`,`24_score`,`1_hw`,`1_score`,`0_hw`,`0_score`) values (8,'bidSentence.txt',4,NULL,NULL,NULL,NULL);
insert  into `cj10244`(`std_id`,`24_hw`,`24_score`,`1_hw`,`1_score`,`0_hw`,`0_score`) values (15,'globdata.ini',3,NULL,NULL,NULL,NULL);

/*Table structure for table `cj142` */

CREATE TABLE `cj142` (
  `std_id` int(11) NOT NULL,
  `21_hw` text,
  `21_score` float DEFAULT NULL,
  `22_hw` text,
  `22_score` float DEFAULT NULL,
  PRIMARY KEY (`std_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `cj142` */

insert  into `cj142`(`std_id`,`21_hw`,`21_score`,`22_hw`,`22_score`) values (10,'eula.1036.txt',NULL,'1.cpp',7);
insert  into `cj142`(`std_id`,`21_hw`,`21_score`,`22_hw`,`22_score`) values (22,'vmware.log',8,'',NULL);
insert  into `cj142`(`std_id`,`21_hw`,`21_score`,`22_hw`,`22_score`) values (30,NULL,NULL,NULL,NULL);

/*Table structure for table `course` */

CREATE TABLE `course` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `period_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `course` */

insert  into `course`(`id`,`code`,`name`,`period_id`,`teacher_id`) values (1,'CS101','Introduction to Computing',1,1);
insert  into `course`(`id`,`code`,`name`,`period_id`,`teacher_id`) values (2,'CS101','Introduction to Computing',2,1);
insert  into `course`(`id`,`code`,`name`,`period_id`,`teacher_id`) values (3,'CS101','Introduction to Computing',3,2);
insert  into `course`(`id`,`code`,`name`,`period_id`,`teacher_id`) values (4,'CS101','Introduction to Computing',4,2);
insert  into `course`(`id`,`code`,`name`,`period_id`,`teacher_id`) values (5,'CS103','Introduction to Internet Technologies and Web Programming',3,3);
insert  into `course`(`id`,`code`,`name`,`period_id`,`teacher_id`) values (6,'CS103','Introduction to Internet Technologies and Web Programming',4,3);
insert  into `course`(`id`,`code`,`name`,`period_id`,`teacher_id`) values (7,'CS105','Introduction to Databases and Data Mining',1,4);
insert  into `course`(`id`,`code`,`name`,`period_id`,`teacher_id`) values (8,'CS105','Introduction to Databases and Data Mining',2,4);
insert  into `course`(`id`,`code`,`name`,`period_id`,`teacher_id`) values (9,'CS118','Introduction to React',1,6);
insert  into `course`(`id`,`code`,`name`,`period_id`,`teacher_id`) values (10,'CS118','Introduction to React',2,6);
insert  into `course`(`id`,`code`,`name`,`period_id`,`teacher_id`) values (11,'CS118','Introduction to React',3,6);
insert  into `course`(`id`,`code`,`name`,`period_id`,`teacher_id`) values (12,'CS118','Introduction to React',4,6);
insert  into `course`(`id`,`code`,`name`,`period_id`,`teacher_id`) values (13,'CS119','Introduction to Lightning Design System',1,7);
insert  into `course`(`id`,`code`,`name`,`period_id`,`teacher_id`) values (14,'CS119','Introduction to Lightning Design System',2,7);
insert  into `course`(`id`,`code`,`name`,`period_id`,`teacher_id`) values (15,'CS119','Introduction to Lightning Design System',3,7);
insert  into `course`(`id`,`code`,`name`,`period_id`,`teacher_id`) values (16,'CS119','Introduction to Lightning Design System',4,7);
insert  into `course`(`id`,`code`,`name`,`period_id`,`teacher_id`) values (17,'CS125','Introduction to Flux',3,8);
insert  into `course`(`id`,`code`,`name`,`period_id`,`teacher_id`) values (18,'CS125','Introduction to Flux',4,8);
insert  into `course`(`id`,`code`,`name`,`period_id`,`teacher_id`) values (19,'CS120','Introduction to Cloud Computing',1,9);
insert  into `course`(`id`,`code`,`name`,`period_id`,`teacher_id`) values (20,'CS120','Introduction to Cloud Computing',2,9);
insert  into `course`(`id`,`code`,`name`,`period_id`,`teacher_id`) values (21,'CS120','Introduction to Cloud Computing',3,9);
insert  into `course`(`id`,`code`,`name`,`period_id`,`teacher_id`) values (22,'CS120','Introduction to Cloud Computing',4,9);
insert  into `course`(`id`,`code`,`name`,`period_id`,`teacher_id`) values (23,'CS121','Introduction to Salesforce',1,1);
insert  into `course`(`id`,`code`,`name`,`period_id`,`teacher_id`) values (24,'CS121','Introduction to Salesforce',2,1);
insert  into `course`(`id`,`code`,`name`,`period_id`,`teacher_id`) values (25,'CS121','Introduction to Salesforce',2,3);
insert  into `course`(`id`,`code`,`name`,`period_id`,`teacher_id`) values (42,'CJ1','Java 101',7,2);
insert  into `course`(`id`,`code`,`name`,`period_id`,`teacher_id`) values (43,'CS201','C 201',7,2);
insert  into `course`(`id`,`code`,`name`,`period_id`,`teacher_id`) values (44,'CJ102','Java 101',7,5);

/*Table structure for table `cs20143` */

CREATE TABLE `cs20143` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `std_id` int(11) DEFAULT NULL,
  `23_hw` text,
  `23_score` double DEFAULT NULL,
  `1_hw` text,
  `1_score` double DEFAULT NULL,
  `2_hw` text,
  `2_score` double DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `cs20143` */

insert  into `cs20143`(`id`,`std_id`,`23_hw`,`23_score`,`1_hw`,`1_score`,`2_hw`,`2_score`) values (1,8,'1.cpp',NULL,NULL,NULL,NULL,NULL);
insert  into `cs20143`(`id`,`std_id`,`23_hw`,`23_score`,`1_hw`,`1_score`,`2_hw`,`2_score`) values (2,10,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `cs20143`(`id`,`std_id`,`23_hw`,`23_score`,`1_hw`,`1_score`,`2_hw`,`2_score`) values (3,30,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `enrollment` */

CREATE TABLE `enrollment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_enrollment` (`course_id`,`student_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `enrollment` */

insert  into `enrollment`(`id`,`course_id`,`student_id`) values (1,1,1);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (25,1,5);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (50,1,9);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (74,1,13);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (98,1,17);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (123,1,21);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (7,2,2);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (31,2,6);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (56,2,10);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (80,2,14);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (104,2,18);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (129,2,22);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (13,3,3);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (37,3,7);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (62,3,11);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (86,3,15);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (110,3,19);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (135,3,23);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (19,4,4);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (43,4,8);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (68,4,12);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (92,4,16);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (116,4,20);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (141,4,24);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (2,5,1);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (26,5,5);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (51,5,9);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (75,5,13);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (99,5,17);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (124,5,21);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (8,6,2);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (32,6,6);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (57,6,10);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (81,6,14);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (105,6,18);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (130,6,22);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (14,7,3);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (38,7,7);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (63,7,11);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (87,7,15);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (111,7,19);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (136,7,23);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (20,8,4);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (44,8,8);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (69,8,12);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (93,8,16);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (117,8,20);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (142,8,24);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (3,9,1);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (27,9,5);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (52,9,9);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (76,9,13);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (100,9,17);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (125,9,21);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (9,10,2);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (33,10,6);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (58,10,10);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (82,10,14);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (106,10,18);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (131,10,22);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (15,11,3);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (39,11,7);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (64,11,11);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (88,11,15);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (112,11,19);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (137,11,23);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (21,12,4);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (45,12,8);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (70,12,12);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (94,12,16);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (118,12,20);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (143,12,24);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (4,13,1);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (28,13,5);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (53,13,9);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (77,13,13);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (101,13,17);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (126,13,21);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (10,14,2);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (34,14,6);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (59,14,10);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (83,14,14);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (107,14,18);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (132,14,22);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (16,15,3);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (40,15,7);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (65,15,11);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (89,15,15);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (113,15,19);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (138,15,23);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (22,16,4);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (46,16,8);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (71,16,12);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (95,16,16);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (119,16,20);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (144,16,24);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (5,17,1);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (29,17,5);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (54,17,9);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (78,17,13);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (102,17,17);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (127,17,21);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (11,18,2);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (35,18,6);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (60,18,10);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (84,18,14);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (108,18,18);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (133,18,22);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (17,19,3);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (41,19,7);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (66,19,11);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (90,19,15);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (114,19,19);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (139,19,23);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (23,20,4);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (47,20,8);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (72,20,12);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (96,20,17);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (120,20,20);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (145,20,24);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (6,21,1);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (30,21,5);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (55,21,9);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (79,21,13);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (103,21,17);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (128,21,21);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (12,22,2);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (36,22,6);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (61,22,10);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (85,22,14);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (109,22,18);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (134,22,22);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (18,23,3);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (42,23,7);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (67,23,11);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (91,23,15);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (115,23,19);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (140,23,23);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (24,24,5);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (48,24,8);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (49,24,9);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (73,24,12);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (97,24,17);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (121,24,20);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (122,24,21);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (146,24,24);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (147,25,11);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (155,40,2);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (170,42,10);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (157,42,22);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (162,42,27);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (164,42,28);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (171,42,29);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (179,42,30);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (168,43,8);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (174,43,10);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (158,43,22);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (166,43,24);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (163,43,27);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (165,43,28);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (172,43,29);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (180,43,30);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (169,44,1);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (167,44,8);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (159,44,24);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (160,44,25);
insert  into `enrollment`(`id`,`course_id`,`student_id`) values (161,44,26);

/*Table structure for table `homework` */

CREATE TABLE `homework` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `homework` */

insert  into `homework`(`id`,`title`,`details`,`course_id`) values (20,'Easy Exercise','Solve the problem on page 32.',35);
insert  into `homework`(`id`,`title`,`details`,`course_id`) values (21,'Easy Exercise','Solve the problem4 on page 23.',42);
insert  into `homework`(`id`,`title`,`details`,`course_id`) values (22,'Test','Develop a sorting program by using quick sort algorithm.',42);
insert  into `homework`(`id`,`title`,`details`,`course_id`) values (23,'Difficult Homework','Make a dummy using c.',43);
insert  into `homework`(`id`,`title`,`details`,`course_id`) values (24,'Easy Homework','Print your name on the screen.',44);

/*Table structure for table `lecture` */

CREATE TABLE `lecture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) DEFAULT NULL,
  `description` text,
  `path` text,
  `size` bigint(20) DEFAULT NULL,
  `uploaded_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `lecture` */

insert  into `lecture`(`id`,`teacher_id`,`description`,`path`,`size`,`uploaded_time`) values (10,18,NULL,'sdf.docx',2005,'2017-10-06 23:46:58');
insert  into `lecture`(`id`,`teacher_id`,`description`,`path`,`size`,`uploaded_time`) values (11,18,NULL,'iOS Swift Game Development Cookbook Second Edition.pdf',4146309,'2017-10-06 23:47:02');
insert  into `lecture`(`id`,`teacher_id`,`description`,`path`,`size`,`uploaded_time`) values (12,18,NULL,'CellTrack 3 EN.pdf',144778,'2017-10-06 23:47:09');
insert  into `lecture`(`id`,`teacher_id`,`description`,`path`,`size`,`uploaded_time`) values (13,2,NULL,'iOS Swift Game Development Cookbook Second Edition.pdf',4146309,'2017-10-07 00:07:25');
insert  into `lecture`(`id`,`teacher_id`,`description`,`path`,`size`,`uploaded_time`) values (14,2,NULL,'1.cpp',3601,'2017-10-10 04:07:11');
insert  into `lecture`(`id`,`teacher_id`,`description`,`path`,`size`,`uploaded_time`) values (20,2,NULL,'mail.txt',134,'2017-10-10 04:08:44');
insert  into `lecture`(`id`,`teacher_id`,`description`,`path`,`size`,`uploaded_time`) values (26,2,NULL,'mail.txt',134,'2017-10-10 04:20:56');

/*Table structure for table `period` */

CREATE TABLE `period` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `period` */

insert  into `period`(`id`,`name`) values (1,'Fall 2014');
insert  into `period`(`id`,`name`) values (2,'Spring 2015');
insert  into `period`(`id`,`name`) values (3,'Fall 2015');
insert  into `period`(`id`,`name`) values (4,'Spring 2016');
insert  into `period`(`id`,`name`) values (5,'Fall 2016');
insert  into `period`(`id`,`name`) values (6,'Spring 2017');
insert  into `period`(`id`,`name`) values (7,'Fall 2017');

/*Table structure for table `student` */

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`id`,`name`,`pwd`) values (1,'Elsa Tobin','elsa');
insert  into `student`(`id`,`name`,`pwd`) values (2,'Peter Stone','peter');
insert  into `student`(`id`,`name`,`pwd`) values (3,'Robert Wilson','robert');
insert  into `student`(`id`,`name`,`pwd`) values (4,'Sadie Wilder','sadie');
insert  into `student`(`id`,`name`,`pwd`) values (5,'John Danny','john');
insert  into `student`(`id`,`name`,`pwd`) values (6,'Jack Kaur','jack');
insert  into `student`(`id`,`name`,`pwd`) values (7,'Charles Thomas','charles');
insert  into `student`(`id`,`name`,`pwd`) values (8,'Isobel Harris','isobel');
insert  into `student`(`id`,`name`,`pwd`) values (9,'Donovan Mack','donovan');
insert  into `student`(`id`,`name`,`pwd`) values (10,'Lexi Rosales','lexi');
insert  into `student`(`id`,`name`,`pwd`) values (11,'Lucas Lawson','lucas');
insert  into `student`(`id`,`name`,`pwd`) values (12,'Louis Chapman','louis');
insert  into `student`(`id`,`name`,`pwd`) values (13,'Jayde Lee','jayde');
insert  into `student`(`id`,`name`,`pwd`) values (14,'Gunnar Wiggins','gunnar');
insert  into `student`(`id`,`name`,`pwd`) values (15,'Ethan Joyner','ethan');
insert  into `student`(`id`,`name`,`pwd`) values (16,'Erik Campbell','erik');
insert  into `student`(`id`,`name`,`pwd`) values (17,'Grace Morgan','grace');
insert  into `student`(`id`,`name`,`pwd`) values (18,'Emilia Rees','emilia');
insert  into `student`(`id`,`name`,`pwd`) values (19,'Luna Bernard','luna');
insert  into `student`(`id`,`name`,`pwd`) values (20,'Jamie Graham','jamie');
insert  into `student`(`id`,`name`,`pwd`) values (21,'Daniel Lynn','daniel');
insert  into `student`(`id`,`name`,`pwd`) values (22,'Adriel Myers','adriel');
insert  into `student`(`id`,`name`,`pwd`) values (23,'Camryn Hancock','camryn');
insert  into `student`(`id`,`name`,`pwd`) values (24,'Tatiana Gutierrez','tatiana');
insert  into `student`(`id`,`name`,`pwd`) values (25,'Rosalie Pollard','rosalie');
insert  into `student`(`id`,`name`,`pwd`) values (26,'Ellis Adams','ellis');
insert  into `student`(`id`,`name`,`pwd`) values (27,'Keegan Clayton','keegan');
insert  into `student`(`id`,`name`,`pwd`) values (28,'John Reid','john');
insert  into `student`(`id`,`name`,`pwd`) values (29,'Alexa Vance','alexa');
insert  into `student`(`id`,`name`,`pwd`) values (30,'Maria May','maria');
insert  into `student`(`id`,`name`,`pwd`) values (31,'Louis Reynolds','louis');
insert  into `student`(`id`,`name`,`pwd`) values (33,'Todd Ruiz','todd');

/*Table structure for table `teacher` */

CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `university` varchar(30) DEFAULT NULL,
  `department` varchar(30) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  `allowed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`email`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

/*Data for the table `teacher` */

insert  into `teacher`(`id`,`name`,`university`,`department`,`email`,`pwd`,`allowed`) values (32,'Abby Riley',NULL,NULL,'abby.R@outlook.com','abby',NULL);
insert  into `teacher`(`id`,`name`,`university`,`department`,`email`,`pwd`,`allowed`) values (14,'Ana Mitchell',NULL,NULL,'ana.M@bulletmail.com','ana',1);
insert  into `teacher`(`id`,`name`,`university`,`department`,`email`,`pwd`,`allowed`) values (16,'Bobby Chambers',NULL,NULL,'bobby.C@gmail.com','bobby',NULL);
insert  into `teacher`(`id`,`name`,`university`,`department`,`email`,`pwd`,`allowed`) values (1,'Brinley Sherman',NULL,NULL,'brinley.S@mail.com','brinley',NULL);
insert  into `teacher`(`id`,`name`,`university`,`department`,`email`,`pwd`,`allowed`) values (2,'Brown Davies','Cambridge University','Data Analysis','brown.D@gmail.com','brown',2);
insert  into `teacher`(`id`,`name`,`university`,`department`,`email`,`pwd`,`allowed`) values (20,'Desmond Hodges',NULL,NULL,'desmond.H@gmail.com','desmond',NULL);
insert  into `teacher`(`id`,`name`,`university`,`department`,`email`,`pwd`,`allowed`) values (38,'Diana Kirby',NULL,NULL,'diana.K@gmail.com','diana',NULL);
insert  into `teacher`(`id`,`name`,`university`,`department`,`email`,`pwd`,`allowed`) values (36,'Gisselle Medina',NULL,NULL,'gisselle.M@mail.com','gissele',NULL);
insert  into `teacher`(`id`,`name`,`university`,`department`,`email`,`pwd`,`allowed`) values (18,'Kaia Rosa',NULL,NULL,'kaia.R@gmail.com','kaia',1);
insert  into `teacher`(`id`,`name`,`university`,`department`,`email`,`pwd`,`allowed`) values (22,'Kolten Grimes',NULL,NULL,'kolten.G@outlook.com','kolten',NULL);
insert  into `teacher`(`id`,`name`,`university`,`department`,`email`,`pwd`,`allowed`) values (12,'Leona Clemons',NULL,NULL,'leona.C@outlook.com','leona',NULL);
insert  into `teacher`(`id`,`name`,`university`,`department`,`email`,`pwd`,`allowed`) values (28,'Lorelei Joyner',NULL,NULL,'lerelei.J@bulletmail.com','lorelei',NULL);
insert  into `teacher`(`id`,`name`,`university`,`department`,`email`,`pwd`,`allowed`) values (3,'Libby Robinson',NULL,NULL,'libby.R@protonmail.com','libby',1);
insert  into `teacher`(`id`,`name`,`university`,`department`,`email`,`pwd`,`allowed`) values (35,'Maia Alexander',NULL,NULL,'maia.A@me.com','maia',NULL);
insert  into `teacher`(`id`,`name`,`university`,`department`,`email`,`pwd`,`allowed`) values (10,'Mason Saunders',NULL,NULL,'mason.S@bulletmail.com','mason',NULL);
insert  into `teacher`(`id`,`name`,`university`,`department`,`email`,`pwd`,`allowed`) values (34,'Reece Harvey',NULL,NULL,'reece.H@mail.com','reece',NULL);
insert  into `teacher`(`id`,`name`,`university`,`department`,`email`,`pwd`,`allowed`) values (39,'Remington Gomez',NULL,NULL,'remington.G@me.com','remington',NULL);
insert  into `teacher`(`id`,`name`,`university`,`department`,`email`,`pwd`,`allowed`) values (33,'Ryan Atkinson',NULL,NULL,'ryan.A@mail.com','ryan',NULL);
insert  into `teacher`(`id`,`name`,`university`,`department`,`email`,`pwd`,`allowed`) values (37,'Sarah Matthews',NULL,NULL,'sarah.M@outlook.com','sarah',1);
insert  into `teacher`(`id`,`name`,`university`,`department`,`email`,`pwd`,`allowed`) values (30,'Sariyah Keller',NULL,NULL,'sariyah.K@me.com','sariyah',NULL);
insert  into `teacher`(`id`,`name`,`university`,`department`,`email`,`pwd`,`allowed`) values (24,'Skylar Carver',NULL,NULL,'skylar.C@outlook.com','skylar',NULL);
insert  into `teacher`(`id`,`name`,`university`,`department`,`email`,`pwd`,`allowed`) values (5,'Smith Bill',NULL,NULL,'smith.B@mail.com','smith',1);
insert  into `teacher`(`id`,`name`,`university`,`department`,`email`,`pwd`,`allowed`) values (6,'Terrance Meyers',NULL,NULL,'terrance.M@gmail.com','terrance',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
