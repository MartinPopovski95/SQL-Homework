--List all Teacher First Names and Student First Names in single result set with duplicates
SELECT FirstName FROM Teacher
UNION ALL
SELECT FirstName FROM Student
GO

--List all Teacher Last Names and Student Last Names in single result set. Remove duplicates
SELECT LastName FROM Teacher
UNION
SELECT LastName FROM Student
GO

--List all common First Names for Teachers and Students
SELECT FirstName FROM Teacher
INTERSECT
SELECT FirstName FROM Student
GO