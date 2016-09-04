CREATE TABLE [dbo].[tblAdmin] (
    [adminID]       INT          IDENTITY (1, 1) NOT NULL,
    [RegID]         INT          NOT NULL,
    [Experience]    VARCHAR (10) NOT NULL,
    [Qualification] VARCHAR (10) NOT NULL,
    PRIMARY KEY CLUSTERED ([adminID] ASC),
    FOREIGN KEY ([RegID]) REFERENCES [dbo].[tblRegistration] ([RegID])
);

