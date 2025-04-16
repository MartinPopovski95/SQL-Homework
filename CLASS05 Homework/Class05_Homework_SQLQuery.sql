--Homework 02.1
--• Create new procedure called CreateGrade;
--• Procedure should create only Grade header info (not Grade Details);
--• Procedure should return the total number of grades in the system for the Student on input (from the CreateGrade);
--• Procedure should return second result set with the MAX Grade of all grades for the Student and Teacher on input (regardless the Course).

CREATE OR ALTER PROCEDURE dbo.CreateGrade (@StudentID int, @CourseID int, @TeacherID int, @Grade int, @CreatedDate date)
AS
BEGIN
	INSERT INTO Grade (StudentID, CourseID, TeacherID, Grade, CreatedDate)
	VALUES(@StudentID, @CourseID, @TeacherID, @Grade, @CreatedDate)

	SELECT
		COUNT(*) as TotalNumberOfGrades
		FROM
			Grade
		WHERE
			StudentID = @StudentID

	SELECT
		MAX(Grade) as MaxGradeOfAllCourses
		FROM 
			Grade
		WHERE
			StudentID = @StudentID
			and TeacherID = @TeacherID
END
GO

SELECT * FROM Grade
GO

EXEC CreateGrade @StudentID = 515, @CourseID = 8, @TeacherID = 48, @Grade = 7, @CreatedDate = '2025.04.14'
GO

EXEC CreateGrade @StudentID = 47, @CourseID = 17, @TeacherID = 3, @Grade = 9, @CreatedDate = '2025.04.14'
GO

--Homework 02.2
--• Create new procedure called CreateGradeDetail;
--• Procedure should add details for specific Grade (new record for new AchievementTypeID, Points, MaxPoints, Date for specific Grade);
--• Output from this procedure should be result set with SUM of GradePoints calculated with formula AchievementPoints/AchievementMaxPoints*ParticipationRate for specific Grade

CREATE OR ALTER PROCEDURE dbo.CreateGradeDetail(@GradeID int, @AchievementTypeID int, @AchievementPoints int, @AchievementMaxPoints int, @AchievementDate date,@ID_Temp int)
AS
BEGIN
	INSERT INTO GradeDetails(GradeID,AchievementTypeID, AchievementPoints, AchievementMaxPoints, AchievementDate,ID_Temp)
	VALUES (@GradeID, @AchievementTypeID, @AchievementPoints, @AchievementMaxPoints, @AchievementDate, @ID_Temp)

	SELECT
		SUM(CAST (gd.AchievementPoints as float)/gd.AchievementMaxPoints*a.ParticipationRate) as TotalGradePoints
	FROM GradeDetails gd
	JOIN AchievementType as a on gd.AchievementTypeID = a.ID
	WHERE GradeID = @GradeID
END
GO

EXEC CreateGradeDetail @GradeID = 0, @AchievementTypeID = 2 , @AchievementPoints = 79, @AchievementMaxPoints = 100, @AchievementDate = '2025.04.14', @ID_Temp = 1
GO

EXEC CreateGradeDetail @GradeID = 1, @AchievementTypeID = 5 , @AchievementPoints = 92, @AchievementMaxPoints = 100, @AchievementDate = '2025.04.14', @ID_Temp = 1
GO