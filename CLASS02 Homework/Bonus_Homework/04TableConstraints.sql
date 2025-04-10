--Change GradeDetails table always to insert value 100 in AchievementMaxPoints column if no value is provided on insert
ALTER TABLE GradeDetails
ADD CONSTRAINT DF_GradeDetails_AchievementMaxPoints
DEFAULT 100 FOR AchievementMaxPoints
GO

--Change GradeDetails table to prevent inserting AchievementPoints that will more than AchievementMaxPoints
ALTER TABLE GradeDetails
ADD CONSTRAINT chk_achievement_points
CHECK (AchievementPoints <= AchievementMaxPoints)
GO

--Change AchievementType table to guarantee unique names across the Achievement types
ALTER TABLE AchievementType
ADD CONSTRAINT uq_achievementtype_name
UNIQUE (Name)
GO
