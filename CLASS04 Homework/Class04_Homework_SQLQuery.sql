-- Declare scalar variable for storing FirstName values
DECLARE @FirstName nvarchar(100)

-- Assign value ‘Antonio’ to the FirstName variable
SET @FirstName = 'Antonio'

-- Find all Students having FirstName same as the variable
SELECT * FROM Student
WHERE FirstName = @FirstName
GO

-- Declare table variable that will contain StudentId, StudentName and DateOfBirth
DECLARE @StudentInfo TABLE
(StudenID int, FirstName nvarchar(100), LastName nvarchar(100), DateOfBirth date)

-- Fill the table variable with all Female students
INSERT INTO @StudentInfo
SELECT ID, FirstName, LastName, DateOfBirth
FROM Student
WHERE Gender = 'F'
SELECT * FROM @StudentInfo
GO

-- Declare temp table that will contain LastName and EnrolledDate columns
CREATE TABLE #StudentTempTable
(LastName nvarchar(100), EnrolledDate date)

-- Fill the temp table with all Male students having First Name starting with ‘A’
INSERT INTO #StudentTempTable
SELECT LastName, EnrolledDate
FROM Student
WHERE Gender = 'M' and FirstName like 'A%'

-- Retrieve the students from the table which last name is with 7 characters
SELECT * FROM #StudentTempTable
WHERE LEN(LastName) = 7
GO

-- Find all teachers whose FirstName length is less than 5 and the first 3 characters of their FirstName and LastName are the same
CREATE OR ALTER FUNCTION dbo.GetMatchingTeachers()
RETURNS TABLE
AS
RETURN
(
    SELECT  FirstName, LastName
    FROM Teacher
    WHERE LEN(FirstName) < 5
      AND LEFT(FirstName, 3) = LEFT(LastName, 3)
)
GO
SELECT * FROM dbo.GetMatchingTeachers();