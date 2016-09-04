CREATE TABLE [dbo].[tblPlanning] (
    [planID]      INT          IDENTITY (1, 1) NOT NULL,
    [userId]      INT          NOT NULL,
    [startPoint]  VARCHAR (20) NOT NULL,
    [destination] VARCHAR (20) NOT NULL,
    [fromDate]    DATE         NOT NULL,
    [toDate]      DATE         NOT NULL,
    [modeId]      INT          NOT NULL,
    PRIMARY KEY CLUSTERED ([planID] ASC),
    FOREIGN KEY ([userId]) REFERENCES [dbo].[tblUsers] ([userId])
);

