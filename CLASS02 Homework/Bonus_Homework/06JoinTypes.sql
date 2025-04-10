--List all possible combinations of Courses names and AchievementType names that can be passed by student
SELECT c.[Name] as CourseName, a.[Name] as AchievementTypeName
FROM Course c
CROSS JOIN AchievementType a
GO

--List all Teachers that has any exam Grade
SELECT DISTINCT t.FirstName, t.LastName
FROM Teacher t
join Grade g on t.ID = g.TeacherID
GO

--List all Teachers without exam Grade
SELECT t.*
FROM Teacher t
LEFT JOIN Grade G ON t.ID = g.TeacherID
WHERE g.TeacherID IS NULL;
GO

--List all Students without exam Grade (using Right Join)
SELECT s.*
FROM Grade g
RIGHT JOIN Student s ON g.StudentID = s.ID
WHERE g.StudentID IS NULL
GO