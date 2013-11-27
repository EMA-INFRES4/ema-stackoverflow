
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/27/2013 13:48:55
-- Generated from EDMX file: \\psf\home\documents\visual studio 2013\Projects\StackEMA\StackEMA\Models\StackEMA.edmx
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


INSERT INTO [dbo].[User] VALUES (1,2,3)

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------