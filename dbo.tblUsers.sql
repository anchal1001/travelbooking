CREATE TABLE [dbo].[tblUsers] (
    [userId] INT NOT NULL,
    [XP]     INT DEFAULT ((0)) NOT NULL,
    [Rating] INT DEFAULT ((0)) NOT NULL,
    [ID]     INT NOT NULL,
    PRIMARY KEY CLUSTERED ([userId] ASC),
    FOREIGN KEY ([ID]) REFERENCES [dbo].[tblRegistration] ([ID])
);

