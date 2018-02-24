-- USE <insert database name here>;

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
