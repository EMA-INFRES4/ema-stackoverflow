
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/27/2013 15:03:06
-- Generated from EDMX file: \\psf\Home\Documents\Visual Studio 2013\Projects\ema-stackoverflow\StackEMA\Models\StackEMA.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_PostReply]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reply] DROP CONSTRAINT [FK_PostReply];
GO
IF OBJECT_ID(N'[dbo].[FK_UserPost]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Post] DROP CONSTRAINT [FK_UserPost];
GO
IF OBJECT_ID(N'[dbo].[FK_UserReply]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reply] DROP CONSTRAINT [FK_UserReply];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Post]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Post];
GO
IF OBJECT_ID(N'[dbo].[Reply]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Reply];
GO
IF OBJECT_ID(N'[dbo].[User]', 'U') IS NOT NULL
    DROP TABLE [dbo].[User];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Post'
CREATE TABLE [dbo].[Post] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(max)  NOT NULL,
    [Date] datetime  NULL,
    [User_Id] int  NOT NULL
);
GO

-- Creating table 'Reply'
CREATE TABLE [dbo].[Reply] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Message] nvarchar(max)  NOT NULL,
    [Date] datetime  NOT NULL,
    [The] bit  NOT NULL,
    [Post_Id] int  NOT NULL,
    [User_Id] int  NOT NULL
);
GO

-- Creating table 'User'
CREATE TABLE [dbo].[User] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Post'
ALTER TABLE [dbo].[Post]
ADD CONSTRAINT [PK_Post]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Reply'
ALTER TABLE [dbo].[Reply]
ADD CONSTRAINT [PK_Reply]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'User'
ALTER TABLE [dbo].[User]
ADD CONSTRAINT [PK_User]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Post_Id] in table 'Reply'
ALTER TABLE [dbo].[Reply]
ADD CONSTRAINT [FK_PostReply]
    FOREIGN KEY ([Post_Id])
    REFERENCES [dbo].[Post]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PostReply'
CREATE INDEX [IX_FK_PostReply]
ON [dbo].[Reply]
    ([Post_Id]);
GO

-- Creating foreign key on [User_Id] in table 'Post'
ALTER TABLE [dbo].[Post]
ADD CONSTRAINT [FK_UserPost]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[User]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UserPost'
CREATE INDEX [IX_FK_UserPost]
ON [dbo].[Post]
    ([User_Id]);
GO

-- Creating foreign key on [User_Id] in table 'Reply'
ALTER TABLE [dbo].[Reply]
ADD CONSTRAINT [FK_UserReply]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[User]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UserReply'
CREATE INDEX [IX_FK_UserReply]
ON [dbo].[Reply]
    ([User_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------




INSERT INTO [dbo].[User] VALUES ('email1@example.com', 'aaa', 'U1');
INSERT INTO [dbo].[User] VALUES ('email2@example.com', 'aaa', 'U2');
INSERT INTO [dbo].[User] VALUES ('email3@example.com', 'aaa', 'U3');
INSERT INTO [dbo].[Post] VALUES ('POST # 1', getdate(), 1);
INSERT INTO [dbo].[Post] VALUES ('POST # 2', getdate(), 3);
INSERT INTO [dbo].[Post] VALUES ('POST # 3', getdate(), 1);
INSERT INTO [dbo].[Post] VALUES ('POST # 4', getdate(), 2);
INSERT INTO [dbo].[Post] VALUES ('POST # 5', getdate(), 2);
INSERT INTO [dbo].[Post] VALUES ('POST # 6', getdate(), 2);
INSERT INTO [dbo].[Post] VALUES ('POST # 7', getdate(), 3);
INSERT INTO [dbo].[Post] VALUES ('POST # 8', getdate(), 3);
INSERT INTO [dbo].[Post] VALUES ('POST # 9', getdate(), 1);
INSERT INTO [dbo].[Post] VALUES ('POST # 10', getdate(), 1);
INSERT INTO [dbo].[Reply] VALUES ('REPLY # 1', getdate(), 0, 1 , 2);
INSERT INTO [dbo].[Reply] VALUES ('REPLY # 2', getdate(), 0, 3 , 1);
INSERT INTO [dbo].[Reply] VALUES ('REPLY # 3', getdate(), 0, 6 , 3);
INSERT INTO [dbo].[Reply] VALUES ('REPLY # 4', getdate(), 0, 3 , 1);
INSERT INTO [dbo].[Reply] VALUES ('REPLY # 5', getdate(), 0, 6 , 3);
INSERT INTO [dbo].[Reply] VALUES ('REPLY # 6', getdate(), 0, 5 , 3);
INSERT INTO [dbo].[Reply] VALUES ('REPLY # 7', getdate(), 0, 7 , 1);
INSERT INTO [dbo].[Reply] VALUES ('REPLY # 8', getdate(), 0, 2 , 3);
INSERT INTO [dbo].[Reply] VALUES ('REPLY # 9', getdate(), 0, 1 , 2);
INSERT INTO [dbo].[Reply] VALUES ('REPLY # 10', getdate(), 0, 6 , 1);
INSERT INTO [dbo].[Reply] VALUES ('REPLY # 11', getdate(), 0, 2 , 2);
INSERT INTO [dbo].[Reply] VALUES ('REPLY # 12', getdate(), 0, 10 , 1);
INSERT INTO [dbo].[Reply] VALUES ('REPLY # 13', getdate(), 0, 2 , 2);
INSERT INTO [dbo].[Reply] VALUES ('REPLY # 14', getdate(), 0, 8 , 3);
INSERT INTO [dbo].[Reply] VALUES ('REPLY # 15', getdate(), 0, 3 , 3);
INSERT INTO [dbo].[Reply] VALUES ('REPLY # 16', getdate(), 0, 1 , 1);
INSERT INTO [dbo].[Reply] VALUES ('REPLY # 17', getdate(), 0, 5 , 1);
INSERT INTO [dbo].[Reply] VALUES ('REPLY # 18', getdate(), 0, 4 , 1);
INSERT INTO [dbo].[Reply] VALUES ('REPLY # 19', getdate(), 0, 2 , 2);
INSERT INTO [dbo].[Reply] VALUES ('REPLY # 20', getdate(), 0, 4 , 3);
INSERT INTO [dbo].[Reply] VALUES ('REPLY # 21', getdate(), 0, 6 , 3);
INSERT INTO [dbo].[Reply] VALUES ('REPLY # 22', getdate(), 0, 6 , 1);
INSERT INTO [dbo].[Reply] VALUES ('REPLY # 23', getdate(), 0, 10 , 3);
INSERT INTO [dbo].[Reply] VALUES ('REPLY # 24', getdate(), 0, 1 , 1);
INSERT INTO [dbo].[Reply] VALUES ('REPLY # 25', getdate(), 0, 3 , 2);
INSERT INTO [dbo].[Reply] VALUES ('REPLY # 26', getdate(), 0, 3 , 2);
INSERT INTO [dbo].[Reply] VALUES ('REPLY # 27', getdate(), 0, 3 , 1);
INSERT INTO [dbo].[Reply] VALUES ('REPLY # 28', getdate(), 0, 8 , 2);
INSERT INTO [dbo].[Reply] VALUES ('REPLY # 29', getdate(), 0, 6 , 2);
INSERT INTO [dbo].[Reply] VALUES ('REPLY # 30', getdate(), 0, 3 , 3);
