USE [master]
GO
/****** Object:  Database [TP07-PreguntadORT]    Script Date: 17/9/2024 09:05:51 ******/
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
/****** Object:  User [alumno]    Script Date: 17/9/2024 09:05:52 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categorías]    Script Date: 17/9/2024 09:05:52 ******/
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
/****** Object:  Table [dbo].[Dificultades]    Script Date: 17/9/2024 09:05:52 ******/
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
/****** Object:  Table [dbo].[Preguntas]    Script Date: 17/9/2024 09:05:52 ******/
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
/****** Object:  Table [dbo].[Respuestas]    Script Date: 17/9/2024 09:05:52 ******/
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
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoría], [IdDificultad], [Enunciado], [Foto]) VALUES (10, 1, 1, N'¿Qué pelicula es esta?', N'https://media.wired.com/photos/660f0e62da77ad89fa0e9812/master/pass/The-Monitor-The-Matrix-Culture-2JD8FJX.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoría], [IdDificultad], [Enunciado], [Foto]) VALUES (11, 1, 2, N'¿Qué pelicula es esta?', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRm4YrpHIcsrG-y28s9u0TKR3KZ7spn5Nt_MQ&s')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoría], [IdDificultad], [Enunciado], [Foto]) VALUES (12, 1, 3, N'¿Qué pelicula es esta?', N'https://imagenes.elpais.com/resizer/v2/UU7EK3LSSRL77HQH5ZHQRJAJIA.jpg?auth=55427cda34ee0832111eb322a50b2305b17bcf0f8986aec80f41c7208a2aeeee&width=414')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoría], [IdDificultad], [Enunciado], [Foto]) VALUES (13, 1, 1, N'¿Qué pelicula es esta?', N'https://m.media-amazon.com/images/S/pv-target-images/fc6453e1a08c1ae819e2ad97c8a00484f6b531a415474e20b32e1ce53d4f5781._SX1080_FMjpg_.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoría], [IdDificultad], [Enunciado], [Foto]) VALUES (14, 1, 2, N'¿Qué pelicula es esta?', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKmJUBMdehtQsru7p3MwuN5I5Gst0XvTR4QT51MwFqhCdJ4LogIfpqy4iB4I3Qve1nz4I&usqp=CAU')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoría], [IdDificultad], [Enunciado], [Foto]) VALUES (15, 1, 3, N'¿Qué pelicula es esta?', N'https://ca-times.brightspotcdn.com/dims4/default/dae35ed/2147483647/strip/false/crop/1449x937+0+0/resize/1449x937!/quality/75/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F10%2F4f%2Ffedee59d4ac5b0e730f54b309701%2Fvolver-ip-1095806.JPG')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoría], [IdDificultad], [Enunciado], [Foto]) VALUES (16, 2, 1, N'¿A que país pertenece esta bandera?', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRY5uVbhBo0L_AhroQtHSt5A9ne6Wc3vgQTg&s')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoría], [IdDificultad], [Enunciado], [Foto]) VALUES (17, 2, 2, N'¿A que país pertenece esta bandera?', N'https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Flag_of_Belarus.svg/800px-Flag_of_Belarus.svg.png')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoría], [IdDificultad], [Enunciado], [Foto]) VALUES (18, 2, 3, N'¿A que país pertenece esta bandera?', N'https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Flag_of_Albania.svg/200px-Flag_of_Albania.svg.png')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoría], [IdDificultad], [Enunciado], [Foto]) VALUES (19, 2, 1, N'¿A que país pertenece esta bandera?', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3_6tA6Ns9-8r3wSBNvVsySu8NPQFoBemqUQ&s')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoría], [IdDificultad], [Enunciado], [Foto]) VALUES (20, 2, 2, N'¿A que país pertenece esta bandera?', N'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Flag_of_Brunei.svg/640px-Flag_of_Brunei.svg.png')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoría], [IdDificultad], [Enunciado], [Foto]) VALUES (21, 2, 3, N'¿A que país pertenece esta bandera?', N'https://upload.wikimedia.org/wikipedia/commons/6/60/Flag_of_Suriname.svg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoría], [IdDificultad], [Enunciado], [Foto]) VALUES (22, 3, 1, N'¿Que animal es este?', N'https://static.nationalgeographicla.com/files/styles/image_3200/public/armadillos01.jpg?w=760&h=506')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoría], [IdDificultad], [Enunciado], [Foto]) VALUES (23, 3, 2, N'¿Que animal es este?', N'https://cdn.pixabay.com/photo/2022/12/14/21/50/okapi-7656378_1280.png')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoría], [IdDificultad], [Enunciado], [Foto]) VALUES (24, 3, 3, N'¿Que animal es este?', N'https://allyouneedisbiology.wordpress.com/wp-content/uploads/2017/02/aye-aye.jpg?w=1038&h=576&crop=1')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoría], [IdDificultad], [Enunciado], [Foto]) VALUES (25, 3, 1, N'¿Que animal es este?', N'https://st3.depositphotos.com/1594920/17257/i/450/depositphotos_172572216-stock-photo-young-california-sea-lion-zalophus.jpg')
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
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (28, 10, 1, N'The Matrix', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (29, 10, 2, N'El Código', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (30, 10, 3, N'Realidad Alternativa
', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (31, 11, 1, N'Goodfellas', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (32, 11, 2, N'The Godfather', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (33, 11, 3, N'Scarface', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (34, 12, 1, N'El Gran Lebowski', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (35, 12, 2, N'Reservoir Dogs', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (36, 12, 3, N'Pulp Fiction', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (37, 13, 1, N'La Guerra de los Mundos', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (38, 13, 2, N'Avatar', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (39, 13, 3, N'Distrito 9', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (40, 14, 1, N'El Indomable Will Hunting', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (41, 14, 2, N'Un Domingo Cualquiera', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (42, 14, 3, N'Forrest Gump', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (43, 15, 1, N'Back to the Future
', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (44, 15, 2, N'Regreso al Futuro
', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (45, 15, 3, N'Viaje al Futuro
', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (46, 16, 1, N'Países Bajos', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (47, 16, 2, N'Bélgica', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (48, 16, 3, N'Luxemburgo', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (49, 17, 1, N'Bielorrusia', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (50, 17, 2, N'Portugal', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (51, 17, 3, N'Polonia', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (52, 18, 1, N'Albania', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (53, 18, 2, N'Macedonia del Norte', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (54, 18, 3, N'Kosovo', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (55, 19, 1, N'Macedonia del Norte', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (56, 19, 2, N'Montenegro', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (57, 19, 3, N'Chequia', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (58, 20, 1, N'Brunei', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (59, 20, 2, N'Singapur', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (60, 20, 3, N'Malasia', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (61, 21, 1, N'Guyana', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (62, 21, 2, N'Surinam', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (63, 21, 3, N'Trinidad y Tobago', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (64, 22, 1, N'Armadillo', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (65, 22, 2, N'Cacatúa', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (66, 22, 3, N'Oso Hormiguero', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (67, 23, 1, N'Cebra de montaña', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (68, 23, 2, N'Jirafa', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (69, 23, 3, N'Okapi', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (70, 24, 1, N'Lémur de cola anillada
', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (71, 24, 2, N'Aye-Aye', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (72, 24, 3, N'Tarsier', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (73, 25, 1, N'Foca', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (74, 25, 2, N'León Marinho
', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (75, 25, 3, N'Delfín', 0, NULL)
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
