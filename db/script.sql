USE [master]
GO
/****** Object:  Database [sisrecocoap]    Script Date: 9/17/2021 9:42:57 AM ******/
CREATE DATABASE [sisrecocoap]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'sisrecocoap', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\sisrecocoap.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'sisrecocoap_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\sisrecocoap_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [sisrecocoap] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [sisrecocoap].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [sisrecocoap] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [sisrecocoap] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [sisrecocoap] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [sisrecocoap] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [sisrecocoap] SET ARITHABORT OFF 
GO
ALTER DATABASE [sisrecocoap] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [sisrecocoap] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [sisrecocoap] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [sisrecocoap] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [sisrecocoap] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [sisrecocoap] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [sisrecocoap] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [sisrecocoap] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [sisrecocoap] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [sisrecocoap] SET  DISABLE_BROKER 
GO
ALTER DATABASE [sisrecocoap] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [sisrecocoap] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [sisrecocoap] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [sisrecocoap] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [sisrecocoap] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [sisrecocoap] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [sisrecocoap] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [sisrecocoap] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [sisrecocoap] SET  MULTI_USER 
GO
ALTER DATABASE [sisrecocoap] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [sisrecocoap] SET DB_CHAINING OFF 
GO
ALTER DATABASE [sisrecocoap] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [sisrecocoap] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [sisrecocoap] SET DELAYED_DURABILITY = DISABLED 
GO
USE [sisrecocoap]
GO
/****** Object:  Table [dbo].[Consumos]    Script Date: 9/17/2021 9:42:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consumos](
	[IdConsumo] [int] NOT NULL,
	[Cuenta] [int] NULL,
	[IdPeriodo] [nvarchar](5) NULL,
	[Cancelado] [bit] NULL,
	[FechaPago] [smalldatetime] NULL,
	[CIEmpleado] [nchar](15) NULL,
 CONSTRAINT [PK_Consumos] PRIMARY KEY CLUSTERED 
(
	[IdConsumo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 9/17/2021 9:42:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[CI] [nchar](15) NOT NULL,
	[Apellidos_Nombres] [nvarchar](50) NULL,
	[Direccion] [nvarchar](200) NULL,
	[Celular] [nvarchar](50) NULL,
	[Cargo] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[FechaRegistro] [smalldatetime] NULL,
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[CI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Periodos]    Script Date: 9/17/2021 9:42:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Periodos](
	[IdPeriodo] [nvarchar](5) NOT NULL,
	[FechaInicio] [smalldatetime] NULL,
	[FechaFinal] [smalldatetime] NULL,
	[Tarifa] [int] NULL,
 CONSTRAINT [PK_Periodos] PRIMARY KEY CLUSTERED 
(
	[IdPeriodo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Socios]    Script Date: 9/17/2021 9:42:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Socios](
	[Cuenta] [int] NOT NULL,
	[ApellidosNombres] [nchar](70) NULL,
	[CI] [nchar](15) NULL,
	[Direccion] [nchar](200) NULL,
	[Celular] [nchar](8) NULL,
	[FechaRegistro] [smalldatetime] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_Socios] PRIMARY KEY CLUSTERED 
(
	[Cuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Empleados] ([CI], [Apellidos_Nombres], [Direccion], [Celular], [Cargo], [Password], [FechaRegistro]) VALUES (N'4020091        ', N'Tapia Hiver', N'far far away', N'72330319', N'administrador', N'admin', CAST(N'2021-09-17 00:00:00' AS SmallDateTime))
ALTER TABLE [dbo].[Consumos]  WITH CHECK ADD  CONSTRAINT [FK_Consumos_Empleados] FOREIGN KEY([CIEmpleado])
REFERENCES [dbo].[Empleados] ([CI])
GO
ALTER TABLE [dbo].[Consumos] CHECK CONSTRAINT [FK_Consumos_Empleados]
GO
ALTER TABLE [dbo].[Consumos]  WITH CHECK ADD  CONSTRAINT [FK_Consumos_Periodos] FOREIGN KEY([IdPeriodo])
REFERENCES [dbo].[Periodos] ([IdPeriodo])
GO
ALTER TABLE [dbo].[Consumos] CHECK CONSTRAINT [FK_Consumos_Periodos]
GO
ALTER TABLE [dbo].[Consumos]  WITH CHECK ADD  CONSTRAINT [FK_Consumos_Socios] FOREIGN KEY([Cuenta])
REFERENCES [dbo].[Socios] ([Cuenta])
GO
ALTER TABLE [dbo].[Consumos] CHECK CONSTRAINT [FK_Consumos_Socios]
GO
USE [master]
GO
ALTER DATABASE [sisrecocoap] SET  READ_WRITE 
GO
