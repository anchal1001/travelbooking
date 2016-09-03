CREATE TABLE [dbo].[tblPlanning] (
    [ID]          INT          NOT NULL,
    [userId]      INT          NOT NULL,
    [startPoint]  VARCHAR (20) NOT NULL,
    [destination] VARCHAR (20) NOT NULL,
    [fromDate]    DATE         NOT NULL,
    [toDate]      DATE         NOT NULL,
    [modeId]      INT          NOT NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([userId]) REFERENCES [dbo].[tblUsers] ([userId])
);

