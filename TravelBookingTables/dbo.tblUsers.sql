CREATE TABLE [dbo].[tblUsers] (
    [userId] INT IDENTITY (1, 1) NOT NULL,
    [XP]     INT DEFAULT ((0)) NOT NULL,
    [Rating] INT DEFAULT ((0)) NOT NULL,
    [RegID]  INT NOT NULL,
    PRIMARY KEY CLUSTERED ([userId] ASC),
    FOREIGN KEY ([RegID]) REFERENCES [dbo].[tblRegistration] ([RegID])
);

