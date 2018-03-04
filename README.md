# Purpose
To learn how to develop an ASP.NET Core 2 MVC web application using Entity Framework Core and a MySQL database that can run on either localhost or on CLOUD.GOV.

# Microsoft Tutorial Used
```https://docs.microsoft.com/en-us/aspnet/core/data/ef-mvc/```

# Create Tables (MySQL)
## (localhost only)
```
CREATE DATABASE <insert database name here>;
USE <insert database name here>; 
```
## (localhost and cloud.gov)
```
CREATE TABLE `Student` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EnrollmentDate` datetime NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

CREATE TABLE `Instructor` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `HireDate` datetime NOT NULL,
  `LastName` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

CREATE TABLE `OfficeAssignment` (
  `InstructorID` int(11) NOT NULL,
  `Location` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`InstructorID`),
  CONSTRAINT `FK_OfficeAssignment_Instructor_InstructorID` FOREIGN KEY (`InstructorID`) REFERENCES `Instructor` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Department` (
  `DepartmentID` int(11) NOT NULL AUTO_INCREMENT,
  `Budget` decimal(18,2) NOT NULL,
  `InstructorID` int(11) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `StartDate` datetime NOT NULL,
  `RowVersion` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`DepartmentID`),
  KEY `IX_Department_InstructorID` (`InstructorID`),
  CONSTRAINT `FK_Department_Instructor_InstructorID` FOREIGN KEY (`InstructorID`) REFERENCES `Instructor` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE `Course` (
  `CourseID` int(11) NOT NULL,
  `Credits` int(11) NOT NULL,
  `DepartmentID` int(11) NOT NULL,
  `Title` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CourseID`),
  KEY `IX_Course_DepartmentID` (`DepartmentID`),
  CONSTRAINT `FK_Course_Department_DepartmentID` FOREIGN KEY (`DepartmentID`) REFERENCES `Department` (`DepartmentID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `CourseAssignment` (
  `CourseID` int(11) NOT NULL,
  `InstructorID` int(11) NOT NULL,
  PRIMARY KEY (`CourseID`,`InstructorID`),
  KEY `IX_CourseAssignment_InstructorID` (`InstructorID`),
  CONSTRAINT `FK_CourseAssignment_Course_CourseID` FOREIGN KEY (`CourseID`) REFERENCES `Course` (`CourseID`) ON DELETE CASCADE,
  CONSTRAINT `FK_CourseAssignment_Instructor_InstructorID` FOREIGN KEY (`InstructorID`) REFERENCES `Instructor` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Enrollment` (
  `EnrollmentID` int(11) NOT NULL AUTO_INCREMENT,
  `CourseID` int(11) NOT NULL,
  `Grade` int(11) DEFAULT NULL,
  `StudentID` int(11) NOT NULL,
  PRIMARY KEY (`EnrollmentID`),
  KEY `IX_Enrollment_CourseID` (`CourseID`),
  KEY `IX_Enrollment_StudentID` (`StudentID`),
  CONSTRAINT `FK_Enrollment_Course_CourseID` FOREIGN KEY (`CourseID`) REFERENCES `Course` (`CourseID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Enrollment_Student_StudentID` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
```
# Populate Tables with Test Data (MySQL)
## (localhost only)
```
USE <insert database name here>
```
## (localhost and cloud.gov)
```
------------------------------------------------------------------------------------------------------------------------------------------------
-- Student 
------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO `Student` (`ID`,`EnrollmentDate`,`FirstName`,`LastName`) VALUES (1,'2010-09-01 00:00:00','Carson','Alexander');
INSERT INTO `Student` (`ID`,`EnrollmentDate`,`FirstName`,`LastName`) VALUES (2,'2012-09-01 00:00:00','Meredith','Alonso');
INSERT INTO `Student` (`ID`,`EnrollmentDate`,`FirstName`,`LastName`) VALUES (3,'2013-09-01 00:00:00','Arturo','Anand');
INSERT INTO `Student` (`ID`,`EnrollmentDate`,`FirstName`,`LastName`) VALUES (4,'2012-09-01 00:00:00','Gytis','Barzdukas');
INSERT INTO `Student` (`ID`,`EnrollmentDate`,`FirstName`,`LastName`) VALUES (5,'2012-09-01 00:00:00','Yan','Li');
INSERT INTO `Student` (`ID`,`EnrollmentDate`,`FirstName`,`LastName`) VALUES (6,'2011-09-01 00:00:00','Peggy','Justice');
INSERT INTO `Student` (`ID`,`EnrollmentDate`,`FirstName`,`LastName`) VALUES (7,'2013-09-01 00:00:00','Laura','Norman');
INSERT INTO `Student` (`ID`,`EnrollmentDate`,`FirstName`,`LastName`) VALUES (8,'2005-09-01 00:00:00','Nino','Olivetto');
------------------------------------------------------------------------------------------------------------------------------------------------
-- Instructor 
------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO `Instructor` (`ID`,`FirstName`,`HireDate`,`LastName`) VALUES (1,'Kim','1995-03-11 00:00:00','Abercrombie');
INSERT INTO `Instructor` (`ID`,`FirstName`,`HireDate`,`LastName`) VALUES (2,'Fadi','2002-07-06 00:00:00','Fakhouri');
INSERT INTO `Instructor` (`ID`,`FirstName`,`HireDate`,`LastName`) VALUES (3,'Roger','1998-07-01 00:00:00','Harui');
INSERT INTO `Instructor` (`ID`,`FirstName`,`HireDate`,`LastName`) VALUES (4,'Candace','2001-01-15 00:00:00','Kapoor');
INSERT INTO `Instructor` (`ID`,`FirstName`,`HireDate`,`LastName`) VALUES (5,'Roger','2004-02-12 00:00:00','Zheng');
------------------------------------------------------------------------------------------------------------------------------------------------
-- OfficeAssignment 
------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO `OfficeAssignment` (`InstructorID`,`Location`) VALUES (2,'Smith 17');
INSERT INTO `OfficeAssignment` (`InstructorID`,`Location`) VALUES (3,'Gowan 27');
INSERT INTO `OfficeAssignment` (`InstructorID`,`Location`) VALUES (4,'Thompson 304');
------------------------------------------------------------------------------------------------------------------------------------------------
-- Department 
------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO `Department` (`DepartmentID`,`Budget`,`InstructorID`,`Name`,`StartDate`) VALUES (1,350000.00,1,'English','2007-09-01 00:00:00');
INSERT INTO `Department` (`DepartmentID`,`Budget`,`InstructorID`,`Name`,`StartDate`) VALUES (2,100000.00,2,'Mathematics','2007-09-01 00:00:00');
INSERT INTO `Department` (`DepartmentID`,`Budget`,`InstructorID`,`Name`,`StartDate`) VALUES (3,350000.00,3,'Engineering','2007-09-01 00:00:00');
INSERT INTO `Department` (`DepartmentID`,`Budget`,`InstructorID`,`Name`,`StartDate`) VALUES (4,100000.00,4,'Economics','2007-09-01 00:00:00');
------------------------------------------------------------------------------------------------------------------------------------------------
-- Course 
------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO `Course` (`CourseID`,`Credits`,`DepartmentID`,`Title`) VALUES (1045,4,2,'Calculus');
INSERT INTO `Course` (`CourseID`,`Credits`,`DepartmentID`,`Title`) VALUES (1050,3,3,'Chemistry');
INSERT INTO `Course` (`CourseID`,`Credits`,`DepartmentID`,`Title`) VALUES (2021,3,1,'Composition');
INSERT INTO `Course` (`CourseID`,`Credits`,`DepartmentID`,`Title`) VALUES (2042,4,1,'Literature');
INSERT INTO `Course` (`CourseID`,`Credits`,`DepartmentID`,`Title`) VALUES (3141,4,2,'Trigonometry');
INSERT INTO `Course` (`CourseID`,`Credits`,`DepartmentID`,`Title`) VALUES (4022,3,4,'Microeconomics');
INSERT INTO `Course` (`CourseID`,`Credits`,`DepartmentID`,`Title`) VALUES (4041,3,4,'Macroeconomics');
------------------------------------------------------------------------------------------------------------------------------------------------
-- CourseAssignment 
------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO `CourseAssignment` (`CourseID`,`InstructorID`) VALUES (2021,1);
INSERT INTO `CourseAssignment` (`CourseID`,`InstructorID`) VALUES (2042,1);
INSERT INTO `CourseAssignment` (`CourseID`,`InstructorID`) VALUES (1045,2);
INSERT INTO `CourseAssignment` (`CourseID`,`InstructorID`) VALUES (1050,3);
INSERT INTO `CourseAssignment` (`CourseID`,`InstructorID`) VALUES (3141,3);
INSERT INTO `CourseAssignment` (`CourseID`,`InstructorID`) VALUES (1050,4);
INSERT INTO `CourseAssignment` (`CourseID`,`InstructorID`) VALUES (4022,5);
INSERT INTO `CourseAssignment` (`CourseID`,`InstructorID`) VALUES (4041,5);
------------------------------------------------------------------------------------------------------------------------------------------------
-- Enrollment 
------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO `Enrollment` (`EnrollmentID`,`CourseID`,`Grade`,`StudentID`) VALUES (1,1050,0,1);
INSERT INTO `Enrollment` (`EnrollmentID`,`CourseID`,`Grade`,`StudentID`) VALUES (2,4022,2,1);
INSERT INTO `Enrollment` (`EnrollmentID`,`CourseID`,`Grade`,`StudentID`) VALUES (3,4041,1,1);
INSERT INTO `Enrollment` (`EnrollmentID`,`CourseID`,`Grade`,`StudentID`) VALUES (4,1045,1,2);
INSERT INTO `Enrollment` (`EnrollmentID`,`CourseID`,`Grade`,`StudentID`) VALUES (5,3141,1,2);
INSERT INTO `Enrollment` (`EnrollmentID`,`CourseID`,`Grade`,`StudentID`) VALUES (6,2021,1,2);
INSERT INTO `Enrollment` (`EnrollmentID`,`CourseID`,`Grade`,`StudentID`) VALUES (7,1050,NULL,3);
INSERT INTO `Enrollment` (`EnrollmentID`,`CourseID`,`Grade`,`StudentID`) VALUES (8,4022,1,3);
INSERT INTO `Enrollment` (`EnrollmentID`,`CourseID`,`Grade`,`StudentID`) VALUES (9,1050,1,4);
INSERT INTO `Enrollment` (`EnrollmentID`,`CourseID`,`Grade`,`StudentID`) VALUES (10,2021,1,5);
INSERT INTO `Enrollment` (`EnrollmentID`,`CourseID`,`Grade`,`StudentID`) VALUES (11,2042,1,6);
```
# Setting Environment Variables
## localhost only (on Mac or Linux)
```
export LOCAL_CONNECTION_STRING="Username=<insert username here>;Password=<insert password here>;Host=localhost;Port=3306;Database=<insert database (schema) name here;Pooling=true;"
```
# Using cloud.gov
Learning how to use cloud.gov is a bit involved and beyond the scope of this README file. I recommend starting here: 
1. ```https://cloud.gov/quickstart/```
2. ```https://cloud.gov/docs/services/relational-database/```
