
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 08/15/2017 18:57:29
-- Generated from EDMX file: D:\POLITECNICA\SEPTIMO SEMESTRE\PROGRAMACION WEB\Proyecto-Aplicaciones-Web-Tienda-Online\WEBAPP\WEBAPP\ModelStore.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [DatabaseStore];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'CarritoSet'
CREATE TABLE [dbo].[CarritoSet] (
    [IdCarrito] int IDENTITY(1,1) NOT NULL,
    [Usuario_IdUsuario] int  NOT NULL
);
GO

-- Creating table 'UsuarioSet'
CREATE TABLE [dbo].[UsuarioSet] (
    [IdUsuario] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Apellido] nvarchar(max)  NOT NULL,
    [Correo] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'CategoriaSet'
CREATE TABLE [dbo].[CategoriaSet] (
    [IdCategoria] int IDENTITY(1,1) NOT NULL,
    [NombreCategoria] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ProductoSet'
CREATE TABLE [dbo].[ProductoSet] (
    [IdProducto] int IDENTITY(1,1) NOT NULL,
    [NombreProducto] nvarchar(max)  NOT NULL,
    [Foto] nvarchar(max)  NOT NULL,
    [Precio] float  NOT NULL,
    [Carrito_IdCarrito] int  NOT NULL,
    [Categoria_IdCategoria] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [IdCarrito] in table 'CarritoSet'
ALTER TABLE [dbo].[CarritoSet]
ADD CONSTRAINT [PK_CarritoSet]
    PRIMARY KEY CLUSTERED ([IdCarrito] ASC);
GO

-- Creating primary key on [IdUsuario] in table 'UsuarioSet'
ALTER TABLE [dbo].[UsuarioSet]
ADD CONSTRAINT [PK_UsuarioSet]
    PRIMARY KEY CLUSTERED ([IdUsuario] ASC);
GO

-- Creating primary key on [IdCategoria] in table 'CategoriaSet'
ALTER TABLE [dbo].[CategoriaSet]
ADD CONSTRAINT [PK_CategoriaSet]
    PRIMARY KEY CLUSTERED ([IdCategoria] ASC);
GO

-- Creating primary key on [IdProducto] in table 'ProductoSet'
ALTER TABLE [dbo].[ProductoSet]
ADD CONSTRAINT [PK_ProductoSet]
    PRIMARY KEY CLUSTERED ([IdProducto] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Usuario_IdUsuario] in table 'CarritoSet'
ALTER TABLE [dbo].[CarritoSet]
ADD CONSTRAINT [FK_CarritoUsuario]
    FOREIGN KEY ([Usuario_IdUsuario])
    REFERENCES [dbo].[UsuarioSet]
        ([IdUsuario])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CarritoUsuario'
CREATE INDEX [IX_FK_CarritoUsuario]
ON [dbo].[CarritoSet]
    ([Usuario_IdUsuario]);
GO

-- Creating foreign key on [Carrito_IdCarrito] in table 'ProductoSet'
ALTER TABLE [dbo].[ProductoSet]
ADD CONSTRAINT [FK_CarritoProducto]
    FOREIGN KEY ([Carrito_IdCarrito])
    REFERENCES [dbo].[CarritoSet]
        ([IdCarrito])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CarritoProducto'
CREATE INDEX [IX_FK_CarritoProducto]
ON [dbo].[ProductoSet]
    ([Carrito_IdCarrito]);
GO

-- Creating foreign key on [Categoria_IdCategoria] in table 'ProductoSet'
ALTER TABLE [dbo].[ProductoSet]
ADD CONSTRAINT [FK_CategoriaProducto]
    FOREIGN KEY ([Categoria_IdCategoria])
    REFERENCES [dbo].[CategoriaSet]
        ([IdCategoria])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CategoriaProducto'
CREATE INDEX [IX_FK_CategoriaProducto]
ON [dbo].[ProductoSet]
    ([Categoria_IdCategoria]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------