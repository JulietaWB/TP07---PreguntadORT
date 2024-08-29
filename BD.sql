USE [master]
GO
/****** Object:  Database [TP07-PreguntadORT]    Script Date: 29/8/2024 14:13:46 ******/
CREATE DATABASE [TP07-PreguntadORT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TP07-PreguntadORT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TP07-PreguntadORT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TP07-PreguntadORT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TP07-PreguntadORT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TP07-PreguntadORT] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TP07-PreguntadORT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TP07-PreguntadORT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TP07-PreguntadORT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TP07-PreguntadORT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TP07-PreguntadORT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TP07-PreguntadORT] SET ARITHABORT OFF 
GO
ALTER DATABASE [TP07-PreguntadORT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TP07-PreguntadORT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TP07-PreguntadORT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TP07-PreguntadORT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TP07-PreguntadORT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TP07-PreguntadORT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TP07-PreguntadORT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TP07-PreguntadORT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TP07-PreguntadORT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TP07-PreguntadORT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TP07-PreguntadORT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TP07-PreguntadORT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TP07-PreguntadORT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TP07-PreguntadORT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TP07-PreguntadORT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TP07-PreguntadORT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TP07-PreguntadORT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TP07-PreguntadORT] SET RECOVERY FULL 
GO
ALTER DATABASE [TP07-PreguntadORT] SET  MULTI_USER 
GO
ALTER DATABASE [TP07-PreguntadORT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TP07-PreguntadORT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TP07-PreguntadORT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TP07-PreguntadORT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TP07-PreguntadORT] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TP07-PreguntadORT', N'ON'
GO
ALTER DATABASE [TP07-PreguntadORT] SET QUERY_STORE = OFF
GO
USE [TP07-PreguntadORT]
GO
/****** Object:  User [alumno]    Script Date: 29/8/2024 14:13:46 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categorías]    Script Date: 29/8/2024 14:13:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorías](
	[IdCategoría] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Foto] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Categorías] PRIMARY KEY CLUSTERED 
(
	[IdCategoría] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dificultades]    Script Date: 29/8/2024 14:13:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dificultades](
	[IdDificultad] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Dificultades] PRIMARY KEY CLUSTERED 
(
	[IdDificultad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 29/8/2024 14:13:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[IdPregunta] [int] NOT NULL,
	[IdCategoría] [int] NOT NULL,
	[IdDificultad] [int] NOT NULL,
	[Enunciado] [varchar](50) NOT NULL,
	[Foto] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Preguntas] PRIMARY KEY CLUSTERED 
(
	[IdPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuestas]    Script Date: 29/8/2024 14:13:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas](
	[IdRespuesta] [int] NOT NULL,
	[IdPregunta] [int] NOT NULL,
	[Opcion] [int] NOT NULL,
	[Contenido] [varchar](50) NOT NULL,
	[Correcta] [bit] NOT NULL,
	[Foto] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Respuestas] PRIMARY KEY CLUSTERED 
(
	[IdRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Categorías] FOREIGN KEY([IdCategoría])
REFERENCES [dbo].[Categorías] ([IdCategoría])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Categorías]
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Dificultades] FOREIGN KEY([IdDificultad])
REFERENCES [dbo].[Dificultades] ([IdDificultad])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Dificultades]
GO
ALTER TABLE [dbo].[Respuestas]  WITH CHECK ADD  CONSTRAINT [FK_Respuestas_Preguntas] FOREIGN KEY([IdPregunta])
REFERENCES [dbo].[Preguntas] ([IdPregunta])
GO
ALTER TABLE [dbo].[Respuestas] CHECK CONSTRAINT [FK_Respuestas_Preguntas]
GO
USE [master]
GO
ALTER DATABASE [TP07-PreguntadORT] SET  READ_WRITE 
GO
