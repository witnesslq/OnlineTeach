/*
SQLyog Ultimate v9.62 
MySQL - 5.5.27 : Database - onlineteach
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`onlineteach` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `onlineteach`;

/*Table structure for table `t_checkattendance` */

DROP TABLE IF EXISTS `t_checkattendance`;

CREATE TABLE `t_checkattendance` (
  `cpID` int(11) NOT NULL,
  `tpCourseTime` datetime NOT NULL,
  `stuID` int(11) NOT NULL,
  `caAttendance` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `student` tinyblob,
  `teachPlan` tinyblob,
  PRIMARY KEY (`cpID`,`tpCourseTime`,`stuID`),
  KEY `FK_attendanceIncludeStudent` (`stuID`),
  CONSTRAINT `FK_attendanceIncludeStudent` FOREIGN KEY (`stuID`) REFERENCES `t_student` (`stuID`),
  CONSTRAINT `FK_teachPlanIncludeCheckAttendance` FOREIGN KEY (`cpID`, `tpCourseTime`) REFERENCES `t_teachplan` (`cpID`, `tpCourseTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_checkattendance` */

/*Table structure for table `t_classroom` */

DROP TABLE IF EXISTS `t_classroom`;

CREATE TABLE `t_classroom` (
  `crID` int(11) NOT NULL AUTO_INCREMENT,
  `crName` varchar(20) DEFAULT NULL,
  `crType` int(11) DEFAULT NULL,
  PRIMARY KEY (`crID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `t_classroom` */

insert  into `t_classroom`(`crID`,`crName`,`crType`) values (1,'801',1),(2,'802',1),(3,'803',1),(4,'804',1),(5,'B101',2),(6,'B102',2),(7,'A101',2),(8,'A102',2),(9,'A103',2),(10,'A104',2),(11,'A105',2);

/*Table structure for table `t_compositecheck` */

DROP TABLE IF EXISTS `t_compositecheck`;

CREATE TABLE `t_compositecheck` (
  `stuID` int(11) NOT NULL,
  `courseID` int(11) NOT NULL,
  `ccID` int(11) DEFAULT NULL,
  `ccGrade` float DEFAULT NULL,
  `ccState` int(11) DEFAULT NULL COMMENT '通没通过',
  PRIMARY KEY (`stuID`,`courseID`),
  KEY `FK_compositeCheckRelateCourseInfo` (`courseID`),
  CONSTRAINT `FK_compositeCheckBelongtoStudent` FOREIGN KEY (`stuID`) REFERENCES `t_student` (`stuID`),
  CONSTRAINT `FK_compositeCheckRelateCourseInfo` FOREIGN KEY (`courseID`) REFERENCES `t_course` (`courseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_compositecheck` */

/*Table structure for table `t_course` */

DROP TABLE IF EXISTS `t_course`;

CREATE TABLE `t_course` (
  `courseID` int(11) NOT NULL AUTO_INCREMENT,
  `courseName` varchar(50) DEFAULT NULL,
  `courseDesc` varchar(200) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `roomType` int(11) DEFAULT NULL,
  PRIMARY KEY (`courseID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `t_course` */

insert  into `t_course`(`courseID`,`courseName`,`courseDesc`,`priority`,`roomType`) values (1,'大学英语','大学英语',100,2),(2,'C++程序设计','C++程序设计',100,1),(3,'Java程序设计','Java程序设计',100,1),(4,'思科网络','思科网络',100,1),(5,'专业英语','计算机专业英语',100,2),(6,'数据结构','数据结构',100,2),(7,'计算机应用','计算机应用',100,1);

/*Table structure for table `t_courseandteacher` */

DROP TABLE IF EXISTS `t_courseandteacher`;

CREATE TABLE `t_courseandteacher` (
  `courseID` int(11) NOT NULL,
  `teacID` int(11) NOT NULL,
  PRIMARY KEY (`courseID`,`teacID`),
  KEY `FK_t_courseAndTeacher2` (`teacID`),
  CONSTRAINT `FK_t_courseAndTeacher` FOREIGN KEY (`courseID`) REFERENCES `t_course` (`courseID`),
  CONSTRAINT `FK_t_courseAndTeacher2` FOREIGN KEY (`teacID`) REFERENCES `t_teacher` (`teacID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_courseandteacher` */

insert  into `t_courseandteacher`(`courseID`,`teacID`) values (1,1),(4,1),(5,1),(1,2),(3,2),(6,2),(7,2),(1,3),(3,3),(2,4),(5,4),(6,4),(2,5),(4,5),(7,5);

/*Table structure for table `t_courseplanitem` */

DROP TABLE IF EXISTS `t_courseplanitem`;

CREATE TABLE `t_courseplanitem` (
  `cpID` int(11) NOT NULL AUTO_INCREMENT,
  `teacID` int(11) NOT NULL,
  `scID` int(11) NOT NULL,
  `courseID` int(11) NOT NULL,
  `crID` int(11) NOT NULL,
  `cpparagraph` int(11) DEFAULT NULL,
  `cpstate` int(11) DEFAULT NULL,
  PRIMARY KEY (`cpID`),
  KEY `FK_CourseItemRelateCourseInfo` (`courseID`),
  KEY `FK_courseBelongToClass` (`scID`),
  KEY `FK_coursePlanItemRelateTeacher` (`teacID`),
  KEY `FK_courseRelateClassroom` (`crID`),
  CONSTRAINT `FK_courseBelongToClass` FOREIGN KEY (`scID`) REFERENCES `t_schoolclass` (`scID`),
  CONSTRAINT `FK_CourseItemRelateCourseInfo` FOREIGN KEY (`courseID`) REFERENCES `t_course` (`courseID`),
  CONSTRAINT `FK_coursePlanItemRelateTeacher` FOREIGN KEY (`teacID`) REFERENCES `t_teacher` (`teacID`),
  CONSTRAINT `FK_courseRelateClassroom` FOREIGN KEY (`crID`) REFERENCES `t_classroom` (`crID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程表原子';

/*Data for the table `t_courseplanitem` */

/*Table structure for table `t_courseware` */

DROP TABLE IF EXISTS `t_courseware`;

CREATE TABLE `t_courseware` (
  `cwareID` int(11) NOT NULL AUTO_INCREMENT,
  `cpID` int(11) NOT NULL,
  `tpCourseTime` datetime NOT NULL,
  `cwareName` varchar(50) DEFAULT NULL,
  `cwareDesc` varchar(255) DEFAULT NULL,
  `coursePlanItem` int(11) DEFAULT NULL,
  PRIMARY KEY (`cwareID`),
  KEY `FK_courseWareBelongtoTeachPlan` (`cpID`,`tpCourseTime`),
  CONSTRAINT `FK_courseWareBelongtoTeachPlan` FOREIGN KEY (`cpID`, `tpCourseTime`) REFERENCES `t_teachplan` (`cpID`, `tpCourseTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_courseware` */

/*Table structure for table `t_coursework` */

DROP TABLE IF EXISTS `t_coursework`;

CREATE TABLE `t_coursework` (
  `cworkID` int(11) NOT NULL AUTO_INCREMENT,
  `cpID` int(11) NOT NULL,
  `tpCourseTime` datetime NOT NULL,
  `cworkTitle` varchar(100) DEFAULT NULL,
  `cworkDesc` varchar(500) DEFAULT NULL,
  `cworkType` int(11) DEFAULT NULL,
  `cworkState` varchar(8) DEFAULT NULL,
  `coursePlanItem` int(11) DEFAULT NULL,
  PRIMARY KEY (`cworkID`),
  KEY `FK_teachPlanIncludeCourseWork` (`cpID`,`tpCourseTime`),
  CONSTRAINT `FK_teachPlanIncludeCourseWork` FOREIGN KEY (`cpID`, `tpCourseTime`) REFERENCES `t_teachplan` (`cpID`, `tpCourseTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_coursework` */

/*Table structure for table `t_file` */

DROP TABLE IF EXISTS `t_file`;

CREATE TABLE `t_file` (
  `fileID` int(11) NOT NULL AUTO_INCREMENT,
  `cwareID` int(11) DEFAULT NULL,
  `filePaths` text,
  `originalFileName` varchar(100) DEFAULT NULL,
  `generatedFileName` varchar(100) DEFAULT NULL,
  `uploadDateTime` datetime DEFAULT NULL,
  `downloadCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`fileID`),
  KEY `FK_courseWareIncludeFile` (`cwareID`),
  CONSTRAINT `FK_courseWareIncludeFile` FOREIGN KEY (`cwareID`) REFERENCES `t_courseware` (`cwareID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_file` */

/*Table structure for table `t_major` */

DROP TABLE IF EXISTS `t_major`;

CREATE TABLE `t_major` (
  `majorID` int(11) NOT NULL AUTO_INCREMENT,
  `majorName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`majorID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `t_major` */

insert  into `t_major`(`majorID`,`majorName`) values (1,'软件技术'),(2,'计算机应用');

/*Table structure for table `t_majorscourse` */

DROP TABLE IF EXISTS `t_majorscourse`;

CREATE TABLE `t_majorscourse` (
  `majorID` int(11) NOT NULL,
  `courseID` int(11) NOT NULL,
  `paragraph` int(11) DEFAULT NULL,
  PRIMARY KEY (`majorID`,`courseID`),
  KEY `FK_t_majorsCourse2` (`courseID`),
  CONSTRAINT `FK_t_majorsCourse` FOREIGN KEY (`majorID`) REFERENCES `t_major` (`majorID`),
  CONSTRAINT `FK_t_majorsCourse2` FOREIGN KEY (`courseID`) REFERENCES `t_course` (`courseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_majorscourse` */

insert  into `t_majorscourse`(`majorID`,`courseID`,`paragraph`) values (1,1,2),(1,2,4),(1,3,4),(1,5,2),(1,6,2),(2,1,2),(2,4,4),(2,5,2),(2,7,4);

/*Table structure for table `t_project` */

DROP TABLE IF EXISTS `t_project`;

CREATE TABLE `t_project` (
  `projID` int(11) NOT NULL AUTO_INCREMENT,
  `projTitle` varchar(255) DEFAULT NULL,
  `projDesc` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`projID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_project` */

/*Table structure for table `t_projectdiv` */

DROP TABLE IF EXISTS `t_projectdiv`;

CREATE TABLE `t_projectdiv` (
  `stuID` int(11) NOT NULL,
  `projID` int(11) NOT NULL,
  `pdID` int(11) DEFAULT NULL,
  `pdWorkDesc` varchar(255) DEFAULT NULL,
  `pdGrade` float DEFAULT NULL,
  PRIMARY KEY (`stuID`,`projID`),
  KEY `FK_projectDivRelateProject` (`projID`),
  CONSTRAINT `FK_projectDivRelateProject` FOREIGN KEY (`projID`) REFERENCES `t_project` (`projID`),
  CONSTRAINT `FK_studentRelateProjectDiv` FOREIGN KEY (`stuID`) REFERENCES `t_student` (`stuID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_projectdiv` */

/*Table structure for table `t_projectgroup` */

DROP TABLE IF EXISTS `t_projectgroup`;

CREATE TABLE `t_projectgroup` (
  `pgID` int(11) NOT NULL AUTO_INCREMENT,
  `pgName` varchar(20) DEFAULT NULL,
  `pgSlogan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pgID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_projectgroup` */

/*Table structure for table `t_projectreply` */

DROP TABLE IF EXISTS `t_projectreply`;

CREATE TABLE `t_projectreply` (
  `pgID` int(11) NOT NULL,
  `projID` int(11) NOT NULL,
  `prID` int(11) NOT NULL,
  `prGrade` float DEFAULT NULL,
  `prState` int(11) DEFAULT NULL,
  `prDate` datetime DEFAULT NULL,
  PRIMARY KEY (`pgID`,`projID`),
  KEY `FK_t_projectReply2` (`projID`),
  CONSTRAINT `FK_t_projectReply` FOREIGN KEY (`pgID`) REFERENCES `t_projectgroup` (`pgID`),
  CONSTRAINT `FK_t_projectReply2` FOREIGN KEY (`projID`) REFERENCES `t_project` (`projID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_projectreply` */

/*Table structure for table `t_schoolclass` */

DROP TABLE IF EXISTS `t_schoolclass`;

CREATE TABLE `t_schoolclass` (
  `scID` int(11) NOT NULL AUTO_INCREMENT,
  `majorID` int(11) DEFAULT NULL,
  `scName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`scID`),
  KEY `FK_classBelongToMajor` (`majorID`),
  CONSTRAINT `FK_classBelongToMajor` FOREIGN KEY (`majorID`) REFERENCES `t_major` (`majorID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `t_schoolclass` */

insert  into `t_schoolclass`(`scID`,`majorID`,`scName`) values (1,1,'113-1'),(2,1,'113-2'),(3,2,'113-1'),(4,2,'113-2');

/*Table structure for table `t_student` */

DROP TABLE IF EXISTS `t_student`;

CREATE TABLE `t_student` (
  `stuID` int(11) NOT NULL AUTO_INCREMENT,
  `pgID` int(11) DEFAULT NULL,
  `scID` int(11) DEFAULT NULL,
  `stuName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`stuID`),
  KEY `FK_projectGroupIncludeStudent` (`pgID`),
  KEY `FK_studentBelongsToClass` (`scID`),
  CONSTRAINT `FK_projectGroupIncludeStudent` FOREIGN KEY (`pgID`) REFERENCES `t_projectgroup` (`pgID`),
  CONSTRAINT `FK_studentBelongsToClass` FOREIGN KEY (`scID`) REFERENCES `t_schoolclass` (`scID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_student` */

/*Table structure for table `t_teacher` */

DROP TABLE IF EXISTS `t_teacher`;

CREATE TABLE `t_teacher` (
  `teacID` int(11) NOT NULL AUTO_INCREMENT,
  `teacName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`teacID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `t_teacher` */

insert  into `t_teacher`(`teacID`,`teacName`) values (1,'张三'),(2,'李四'),(3,'王五'),(4,'赵六'),(5,'孙七');

/*Table structure for table `t_teachplan` */

DROP TABLE IF EXISTS `t_teachplan`;

CREATE TABLE `t_teachplan` (
  `cpID` int(11) NOT NULL,
  `tpCourseTime` datetime NOT NULL,
  `tpTeachMethod` varchar(255) DEFAULT NULL,
  `tpTeachContent` text,
  `tpTeachGoal` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`cpID`,`tpCourseTime`),
  CONSTRAINT `FK_coursePlanItemRelateTeachPlan` FOREIGN KEY (`cpID`) REFERENCES `t_courseplanitem` (`cpID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_teachplan` */

/*Table structure for table `t_workstate` */

DROP TABLE IF EXISTS `t_workstate`;

CREATE TABLE `t_workstate` (
  `cworkID` int(11) NOT NULL,
  `stuID` int(11) NOT NULL,
  `fileID` int(11) NOT NULL,
  `wsID` int(11) NOT NULL,
  `wsGrade` float DEFAULT NULL,
  `wsTeacherComment` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`cworkID`,`stuID`,`fileID`),
  KEY `FK_t_workstate2` (`stuID`),
  KEY `FK_t_workstate3` (`fileID`),
  CONSTRAINT `FK_t_workstate` FOREIGN KEY (`cworkID`) REFERENCES `t_coursework` (`cworkID`),
  CONSTRAINT `FK_t_workstate2` FOREIGN KEY (`stuID`) REFERENCES `t_student` (`stuID`),
  CONSTRAINT `FK_t_workstate3` FOREIGN KEY (`fileID`) REFERENCES `t_file` (`fileID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_workstate` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
