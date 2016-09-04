CREATE TABLE [dbo].[tblZipCode] (
    [zipID]      INT          IDENTITY (1, 1) NOT NULL,
    [Zip]        VARCHAR (10) NOT NULL,
    [City_name]  VARCHAR (20) NOT NULL,
    [State_name] VARCHAR (20) NOT NULL,
    PRIMARY KEY CLUSTERED ([zipID] ASC)
);

