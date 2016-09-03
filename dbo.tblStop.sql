CREATE TABLE [dbo].[tblStop] (
    [ID]      INT          NOT NULL,
    [cityId]  INT          NOT NULL,
    [stopsAt] VARCHAR (20) NOT NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([cityId]) REFERENCES [dbo].[tblCity] ([cityId])
);

