CREATE TABLE IF NOT EXISTS `backup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `createdDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `lastModifiedDate` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `exam` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `maxMarks` int(11) DEFAULT NULL,
  `passPercent` int(11) DEFAULT NULL,
  `imageId` varchar(255) DEFAULT NULL,
  `createdDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `lastModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdById` int(11) DEFAULT NULL,
  `lastModifiedById` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `timeAllowed` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`,`code`),
  KEY `createdById` (`createdById`),
  KEY `lastModifiedById` (`lastModifiedById`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `paper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `examId` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `result` tinyint(1) DEFAULT NULL,
  `percent` int(11) DEFAULT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastModifiedDate` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(255) DEFAULT NULL,
  `timeTaken` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `examId` (`examId`,`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `paperanswer` (
  `paperId` int(11) NOT NULL,
  `answer` varchar(10) DEFAULT NULL,
  `correct` tinyint(1) DEFAULT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastModifiedDate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `questionId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `paperId` (`paperId`),
  KEY `questionId` (`questionId`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `question` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `questionText` varchar(5000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `a` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `b` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `c` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `d` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `e` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `f` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `aCorrect` tinyint(1) DEFAULT NULL,
  `bCorrect` tinyint(1) DEFAULT NULL,
  `cCorrect` tinyint(1) DEFAULT NULL,
  `dCorrect` tinyint(1) DEFAULT NULL,
  `eCorrect` tinyint(1) DEFAULT NULL,
  `fCorrect` tinyint(1) DEFAULT NULL,
  `examId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `examId` (`examId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'user',
  `active` tinyint(1) DEFAULT NULL,
  `salt` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastModifiedDate` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `name` (`name`,`email`),
  KEY `role` (`role`),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=338 DEFAULT CHARSET=latin1;

INSERT INTO `backup` (`id`,`date`) VALUES (1,'2016-07-06 21:33:11.000');
INSERT INTO `backup` (`id`,`date`) VALUES (5,'2016-08-09 16:48:26.000');
INSERT INTO `backup` (`id`,`date`) VALUES (6,'2016-08-09 21:08:48.000');
INSERT INTO `backup` (`id`,`date`) VALUES (7,'2016-08-09 21:11:31.000');
INSERT INTO `backup` (`id`,`date`) VALUES (8,'2016-08-09 21:14:11.000');
INSERT INTO `backup` (`id`,`date`) VALUES (9,'2016-08-09 21:15:48.000');

INSERT INTO `category` (`id`,`name`,`createdDate`,`lastModifiedDate`) VALUES (1,'Physics','2016-07-23 09:57:39.000','0000-00-00 00:00:00');
INSERT INTO `category` (`id`,`name`,`createdDate`,`lastModifiedDate`) VALUES (2,'Chemistry','2016-07-23 09:57:39.000','0000-00-00 00:00:00');
INSERT INTO `category` (`id`,`name`,`createdDate`,`lastModifiedDate`) VALUES (3,'Biology','2016-07-22 22:57:39.000','0000-00-00 00:00:00');
INSERT INTO `category` (`id`,`name`,`createdDate`,`lastModifiedDate`) VALUES (4,'General Studies','2016-07-23 09:57:39.000','0000-00-00 00:00:00');
INSERT INTO `category` (`id`,`name`,`createdDate`,`lastModifiedDate`) VALUES (5,'Jumpa Hillary','2016-07-23 05:52:14.000','0000-00-00 00:00:00');
INSERT INTO `category` (`id`,`name`,`createdDate`,`lastModifiedDate`) VALUES (6,'Jumbo','2016-07-26 14:22:11.000','0000-00-00 00:00:00');

INSERT INTO `exam` (`id`,`name`,`code`,`description`,`category`,`maxMarks`,`passPercent`,`imageId`,`createdDate`,`lastModifiedDate`,`createdById`,`lastModifiedById`,`active`,`timeAllowed`) VALUES (14,'Mathematics','Math','Mathematics Description','General Studies',100,30,'10',NULL,'2016-07-17 07:23:17.000',NULL,NULL,1,45);
INSERT INTO `exam` (`id`,`name`,`code`,`description`,`category`,`maxMarks`,`passPercent`,`imageId`,`createdDate`,`lastModifiedDate`,`createdById`,`lastModifiedById`,`active`,`timeAllowed`) VALUES (18,'Chemistry','Chem','This is Chemistry Exam','Chemistry',90,10,'15','2016-07-17 01:44:03.000','2016-07-17 02:05:09.000',NULL,NULL,NULL,100);
INSERT INTO `exam` (`id`,`name`,`code`,`description`,`category`,`maxMarks`,`passPercent`,`imageId`,`createdDate`,`lastModifiedDate`,`createdById`,`lastModifiedById`,`active`,`timeAllowed`) VALUES (29,'Test','Test','Description','Biology',100,45,'3','2016-07-18 04:53:48.000','2016-07-18 04:53:48.000',NULL,NULL,NULL,1);
INSERT INTO `exam` (`id`,`name`,`code`,`description`,`category`,`maxMarks`,`passPercent`,`imageId`,`createdDate`,`lastModifiedDate`,`createdById`,`lastModifiedById`,`active`,`timeAllowed`) VALUES (30,'Name','Cod','Biology','Biology',100,45,'3','2016-07-18 04:58:25.000','2016-07-18 04:58:25.000',NULL,NULL,NULL,100);
INSERT INTO `exam` (`id`,`name`,`code`,`description`,`category`,`maxMarks`,`passPercent`,`imageId`,`createdDate`,`lastModifiedDate`,`createdById`,`lastModifiedById`,`active`,`timeAllowed`) VALUES (31,'Alpha Test','Alpha','Alpha This contains valid questions for the exam testing','General Studies',100,45,'2','2016-07-16 23:42:02.000','2016-07-16 23:42:02.000',NULL,NULL,1,60);
INSERT INTO `exam` (`id`,`name`,`code`,`description`,`category`,`maxMarks`,`passPercent`,`imageId`,`createdDate`,`lastModifiedDate`,`createdById`,`lastModifiedById`,`active`,`timeAllowed`) VALUES (39,'Happy','Happy','Happy','Happy',100,40,'2','2016-08-02 08:05:48.000','2016-08-02 08:05:48.000',NULL,NULL,1,60);
INSERT INTO `exam` (`id`,`name`,`code`,`description`,`category`,`maxMarks`,`passPercent`,`imageId`,`createdDate`,`lastModifiedDate`,`createdById`,`lastModifiedById`,`active`,`timeAllowed`) VALUES (40,'Go Lucky','Go Lucky','Go Lucky','Biology',100,60,'3','2016-08-02 08:05:48.000','2016-08-02 08:05:48.000',NULL,NULL,1,90);
INSERT INTO `exam` (`id`,`name`,`code`,`description`,`category`,`maxMarks`,`passPercent`,`imageId`,`createdDate`,`lastModifiedDate`,`createdById`,`lastModifiedById`,`active`,`timeAllowed`) VALUES (41,'Yes','MyCode','Description of the Exam','Jumbo',100,45,'0','2016-08-06 17:37:43.000','2016-08-06 17:37:43.000',NULL,NULL,1,100);
INSERT INTO `exam` (`id`,`name`,`code`,`description`,`category`,`maxMarks`,`passPercent`,`imageId`,`createdDate`,`lastModifiedDate`,`createdById`,`lastModifiedById`,`active`,`timeAllowed`) VALUES (42,'Inactive Exam','CODE','This exam is inactive','Physics',100,45,'0','2016-08-07 18:29:33.000','2016-08-07 18:29:33.000',NULL,NULL,NULL,30);

INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (1,31,4,0,25,'2016-07-22 07:39:49.000','2016-07-22 07:41:04.000','Complete',0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (3,31,4,1,75,'2016-07-22 10:48:07.000','2016-07-22 10:48:23.000','Complete',0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (4,31,4,0,25,'2016-07-22 11:30:51.000','2016-07-22 11:31:04.000','Complete',0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (5,31,1,NULL,NULL,'2016-07-24 08:26:26.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (6,31,1,NULL,NULL,'2016-07-24 08:27:37.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (7,31,1,NULL,NULL,'2016-07-24 08:27:56.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (8,31,1,NULL,NULL,'2016-07-24 08:29:56.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (9,31,1,NULL,NULL,'2016-07-24 08:32:26.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (10,31,1,NULL,NULL,'2016-07-24 08:33:09.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (11,31,1,NULL,NULL,'2016-07-24 08:35:13.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (12,31,1,NULL,NULL,'2016-07-24 08:35:51.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (13,31,1,NULL,NULL,'2016-07-24 08:35:58.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (14,31,1,NULL,NULL,'2016-07-24 08:36:11.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (15,31,1,NULL,NULL,'2016-07-24 08:36:35.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (16,31,1,NULL,NULL,'2016-07-24 08:37:16.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (17,31,1,0,25,'2016-07-24 09:55:27.000','2016-07-24 09:55:38.000','Complete',0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (18,31,1,NULL,NULL,'2016-08-01 10:36:25.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (19,31,1,NULL,NULL,'2016-08-01 10:39:23.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (20,31,1,NULL,NULL,'2016-08-01 10:40:06.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (21,31,1,NULL,NULL,'2016-08-01 10:41:55.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (22,31,1,NULL,NULL,'2016-08-01 10:43:15.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (23,31,1,NULL,NULL,'2016-08-01 10:43:54.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (24,31,1,NULL,NULL,'2016-08-01 10:44:20.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (25,31,1,NULL,NULL,'2016-08-01 10:44:46.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (26,31,1,NULL,NULL,'2016-08-01 10:45:01.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (27,31,1,NULL,NULL,'2016-08-01 10:45:48.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (28,31,1,NULL,NULL,'2016-08-01 10:45:59.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (29,31,1,NULL,NULL,'2016-08-01 10:46:15.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (30,31,1,NULL,NULL,'2016-08-01 10:46:24.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (31,31,1,NULL,NULL,'2016-08-01 10:46:46.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (32,31,1,NULL,NULL,'2016-08-01 10:48:18.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (33,31,1,NULL,NULL,'2016-08-01 10:49:44.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (34,31,1,NULL,NULL,'2016-08-01 10:50:12.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (35,31,1,NULL,NULL,'2016-08-01 10:50:52.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (36,31,1,NULL,NULL,'2016-08-01 10:51:59.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (37,31,1,NULL,NULL,'2016-08-01 10:53:41.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (38,31,1,NULL,NULL,'2016-08-01 11:12:30.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (39,31,1,NULL,NULL,'2016-08-01 11:24:19.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (40,31,1,NULL,NULL,'2016-08-01 11:25:37.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (41,31,1,NULL,NULL,'2016-08-01 11:28:18.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (42,31,1,NULL,NULL,'2016-08-01 11:29:01.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (43,31,1,NULL,NULL,'2016-08-01 11:41:18.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (44,31,1,0,0,'2016-08-01 11:42:07.000','2016-08-01 11:42:21.000','Complete',0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (45,31,1,NULL,NULL,'2016-08-01 11:48:19.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (46,31,1,0,25,'2016-08-01 11:49:10.000','2016-08-01 11:49:27.000','Complete',0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (47,31,1,0,25,'2016-08-01 11:49:48.000','2016-08-01 11:54:27.000','Complete',0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (48,31,1,0,25,'2016-08-01 19:46:03.000','2016-08-01 19:46:19.000','Complete',1);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (49,31,1,NULL,NULL,'2016-08-01 19:55:23.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (50,31,1,NULL,NULL,'2016-08-01 19:57:39.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (51,31,1,0,0,'2016-08-01 19:57:53.000','2016-08-01 19:58:06.000','Complete',1);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (52,31,1,NULL,NULL,'2016-08-01 19:58:53.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (53,31,1,NULL,NULL,'2016-08-01 20:01:52.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (54,31,1,1,75,'2016-08-01 20:02:17.000','2016-08-01 20:02:29.000','Complete',1);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (55,31,1,0,25,'2016-08-01 20:02:59.000','2016-08-01 20:03:11.000','Complete',1);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (56,31,1,1,50,'2016-08-01 20:03:59.000','2016-08-01 20:04:14.000','Complete',1);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (57,31,1,0,25,'2016-08-01 20:05:42.000','2016-08-01 20:05:51.000','Complete',1);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (58,31,1,NULL,NULL,'2016-08-01 20:07:41.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (59,41,1,NULL,NULL,'2016-08-06 17:41:45.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (60,41,1,NULL,NULL,'2016-08-06 17:54:43.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (61,41,1,NULL,NULL,'2016-08-06 17:55:08.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (62,41,1,NULL,NULL,'2016-08-06 17:55:19.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (63,41,1,NULL,NULL,'2016-08-06 17:56:22.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (64,41,1,NULL,NULL,'2016-08-06 17:56:33.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (65,41,1,NULL,NULL,'2016-08-06 17:56:54.000','0000-00-00 00:00:00',NULL,0);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (66,31,1,0,25,'2016-08-06 19:14:15.000','2016-08-06 19:14:36.000','Complete',1);
INSERT INTO `paper` (`id`,`examId`,`userId`,`result`,`percent`,`createdDate`,`lastModifiedDate`,`status`,`timeTaken`) VALUES (67,42,336,NULL,NULL,'2016-08-07 18:30:21.000','0000-00-00 00:00:00',NULL,0);

INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (1,'a',1,'2016-07-22 07:40:46.000',NULL,1,4);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (1,'a',0,'2016-07-22 07:40:51.000',NULL,2,5);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (1,'a',0,'2016-07-22 07:40:55.000',NULL,3,6);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (3,'a',1,'2016-07-22 10:48:11.000',NULL,4,4);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (3,'c',1,'2016-07-22 10:48:15.000',NULL,5,5);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (3,'d',1,'2016-07-22 10:48:17.000',NULL,6,6);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (4,'a',1,'2016-07-22 11:30:54.000',NULL,7,4);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (4,'a',0,'2016-07-22 11:30:56.000',NULL,8,5);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (4,'a',0,'2016-07-22 11:30:59.000',NULL,9,6);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (10,'',0,'2016-07-24 08:33:22.000',NULL,10,4);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (10,'',0,'2016-07-24 08:33:24.000',NULL,11,5);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (10,'',0,'2016-07-24 08:33:26.000',NULL,12,6);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (10,'',0,'2016-07-24 08:33:31.000',NULL,13,7);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (14,'',0,'2016-07-24 08:36:23.000',NULL,14,4);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (15,'',0,'2016-07-24 08:37:01.000',NULL,15,4);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (15,'',0,'2016-07-24 08:37:02.000',NULL,16,5);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (15,'',0,'2016-07-24 08:37:03.000',NULL,17,6);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (16,'',0,'2016-07-24 08:37:21.000',NULL,18,4);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (16,'',0,'2016-07-24 08:37:21.000',NULL,19,5);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (16,'',0,'2016-07-24 08:37:22.000',NULL,20,6);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (17,'a',1,'2016-07-24 09:55:30.000',NULL,21,4);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (17,'a',0,'2016-07-24 09:55:32.000',NULL,22,5);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (17,'a',0,'2016-07-24 09:55:34.000',NULL,23,6);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (17,'ab',0,'2016-07-24 09:55:37.000',NULL,24,7);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (39,'',0,'2016-08-01 11:25:01.000',NULL,25,4);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (39,'',0,'2016-08-01 11:25:03.000',NULL,26,5);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (39,'',0,'2016-08-01 11:25:08.000',NULL,27,6);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (40,'',0,'2016-08-01 11:25:41.000',NULL,28,4);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (40,'',0,'2016-08-01 11:25:42.000',NULL,29,5);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (40,'',0,'2016-08-01 11:25:44.000',NULL,30,6);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (40,'',0,'2016-08-01 11:26:08.000',NULL,31,7);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (41,'a',1,'2016-08-01 11:28:22.000',NULL,32,4);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (41,'b',0,'2016-08-01 11:28:26.000',NULL,33,5);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (41,'b',0,'2016-08-01 11:28:29.000',NULL,34,6);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (41,'bc',0,'2016-08-01 11:28:34.000',NULL,35,7);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (42,'',0,'2016-08-01 11:29:04.000',NULL,36,4);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (42,'',0,'2016-08-01 11:29:04.000',NULL,37,5);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (42,'',0,'2016-08-01 11:29:05.000',NULL,38,6);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (42,'',0,'2016-08-01 11:29:06.000',NULL,39,7);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (44,'',0,'2016-08-01 11:42:11.000',NULL,40,4);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (44,'',0,'2016-08-01 11:42:17.000',NULL,41,5);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (44,'',0,'2016-08-01 11:42:17.000',NULL,42,6);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (44,'',0,'2016-08-01 11:42:18.000',NULL,43,7);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (46,'b',0,'2016-08-01 11:49:17.000',NULL,44,4);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (46,'c',1,'2016-08-01 11:49:20.000',NULL,45,5);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (46,'b',0,'2016-08-01 11:49:22.000',NULL,46,6);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (46,'bc',0,'2016-08-01 11:49:25.000',NULL,47,7);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (47,'a',1,'2016-08-01 11:49:52.000',NULL,48,4);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (47,'',0,'2016-08-01 11:54:22.000',NULL,49,5);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (47,'',0,'2016-08-01 11:54:23.000',NULL,50,6);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (47,'',0,'2016-08-01 11:54:25.000',NULL,51,7);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (48,'a',1,'2016-08-01 19:46:08.000',NULL,52,4);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (48,'b',0,'2016-08-01 19:46:10.000',NULL,53,5);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (48,'b',0,'2016-08-01 19:46:12.000',NULL,54,6);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (48,'bc',0,'2016-08-01 19:46:15.000',NULL,55,7);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (51,'',0,'2016-08-01 19:58:01.000',NULL,56,4);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (51,'',0,'2016-08-01 19:58:02.000',NULL,57,5);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (51,'',0,'2016-08-01 19:58:03.000',NULL,58,6);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (51,'',0,'2016-08-01 19:58:03.000',NULL,59,7);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (53,'d',0,'2016-08-01 20:01:55.000',NULL,60,4);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (54,'a',1,'2016-08-01 20:02:20.000',NULL,61,4);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (54,'c',1,'2016-08-01 20:02:22.000',NULL,62,5);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (54,'d',1,'2016-08-01 20:02:25.000',NULL,63,6);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (55,'b',0,'2016-08-01 20:03:03.000',NULL,64,4);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (55,'d',0,'2016-08-01 20:03:05.000',NULL,65,5);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (55,'d',1,'2016-08-01 20:03:07.000',NULL,66,6);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (55,'c',0,'2016-08-01 20:03:09.000',NULL,67,7);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (56,'a',1,'2016-08-01 20:04:05.000',NULL,68,4);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (56,'c',1,'2016-08-01 20:04:08.000',NULL,69,5);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (56,'b',0,'2016-08-01 20:04:10.000',NULL,70,6);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (56,'b',0,'2016-08-01 20:04:12.000',NULL,71,7);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (57,'a',1,'2016-08-01 20:05:44.000',NULL,72,4);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (57,'b',0,'2016-08-01 20:05:47.000',NULL,73,5);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (57,'b',0,'2016-08-01 20:05:49.000',NULL,74,6);
INSERT INTO `paperanswer` (`paperId`,`answer`,`correct`,`createdDate`,`lastModifiedDate`,`id`,`questionId`) VALUES (57,'c',0,'2016-08-01 20:05:51.000',NULL,75,7);

INSERT INTO `question` (`id`,`name`,`questionText`,`a`,`active`,`b`,`c`,`d`,`e`,`f`,`aCorrect`,`bCorrect`,`cCorrect`,`dCorrect`,`eCorrect`,`fCorrect`,`examId`) VALUES (4,'Q1','Qutub Minar is which state ?\nPlease identify the state correctly, else a negative mark can be applied','Delhi',1,'Agra','Indore','Jaipur','','',1,0,0,0,0,0,31);
INSERT INTO `question` (`id`,`name`,`questionText`,`a`,`active`,`b`,`c`,`d`,`e`,`f`,`aCorrect`,`bCorrect`,`cCorrect`,`dCorrect`,`eCorrect`,`fCorrect`,`examId`) VALUES (5,'Q2','Ocean is in which state ?','Gas',1,'Solid','Liquid','Plasma','','',0,0,1,0,0,0,31);
INSERT INTO `question` (`id`,`name`,`questionText`,`a`,`active`,`b`,`c`,`d`,`e`,`f`,`aCorrect`,`bCorrect`,`cCorrect`,`dCorrect`,`eCorrect`,`fCorrect`,`examId`) VALUES (6,'Q3','Which is the odd man out ?','1',1,'3','5','8','','',0,0,0,1,0,0,31);
INSERT INTO `question` (`id`,`name`,`questionText`,`a`,`active`,`b`,`c`,`d`,`e`,`f`,`aCorrect`,`bCorrect`,`cCorrect`,`dCorrect`,`eCorrect`,`fCorrect`,`examId`) VALUES (7,'Q4','Topcoder Tracks','Design',1,'Development','Data Science','SRM','','',1,1,1,0,0,0,31);
INSERT INTO `question` (`id`,`name`,`questionText`,`a`,`active`,`b`,`c`,`d`,`e`,`f`,`aCorrect`,`bCorrect`,`cCorrect`,`dCorrect`,`eCorrect`,`fCorrect`,`examId`) VALUES (8,'Aaa ja','This is question','Option A',1,'Option B','','','','',1,1,0,0,0,0,30);
INSERT INTO `question` (`id`,`name`,`questionText`,`a`,`active`,`b`,`c`,`d`,`e`,`f`,`aCorrect`,`bCorrect`,`cCorrect`,`dCorrect`,`eCorrect`,`fCorrect`,`examId`) VALUES (9,'Dude Question','Are you a Dude ?','Yes',1,'No','','','','',1,0,0,0,0,0,18);
INSERT INTO `question` (`id`,`name`,`questionText`,`a`,`active`,`b`,`c`,`d`,`e`,`f`,`aCorrect`,`bCorrect`,`cCorrect`,`dCorrect`,`eCorrect`,`fCorrect`,`examId`) VALUES (10,'Q1','This is my Question','Option A',1,'Option B','','','','',1,0,0,0,0,0,28);
INSERT INTO `question` (`id`,`name`,`questionText`,`a`,`active`,`b`,`c`,`d`,`e`,`f`,`aCorrect`,`bCorrect`,`cCorrect`,`dCorrect`,`eCorrect`,`fCorrect`,`examId`) VALUES (11,'My quest','Q Text','Option A',1,'Option B','Option C','Option D','Option EF','',1,1,1,1,1,0,35);
INSERT INTO `question` (`id`,`name`,`questionText`,`a`,`active`,`b`,`c`,`d`,`e`,`f`,`aCorrect`,`bCorrect`,`cCorrect`,`dCorrect`,`eCorrect`,`fCorrect`,`examId`) VALUES (12,'Inactive Exam Question','Q Text','Option A',1,'Option B','','','','',1,0,0,0,0,0,42);

INSERT INTO `user` (`id`,`name`,`email`,`role`,`active`,`salt`,`password`,`createdDate`,`lastModifiedDate`) VALUES (1,'ritesh','admin@admin.com','admin',1,'myQHcvVgfTiZgzDOgxMCVg==','zv/1gtdQxP6jOzTmixkseC0u+VJFr0ixpe+cL5Nrla2uPYtgMHb6M3Yin3mGiC3mRpAIgojT59CbTyVg2ULH7g==','2016-07-21 14:03:55.000','2016-08-06 18:47:06.000');
INSERT INTO `user` (`id`,`name`,`email`,`role`,`active`,`salt`,`password`,`createdDate`,`lastModifiedDate`) VALUES (3,'another','ab@ab.com','user',1,'k9owLdwFrdXhmG7DiKnoRg==','HNPB43ywO5Y6gmVfkUsrMmX7mf82l36QweFschhyxAFQSzPPIQis93LmsjAseCFp7KuunxDGcF84o1OaICX8ZQ==','2016-07-21 21:45:33.000','0000-00-00 00:00:00');
INSERT INTO `user` (`id`,`name`,`email`,`role`,`active`,`salt`,`password`,`createdDate`,`lastModifiedDate`) VALUES (15,'abcdef','abc23@abc.com','user',1,'Bf9bvdHkfiwa4otjE7Blcw==','v9mRUyttce67OyD72aKD+z6dgFW4TopQdA1v5S+ntmI64Mn9K8VYnApzYBfGKla3hSj0cRCb5kNhc4BCcHYrOA==','2016-07-26 04:44:44.000','0000-00-00 00:00:00');
INSERT INTO `user` (`id`,`name`,`email`,`role`,`active`,`salt`,`password`,`createdDate`,`lastModifiedDate`) VALUES (335,'abc','bob@bob.com','user',1,'VHxrwMLkZfK2+A4zyEy8WQ==','OMUpMtL4iqogDN/ElpuwlXzdtaldiLMgnBdhF835dcwiDSJjUz2H/Pnsj0E/1wolPInofJVIdKYHFRhaXC//+A==','2016-07-29 02:14:21.000','2016-07-29 05:07:53.000');
INSERT INTO `user` (`id`,`name`,`email`,`role`,`active`,`salt`,`password`,`createdDate`,`lastModifiedDate`) VALUES (336,'ritesh','jumbo@jumbo.com','user',1,'xV04vz9oneGBDOrqYEvLRA==','AZqQo4WV4V0kbR+vnXzDU9ac88vQUMJ8G21/6TBr6Wu2u/GwN8jsTyT1UkHj/DEAujSMBwRYRoRQdJ0nftVqCQ==','2016-08-07 18:03:18.000','2016-08-07 18:28:40.000');
INSERT INTO `user` (`id`,`name`,`email`,`role`,`active`,`salt`,`password`,`createdDate`,`lastModifiedDate`) VALUES (337,'abc','jumbo@jumbo1.com','user',0,'MAx/J9sBVm9SHVLR0/67Vg==','9LFjjKtlr4y19lyrMomnyPbnH+DUM32Ek9Fw19moIURFsDqgletzY5twplVCVXf3MKF06LpBr9/Q3hC1dwHVxg==','2016-08-07 18:03:55.000','2016-08-07 18:28:21.000');