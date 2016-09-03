CREATE TABLE [dbo].[tblAdmin] (
    [ADMIN_ID]      INT          NOT NULL,
    [ID]            INT          NOT NULL,
    [Experience]    VARCHAR (10) NOT NULL,
    [Qualification] VARCHAR (10) NOT NULL,
    PRIMARY KEY CLUSTERED ([ADMIN_ID] ASC),
    FOREIGN KEY ([ID]) REFERENCES [dbo].[tblRegistration] ([ID])
);

