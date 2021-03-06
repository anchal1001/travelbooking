﻿CREATE TABLE [dbo].[tblRegistration] (
    [ID]               INT          NOT NULL,
    [Name]             VARCHAR (50) NOT NULL,
    [Email]            VARCHAR (50) NOT NULL,
    [PW]               VARCHAR (10) NOT NULL,
    [SecurityQuestion] INT          NOT NULL,
    [Answer]           VARCHAR (50) NOT NULL,
    [Category_Id]      INT          NOT NULL,
    [Phone]            VARCHAR (15) NOT NULL,
    [DOB]              DATE         NOT NULL,
    [ZIP]              VARCHAR (10) NOT NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);

