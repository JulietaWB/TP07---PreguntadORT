USE [master]
GO
/****** Object:  Database [TP07-PreguntadORT]    Script Date: 12/9/2024 14:03:23 ******/
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
/****** Object:  User [alumno]    Script Date: 12/9/2024 14:03:23 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categorías]    Script Date: 12/9/2024 14:03:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorías](
	[IdCategoría] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Foto] [varchar](5000) NULL,
 CONSTRAINT [PK_Categorías] PRIMARY KEY CLUSTERED 
(
	[IdCategoría] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dificultades]    Script Date: 12/9/2024 14:03:23 ******/
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
/****** Object:  Table [dbo].[Preguntas]    Script Date: 12/9/2024 14:03:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[IdPregunta] [int] NOT NULL,
	[IdCategoría] [int] NOT NULL,
	[IdDificultad] [int] NOT NULL,
	[Enunciado] [varchar](500) NOT NULL,
	[Foto] [varchar](5000) NULL,
 CONSTRAINT [PK_Preguntas] PRIMARY KEY CLUSTERED 
(
	[IdPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuestas]    Script Date: 12/9/2024 14:03:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas](
	[IdRespuesta] [int] NOT NULL,
	[IdPregunta] [int] NOT NULL,
	[Opcion] [int] NOT NULL,
	[Contenido] [varchar](500) NOT NULL,
	[Correcta] [bit] NOT NULL,
	[Foto] [varchar](5000) NULL,
 CONSTRAINT [PK_Respuestas] PRIMARY KEY CLUSTERED 
(
	[IdRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Categorías] ([IdCategoría], [Nombre], [Foto]) VALUES (1, N'Cine', N'')
INSERT [dbo].[Categorías] ([IdCategoría], [Nombre], [Foto]) VALUES (2, N'Geografía', NULL)
INSERT [dbo].[Categorías] ([IdCategoría], [Nombre], [Foto]) VALUES (3, N'Animales', NULL)
GO
INSERT [dbo].[Dificultades] ([IdDificultad], [Nombre]) VALUES (1, N'Fácil')
INSERT [dbo].[Dificultades] ([IdDificultad], [Nombre]) VALUES (2, N'Intermedio')
INSERT [dbo].[Dificultades] ([IdDificultad], [Nombre]) VALUES (3, N'Difícil')
GO
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoría], [IdDificultad], [Enunciado], [Foto]) VALUES (1, 1, 1, N'¿Qué pelicula es esta?', N'https://media.revistavanityfair.es/photos/60e864d476b409bfd6cba092/master/pass/17540.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoría], [IdDificultad], [Enunciado], [Foto]) VALUES (2, 1, 2, N'¿Qué pelicula es esta?', N'https://hyperbole.es/wp-content/uploads/2014/11/interstellar3.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoría], [IdDificultad], [Enunciado], [Foto]) VALUES (3, 1, 3, N'¿Qué pelicula es esta?', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRueYD65_sPyoGb1x4x5BHNVKzJtlqcdp82Q&s')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoría], [IdDificultad], [Enunciado], [Foto]) VALUES (4, 2, 1, N'¿A que país pertenece esta bandera?', N'https://upload.wikimedia.org/wikipedia/commons/f/fe/Flag_of_Egypt.svg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoría], [IdDificultad], [Enunciado], [Foto]) VALUES (5, 2, 2, N'¿A que país pertenece esta bandera?', N'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFwAAABcCAMAAADUMSJqAAAAG1BMVEXOKTlHcFD////MGy7jjZT88fLz9vSbsKA+akhP0JAvAAAARUlEQVRoge3MwQ2AIAAEsBMF3X9iJ/B5MSTtAE0AAOAPZ1GuosyijCK5XC6Xy+Vydata:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFwAAABcCAMAAADUMSJqAAAAG1BMVEXOKTlHcFD////MGy7jjZT88fLz9vSbsKA+akhP0JAvAAAARUlEQVRoge3MwQ2AIAAEsBMF3X9iJ/B5MSTtAE0AAOAPZ1GuosyijCK5XC6Xy+Vy+d75KspdlKcoR5FcLpfL5XK5XP7lBenWKmnQDyCqAAAAAElFTkSuQmCC')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoría], [IdDificultad], [Enunciado], [Foto]) VALUES (6, 2, 3, N'¿A que país pertenece esta bandera?', N'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c7/Flag_of_Serbia_%281882%E2%80%931918%29.svg/2560px-Flag_of_Serbia_%281882%E2%80%931918%29.svg.png')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoría], [IdDificultad], [Enunciado], [Foto]) VALUES (7, 3, 1, N'¿Que animal es este?', N'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRqhN5Td05yBqj_1pimCRo8ZnqWvvuVFCsz2vpXMZY8Tqhm-Xjij4XzRFS7LxS-fjebaHkuI_idgFC-fm8SUkRvDeRvefHqWB-n5F4CLw')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoría], [IdDificultad], [Enunciado], [Foto]) VALUES (8, 3, 2, N'¿Que animal es este?', N'https://i.pinimg.com/originals/d3/2f/0f/d32f0fbb35c4c87c81120128141e24a5.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoría], [IdDificultad], [Enunciado], [Foto]) VALUES (9, 3, 3, N'¿Que animal es este?', N'https://www.veterinariaromareda.es/uploads/nXPAVri1/737x0_1140x0/Cuidados-de-las-cobayas.jpg')
GO
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (1, 1, 1, N'Cabaret (1972)', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (2, 1, 2, N'The Great Gatsby', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (3, 1, 3, N'Titanic', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (4, 2, 1, N'Intersellar', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (5, 2, 2, N'Una odisea del espacio (2001)', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (6, 2, 3, N'Alien: El octavo pasajero', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (7, 3, 1, N'The Big Lebowski', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (8, 3, 2, N'Los Ángeles de Charlie', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (9, 3, 3, N'Blade Runner', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (10, 4, 1, N'Irak', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (11, 4, 2, N'México', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (12, 4, 3, N'Egipto', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (13, 5, 1, N'Hungría', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (14, 5, 2, N'Lituania', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (15, 5, 3, N'Eslovaquia', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (16, 6, 1, N'Eslovenia', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (17, 6, 2, N'Serbia', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (18, 6, 3, N'Croacia', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (19, 7, 1, N'Grillo de campo', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (20, 7, 2, N'Cigarra', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (21, 7, 3, N'Saltamontes', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (22, 8, 1, N'Salamandra', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (23, 8, 2, N'Axolote', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (24, 8, 3, N'Caudata', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (25, 9, 1, N'Cobaya', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (26, 9, 2, N'Capibara', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (27, 9, 3, N'Hamster', 0, NULL)
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

