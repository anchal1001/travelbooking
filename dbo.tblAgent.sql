CREATE TABLE [dbo].[tblAgent] (
    [agentId] INT NOT NULL,
    [ID]      INT NOT NULL,
    PRIMARY KEY CLUSTERED ([agentId] ASC),
    FOREIGN KEY ([ID]) REFERENCES [dbo].[tblRegistration] ([ID])
);

