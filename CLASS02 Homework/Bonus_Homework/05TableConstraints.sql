--Create Foreign key constraints from diagram or with script

ALTER TABLE [dbo].[Grade] ADD CONSTRAINT [FK_Grade_Student] FOREIGN KEY ([StudentID]) REFERENCES [dbo].[Student]([Id])