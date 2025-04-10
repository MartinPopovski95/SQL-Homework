--Calculate the count of all grades per Teacher in the system
SELECT g.TeacherID, COUNT(Grade) as TotalGrade
FROM Grade g
left join Teacher t on g.TeacherID = t.ID
GROUP BY g.TeacherID
GO

--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)
SELECT g.TeacherID, COUNT(Grade) as TotalGrade
FROM Grade g
left join Teacher t on g.TeacherID = t.ID
WHERE StudentID < 100
GROUP BY g.TeacherID
GO

--Find the Maximal Grade, and the Average Grade per Student on all grades in the system
SELECT g.StudentID, MAX(Grade) as MaxGrade, AVG (Grade) as AverageGrade
FROM Grade g
left join Student s on g.StudentID = s.ID
GROUP BY g.StudentID 
GO

--Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200
SELECT g.TeacherID, COUNT(Grade) as TotalGrade
FROM Grade g
left join Teacher t on g.TeacherID = t.ID
GROUP BY g.TeacherID
HAVING(COUNT(Grade) > 200)
GO

--Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. Filter only records where Maximal Grade is equal to Average Grade
SELECT g.StudentID, COUNT(Grade) as TotalGrade, MAX(Grade) as MaxGrade, AVG (Grade) as AverageGrade
FROM Grade g
left join Student s on g.StudentID = s.ID
GROUP BY g.StudentID
HAVING(MAX(Grade) = AVG(Grade))
GO

--List Student First Name and Last Name next to the other details from previous query
SELECT StudentID, FirstName, LastName, MAX(Grade) AS MaximalGrade, AVG(Grade) AS AverageGrade
FROM Student s
right join Grade g ON s.ID = g.StudentID
GROUP BY StudentID, FirstName, LastName
HAVING MAX(Grade) = AVG(Grade)
GO

--Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student
CREATE VIEW vv_StudentGrades
AS
SELECT StudentID, COUNT(Grade) as TotalGrades
FROM Student s
right join Grade g ON s.ID = g.StudentID
GROUP BY StudentID
GO

--Change the view to show Student First and Last Names instead of StudentID
ALTER VIEW vv_StudentGrades
AS
SELECT FirstName, LastName, COUNT(Grade) as TotalGrades
FROM Student s
right join Grade g ON s.ID = g.StudentID
GROUP BY FirstName, LastName
GO

--List all rows from view ordered by biggest Grade Count
SELECT * FROM vv_StudentGrades
ORDER BY TotalGrades desc
GO