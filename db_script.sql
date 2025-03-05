CREATE TABLE [dbo].[tblUser]
(
    [Id] INT IDENTITY NOT NULL PRIMARY KEY, 
    [username] VARCHAR(50) NULL, 
    [email] VARCHAR(50) NOT NULL, 
    [password] VARCHAR(50) NOT NULL
);
GO

INSERT INTO [tblUser] (username, email, password)
VALUES ('admin', 'admin@gmail.com', '123');
GO

CREATE TABLE [tblActivities] (
    ActivitiesID INT PRIMARY KEY IDENTITY,
    UserID INT,
    ActivityType VARCHAR(50),
    Duration INT,
    Distance FLOAT,
    Calories FLOAT,
    Sets INT,
    Repetitions INT,
    PosesCompleted INT,
    ElevationGain FLOAT,  -- Fixed case consistency
    ActivityDate DATE,
    CONSTRAINT [FK_tblActivities_tblUser]
    FOREIGN KEY (UserID) REFERENCES [tblUser](Id)
);
GO

CREATE TABLE [UserGoals] (
    GoalID INT PRIMARY KEY IDENTITY,
    UserID INT,
    GoalCalories INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES [tblUser](Id)
);
GO

INSERT INTO [tblActivities] (UserID, ActivityType, Duration,
Distance, Calories, Sets, Repetitions, PosesCompleted, ElevationGain, ActivityDate)
VALUES (1, 'Running', 2, 1, 1, 1, 1, 1, 1, GETDATE());
GO
