
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 07/18/2017 23:45:42
-- Generated from EDMX file: D:\POLITECNICA\SEPTIMO SEMESTRE\PROGRAMACION WEB\Proyecto-Aplicaciones-Web-Tienda-Online\ProyectoWeb\ProyectoWeb\Models\ModelStoreV1.edmx
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

IF OBJECT_ID(N'[dbo].[FK_CategoriaProducto]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductoSet] DROP CONSTRAINT [FK_CategoriaProducto];
GO
IF OBJECT_ID(N'[dbo].[FK_CarritoProducto]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductoSet] DROP CONSTRAINT [FK_CarritoProducto];
GO
IF OBJECT_ID(N'[dbo].[FK_CarritoUsuario]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UsuarioSet] DROP CONSTRAINT [FK_CarritoUsuario];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[CarritoSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CarritoSet];
GO
IF OBJECT_ID(N'[dbo].[CategoriaSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CategoriaSet];
GO
IF OBJECT_ID(N'[dbo].[ProductoSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductoSet];
GO
IF OBJECT_ID(N'[dbo].[UsuarioSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UsuarioSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'CarritoSet'
CREATE TABLE [dbo].[CarritoSet] (
    [IdCarrito] int IDENTITY(1,1) NOT NULL
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
    [Categoria_IdCategoria] int  NOT NULL,
    [Carrito_IdCarrito] int  NOT NULL
);
GO

-- Creating table 'UsuarioSet'
CREATE TABLE [dbo].[UsuarioSet] (
    [IdUsuario] int IDENTITY(1,1) NOT NULL,
    [Nombres] nvarchar(max)  NOT NULL,
    [Apellidos] nvarchar(max)  NOT NULL,
    [Correo] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [Carrito_IdCarrito] int  NOT NULL
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

-- Creating primary key on [IdUsuario] in table 'UsuarioSet'
ALTER TABLE [dbo].[UsuarioSet]
ADD CONSTRAINT [PK_UsuarioSet]
    PRIMARY KEY CLUSTERED ([IdUsuario] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

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

-- Creating foreign key on [Carrito_IdCarrito] in table 'UsuarioSet'
ALTER TABLE [dbo].[UsuarioSet]
ADD CONSTRAINT [FK_CarritoUsuario]
    FOREIGN KEY ([Carrito_IdCarrito])
    REFERENCES [dbo].[CarritoSet]
        ([IdCarrito])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CarritoUsuario'
CREATE INDEX [IX_FK_CarritoUsuario]
ON [dbo].[UsuarioSet]
    ([Carrito_IdCarrito]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------