-- CREATE DATABASE <insert database name here>;
-- USE <insert database name here>;

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