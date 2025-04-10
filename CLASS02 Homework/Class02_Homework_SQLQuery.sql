--Find all Students with FirstName = Antonio
SELECT * FROM Student
WHERE FirstName = 'Antonio'
GO

--Find all Students with DateOfBirth greater than ‘01.01.1999’
SELECT * FROM Student
WHERE DateOfBirth > '1999.01.01'
GO

--Find all Students with LastName starting With ‘J’ enrolled in January/1998
SELECT * FROM Student
WHERE EnrolledDate >= '1998.01.01' and EnrolledDate <= '1998.01.31'
and LastName like 'J%'
GO

--List all Students ordered by FirstName
SELECT * FROM Student
Order by FirstName
GO

--List all Teacher Last Names and Student Last Names in single result set. Remove duplicates
SELECT LastName FROM Teacher
UNION
SELECT LastName FROM Student
GO

--Create Foreign key constraints from diagram or with script
ALTER TABLE Grade
ADD CONSTRAINT FK_Grade_Student
FOREIGN KEY (StudentID)
REFERENCES Student(ID)
GO

--List all possible combinations of Courses names and AchievementType names that can be passed by student
SELECT c.[Name] as CourseName, a.[Name] as AchievementTypeName
FROM Course c
CROSS JOIN AchievementType a
GO

--List all Teachers without exam Grade
SELECT t.*
FROM Teacher t
LEFT JOIN Grade G ON t.ID = g.TeacherID
WHERE g.TeacherID IS NULL;
GO
