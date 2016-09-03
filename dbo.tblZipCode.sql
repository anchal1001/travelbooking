CREATE TABLE [dbo].[tblZipCode] (
    [ID]         INT          NOT NULL,
    [Zip]        VARCHAR (10) NOT NULL,
    [City_name]  VARCHAR (20) NOT NULL,
    [State_name] VARCHAR (20) NOT NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);

