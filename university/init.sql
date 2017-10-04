/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100113
 Source Host           : localhost:3306
 Source Schema         : my_db

 Target Server Type    : MySQL
 Target Server Version : 100113
 File Encoding         : 65001

 Date: 04/10/2017 01:45:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cj10244
-- ----------------------------
DROP TABLE IF EXISTS `cj10244`;
CREATE TABLE `cj10244`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `std_id` int(11) NULL DEFAULT NULL,
  `24_hw` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `24_score` double NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cj142
-- ----------------------------
DROP TABLE IF EXISTS `cj142`;
CREATE TABLE `cj142`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `std_id` int(11) NULL DEFAULT NULL,
  `21_hw` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `21_score` double NULL DEFAULT NULL,
  `22_hw` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `22_score` double NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `credits` int(11) NULL DEFAULT NULL,
  `period_id` int(11) NULL DEFAULT NULL,
  `teacher_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, 'CS101', 'Introduction to Computing', 4, 1, 1);
INSERT INTO `course` VALUES (2, 'CS101', 'Introduction to Computing', 4, 2, 1);
INSERT INTO `course` VALUES (3, 'CS101', 'Introduction to Computing', 4, 3, 2);
INSERT INTO `course` VALUES (4, 'CS101', 'Introduction to Computing', 4, 4, 2);
INSERT INTO `course` VALUES (5, 'CS103', 'Introduction to Internet Technologies and Web Programming', 4, 3, 3);
INSERT INTO `course` VALUES (6, 'CS103', 'Introduction to Internet Technologies and Web Programming', 4, 4, 3);
INSERT INTO `course` VALUES (7, 'CS105', 'Introduction to Databases and Data Mining', 4, 1, 4);
INSERT INTO `course` VALUES (8, 'CS105', 'Introduction to Databases and Data Mining', 4, 2, 4);
INSERT INTO `course` VALUES (9, 'CS118', 'Introduction to React', 4, 1, 6);
INSERT INTO `course` VALUES (10, 'CS118', 'Introduction to React', 4, 2, 6);
INSERT INTO `course` VALUES (11, 'CS118', 'Introduction to React', 4, 3, 6);
INSERT INTO `course` VALUES (12, 'CS118', 'Introduction to React', 4, 4, 6);
INSERT INTO `course` VALUES (13, 'CS119', 'Introduction to Lightning Design System', 4, 1, 7);
INSERT INTO `course` VALUES (14, 'CS119', 'Introduction to Lightning Design System', 4, 2, 7);
INSERT INTO `course` VALUES (15, 'CS119', 'Introduction to Lightning Design System', 4, 3, 7);
INSERT INTO `course` VALUES (16, 'CS119', 'Introduction to Lightning Design System', 4, 4, 7);
INSERT INTO `course` VALUES (17, 'CS125', 'Introduction to Flux', 4, 3, 8);
INSERT INTO `course` VALUES (18, 'CS125', 'Introduction to Flux', 4, 4, 8);
INSERT INTO `course` VALUES (19, 'CS120', 'Introduction to Cloud Computing', 4, 1, 9);
INSERT INTO `course` VALUES (20, 'CS120', 'Introduction to Cloud Computing', 4, 2, 9);
INSERT INTO `course` VALUES (21, 'CS120', 'Introduction to Cloud Computing', 4, 3, 9);
INSERT INTO `course` VALUES (22, 'CS120', 'Introduction to Cloud Computing', 4, 4, 9);
INSERT INTO `course` VALUES (23, 'CS121', 'Introduction to Salesforce', 4, 1, 1);
INSERT INTO `course` VALUES (24, 'CS121', 'Introduction to Salesforce', 4, 2, 1);
INSERT INTO `course` VALUES (25, 'CS121', 'Introduction to Salesforce', 4, 2, 3);
INSERT INTO `course` VALUES (42, 'CJ1', 'Java 101', 4, 7, 17);
INSERT INTO `course` VALUES (43, 'CS201', 'C 201', 4, 7, 17);
INSERT INTO `course` VALUES (44, 'CJ102', 'Java 101', 4, 7, 18);

-- ----------------------------
-- Table structure for cs20143
-- ----------------------------
DROP TABLE IF EXISTS `cs20143`;
CREATE TABLE `cs20143`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `std_id` int(11) NULL DEFAULT NULL,
  `23_hw` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `23_score` double NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for enrollment
-- ----------------------------
DROP TABLE IF EXISTS `enrollment`;
CREATE TABLE `enrollment`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NULL DEFAULT NULL,
  `student_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_enrollment`(`course_id`, `student_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 167 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of enrollment
-- ----------------------------
INSERT INTO `enrollment` VALUES (1, 1, 1);
INSERT INTO `enrollment` VALUES (25, 1, 5);
INSERT INTO `enrollment` VALUES (50, 1, 9);
INSERT INTO `enrollment` VALUES (74, 1, 13);
INSERT INTO `enrollment` VALUES (98, 1, 17);
INSERT INTO `enrollment` VALUES (123, 1, 21);
INSERT INTO `enrollment` VALUES (7, 2, 2);
INSERT INTO `enrollment` VALUES (31, 2, 6);
INSERT INTO `enrollment` VALUES (56, 2, 10);
INSERT INTO `enrollment` VALUES (80, 2, 14);
INSERT INTO `enrollment` VALUES (104, 2, 18);
INSERT INTO `enrollment` VALUES (129, 2, 22);
INSERT INTO `enrollment` VALUES (13, 3, 3);
INSERT INTO `enrollment` VALUES (37, 3, 7);
INSERT INTO `enrollment` VALUES (62, 3, 11);
INSERT INTO `enrollment` VALUES (86, 3, 15);
INSERT INTO `enrollment` VALUES (110, 3, 19);
INSERT INTO `enrollment` VALUES (135, 3, 23);
INSERT INTO `enrollment` VALUES (19, 4, 4);
INSERT INTO `enrollment` VALUES (43, 4, 8);
INSERT INTO `enrollment` VALUES (68, 4, 12);
INSERT INTO `enrollment` VALUES (92, 4, 16);
INSERT INTO `enrollment` VALUES (116, 4, 20);
INSERT INTO `enrollment` VALUES (141, 4, 24);
INSERT INTO `enrollment` VALUES (2, 5, 1);
INSERT INTO `enrollment` VALUES (26, 5, 5);
INSERT INTO `enrollment` VALUES (51, 5, 9);
INSERT INTO `enrollment` VALUES (75, 5, 13);
INSERT INTO `enrollment` VALUES (99, 5, 17);
INSERT INTO `enrollment` VALUES (124, 5, 21);
INSERT INTO `enrollment` VALUES (8, 6, 2);
INSERT INTO `enrollment` VALUES (32, 6, 6);
INSERT INTO `enrollment` VALUES (57, 6, 10);
INSERT INTO `enrollment` VALUES (81, 6, 14);
INSERT INTO `enrollment` VALUES (105, 6, 18);
INSERT INTO `enrollment` VALUES (130, 6, 22);
INSERT INTO `enrollment` VALUES (14, 7, 3);
INSERT INTO `enrollment` VALUES (38, 7, 7);
INSERT INTO `enrollment` VALUES (63, 7, 11);
INSERT INTO `enrollment` VALUES (87, 7, 15);
INSERT INTO `enrollment` VALUES (111, 7, 19);
INSERT INTO `enrollment` VALUES (136, 7, 23);
INSERT INTO `enrollment` VALUES (20, 8, 4);
INSERT INTO `enrollment` VALUES (44, 8, 8);
INSERT INTO `enrollment` VALUES (69, 8, 12);
INSERT INTO `enrollment` VALUES (93, 8, 16);
INSERT INTO `enrollment` VALUES (117, 8, 20);
INSERT INTO `enrollment` VALUES (142, 8, 24);
INSERT INTO `enrollment` VALUES (3, 9, 1);
INSERT INTO `enrollment` VALUES (27, 9, 5);
INSERT INTO `enrollment` VALUES (52, 9, 9);
INSERT INTO `enrollment` VALUES (76, 9, 13);
INSERT INTO `enrollment` VALUES (100, 9, 17);
INSERT INTO `enrollment` VALUES (125, 9, 21);
INSERT INTO `enrollment` VALUES (9, 10, 2);
INSERT INTO `enrollment` VALUES (33, 10, 6);
INSERT INTO `enrollment` VALUES (58, 10, 10);
INSERT INTO `enrollment` VALUES (82, 10, 14);
INSERT INTO `enrollment` VALUES (106, 10, 18);
INSERT INTO `enrollment` VALUES (131, 10, 22);
INSERT INTO `enrollment` VALUES (15, 11, 3);
INSERT INTO `enrollment` VALUES (39, 11, 7);
INSERT INTO `enrollment` VALUES (64, 11, 11);
INSERT INTO `enrollment` VALUES (88, 11, 15);
INSERT INTO `enrollment` VALUES (112, 11, 19);
INSERT INTO `enrollment` VALUES (137, 11, 23);
INSERT INTO `enrollment` VALUES (21, 12, 4);
INSERT INTO `enrollment` VALUES (45, 12, 8);
INSERT INTO `enrollment` VALUES (70, 12, 12);
INSERT INTO `enrollment` VALUES (94, 12, 16);
INSERT INTO `enrollment` VALUES (118, 12, 20);
INSERT INTO `enrollment` VALUES (143, 12, 24);
INSERT INTO `enrollment` VALUES (4, 13, 1);
INSERT INTO `enrollment` VALUES (28, 13, 5);
INSERT INTO `enrollment` VALUES (53, 13, 9);
INSERT INTO `enrollment` VALUES (77, 13, 13);
INSERT INTO `enrollment` VALUES (101, 13, 17);
INSERT INTO `enrollment` VALUES (126, 13, 21);
INSERT INTO `enrollment` VALUES (10, 14, 2);
INSERT INTO `enrollment` VALUES (34, 14, 6);
INSERT INTO `enrollment` VALUES (59, 14, 10);
INSERT INTO `enrollment` VALUES (83, 14, 14);
INSERT INTO `enrollment` VALUES (107, 14, 18);
INSERT INTO `enrollment` VALUES (132, 14, 22);
INSERT INTO `enrollment` VALUES (16, 15, 3);
INSERT INTO `enrollment` VALUES (40, 15, 7);
INSERT INTO `enrollment` VALUES (65, 15, 11);
INSERT INTO `enrollment` VALUES (89, 15, 15);
INSERT INTO `enrollment` VALUES (113, 15, 19);
INSERT INTO `enrollment` VALUES (138, 15, 23);
INSERT INTO `enrollment` VALUES (22, 16, 4);
INSERT INTO `enrollment` VALUES (46, 16, 8);
INSERT INTO `enrollment` VALUES (71, 16, 12);
INSERT INTO `enrollment` VALUES (95, 16, 16);
INSERT INTO `enrollment` VALUES (119, 16, 20);
INSERT INTO `enrollment` VALUES (144, 16, 24);
INSERT INTO `enrollment` VALUES (5, 17, 1);
INSERT INTO `enrollment` VALUES (29, 17, 5);
INSERT INTO `enrollment` VALUES (54, 17, 9);
INSERT INTO `enrollment` VALUES (78, 17, 13);
INSERT INTO `enrollment` VALUES (102, 17, 17);
INSERT INTO `enrollment` VALUES (127, 17, 21);
INSERT INTO `enrollment` VALUES (11, 18, 2);
INSERT INTO `enrollment` VALUES (35, 18, 6);
INSERT INTO `enrollment` VALUES (60, 18, 10);
INSERT INTO `enrollment` VALUES (84, 18, 14);
INSERT INTO `enrollment` VALUES (108, 18, 18);
INSERT INTO `enrollment` VALUES (133, 18, 22);
INSERT INTO `enrollment` VALUES (17, 19, 3);
INSERT INTO `enrollment` VALUES (41, 19, 7);
INSERT INTO `enrollment` VALUES (66, 19, 11);
INSERT INTO `enrollment` VALUES (90, 19, 15);
INSERT INTO `enrollment` VALUES (114, 19, 19);
INSERT INTO `enrollment` VALUES (139, 19, 23);
INSERT INTO `enrollment` VALUES (23, 20, 4);
INSERT INTO `enrollment` VALUES (47, 20, 8);
INSERT INTO `enrollment` VALUES (72, 20, 12);
INSERT INTO `enrollment` VALUES (96, 20, 17);
INSERT INTO `enrollment` VALUES (120, 20, 20);
INSERT INTO `enrollment` VALUES (145, 20, 24);
INSERT INTO `enrollment` VALUES (6, 21, 1);
INSERT INTO `enrollment` VALUES (30, 21, 5);
INSERT INTO `enrollment` VALUES (55, 21, 9);
INSERT INTO `enrollment` VALUES (79, 21, 13);
INSERT INTO `enrollment` VALUES (103, 21, 17);
INSERT INTO `enrollment` VALUES (128, 21, 21);
INSERT INTO `enrollment` VALUES (12, 22, 2);
INSERT INTO `enrollment` VALUES (36, 22, 6);
INSERT INTO `enrollment` VALUES (61, 22, 10);
INSERT INTO `enrollment` VALUES (85, 22, 14);
INSERT INTO `enrollment` VALUES (109, 22, 18);
INSERT INTO `enrollment` VALUES (134, 22, 22);
INSERT INTO `enrollment` VALUES (18, 23, 3);
INSERT INTO `enrollment` VALUES (42, 23, 7);
INSERT INTO `enrollment` VALUES (67, 23, 11);
INSERT INTO `enrollment` VALUES (91, 23, 15);
INSERT INTO `enrollment` VALUES (115, 23, 19);
INSERT INTO `enrollment` VALUES (140, 23, 23);
INSERT INTO `enrollment` VALUES (24, 24, 5);
INSERT INTO `enrollment` VALUES (48, 24, 8);
INSERT INTO `enrollment` VALUES (49, 24, 9);
INSERT INTO `enrollment` VALUES (73, 24, 12);
INSERT INTO `enrollment` VALUES (97, 24, 17);
INSERT INTO `enrollment` VALUES (121, 24, 20);
INSERT INTO `enrollment` VALUES (122, 24, 21);
INSERT INTO `enrollment` VALUES (146, 24, 24);
INSERT INTO `enrollment` VALUES (147, 25, 11);
INSERT INTO `enrollment` VALUES (155, 40, 2);
INSERT INTO `enrollment` VALUES (157, 42, 22);
INSERT INTO `enrollment` VALUES (162, 42, 27);
INSERT INTO `enrollment` VALUES (164, 42, 28);
INSERT INTO `enrollment` VALUES (158, 43, 22);
INSERT INTO `enrollment` VALUES (166, 43, 24);
INSERT INTO `enrollment` VALUES (163, 43, 27);
INSERT INTO `enrollment` VALUES (165, 43, 28);
INSERT INTO `enrollment` VALUES (159, 44, 24);
INSERT INTO `enrollment` VALUES (160, 44, 25);
INSERT INTO `enrollment` VALUES (161, 44, 26);

-- ----------------------------
-- Table structure for homework
-- ----------------------------
DROP TABLE IF EXISTS `homework`;
CREATE TABLE `homework`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `details` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `course_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of homework
-- ----------------------------
INSERT INTO `homework` VALUES (20, 'Easy Exercise', 'Solve the problem on page 32.', 35);
INSERT INTO `homework` VALUES (21, 'Easy Exercise', 'Solve the problem4 on page 23.', 42);
INSERT INTO `homework` VALUES (22, 'Test', 'Develop a sorting program by using quick sort algorithm.', 42);
INSERT INTO `homework` VALUES (23, 'Difficult Homework', 'Make a dummy using c.', 43);
INSERT INTO `homework` VALUES (24, 'Easy Homework', 'Print your name on the screen.', 44);

-- ----------------------------
-- Table structure for period
-- ----------------------------
DROP TABLE IF EXISTS `period`;
CREATE TABLE `period`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of period
-- ----------------------------
INSERT INTO `period` VALUES (1, 'Fall 2014');
INSERT INTO `period` VALUES (2, 'Spring 2015');
INSERT INTO `period` VALUES (3, 'Fall 2015');
INSERT INTO `period` VALUES (4, 'Spring 2016');
INSERT INTO `period` VALUES (5, 'Fall 2016');
INSERT INTO `period` VALUES (6, 'Spring 2017');
INSERT INTO `period` VALUES (7, 'Fall 2017');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `last_name` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `address` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `city` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `state` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `zip` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `dob` date NULL DEFAULT NULL,
  `phone` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `mobile_phone` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `email` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `pic` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `registration` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pwd` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `std_id` int(11) NULL DEFAULT NULL,
  `full_name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, 'Camila', 'Martinez', '18 Henry st', 'Cambridge', 'MA', '01742', '1995-09-07', '617-985-6955', '617-666-5555', 'cmartinez@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/camila_martinez.jpg', '2012-07-14 00:00:00', '2017-10-01 23:39:09', 'camila', 'Camila', NULL, 'Camila Martinez');
INSERT INTO `student` VALUES (2, 'Cassandra', 'Bowman', '56 Broad st', 'San Francisco', 'CA', '01742', '1994-12-08', '781-458-8541', '617-987-6543', 'cbowman@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/cassandra_bowman.jpg', '2012-07-14 00:00:00', '2017-10-01 23:39:09', 'cassandra', 'Cassandra', NULL, 'Cassandra Bowman');
INSERT INTO `student` VALUES (3, 'Catherine', 'Hansen', '52 Elm st', 'Boston', 'MA', '01742', '1993-01-01', '404-986-356', '857-584-654', 'chansen@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/catherine_hansen.jpg', '2012-07-14 00:00:00', '2017-10-02 19:14:19', 'catherine', 'Catherine', NULL, 'Catherine Hansen');
INSERT INTO `student` VALUES (4, 'Cindy', 'Curtis', '101 Massachusetts Avenue', 'Seattle', 'WA', '01742', '1995-02-27', '212-854-6354', '212-963-8521', 'ccurtis@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/cindy_curtis.jpg', '2012-07-14 00:00:00', '2017-10-01 23:39:09', 'cindy', 'Cindy', NULL, 'Cindy Curtis');
INSERT INTO `student` VALUES (5, 'Claire', 'Chapman', '3 Oak st', 'Chicago', 'IL', '01742', '1996-03-24', '508-987-6541', '508-852-3222', 'cchapman@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/claire_chapman.jpg', '2012-07-14 00:00:00', '2017-10-01 23:39:09', 'claire', 'Claire', NULL, 'Claire Chapman');
INSERT INTO `student` VALUES (6, 'Claudia', 'Leonard', '56 Chestnut st', 'Burlington', 'VT', '01742', '1992-04-18', '415-985-9632', '415-987-6655', 'cleonard@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/claudia_leonard.jpg', '2012-07-14 00:00:00', '2017-10-01 23:39:09', 'claudia', 'Claudia', NULL, 'Claudia Leonard');
INSERT INTO `student` VALUES (7, 'Diego', 'Costa', '24 Belmont st', 'Houston', 'TX', '01742', '1993-05-20', '521-988-2255', '521-886-6688', 'dcosta@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/diego_costa.jpg', '2012-07-14 00:00:00', '2017-10-01 23:39:09', 'diego', 'Diego', NULL, 'Diego Costa');
INSERT INTO `student` VALUES (8, 'Elsa', 'Olson', '85 Boylston st', 'Fort Lauderdale', 'FL', '01742', '1995-06-01', '234-996-7412', '234-852-9632', 'eolson@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/elsa_olson.jpg', '2012-07-14 00:00:00', '2017-10-01 23:39:09', 'elsa', 'Elsa', NULL, 'Elsa Olson');
INSERT INTO `student` VALUES (9, 'Finn', 'Cunningham', '47 Main st', 'Tampa', 'FL', '01742', '1996-07-24', '643-258-8521', '643-965-6322', 'fcunningham@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/finn_cunningham.jpg', '2012-07-14 00:00:00', '2017-10-01 23:39:09', 'finn', 'Finn', NULL, 'Finn Cunningham');
INSERT INTO `student` VALUES (10, 'Greg', 'Matthews', '18 Nevada st', 'Denver', 'CO', '01742', '1995-08-11', '412-985-2241', '412-963-8547', 'gmatthews@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/greg_matthews.jpg', '2012-07-14 00:00:00', '2017-10-01 23:39:09', 'greg', 'Greg', NULL, 'Greg Matthews');
INSERT INTO `student` VALUES (11, 'Hector', 'Reyes', '147 California st', 'Providence', 'RI', '01742', '1994-09-28', '507-854-9632', '507-525-6363', 'hreyes@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/hector_reyes.jpg', '2012-07-14 00:00:00', '2017-10-02 20:44:18', 'hector', 'Hector', NULL, 'Hector Reyes');
INSERT INTO `student` VALUES (12, 'James', 'Alexander', '28 Trapelo Road st', 'Hartford', 'CT', '01742', '1993-10-21', '593-968-7468', '593-691-3791', 'jalexander@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/james_alexander.jpg', '2012-07-14 00:00:00', '2017-10-01 23:39:09', 'james', 'James', NULL, 'James Alexander');
INSERT INTO `student` VALUES (13, 'Jens', 'Henderson', '123 Washington st', 'Los Angeles', 'CA', '01742', '1992-11-03', '603-873-9562', '603-253-6548', 'jhenderson@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/jens_henderson.jpg', '2012-07-14 00:00:00', '2017-10-01 23:39:09', 'jens', 'Jens', NULL, 'Jens Henderson');
INSERT INTO `student` VALUES (14, 'John', 'Bailey', '85 Concord Ave', 'San Diego', 'CA', '01742', '1993-12-31', '752-961-1212', '752-623-6741', 'jbailey@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/john_bailey.jpg', '2012-07-14 00:00:00', '2017-10-01 23:39:09', 'john', 'John', NULL, 'John Bailey');
INSERT INTO `student` VALUES (15, 'Jonathan', 'Rogers', '85 Boylston st', 'Detroit', 'MI', '01742', '1992-01-02', '803-256-9617', '803-625-5544', 'jrogers@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/jonathan_rogers.jpg', '2012-07-14 00:00:00', '2017-10-01 23:39:09', 'jonathan', 'Jonathan', NULL, 'Jonathan Rogers');
INSERT INTO `student` VALUES (16, 'Justin', 'Scott', '458 Federal st', 'Columbus', 'OH', '01742', '1993-02-04', '241-854-3591', '241-632-8246', 'jscott@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/justin_scott.jpg', '2012-07-14 00:00:00', '2017-10-01 23:39:09', 'justin', 'Justin', NULL, 'Justin Scott');
INSERT INTO `student` VALUES (17, 'Linda', 'Lewis', '145 Gloucester st', 'Endicott', 'NY', '01742', '1994-03-15', '331-658-3254', '331-586-9637', 'llewis@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/linda_lewis.jpg', '2012-07-14 00:00:00', '2017-10-01 23:39:09', 'linda', 'Linda', NULL, 'Linda Lewis');
INSERT INTO `student` VALUES (18, 'Lori', 'Anderson', '523 Arlington st', 'Atlanta', 'GA', '01742', '1995-04-22', '498-683-1754', '498-685-6322', 'landerson@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/lori_anderson.jpg', '2012-07-14 00:00:00', '2017-10-01 23:39:09', 'lori', 'Lori', NULL, 'Lori Anderson');
INSERT INTO `student` VALUES (19, 'Luisa', 'Vasquez', '28 Clarendon st', 'New Orleans', 'LA', '01742', '1996-05-14', '578-963-5214', '578-641-8799', 'lvasquez@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/luisa_vasquez.jpg', '2012-07-14 00:00:00', '2017-10-01 23:39:09', 'luisa', 'Luisa', NULL, 'Luisa Vasquez');
INSERT INTO `student` VALUES (20, 'Lynn', 'Martin', '78 Exeter st', 'Madison', 'WI', '01742', '1992-06-20', '603-963-8855', '603-256-8741', 'lmartin@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/lynn_martin.jpg', '2012-07-14 00:00:00', '2017-10-01 23:39:09', 'lynn', 'Lynn', NULL, 'Lynn Martin');
INSERT INTO `student` VALUES (21, 'Mark', 'Davis', '54 Fairfield st', 'Boston', 'MA', '01742', '1993-07-18', '752-634-8799', '752-967-2511', 'mdavis@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/mark_davis.jpg', '2012-07-14 00:00:00', '2017-10-01 23:39:09', 'mark', 'Mark', NULL, 'Mark Davis');
INSERT INTO `student` VALUES (22, 'Peter', 'Jacobson', '47 Market st', 'Des Moines', 'IA', '01742', '1994-08-23', '821-635-4411', '821-635-5741', 'pjacobson@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/peter_jacobson.jpg', '2012-07-14 00:00:00', '2017-10-01 23:39:09', 'peter', 'Peter', NULL, 'Peter Jacobson');
INSERT INTO `student` VALUES (23, 'Phil', 'Harris', '125 Davis st', 'Boston', 'MA', '01742', '1995-09-01', '285-325-6431', '285-635-5877', 'pharris@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/phil_harris.jpg', '2012-07-14 00:00:00', '2017-10-01 23:39:09', 'phil', 'Phil', NULL, 'Phil Harris');
INSERT INTO `student` VALUES (24, 'Rebecca', 'Gutierrez', '85 Walnut st', 'Portland', 'OR', '01742', '1996-10-10', '352-658-9741', '352-981-8462', 'rgutierrez@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/rebecca_gutierrez.jpg', '2012-07-14 00:00:00', '2017-10-01 23:39:09', 'rebecca', 'Rebecca', NULL, 'Rebecca Gutierrez');
INSERT INTO `student` VALUES (25, 'Robert', 'Wilson', '145 Lexington st', 'Newark', 'NJ', '01742', '1992-11-24', '475-658-9988', '475-958-6714', 'rwilson@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/robert_wilson.jpg', '2012-07-14 00:00:00', '2017-10-01 23:39:09', 'robert', 'Robert', NULL, 'Robert Wilson');
INSERT INTO `student` VALUES (26, 'Sophie', 'Miller', '21 Webster st', 'Las Vegas', 'NV', '01742', '1993-12-08', '518-983-5473', '518-472-3255', 'smiller@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/sophie_miller.jpg', '2012-07-14 00:00:00', '2017-10-01 23:39:09', 'sophie', 'Sophie', NULL, 'Sophie Miller');
INSERT INTO `student` VALUES (27, 'Tammy', 'Robinson', '56 Summer st', 'Boston', 'MA', '01742', '1994-01-16', '678-256-3796', '678-354-2282', 'ogreen@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/tammy_robinson.jpg', '2012-07-14 00:00:00', '2017-10-01 23:39:09', 'tammy', 'Tammy', NULL, 'Tammy Robinson');
INSERT INTO `student` VALUES (28, 'Valerie', 'Johnston', '24 Powels st', 'Cambridge', 'MA', '01742', '1995-02-19', '708-654-3214', '708-685-3522', 'vjohnston@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/valerie_johnston.jpg', '2012-07-14 00:00:00', '2017-10-01 23:39:09', 'valerie', 'Valerie', NULL, 'Valerie Johnston');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `last_name` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `address` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `city` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `state` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `zip` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `phone` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `mobile_phone` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `email` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `pic` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `user_id` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pwd` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `full_name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, 'Tanya', 'Sharma', '18 Henry st', 'Cambridge', 'MA', '01742', 'PHD', '617-985-6955', '617-666-5555', 'tsharma@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/tanya_sharma.jpg', 'tanya', 'tanya', 'Tanya Sharma');
INSERT INTO `teacher` VALUES (2, 'Miriam', 'Aupont', '56 Broad st', 'Cambridge', 'MA', '01742', 'PHD', '617-123-4567', '617-987-6543', 'maupont@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/miriam_aupont.jpg', 'miriam', 'miriam', 'Miriam Aupont');
INSERT INTO `teacher` VALUES (3, 'Jonathan', 'Bradley', '52 Elm st', 'Boston', 'MA', '01742', 'PHD', '617-123-4567', '617-987-6543', 'jbradley@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/jonathan_bradley.jpg', 'jonathan', 'jonathan', 'Jonathan Bradley');
INSERT INTO `teacher` VALUES (4, 'Anup', 'Gupta', '101 Massachusetts Avenue', 'Boston', 'MA', '01742', 'PHD', '617-123-4567', '617-987-6543', 'agupta@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/anup_gupta.jpg', 'anup', 'anup', 'Anup Gupta');
INSERT INTO `teacher` VALUES (5, 'Kenneth', 'Sato', '3 Oak st', 'Boston', 'MA', '01742', 'PHD', '617-123-4567', '617-987-6543', 'ksato@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/kenneth_sato.jpg', 'kenneth', 'kenneth', 'Kenneth Sato');
INSERT INTO `teacher` VALUES (6, 'James', 'Kennedy', '56 Chestnut st', 'Boston', 'MA', '01742', 'PHD', '617-123-4567', '617-987-6543', 'jkennedy@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/james_kennedy.jpg', 'james', 'james', 'James Kennedy');
INSERT INTO `teacher` VALUES (7, 'Amy', 'Taylor', '24 Belmont st', 'Boston', 'MA', '01742', 'PHD', '617-123-4567', '617-987-6543', 'ataylor@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/amy_taylor.jpg', 'amy', 'amy', 'Amy Taylor');
INSERT INTO `teacher` VALUES (8, 'Olivia', 'Green', '85 Boylston st', 'Boston', 'MA', '01742', 'PHD', '617-123-4567', '617-987-6543', 'ogreen@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/olivia_green.jpg', 'olivia', 'olivia', 'Olivia Green');
INSERT INTO `teacher` VALUES (9, 'Michael', 'Jones', '184 Gloucester st', 'Cambridge', 'MA', '01742', 'PHD', '617-985-6955', '617-666-5555', 'mjones@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/michael_jones.jpg', 'michael', 'michael', 'Michael Jones');
INSERT INTO `teacher` VALUES (17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'brown', 'brown', 'Brown');
INSERT INTO `teacher` VALUES (18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'smith', 'smith', 'Smith');

SET FOREIGN_KEY_CHECKS = 1;
