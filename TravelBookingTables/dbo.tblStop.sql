CREATE TABLE [dbo].[tblStop] (
    [stopID]  INT          IDENTITY (1, 1) NOT NULL,
    [cityId]  INT          NOT NULL,
    [stopsAt] VARCHAR (20) NOT NULL,
    PRIMARY KEY CLUSTERED ([stopID] ASC),
    FOREIGN KEY ([cityId]) REFERENCES [dbo].[tblCity] ([cityId])
);

