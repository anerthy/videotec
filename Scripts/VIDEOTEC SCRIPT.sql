USE [master]
GO
/****** Object:  Database [VIDEOTEC]    Script Date: 10/11/2022 15:03:20 ******/
CREATE DATABASE [VIDEOTEC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VIDEOTEC_Data', FILENAME = N'C:\SQLData\VIDEOTEC_Data.mdf' , SIZE = 4194304KB , MAXSIZE = 33554432KB , FILEGROWTH = 2097152KB ), 
 FILEGROUP [BITACORAS] 
( NAME = N'BITACORAS_Data', FILENAME = N'C:\SQLData\BITACORAS_Data.ndf' , SIZE = 512000KB , MAXSIZE = 2097152KB , FILEGROWTH = 512000KB ), 
 FILEGROUP [PELICULAS] 
( NAME = N'PELICULAS_Data', FILENAME = N'C:\SQLData\PELICULAS_Data.ndf' , SIZE = 512000KB , MAXSIZE = 2097152KB , FILEGROWTH = 512000KB ), 
 FILEGROUP [PRESTAMOS] 
( NAME = N'PRESTAMOS_Data', FILENAME = N'C:\SQLData\PRESTAMOS_Data.ndf' , SIZE = 512000KB , MAXSIZE = 2097152KB , FILEGROWTH = 512000KB ), 
 FILEGROUP [SISTEMA] 
( NAME = N'SISTEMA_Data', FILENAME = N'C:\SQLData\SISTEMA_Data.ndf' , SIZE = 512000KB , MAXSIZE = 2097152KB , FILEGROWTH = 512000KB ), 
 FILEGROUP [SOCIOS] 
( NAME = N'SOCIOS_Data', FILENAME = N'C:\SQLData\SOCIOS_Data.ndf' , SIZE = 512000KB , MAXSIZE = 2097152KB , FILEGROWTH = 512000KB )
 LOG ON 
( NAME = N'VIDEOTEC_Log', FILENAME = N'C:\SQLLog\VIDEOTEC_Log.ldf' , SIZE = 2097152KB , MAXSIZE = 8388608KB , FILEGROWTH = 1048576KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [VIDEOTEC] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VIDEOTEC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VIDEOTEC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VIDEOTEC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VIDEOTEC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VIDEOTEC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VIDEOTEC] SET ARITHABORT OFF 
GO
ALTER DATABASE [VIDEOTEC] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [VIDEOTEC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VIDEOTEC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VIDEOTEC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VIDEOTEC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VIDEOTEC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VIDEOTEC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VIDEOTEC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VIDEOTEC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VIDEOTEC] SET  ENABLE_BROKER 
GO
ALTER DATABASE [VIDEOTEC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VIDEOTEC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VIDEOTEC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VIDEOTEC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VIDEOTEC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VIDEOTEC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VIDEOTEC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VIDEOTEC] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VIDEOTEC] SET  MULTI_USER 
GO
ALTER DATABASE [VIDEOTEC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VIDEOTEC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VIDEOTEC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VIDEOTEC] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VIDEOTEC] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VIDEOTEC] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [VIDEOTEC] SET QUERY_STORE = OFF
GO
USE [VIDEOTEC]
GO
/****** Object:  UserDefinedFunction [dbo].[fnt_edad]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fnt_edad] (@nacimiento date) returns int
as
BEGIN

declare @hoy date = getdate(), @años int

set @años= (year(@hoy) - year(@nacimiento))

IF(month(@hoy) = month(@nacimiento))
BEGIN

	if (day(@hoy) < day(@nacimiento))
	begin
		set @años -= 1
	end

END
ELSE IF (month(@hoy) < month(@nacimiento))
begin
	set @años -= 1
end
 return @años

END
GO
/****** Object:  Table [dbo].[tbl_socio]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_socio](
	[soc_codigo_socio] [varchar](12) NOT NULL,
	[soc_cedula] [varchar](9) NOT NULL,
	[soc_nombre] [varchar](35) NOT NULL,
	[soc_apellido1] [varchar](40) NOT NULL,
	[soc_apellido2] [varchar](40) NOT NULL,
	[soc_correo] [varchar](50) NOT NULL,
	[soc_telefono] [varchar](8) NOT NULL,
	[soc_codigo_postal] [varchar](5) NOT NULL,
	[soc_direccion_exacta] [varchar](100) NOT NULL,
	[soc_genero] [varchar](10) NOT NULL,
	[soc_fecha_nacimiento] [date] NOT NULL,
	[soc_foto_perfil] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_socio] PRIMARY KEY CLUSTERED 
(
	[soc_codigo_socio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [SOCIOS]
) ON [SOCIOS]
GO
/****** Object:  View [dbo].[view_tbl_socio]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[view_tbl_socio] as
select soc_codigo_socio,
soc_cedula,
soc_nombre,
soc_apellido1,
soc_apellido2,
soc_correo,
soc_telefono,
soc_codigo_postal,
soc_direccion_exacta,
soc_genero,
dbo.fnt_edad(soc_fecha_nacimiento) as soc_edad,
soc_foto_perfil 
from tbl_socio
with check option
GO
/****** Object:  Table [dbo].[tbl_actor]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_actor](
	[act_id_actor] [int] IDENTITY(1,1) NOT NULL,
	[act_nombre] [varchar](35) NOT NULL,
	[act_nombre_nacimiento] [varchar](40) NOT NULL,
	[act_nacionalidad] [varchar](15) NOT NULL,
	[act_biografia] [text] NOT NULL,
	[act_año_inicio] [int] NOT NULL,
	[act_fecha_nacimiento] [date] NOT NULL,
	[act_ocupacion] [varchar](100) NOT NULL,
	[act_imagen] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_actor] PRIMARY KEY CLUSTERED 
(
	[act_id_actor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PELICULAS]
) ON [PELICULAS] TEXTIMAGE_ON [PELICULAS]
GO
/****** Object:  Table [dbo].[tbl_bitacora_actor]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_bitacora_actor](
	[bit_act_id_bitacora_actor] [int] IDENTITY(1,1) NOT NULL,
	[bit_act_usuario] [varchar](30) NOT NULL,
	[bit_act_actor] [int] NOT NULL,
	[bit_act_accion] [varchar](6) NOT NULL,
	[bit_act_fecha_accion] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_bitacora_actor] PRIMARY KEY CLUSTERED 
(
	[bit_act_id_bitacora_actor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [BITACORAS]
) ON [BITACORAS]
GO
/****** Object:  Table [dbo].[tbl_bitacora_carrito_compra]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_bitacora_carrito_compra](
	[bit_carr_id_bitacora_carrito_compra] [int] IDENTITY(1,1) NOT NULL,
	[bit_carr_usuario] [varchar](30) NOT NULL,
	[bit_carr_carrito_compra] [int] NOT NULL,
	[bit_carr_accion] [varchar](6) NOT NULL,
	[bit_carr_fecha_accion] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_bitacora_carrito_compra] PRIMARY KEY CLUSTERED 
(
	[bit_carr_id_bitacora_carrito_compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [BITACORAS]
) ON [BITACORAS]
GO
/****** Object:  Table [dbo].[tbl_bitacora_cinta]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_bitacora_cinta](
	[bit_cin_id_bitacora_cinta] [int] IDENTITY(1,1) NOT NULL,
	[bit_cin_usuario] [varchar](30) NOT NULL,
	[bit_cin_cinta] [varchar](13) NOT NULL,
	[bit_cin_accion] [varchar](6) NOT NULL,
	[bit_cin_fecha_accion] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_bitacora_cinta] PRIMARY KEY CLUSTERED 
(
	[bit_cin_id_bitacora_cinta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [BITACORAS]
) ON [BITACORAS]
GO
/****** Object:  Table [dbo].[tbl_bitacora_clasificacion]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_bitacora_clasificacion](
	[bit_clasf_id_bitacora_clasificacion] [int] IDENTITY(1,1) NOT NULL,
	[bit_clasf_usuario] [varchar](30) NOT NULL,
	[bit_clasf_clasificacion] [varchar](5) NOT NULL,
	[bit_clasf_accion] [varchar](6) NOT NULL,
	[bit_clasf_fecha_accion] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_bitacora_clasificacion] PRIMARY KEY CLUSTERED 
(
	[bit_clasf_id_bitacora_clasificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [BITACORAS]
) ON [BITACORAS]
GO
/****** Object:  Table [dbo].[tbl_bitacora_detalle_prestamo]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_bitacora_detalle_prestamo](
	[bit_det_pres_id_bitacora_detalle_prestamo] [int] IDENTITY(1,1) NOT NULL,
	[bit_det_pres_usuario] [varchar](30) NOT NULL,
	[bit_det_pres_detalle_prestamo] [int] NOT NULL,
	[bit_det_pres_accion] [varchar](6) NOT NULL,
	[bit_det_pres_fecha_accion] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_bitacora_detalle_prestamo] PRIMARY KEY CLUSTERED 
(
	[bit_det_pres_id_bitacora_detalle_prestamo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [BITACORAS]
) ON [BITACORAS]
GO
/****** Object:  Table [dbo].[tbl_bitacora_devolucion_cinta]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_bitacora_devolucion_cinta](
	[bit_del_cin_id_bitacora_devolucion_cinta] [int] IDENTITY(1,1) NOT NULL,
	[bit_del_cin_usuario] [varchar](30) NOT NULL,
	[bit_del_cin_devolucion_cinta] [int] NOT NULL,
	[bit_del_cin_accion] [varchar](6) NOT NULL,
	[bit_del_cin_fecha_accion] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_bitacora_devolucion_cinta] PRIMARY KEY CLUSTERED 
(
	[bit_del_cin_id_bitacora_devolucion_cinta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [BITACORAS]
) ON [BITACORAS]
GO
/****** Object:  Table [dbo].[tbl_bitacora_director]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_bitacora_director](
	[bit_dir_id_bitacora_director] [int] IDENTITY(1,1) NOT NULL,
	[bit_dir_usuario] [varchar](30) NOT NULL,
	[bit_dir_director] [int] NOT NULL,
	[bit_dir_accion] [varchar](6) NOT NULL,
	[bit_dir_fecha_accion] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_bitacora_director] PRIMARY KEY CLUSTERED 
(
	[bit_dir_id_bitacora_director] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [BITACORAS]
) ON [BITACORAS]
GO
/****** Object:  Table [dbo].[tbl_bitacora_empresa]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_bitacora_empresa](
	[bit_emp_id_bitacora_empresa] [int] IDENTITY(1,1) NOT NULL,
	[bit_emp_usuario] [varchar](30) NOT NULL,
	[bit_emp_empresa] [int] NOT NULL,
	[bit_emp_accion] [varchar](6) NOT NULL,
	[bit_emp_fecha_accion] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_bitacora_empresa] PRIMARY KEY CLUSTERED 
(
	[bit_emp_id_bitacora_empresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [BITACORAS]
) ON [BITACORAS]
GO
/****** Object:  Table [dbo].[tbl_bitacora_genero_pelicula]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_bitacora_genero_pelicula](
	[bit_gen_id_bitacora_genero_pelicula] [int] IDENTITY(1,1) NOT NULL,
	[bit_gen_usuario] [varchar](30) NOT NULL,
	[bit_gen_genero_pelicula] [int] NOT NULL,
	[bit_gen_accion] [varchar](6) NOT NULL,
	[bit_gen_fecha_accion] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_bitacora_genero_pelicula] PRIMARY KEY CLUSTERED 
(
	[bit_gen_id_bitacora_genero_pelicula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [BITACORAS]
) ON [BITACORAS]
GO
/****** Object:  Table [dbo].[tbl_bitacora_idioma]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_bitacora_idioma](
	[bit_idm_id_bitacora_idioma] [int] IDENTITY(1,1) NOT NULL,
	[bit_idm_usuario] [varchar](30) NOT NULL,
	[bit_idm_idioma_id] [varchar](3) NOT NULL,
	[bit_idm_accion] [varchar](6) NOT NULL,
	[bit_idm_fecha_accion] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_bitacora_idioma] PRIMARY KEY CLUSTERED 
(
	[bit_idm_id_bitacora_idioma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [BITACORAS]
) ON [BITACORAS]
GO
/****** Object:  Table [dbo].[tbl_bitacora_lista_espera]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_bitacora_lista_espera](
	[bit_list_id_bitacora_lista_espera] [int] IDENTITY(1,1) NOT NULL,
	[bit_list_usuario] [varchar](30) NOT NULL,
	[bit_list_lista_espera] [int] NOT NULL,
	[bit_list_accion] [varchar](6) NOT NULL,
	[bit_list_fecha_accion] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_bitacora_lista_espera] PRIMARY KEY CLUSTERED 
(
	[bit_list_id_bitacora_lista_espera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [BITACORAS]
) ON [BITACORAS]
GO
/****** Object:  Table [dbo].[tbl_bitacora_llamada]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_bitacora_llamada](
	[bit_lla_id_bitacora_llamada] [int] IDENTITY(1,1) NOT NULL,
	[bit_lla_usuario] [varchar](30) NOT NULL,
	[bit_lla_llamada] [int] NOT NULL,
	[bit_lla_accion] [varchar](6) NOT NULL,
	[bit_lla_fecha_accion] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_bitacora_llamada] PRIMARY KEY CLUSTERED 
(
	[bit_lla_id_bitacora_llamada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [BITACORAS]
) ON [BITACORAS]
GO
/****** Object:  Table [dbo].[tbl_bitacora_pelicula]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_bitacora_pelicula](
	[bit_pel_id_bitacora_pelicula] [int] IDENTITY(1,1) NOT NULL,
	[bit_pel_usuario] [varchar](30) NOT NULL,
	[bit_pel_pelicula] [varchar](8) NOT NULL,
	[bit_pel_accion] [varchar](6) NOT NULL,
	[bit_pel_fecha_accion] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_bitacora_pelicula] PRIMARY KEY CLUSTERED 
(
	[bit_pel_id_bitacora_pelicula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [BITACORAS]
) ON [BITACORAS]
GO
/****** Object:  Table [dbo].[tbl_bitacora_pelicula_actor]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_bitacora_pelicula_actor](
	[bit_pel_act_id_bitacora_pelicula_actor] [int] IDENTITY(1,1) NOT NULL,
	[bit_pel_act_usuario] [varchar](30) NOT NULL,
	[bit_pel_act_pelicula_actor] [int] NOT NULL,
	[bit_pel_act_accion] [varchar](6) NOT NULL,
	[bit_pel_act_fecha_accion] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_bitacora_pelicula_actor] PRIMARY KEY CLUSTERED 
(
	[bit_pel_act_id_bitacora_pelicula_actor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [BITACORAS]
) ON [BITACORAS]
GO
/****** Object:  Table [dbo].[tbl_bitacora_pelicula_director]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_bitacora_pelicula_director](
	[bit_pel_dir_id_bitacora_pelicula_director] [int] IDENTITY(1,1) NOT NULL,
	[bit_pel_dir_usuario] [varchar](30) NOT NULL,
	[bit_pel_dir_pelicula_director] [int] NOT NULL,
	[bit_pel_dir_accion] [varchar](6) NOT NULL,
	[bit_pel_dir_fecha_accion] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_bitacora_pelicula_director] PRIMARY KEY CLUSTERED 
(
	[bit_pel_dir_id_bitacora_pelicula_director] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [BITACORAS]
) ON [BITACORAS]
GO
/****** Object:  Table [dbo].[tbl_bitacora_pelicula_genero]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_bitacora_pelicula_genero](
	[bit_pel_gen_id_bitacora_pelicula_genero] [int] IDENTITY(1,1) NOT NULL,
	[bit_pel_gen_usuario] [varchar](30) NOT NULL,
	[bit_pel_gen_pelicula_genero] [int] NOT NULL,
	[bit_pel_gen_accion] [varchar](6) NOT NULL,
	[bit_pel_gen_fecha_accion] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_bitacora_pelicula_genero] PRIMARY KEY CLUSTERED 
(
	[bit_pel_gen_id_bitacora_pelicula_genero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [BITACORAS]
) ON [BITACORAS]
GO
/****** Object:  Table [dbo].[tbl_bitacora_pelicula_productora]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_bitacora_pelicula_productora](
	[bit_pel_prod_id_bitacora_pelicula_productora] [int] IDENTITY(1,1) NOT NULL,
	[bit_pel_prod_usuario] [varchar](30) NOT NULL,
	[bit_pel_prod_pelicula_productora] [int] NOT NULL,
	[bit_pel_prod_accion] [varchar](6) NOT NULL,
	[bit_pel_prod_fecha_accion] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_bitacora_pelicula_productora] PRIMARY KEY CLUSTERED 
(
	[bit_pel_prod_id_bitacora_pelicula_productora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [BITACORAS]
) ON [BITACORAS]
GO
/****** Object:  Table [dbo].[tbl_bitacora_prestamo]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_bitacora_prestamo](
	[bit_pres_id_bitacora_prestamo] [int] IDENTITY(1,1) NOT NULL,
	[bit_pres_usuario] [varchar](30) NOT NULL,
	[bit_pres_prestamo] [int] NOT NULL,
	[bit_pres_accion] [varchar](6) NOT NULL,
	[bit_pres_fecha_accion] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_bitacora_prestamo] PRIMARY KEY CLUSTERED 
(
	[bit_pres_id_bitacora_prestamo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [BITACORAS]
) ON [BITACORAS]
GO
/****** Object:  Table [dbo].[tbl_bitacora_productora]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_bitacora_productora](
	[bit_prod_id_bitacora_productora] [int] IDENTITY(1,1) NOT NULL,
	[bit_prod_usuario] [varchar](30) NOT NULL,
	[bit_prod_productora] [int] NOT NULL,
	[bit_prod_accion] [varchar](6) NOT NULL,
	[bit_prod_fecha_accion] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_bitacora_productora] PRIMARY KEY CLUSTERED 
(
	[bit_prod_id_bitacora_productora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [BITACORAS]
) ON [BITACORAS]
GO
/****** Object:  Table [dbo].[tbl_bitacora_registro_prestamos]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_bitacora_registro_prestamos](
	[bit_reg_cin_id_bitacora_devolucion_cinta] [int] IDENTITY(1,1) NOT NULL,
	[bit_reg_cin_usuario] [varchar](30) NOT NULL,
	[bit_reg_cin_registro_prestamos] [int] NOT NULL,
	[bit_reg_cin_accion] [varchar](6) NOT NULL,
	[bit_reg_cin_fecha_accion] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_bitacora_registro_prestamos] PRIMARY KEY CLUSTERED 
(
	[bit_reg_cin_id_bitacora_devolucion_cinta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [BITACORAS]
) ON [BITACORAS]
GO
/****** Object:  Table [dbo].[tbl_bitacora_rol]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_bitacora_rol](
	[bit_rol_id_bitacora_rol] [int] IDENTITY(1,1) NOT NULL,
	[bit_rol_usuario] [varchar](30) NOT NULL,
	[bit_rol_rol] [int] NOT NULL,
	[bit_rol_accion] [varchar](6) NOT NULL,
	[bit_rol_fecha_accion] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_bitacora_rol] PRIMARY KEY CLUSTERED 
(
	[bit_rol_id_bitacora_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [BITACORAS]
) ON [BITACORAS]
GO
/****** Object:  Table [dbo].[tbl_bitacora_socio]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_bitacora_socio](
	[bit_soc_id_bitacora_socio] [int] IDENTITY(1,1) NOT NULL,
	[bit_soc_usuario] [varchar](30) NOT NULL,
	[bit_soc_socio] [varchar](12) NOT NULL,
	[bit_soc_accion] [varchar](6) NOT NULL,
	[bit_soc_fecha_accion] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_bitacora_socio] PRIMARY KEY CLUSTERED 
(
	[bit_soc_id_bitacora_socio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [BITACORAS]
) ON [BITACORAS]
GO
/****** Object:  Table [dbo].[tbl_bitacora_socio_actor]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_bitacora_socio_actor](
	[bit_soc_act_id_bitacora_socio_actor] [int] IDENTITY(1,1) NOT NULL,
	[bit_soc_act_usuario] [varchar](30) NOT NULL,
	[bit_soc_act_socio_actor] [int] NOT NULL,
	[bit_soc_act_accion] [varchar](6) NOT NULL,
	[bit_soc_act_fecha_accion] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_bitacora_socio_actor] PRIMARY KEY CLUSTERED 
(
	[bit_soc_act_id_bitacora_socio_actor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [BITACORAS]
) ON [BITACORAS]
GO
/****** Object:  Table [dbo].[tbl_bitacora_socio_director]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_bitacora_socio_director](
	[bit_soc_dir_id_bitacora_socio_director] [int] IDENTITY(1,1) NOT NULL,
	[bit_soc_dir_usuario] [varchar](30) NOT NULL,
	[bit_soc_dir_socio_director] [int] NOT NULL,
	[bit_soc_dir_accion] [varchar](6) NOT NULL,
	[bit_soc_dir_fecha_accion] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_bitacora_socio_director] PRIMARY KEY CLUSTERED 
(
	[bit_soc_dir_id_bitacora_socio_director] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [BITACORAS]
) ON [BITACORAS]
GO
/****** Object:  Table [dbo].[tbl_bitacora_socio_genero]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_bitacora_socio_genero](
	[bit_soc_gen_id_bitacora_socio_genero] [int] IDENTITY(1,1) NOT NULL,
	[bit_soc_gen_usuario] [varchar](30) NOT NULL,
	[bit_soc_gen_socio_genero] [int] NOT NULL,
	[bit_soc_gen_accion] [varchar](6) NOT NULL,
	[bit_soc_gen_fecha_accion] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_bitacora_socio_genero] PRIMARY KEY CLUSTERED 
(
	[bit_soc_gen_id_bitacora_socio_genero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [BITACORAS]
) ON [BITACORAS]
GO
/****** Object:  Table [dbo].[tbl_bitacora_subtitulos_cinta]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_bitacora_subtitulos_cinta](
	[bit_sub_id_bitacora_subtitulos_cinta] [int] IDENTITY(1,1) NOT NULL,
	[bit_sub_usuario] [varchar](30) NOT NULL,
	[bit_sub_subtitulos_cinta] [int] NOT NULL,
	[bit_sub_accion] [varchar](6) NOT NULL,
	[bit_sub_fecha_accion] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_bitacora_subtitulos_cinta] PRIMARY KEY CLUSTERED 
(
	[bit_sub_id_bitacora_subtitulos_cinta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [BITACORAS]
) ON [BITACORAS]
GO
/****** Object:  Table [dbo].[tbl_bitacora_usuario]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_bitacora_usuario](
	[bit_user_id_bitacora_usuario] [int] IDENTITY(1,1) NOT NULL,
	[bit_user_usuario] [varchar](30) NOT NULL,
	[bit_user_usuario_id] [int] NOT NULL,
	[bit_user_accion] [varchar](6) NOT NULL,
	[bit_user_fecha_accion] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_bitacora_usuario] PRIMARY KEY CLUSTERED 
(
	[bit_user_id_bitacora_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [BITACORAS]
) ON [BITACORAS]
GO
/****** Object:  Table [dbo].[tbl_carrito_compra]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_carrito_compra](
	[carr_id_carrito] [int] IDENTITY(1,1) NOT NULL,
	[carr_pelicula_id] [varchar](8) NOT NULL,
	[carr_codigo_socio] [varchar](12) NOT NULL,
	[carr_estado] [varchar](10) NOT NULL,
 CONSTRAINT [PK_tbl_carrito_compra] PRIMARY KEY CLUSTERED 
(
	[carr_id_carrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRESTAMOS]
) ON [PRESTAMOS]
GO
/****** Object:  Table [dbo].[tbl_cinta]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_cinta](
	[cin_numero_cinta] [varchar](13) NOT NULL,
	[cin_idioma] [varchar](3) NOT NULL,
	[cin_pelicula_id] [varchar](8) NOT NULL,
	[cin_estado] [varchar](10) NOT NULL,
 CONSTRAINT [PK_tbl_cinta] PRIMARY KEY CLUSTERED 
(
	[cin_numero_cinta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PELICULAS]
) ON [PELICULAS]
GO
/****** Object:  Table [dbo].[tbl_clasificacion]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_clasificacion](
	[clasf_simbolo] [varchar](5) NOT NULL,
	[clasf_nombre] [varchar](30) NOT NULL,
	[clasf_significado] [text] NOT NULL,
 CONSTRAINT [PK_tbl_clasificacion] PRIMARY KEY CLUSTERED 
(
	[clasf_simbolo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PELICULAS]
) ON [PELICULAS] TEXTIMAGE_ON [PELICULAS]
GO
/****** Object:  Table [dbo].[tbl_detalle_prestamo]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_detalle_prestamo](
	[det_pres_id_detalle_prestamo] [int] IDENTITY(1,1) NOT NULL,
	[det_pres_prestamo_id] [int] NOT NULL,
	[det_pres_numero_cinta] [varchar](13) NOT NULL,
	[det_pres_sub_total] [money] NOT NULL,
 CONSTRAINT [PK_tbl_detalle_prestamo] PRIMARY KEY CLUSTERED 
(
	[det_pres_id_detalle_prestamo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRESTAMOS]
) ON [PRESTAMOS]
GO
/****** Object:  Table [dbo].[tbl_devolucion_cinta]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_devolucion_cinta](
	[del_cin_id_devolucion_cinta] [int] IDENTITY(1,1) NOT NULL,
	[del_cin_numero_cinta] [varchar](13) NOT NULL,
	[del_cin_codigo_socio] [varchar](12) NOT NULL,
	[del_cin_fecha_prestamo] [datetime] NOT NULL,
	[del_cin_fecha_devolucion] [datetime] NOT NULL,
 CONSTRAINT [PK_del_cin_id_devolucion_cinta] PRIMARY KEY CLUSTERED 
(
	[del_cin_id_devolucion_cinta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRESTAMOS]
) ON [PRESTAMOS]
GO
/****** Object:  Table [dbo].[tbl_director]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_director](
	[dir_id_director] [int] IDENTITY(1,1) NOT NULL,
	[dir_nombre] [varchar](30) NOT NULL,
	[dir_nombre_nacimiento] [varchar](50) NOT NULL,
	[dir_nacionalidad] [varchar](15) NOT NULL,
	[dir_biografia] [text] NOT NULL,
	[dir_fecha_nacimiento] [date] NOT NULL,
	[dir_imagen] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_director] PRIMARY KEY CLUSTERED 
(
	[dir_id_director] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PELICULAS]
) ON [PELICULAS] TEXTIMAGE_ON [PELICULAS]
GO
/****** Object:  Table [dbo].[tbl_empresa]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_empresa](
	[emp_id_empresa] [int] IDENTITY(1,1) NOT NULL,
	[emp_nombre] [varchar](15) NOT NULL,
	[emp_telefono] [varchar](8) NOT NULL,
	[emp_direccion] [text] NOT NULL,
	[emp_correo] [varchar](50) NOT NULL,
	[emp_logo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_empresa] PRIMARY KEY CLUSTERED 
(
	[emp_id_empresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [SISTEMA]
) ON [SISTEMA] TEXTIMAGE_ON [SISTEMA]
GO
/****** Object:  Table [dbo].[tbl_genero_pelicula]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_genero_pelicula](
	[gen_id_genero] [int] IDENTITY(1,1) NOT NULL,
	[gen_nombre] [varchar](20) NOT NULL,
	[gen_descripcion] [text] NOT NULL,
	[gen_imagen] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_genero_pelicula] PRIMARY KEY CLUSTERED 
(
	[gen_id_genero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PELICULAS]
) ON [PELICULAS] TEXTIMAGE_ON [PELICULAS]
GO
/****** Object:  Table [dbo].[tbl_idioma]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_idioma](
	[idm_id_idioma] [varchar](3) NOT NULL,
	[idm_nombre] [varchar](10) NOT NULL,
 CONSTRAINT [PK_tbl_idioma] PRIMARY KEY CLUSTERED 
(
	[idm_id_idioma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PELICULAS]
) ON [PELICULAS]
GO
/****** Object:  Table [dbo].[tbl_lista_espera]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_lista_espera](
	[list_id_lista_espera] [int] IDENTITY(1,1) NOT NULL,
	[list_codigo_socio] [varchar](12) NOT NULL,
	[list_pelicula_id] [varchar](8) NOT NULL,
	[list_fecha_solicitud] [datetime] NOT NULL,
 CONSTRAINT [PK_list_id_lista_espera] PRIMARY KEY CLUSTERED 
(
	[list_id_lista_espera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRESTAMOS]
) ON [PRESTAMOS]
GO
/****** Object:  Table [dbo].[tbl_llamada]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_llamada](
	[lla_id_llamada] [int] IDENTITY(1,1) NOT NULL,
	[lla_codigo_socio] [varchar](12) NOT NULL,
	[lla_pelicula_id] [varchar](8) NOT NULL,
 CONSTRAINT [PK_lla_id_llamada] PRIMARY KEY CLUSTERED 
(
	[lla_id_llamada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [SOCIOS]
) ON [SOCIOS]
GO
/****** Object:  Table [dbo].[tbl_pelicula]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_pelicula](
	[pel_id_pelicula] [varchar](8) NOT NULL,
	[pel_titulo] [varchar](10) NOT NULL,
	[pel_sinopsis] [text] NOT NULL,
	[pel_clasificacion] [varchar](5) NOT NULL,
	[pel_duracion] [time](7) NOT NULL,
	[pel_año_publicacion] [int] NOT NULL,
	[pel_stock_cintas] [int] NOT NULL,
	[pel_pais] [varchar](20) NOT NULL,
	[pel_precio] [money] NOT NULL,
	[pel_disponibilidad] [varchar](13) NOT NULL,
	[pel_portada] [varchar](50) NOT NULL,
	[pel_trailer] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_pelicula] PRIMARY KEY CLUSTERED 
(
	[pel_id_pelicula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PELICULAS]
) ON [PELICULAS] TEXTIMAGE_ON [PELICULAS]
GO
/****** Object:  Table [dbo].[tbl_pelicula_actor]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_pelicula_actor](
	[pel_act_id_pelicula_actor] [int] IDENTITY(1,1) NOT NULL,
	[pel_act_actor_id] [int] NOT NULL,
	[pel_act_tipo_actor] [varchar](10) NOT NULL,
	[pel_act_pelicula_id] [varchar](8) NOT NULL,
 CONSTRAINT [FK_tbl_pelicula_actor] PRIMARY KEY CLUSTERED 
(
	[pel_act_id_pelicula_actor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PELICULAS]
) ON [PELICULAS]
GO
/****** Object:  Table [dbo].[tbl_pelicula_director]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_pelicula_director](
	[pel_dir_id_pelicula_director] [int] IDENTITY(1,1) NOT NULL,
	[pel_dir_pelicula_id] [varchar](8) NOT NULL,
	[pel_dir_director_id] [int] NOT NULL,
 CONSTRAINT [PK_tbl_pelicula_director] PRIMARY KEY CLUSTERED 
(
	[pel_dir_id_pelicula_director] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PELICULAS]
) ON [PELICULAS]
GO
/****** Object:  Table [dbo].[tbl_pelicula_genero]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_pelicula_genero](
	[pel_gen_id_pelicula_genero] [int] IDENTITY(1,1) NOT NULL,
	[pel_gen_genero_id] [int] NOT NULL,
	[pel_gen_pelicula_id] [varchar](8) NOT NULL,
 CONSTRAINT [PK_tbl_pelicula_genero] PRIMARY KEY CLUSTERED 
(
	[pel_gen_id_pelicula_genero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PELICULAS]
) ON [PELICULAS]
GO
/****** Object:  Table [dbo].[tbl_pelicula_productora]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_pelicula_productora](
	[pel_prod_id_pelicula_productora] [int] IDENTITY(1,1) NOT NULL,
	[pel_prod_productora_id] [int] NOT NULL,
	[pel_prod_pelicula_id] [varchar](8) NOT NULL,
 CONSTRAINT [FK_tbl_pelicula_productora] PRIMARY KEY CLUSTERED 
(
	[pel_prod_id_pelicula_productora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PELICULAS]
) ON [PELICULAS]
GO
/****** Object:  Table [dbo].[tbl_prestamo]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_prestamo](
	[pres_id_prestamo] [int] IDENTITY(1,1) NOT NULL,
	[pres_fecha_prestamo] [datetime] NOT NULL,
	[pres_fecha_devolucion] [datetime] NOT NULL,
	[pres_codigo_socio] [varchar](12) NOT NULL,
	[pres_precio_total] [money] NOT NULL,
 CONSTRAINT [PK_tbl_prestamo] PRIMARY KEY CLUSTERED 
(
	[pres_id_prestamo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRESTAMOS]
) ON [PRESTAMOS]
GO
/****** Object:  Table [dbo].[tbl_productora]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_productora](
	[prod_id_productora] [int] IDENTITY(1,1) NOT NULL,
	[prod_nombre] [varchar](20) NOT NULL,
	[prod_año_fundacion] [int] NOT NULL,
	[prod_descripcion] [text] NOT NULL,
	[prod_sitio_web] [varchar](20) NOT NULL,
	[prod_logo] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_productora] PRIMARY KEY CLUSTERED 
(
	[prod_id_productora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PELICULAS]
) ON [PELICULAS] TEXTIMAGE_ON [PELICULAS]
GO
/****** Object:  Table [dbo].[tbl_registro_prestamos]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_registro_prestamos](
	[reg_pres_id_registro_prestamos] [int] IDENTITY(1,1) NOT NULL,
	[reg_pres_numero_cinta] [varchar](13) NOT NULL,
	[reg_pres_codigo_socio] [varchar](12) NOT NULL,
	[reg_pres_fecha_prestamo] [datetime] NOT NULL,
	[reg_pres_fecha_devolucion] [datetime] NOT NULL,
 CONSTRAINT [PK_reg_pres_id_registro_prestamos] PRIMARY KEY CLUSTERED 
(
	[reg_pres_id_registro_prestamos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRESTAMOS]
) ON [PRESTAMOS]
GO
/****** Object:  Table [dbo].[tbl_rol]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_rol](
	[rol_id_rol] [int] IDENTITY(1,1) NOT NULL,
	[rol_nombre] [varchar](20) NOT NULL,
	[rol_descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [PK_tbl_rol] PRIMARY KEY CLUSTERED 
(
	[rol_id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [SISTEMA]
) ON [SISTEMA]
GO
/****** Object:  Table [dbo].[tbl_socio_actor]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_socio_actor](
	[soc_act_id_socio_actor] [int] IDENTITY(1,1) NOT NULL,
	[soc_act_codigo_socio] [varchar](12) NOT NULL,
	[soc_act_actor_id] [int] NOT NULL,
 CONSTRAINT [PK_tbl_socio_actor] PRIMARY KEY CLUSTERED 
(
	[soc_act_id_socio_actor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [SOCIOS]
) ON [SOCIOS]
GO
/****** Object:  Table [dbo].[tbl_socio_director]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_socio_director](
	[soc_dir_id_socio_director] [int] IDENTITY(1,1) NOT NULL,
	[soc_dir_codigo_socio] [varchar](12) NOT NULL,
	[soc_dir_director_id] [int] NOT NULL,
 CONSTRAINT [PK_tbl_socio_director] PRIMARY KEY CLUSTERED 
(
	[soc_dir_id_socio_director] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [SOCIOS]
) ON [SOCIOS]
GO
/****** Object:  Table [dbo].[tbl_socio_genero]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_socio_genero](
	[soc_gen_id_socio_genero] [int] IDENTITY(1,1) NOT NULL,
	[soc_gen_codigo_socio] [varchar](12) NOT NULL,
	[soc_gen_genero_id] [int] NOT NULL,
 CONSTRAINT [PK_tbl_socio_genero] PRIMARY KEY CLUSTERED 
(
	[soc_gen_id_socio_genero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [SOCIOS]
) ON [SOCIOS]
GO
/****** Object:  Table [dbo].[tbl_subtitulos_cinta]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_subtitulos_cinta](
	[sub_subtitulos_cinta] [int] IDENTITY(1,1) NOT NULL,
	[sub_numero_cinta] [varchar](13) NOT NULL,
	[sub_idioma_id] [varchar](3) NOT NULL,
 CONSTRAINT [PK_tbl_subtitulos_cinta] PRIMARY KEY CLUSTERED 
(
	[sub_subtitulos_cinta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PELICULAS]
) ON [PELICULAS]
GO
/****** Object:  Table [dbo].[tbl_usuario]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_usuario](
	[user_id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[user_nombre] [varchar](35) NOT NULL,
	[user_correo] [varchar](50) NOT NULL,
	[user_contraseña] [varchar](75) NOT NULL,
	[user_rol_id] [int] NOT NULL,
	[user_foto] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_usuario] PRIMARY KEY CLUSTERED 
(
	[user_id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [SISTEMA]
) ON [SISTEMA]
GO
SET IDENTITY_INSERT [dbo].[tbl_bitacora_rol] ON 

INSERT [dbo].[tbl_bitacora_rol] ([bit_rol_id_bitacora_rol], [bit_rol_usuario], [bit_rol_rol], [bit_rol_accion], [bit_rol_fecha_accion]) VALUES (1, N'dbo', 1, N'INSERT', CAST(N'2022-11-10T14:57:40.887' AS DateTime))
INSERT [dbo].[tbl_bitacora_rol] ([bit_rol_id_bitacora_rol], [bit_rol_usuario], [bit_rol_rol], [bit_rol_accion], [bit_rol_fecha_accion]) VALUES (2, N'dbo', 2, N'INSERT', CAST(N'2022-11-10T14:59:51.050' AS DateTime))
INSERT [dbo].[tbl_bitacora_rol] ([bit_rol_id_bitacora_rol], [bit_rol_usuario], [bit_rol_rol], [bit_rol_accion], [bit_rol_fecha_accion]) VALUES (3, N'dbo', 3, N'INSERT', CAST(N'2022-11-10T14:59:51.050' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_bitacora_rol] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_bitacora_socio] ON 

INSERT [dbo].[tbl_bitacora_socio] ([bit_soc_id_bitacora_socio], [bit_soc_usuario], [bit_soc_socio], [bit_soc_accion], [bit_soc_fecha_accion]) VALUES (1, N'dbo', N'02C2D8D75F8A', N'INSERT', CAST(N'2022-11-10T00:04:57.393' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_bitacora_socio] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_rol] ON 

INSERT [dbo].[tbl_rol] ([rol_id_rol], [rol_nombre], [rol_descripcion]) VALUES (1, N'VIDEOTEC-SA', N'Rol de super administrador del sistema')
INSERT [dbo].[tbl_rol] ([rol_id_rol], [rol_nombre], [rol_descripcion]) VALUES (2, N'Administrador', N'Tiene acceso a todo el sistema')
INSERT [dbo].[tbl_rol] ([rol_id_rol], [rol_nombre], [rol_descripcion]) VALUES (3, N'Socio', N'Rol de socio. Puede realizar prestamos de peliculas')
SET IDENTITY_INSERT [dbo].[tbl_rol] OFF
GO
INSERT [dbo].[tbl_socio] ([soc_codigo_socio], [soc_cedula], [soc_nombre], [soc_apellido1], [soc_apellido2], [soc_correo], [soc_telefono], [soc_codigo_postal], [soc_direccion_exacta], [soc_genero], [soc_fecha_nacimiento], [soc_foto_perfil]) VALUES (N'02C2D8D75F8A', N'504460444', N'Andres', N'Mejias', N'Gonzalez', N'andmejigo@gmail.com', N'87293508', N'50201', N'25m de la escuela Cerro Azul', N'Masculino', CAST(N'2022-11-08' AS Date), N'foto_perfil')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tbl_soci__01D4EFFFAEB381A4]    Script Date: 10/11/2022 15:03:20 ******/
ALTER TABLE [dbo].[tbl_socio] ADD UNIQUE NONCLUSTERED 
(
	[soc_cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [SOCIOS]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tbl_usua__261B8AE3BADD662A]    Script Date: 10/11/2022 15:03:20 ******/
ALTER TABLE [dbo].[tbl_usuario] ADD UNIQUE NONCLUSTERED 
(
	[user_nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [SISTEMA]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tbl_usua__9D29A666C3D4C1E4]    Script Date: 10/11/2022 15:03:20 ******/
ALTER TABLE [dbo].[tbl_usuario] ADD UNIQUE NONCLUSTERED 
(
	[user_correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [SISTEMA]
GO
ALTER TABLE [dbo].[tbl_bitacora_actor] ADD  DEFAULT (user_name()) FOR [bit_act_usuario]
GO
ALTER TABLE [dbo].[tbl_bitacora_actor] ADD  DEFAULT (getdate()) FOR [bit_act_fecha_accion]
GO
ALTER TABLE [dbo].[tbl_bitacora_carrito_compra] ADD  DEFAULT (user_name()) FOR [bit_carr_usuario]
GO
ALTER TABLE [dbo].[tbl_bitacora_carrito_compra] ADD  DEFAULT (getdate()) FOR [bit_carr_fecha_accion]
GO
ALTER TABLE [dbo].[tbl_bitacora_cinta] ADD  DEFAULT (user_name()) FOR [bit_cin_usuario]
GO
ALTER TABLE [dbo].[tbl_bitacora_cinta] ADD  DEFAULT (getdate()) FOR [bit_cin_fecha_accion]
GO
ALTER TABLE [dbo].[tbl_bitacora_clasificacion] ADD  DEFAULT (user_name()) FOR [bit_clasf_usuario]
GO
ALTER TABLE [dbo].[tbl_bitacora_clasificacion] ADD  DEFAULT (getdate()) FOR [bit_clasf_fecha_accion]
GO
ALTER TABLE [dbo].[tbl_bitacora_detalle_prestamo] ADD  DEFAULT (user_name()) FOR [bit_det_pres_usuario]
GO
ALTER TABLE [dbo].[tbl_bitacora_detalle_prestamo] ADD  DEFAULT (getdate()) FOR [bit_det_pres_fecha_accion]
GO
ALTER TABLE [dbo].[tbl_bitacora_devolucion_cinta] ADD  DEFAULT (user_name()) FOR [bit_del_cin_usuario]
GO
ALTER TABLE [dbo].[tbl_bitacora_devolucion_cinta] ADD  DEFAULT (getdate()) FOR [bit_del_cin_fecha_accion]
GO
ALTER TABLE [dbo].[tbl_bitacora_director] ADD  DEFAULT (user_name()) FOR [bit_dir_usuario]
GO
ALTER TABLE [dbo].[tbl_bitacora_director] ADD  DEFAULT (getdate()) FOR [bit_dir_fecha_accion]
GO
ALTER TABLE [dbo].[tbl_bitacora_empresa] ADD  DEFAULT (user_name()) FOR [bit_emp_usuario]
GO
ALTER TABLE [dbo].[tbl_bitacora_empresa] ADD  DEFAULT (getdate()) FOR [bit_emp_fecha_accion]
GO
ALTER TABLE [dbo].[tbl_bitacora_genero_pelicula] ADD  DEFAULT (user_name()) FOR [bit_gen_usuario]
GO
ALTER TABLE [dbo].[tbl_bitacora_genero_pelicula] ADD  DEFAULT (getdate()) FOR [bit_gen_fecha_accion]
GO
ALTER TABLE [dbo].[tbl_bitacora_idioma] ADD  DEFAULT (user_name()) FOR [bit_idm_usuario]
GO
ALTER TABLE [dbo].[tbl_bitacora_idioma] ADD  DEFAULT (getdate()) FOR [bit_idm_fecha_accion]
GO
ALTER TABLE [dbo].[tbl_bitacora_lista_espera] ADD  DEFAULT (user_name()) FOR [bit_list_usuario]
GO
ALTER TABLE [dbo].[tbl_bitacora_lista_espera] ADD  DEFAULT (getdate()) FOR [bit_list_fecha_accion]
GO
ALTER TABLE [dbo].[tbl_bitacora_llamada] ADD  DEFAULT (user_name()) FOR [bit_lla_usuario]
GO
ALTER TABLE [dbo].[tbl_bitacora_llamada] ADD  DEFAULT (getdate()) FOR [bit_lla_fecha_accion]
GO
ALTER TABLE [dbo].[tbl_bitacora_pelicula] ADD  DEFAULT (user_name()) FOR [bit_pel_usuario]
GO
ALTER TABLE [dbo].[tbl_bitacora_pelicula] ADD  DEFAULT (getdate()) FOR [bit_pel_fecha_accion]
GO
ALTER TABLE [dbo].[tbl_bitacora_pelicula_actor] ADD  DEFAULT (user_name()) FOR [bit_pel_act_usuario]
GO
ALTER TABLE [dbo].[tbl_bitacora_pelicula_actor] ADD  DEFAULT (getdate()) FOR [bit_pel_act_fecha_accion]
GO
ALTER TABLE [dbo].[tbl_bitacora_pelicula_director] ADD  DEFAULT (user_name()) FOR [bit_pel_dir_usuario]
GO
ALTER TABLE [dbo].[tbl_bitacora_pelicula_director] ADD  DEFAULT (getdate()) FOR [bit_pel_dir_fecha_accion]
GO
ALTER TABLE [dbo].[tbl_bitacora_pelicula_genero] ADD  DEFAULT (user_name()) FOR [bit_pel_gen_usuario]
GO
ALTER TABLE [dbo].[tbl_bitacora_pelicula_genero] ADD  DEFAULT (getdate()) FOR [bit_pel_gen_fecha_accion]
GO
ALTER TABLE [dbo].[tbl_bitacora_pelicula_productora] ADD  DEFAULT (user_name()) FOR [bit_pel_prod_usuario]
GO
ALTER TABLE [dbo].[tbl_bitacora_pelicula_productora] ADD  DEFAULT (getdate()) FOR [bit_pel_prod_fecha_accion]
GO
ALTER TABLE [dbo].[tbl_bitacora_prestamo] ADD  DEFAULT (user_name()) FOR [bit_pres_usuario]
GO
ALTER TABLE [dbo].[tbl_bitacora_prestamo] ADD  DEFAULT (getdate()) FOR [bit_pres_fecha_accion]
GO
ALTER TABLE [dbo].[tbl_bitacora_productora] ADD  DEFAULT (user_name()) FOR [bit_prod_usuario]
GO
ALTER TABLE [dbo].[tbl_bitacora_productora] ADD  DEFAULT (getdate()) FOR [bit_prod_fecha_accion]
GO
ALTER TABLE [dbo].[tbl_bitacora_registro_prestamos] ADD  DEFAULT (user_name()) FOR [bit_reg_cin_usuario]
GO
ALTER TABLE [dbo].[tbl_bitacora_registro_prestamos] ADD  DEFAULT (getdate()) FOR [bit_reg_cin_fecha_accion]
GO
ALTER TABLE [dbo].[tbl_bitacora_rol] ADD  DEFAULT (user_name()) FOR [bit_rol_usuario]
GO
ALTER TABLE [dbo].[tbl_bitacora_rol] ADD  DEFAULT (getdate()) FOR [bit_rol_fecha_accion]
GO
ALTER TABLE [dbo].[tbl_bitacora_socio] ADD  DEFAULT (user_name()) FOR [bit_soc_usuario]
GO
ALTER TABLE [dbo].[tbl_bitacora_socio] ADD  DEFAULT (getdate()) FOR [bit_soc_fecha_accion]
GO
ALTER TABLE [dbo].[tbl_bitacora_socio_actor] ADD  DEFAULT (user_name()) FOR [bit_soc_act_usuario]
GO
ALTER TABLE [dbo].[tbl_bitacora_socio_actor] ADD  DEFAULT (getdate()) FOR [bit_soc_act_fecha_accion]
GO
ALTER TABLE [dbo].[tbl_bitacora_socio_director] ADD  DEFAULT (user_name()) FOR [bit_soc_dir_usuario]
GO
ALTER TABLE [dbo].[tbl_bitacora_socio_director] ADD  DEFAULT (getdate()) FOR [bit_soc_dir_fecha_accion]
GO
ALTER TABLE [dbo].[tbl_bitacora_socio_genero] ADD  DEFAULT (user_name()) FOR [bit_soc_gen_usuario]
GO
ALTER TABLE [dbo].[tbl_bitacora_socio_genero] ADD  DEFAULT (getdate()) FOR [bit_soc_gen_fecha_accion]
GO
ALTER TABLE [dbo].[tbl_bitacora_subtitulos_cinta] ADD  DEFAULT (user_name()) FOR [bit_sub_usuario]
GO
ALTER TABLE [dbo].[tbl_bitacora_subtitulos_cinta] ADD  DEFAULT (getdate()) FOR [bit_sub_fecha_accion]
GO
ALTER TABLE [dbo].[tbl_bitacora_usuario] ADD  DEFAULT (user_name()) FOR [bit_user_usuario]
GO
ALTER TABLE [dbo].[tbl_bitacora_usuario] ADD  DEFAULT (getdate()) FOR [bit_user_fecha_accion]
GO
ALTER TABLE [dbo].[tbl_carrito_compra] ADD  DEFAULT ('En proceso') FOR [carr_estado]
GO
ALTER TABLE [dbo].[tbl_cinta] ADD  DEFAULT ('Disponible') FOR [cin_estado]
GO
ALTER TABLE [dbo].[tbl_lista_espera] ADD  DEFAULT (getdate()) FOR [list_fecha_solicitud]
GO
ALTER TABLE [dbo].[tbl_pelicula] ADD  DEFAULT ((0)) FOR [pel_stock_cintas]
GO
ALTER TABLE [dbo].[tbl_pelicula] ADD  DEFAULT ('No disponible') FOR [pel_disponibilidad]
GO
ALTER TABLE [dbo].[tbl_prestamo] ADD  DEFAULT (getdate()) FOR [pres_fecha_prestamo]
GO
ALTER TABLE [dbo].[tbl_prestamo] ADD  DEFAULT ((0)) FOR [pres_precio_total]
GO
ALTER TABLE [dbo].[tbl_usuario] ADD  DEFAULT ((3)) FOR [user_rol_id]
GO
ALTER TABLE [dbo].[tbl_carrito_compra]  WITH CHECK ADD  CONSTRAINT [FK_carr_codigo_socio] FOREIGN KEY([carr_codigo_socio])
REFERENCES [dbo].[tbl_socio] ([soc_codigo_socio])
GO
ALTER TABLE [dbo].[tbl_carrito_compra] CHECK CONSTRAINT [FK_carr_codigo_socio]
GO
ALTER TABLE [dbo].[tbl_carrito_compra]  WITH CHECK ADD  CONSTRAINT [FK_carr_pelicula_id] FOREIGN KEY([carr_pelicula_id])
REFERENCES [dbo].[tbl_pelicula] ([pel_id_pelicula])
GO
ALTER TABLE [dbo].[tbl_carrito_compra] CHECK CONSTRAINT [FK_carr_pelicula_id]
GO
ALTER TABLE [dbo].[tbl_cinta]  WITH CHECK ADD  CONSTRAINT [FK_cinta_pelicula] FOREIGN KEY([cin_pelicula_id])
REFERENCES [dbo].[tbl_pelicula] ([pel_id_pelicula])
GO
ALTER TABLE [dbo].[tbl_cinta] CHECK CONSTRAINT [FK_cinta_pelicula]
GO
ALTER TABLE [dbo].[tbl_detalle_prestamo]  WITH CHECK ADD  CONSTRAINT [FK_det_pres_numero_cinta] FOREIGN KEY([det_pres_numero_cinta])
REFERENCES [dbo].[tbl_cinta] ([cin_numero_cinta])
GO
ALTER TABLE [dbo].[tbl_detalle_prestamo] CHECK CONSTRAINT [FK_det_pres_numero_cinta]
GO
ALTER TABLE [dbo].[tbl_detalle_prestamo]  WITH CHECK ADD  CONSTRAINT [FK_det_pres_prestamo_id] FOREIGN KEY([det_pres_prestamo_id])
REFERENCES [dbo].[tbl_prestamo] ([pres_id_prestamo])
GO
ALTER TABLE [dbo].[tbl_detalle_prestamo] CHECK CONSTRAINT [FK_det_pres_prestamo_id]
GO
ALTER TABLE [dbo].[tbl_devolucion_cinta]  WITH CHECK ADD  CONSTRAINT [FK_del_cin_codigo_socio] FOREIGN KEY([del_cin_codigo_socio])
REFERENCES [dbo].[tbl_socio] ([soc_codigo_socio])
GO
ALTER TABLE [dbo].[tbl_devolucion_cinta] CHECK CONSTRAINT [FK_del_cin_codigo_socio]
GO
ALTER TABLE [dbo].[tbl_devolucion_cinta]  WITH CHECK ADD  CONSTRAINT [FK_del_cin_numero_cinta] FOREIGN KEY([del_cin_numero_cinta])
REFERENCES [dbo].[tbl_cinta] ([cin_numero_cinta])
GO
ALTER TABLE [dbo].[tbl_devolucion_cinta] CHECK CONSTRAINT [FK_del_cin_numero_cinta]
GO
ALTER TABLE [dbo].[tbl_lista_espera]  WITH CHECK ADD  CONSTRAINT [FK_list_codigo_socio] FOREIGN KEY([list_codigo_socio])
REFERENCES [dbo].[tbl_socio] ([soc_codigo_socio])
GO
ALTER TABLE [dbo].[tbl_lista_espera] CHECK CONSTRAINT [FK_list_codigo_socio]
GO
ALTER TABLE [dbo].[tbl_lista_espera]  WITH CHECK ADD  CONSTRAINT [FK_list_pelicula_id] FOREIGN KEY([list_pelicula_id])
REFERENCES [dbo].[tbl_pelicula] ([pel_id_pelicula])
GO
ALTER TABLE [dbo].[tbl_lista_espera] CHECK CONSTRAINT [FK_list_pelicula_id]
GO
ALTER TABLE [dbo].[tbl_llamada]  WITH CHECK ADD  CONSTRAINT [FK_lla_codigo_socio] FOREIGN KEY([lla_codigo_socio])
REFERENCES [dbo].[tbl_socio] ([soc_codigo_socio])
GO
ALTER TABLE [dbo].[tbl_llamada] CHECK CONSTRAINT [FK_lla_codigo_socio]
GO
ALTER TABLE [dbo].[tbl_llamada]  WITH CHECK ADD  CONSTRAINT [FK_lla_pelicula_id] FOREIGN KEY([lla_pelicula_id])
REFERENCES [dbo].[tbl_pelicula] ([pel_id_pelicula])
GO
ALTER TABLE [dbo].[tbl_llamada] CHECK CONSTRAINT [FK_lla_pelicula_id]
GO
ALTER TABLE [dbo].[tbl_pelicula]  WITH CHECK ADD  CONSTRAINT [FK_pelicula_clasificacion] FOREIGN KEY([pel_clasificacion])
REFERENCES [dbo].[tbl_clasificacion] ([clasf_simbolo])
GO
ALTER TABLE [dbo].[tbl_pelicula] CHECK CONSTRAINT [FK_pelicula_clasificacion]
GO
ALTER TABLE [dbo].[tbl_pelicula_actor]  WITH CHECK ADD  CONSTRAINT [FK_pel_act_actor_id] FOREIGN KEY([pel_act_actor_id])
REFERENCES [dbo].[tbl_actor] ([act_id_actor])
GO
ALTER TABLE [dbo].[tbl_pelicula_actor] CHECK CONSTRAINT [FK_pel_act_actor_id]
GO
ALTER TABLE [dbo].[tbl_pelicula_actor]  WITH CHECK ADD  CONSTRAINT [FK_pel_act_pelicula_id] FOREIGN KEY([pel_act_pelicula_id])
REFERENCES [dbo].[tbl_pelicula] ([pel_id_pelicula])
GO
ALTER TABLE [dbo].[tbl_pelicula_actor] CHECK CONSTRAINT [FK_pel_act_pelicula_id]
GO
ALTER TABLE [dbo].[tbl_pelicula_director]  WITH CHECK ADD  CONSTRAINT [FK_pel_dir_director_id] FOREIGN KEY([pel_dir_director_id])
REFERENCES [dbo].[tbl_director] ([dir_id_director])
GO
ALTER TABLE [dbo].[tbl_pelicula_director] CHECK CONSTRAINT [FK_pel_dir_director_id]
GO
ALTER TABLE [dbo].[tbl_pelicula_director]  WITH CHECK ADD  CONSTRAINT [FK_pel_dir_pelicula_id] FOREIGN KEY([pel_dir_pelicula_id])
REFERENCES [dbo].[tbl_pelicula] ([pel_id_pelicula])
GO
ALTER TABLE [dbo].[tbl_pelicula_director] CHECK CONSTRAINT [FK_pel_dir_pelicula_id]
GO
ALTER TABLE [dbo].[tbl_pelicula_genero]  WITH CHECK ADD  CONSTRAINT [FK_pel_gen_genero_id] FOREIGN KEY([pel_gen_genero_id])
REFERENCES [dbo].[tbl_genero_pelicula] ([gen_id_genero])
GO
ALTER TABLE [dbo].[tbl_pelicula_genero] CHECK CONSTRAINT [FK_pel_gen_genero_id]
GO
ALTER TABLE [dbo].[tbl_pelicula_genero]  WITH CHECK ADD  CONSTRAINT [FK_pel_gen_pelicula_id] FOREIGN KEY([pel_gen_pelicula_id])
REFERENCES [dbo].[tbl_pelicula] ([pel_id_pelicula])
GO
ALTER TABLE [dbo].[tbl_pelicula_genero] CHECK CONSTRAINT [FK_pel_gen_pelicula_id]
GO
ALTER TABLE [dbo].[tbl_pelicula_productora]  WITH CHECK ADD  CONSTRAINT [FK_pel_prod_pelicula_id] FOREIGN KEY([pel_prod_pelicula_id])
REFERENCES [dbo].[tbl_pelicula] ([pel_id_pelicula])
GO
ALTER TABLE [dbo].[tbl_pelicula_productora] CHECK CONSTRAINT [FK_pel_prod_pelicula_id]
GO
ALTER TABLE [dbo].[tbl_pelicula_productora]  WITH CHECK ADD  CONSTRAINT [FK_pel_prod_productora_id] FOREIGN KEY([pel_prod_productora_id])
REFERENCES [dbo].[tbl_productora] ([prod_id_productora])
GO
ALTER TABLE [dbo].[tbl_pelicula_productora] CHECK CONSTRAINT [FK_pel_prod_productora_id]
GO
ALTER TABLE [dbo].[tbl_prestamo]  WITH CHECK ADD  CONSTRAINT [FK_pres_codigo_socio] FOREIGN KEY([pres_codigo_socio])
REFERENCES [dbo].[tbl_socio] ([soc_codigo_socio])
GO
ALTER TABLE [dbo].[tbl_prestamo] CHECK CONSTRAINT [FK_pres_codigo_socio]
GO
ALTER TABLE [dbo].[tbl_registro_prestamos]  WITH CHECK ADD  CONSTRAINT [FK_reg_pres_codigo_socio] FOREIGN KEY([reg_pres_codigo_socio])
REFERENCES [dbo].[tbl_socio] ([soc_codigo_socio])
GO
ALTER TABLE [dbo].[tbl_registro_prestamos] CHECK CONSTRAINT [FK_reg_pres_codigo_socio]
GO
ALTER TABLE [dbo].[tbl_registro_prestamos]  WITH CHECK ADD  CONSTRAINT [FK_reg_pres_numero_cinta] FOREIGN KEY([reg_pres_numero_cinta])
REFERENCES [dbo].[tbl_cinta] ([cin_numero_cinta])
GO
ALTER TABLE [dbo].[tbl_registro_prestamos] CHECK CONSTRAINT [FK_reg_pres_numero_cinta]
GO
ALTER TABLE [dbo].[tbl_socio_actor]  WITH CHECK ADD  CONSTRAINT [FK_soc_act_actor_id] FOREIGN KEY([soc_act_actor_id])
REFERENCES [dbo].[tbl_actor] ([act_id_actor])
GO
ALTER TABLE [dbo].[tbl_socio_actor] CHECK CONSTRAINT [FK_soc_act_actor_id]
GO
ALTER TABLE [dbo].[tbl_socio_actor]  WITH CHECK ADD  CONSTRAINT [FK_soc_act_codigo_socio] FOREIGN KEY([soc_act_codigo_socio])
REFERENCES [dbo].[tbl_socio] ([soc_codigo_socio])
GO
ALTER TABLE [dbo].[tbl_socio_actor] CHECK CONSTRAINT [FK_soc_act_codigo_socio]
GO
ALTER TABLE [dbo].[tbl_socio_director]  WITH CHECK ADD  CONSTRAINT [FK_soc_dir_codigo_socio] FOREIGN KEY([soc_dir_codigo_socio])
REFERENCES [dbo].[tbl_socio] ([soc_codigo_socio])
GO
ALTER TABLE [dbo].[tbl_socio_director] CHECK CONSTRAINT [FK_soc_dir_codigo_socio]
GO
ALTER TABLE [dbo].[tbl_socio_director]  WITH CHECK ADD  CONSTRAINT [FK_soc_dir_director_id] FOREIGN KEY([soc_dir_director_id])
REFERENCES [dbo].[tbl_director] ([dir_id_director])
GO
ALTER TABLE [dbo].[tbl_socio_director] CHECK CONSTRAINT [FK_soc_dir_director_id]
GO
ALTER TABLE [dbo].[tbl_socio_genero]  WITH CHECK ADD  CONSTRAINT [FK_soc_gen_codigo_socio] FOREIGN KEY([soc_gen_codigo_socio])
REFERENCES [dbo].[tbl_socio] ([soc_codigo_socio])
GO
ALTER TABLE [dbo].[tbl_socio_genero] CHECK CONSTRAINT [FK_soc_gen_codigo_socio]
GO
ALTER TABLE [dbo].[tbl_socio_genero]  WITH CHECK ADD  CONSTRAINT [FK_soc_gen_genero_id] FOREIGN KEY([soc_gen_genero_id])
REFERENCES [dbo].[tbl_genero_pelicula] ([gen_id_genero])
GO
ALTER TABLE [dbo].[tbl_socio_genero] CHECK CONSTRAINT [FK_soc_gen_genero_id]
GO
ALTER TABLE [dbo].[tbl_subtitulos_cinta]  WITH CHECK ADD  CONSTRAINT [FK_subtitulos_cinta] FOREIGN KEY([sub_numero_cinta])
REFERENCES [dbo].[tbl_cinta] ([cin_numero_cinta])
GO
ALTER TABLE [dbo].[tbl_subtitulos_cinta] CHECK CONSTRAINT [FK_subtitulos_cinta]
GO
ALTER TABLE [dbo].[tbl_subtitulos_cinta]  WITH CHECK ADD  CONSTRAINT [FK_subtitulos_idioma] FOREIGN KEY([sub_idioma_id])
REFERENCES [dbo].[tbl_idioma] ([idm_id_idioma])
GO
ALTER TABLE [dbo].[tbl_subtitulos_cinta] CHECK CONSTRAINT [FK_subtitulos_idioma]
GO
ALTER TABLE [dbo].[tbl_usuario]  WITH CHECK ADD  CONSTRAINT [FK_user_rol_id] FOREIGN KEY([user_rol_id])
REFERENCES [dbo].[tbl_rol] ([rol_id_rol])
GO
ALTER TABLE [dbo].[tbl_usuario] CHECK CONSTRAINT [FK_user_rol_id]
GO
ALTER TABLE [dbo].[tbl_bitacora_actor]  WITH CHECK ADD CHECK  (([bit_act_accion]='DELETE' OR [bit_act_accion]='UPDATE' OR [bit_act_accion]='INSERT'))
GO
ALTER TABLE [dbo].[tbl_bitacora_carrito_compra]  WITH CHECK ADD CHECK  (([bit_carr_accion]='DELETE' OR [bit_carr_accion]='UPDATE' OR [bit_carr_accion]='INSERT'))
GO
ALTER TABLE [dbo].[tbl_bitacora_cinta]  WITH CHECK ADD CHECK  (([bit_cin_accion]='DELETE' OR [bit_cin_accion]='UPDATE' OR [bit_cin_accion]='INSERT'))
GO
ALTER TABLE [dbo].[tbl_bitacora_clasificacion]  WITH CHECK ADD CHECK  (([bit_clasf_accion]='DELETE' OR [bit_clasf_accion]='UPDATE' OR [bit_clasf_accion]='INSERT'))
GO
ALTER TABLE [dbo].[tbl_bitacora_detalle_prestamo]  WITH CHECK ADD CHECK  (([bit_det_pres_accion]='DELETE' OR [bit_det_pres_accion]='UPDATE' OR [bit_det_pres_accion]='INSERT'))
GO
ALTER TABLE [dbo].[tbl_bitacora_devolucion_cinta]  WITH CHECK ADD CHECK  (([bit_del_cin_accion]='DELETE' OR [bit_del_cin_accion]='UPDATE' OR [bit_del_cin_accion]='INSERT'))
GO
ALTER TABLE [dbo].[tbl_bitacora_director]  WITH CHECK ADD CHECK  (([bit_dir_accion]='DELETE' OR [bit_dir_accion]='UPDATE' OR [bit_dir_accion]='INSERT'))
GO
ALTER TABLE [dbo].[tbl_bitacora_empresa]  WITH CHECK ADD CHECK  (([bit_emp_accion]='DELETE' OR [bit_emp_accion]='UPDATE' OR [bit_emp_accion]='INSERT'))
GO
ALTER TABLE [dbo].[tbl_bitacora_genero_pelicula]  WITH CHECK ADD CHECK  (([bit_gen_accion]='DELETE' OR [bit_gen_accion]='UPDATE' OR [bit_gen_accion]='INSERT'))
GO
ALTER TABLE [dbo].[tbl_bitacora_idioma]  WITH CHECK ADD CHECK  (([bit_idm_accion]='DELETE' OR [bit_idm_accion]='UPDATE' OR [bit_idm_accion]='INSERT'))
GO
ALTER TABLE [dbo].[tbl_bitacora_lista_espera]  WITH CHECK ADD CHECK  (([bit_list_accion]='DELETE' OR [bit_list_accion]='UPDATE' OR [bit_list_accion]='INSERT'))
GO
ALTER TABLE [dbo].[tbl_bitacora_llamada]  WITH CHECK ADD CHECK  (([bit_lla_accion]='DELETE' OR [bit_lla_accion]='UPDATE' OR [bit_lla_accion]='INSERT'))
GO
ALTER TABLE [dbo].[tbl_bitacora_pelicula]  WITH CHECK ADD CHECK  (([bit_pel_accion]='DELETE' OR [bit_pel_accion]='UPDATE' OR [bit_pel_accion]='INSERT'))
GO
ALTER TABLE [dbo].[tbl_bitacora_pelicula_actor]  WITH CHECK ADD CHECK  (([bit_pel_act_accion]='DELETE' OR [bit_pel_act_accion]='UPDATE' OR [bit_pel_act_accion]='INSERT'))
GO
ALTER TABLE [dbo].[tbl_bitacora_pelicula_director]  WITH CHECK ADD CHECK  (([bit_pel_dir_accion]='DELETE' OR [bit_pel_dir_accion]='UPDATE' OR [bit_pel_dir_accion]='INSERT'))
GO
ALTER TABLE [dbo].[tbl_bitacora_pelicula_genero]  WITH CHECK ADD CHECK  (([bit_pel_gen_accion]='DELETE' OR [bit_pel_gen_accion]='UPDATE' OR [bit_pel_gen_accion]='INSERT'))
GO
ALTER TABLE [dbo].[tbl_bitacora_pelicula_productora]  WITH CHECK ADD CHECK  (([bit_pel_prod_accion]='DELETE' OR [bit_pel_prod_accion]='UPDATE' OR [bit_pel_prod_accion]='INSERT'))
GO
ALTER TABLE [dbo].[tbl_bitacora_prestamo]  WITH CHECK ADD CHECK  (([bit_pres_accion]='DELETE' OR [bit_pres_accion]='UPDATE' OR [bit_pres_accion]='INSERT'))
GO
ALTER TABLE [dbo].[tbl_bitacora_productora]  WITH CHECK ADD CHECK  (([bit_prod_accion]='DELETE' OR [bit_prod_accion]='UPDATE' OR [bit_prod_accion]='INSERT'))
GO
ALTER TABLE [dbo].[tbl_bitacora_registro_prestamos]  WITH CHECK ADD CHECK  (([bit_reg_cin_accion]='DELETE' OR [bit_reg_cin_accion]='UPDATE' OR [bit_reg_cin_accion]='INSERT'))
GO
ALTER TABLE [dbo].[tbl_bitacora_rol]  WITH CHECK ADD CHECK  (([bit_rol_accion]='DELETE' OR [bit_rol_accion]='UPDATE' OR [bit_rol_accion]='INSERT'))
GO
ALTER TABLE [dbo].[tbl_bitacora_socio]  WITH CHECK ADD CHECK  (([bit_soc_accion]='DELETE' OR [bit_soc_accion]='UPDATE' OR [bit_soc_accion]='INSERT'))
GO
ALTER TABLE [dbo].[tbl_bitacora_socio_actor]  WITH CHECK ADD CHECK  (([bit_soc_act_accion]='DELETE' OR [bit_soc_act_accion]='UPDATE' OR [bit_soc_act_accion]='INSERT'))
GO
ALTER TABLE [dbo].[tbl_bitacora_socio_director]  WITH CHECK ADD CHECK  (([bit_soc_dir_accion]='DELETE' OR [bit_soc_dir_accion]='UPDATE' OR [bit_soc_dir_accion]='INSERT'))
GO
ALTER TABLE [dbo].[tbl_bitacora_socio_genero]  WITH CHECK ADD CHECK  (([bit_soc_gen_accion]='DELETE' OR [bit_soc_gen_accion]='UPDATE' OR [bit_soc_gen_accion]='INSERT'))
GO
ALTER TABLE [dbo].[tbl_bitacora_subtitulos_cinta]  WITH CHECK ADD CHECK  (([bit_sub_accion]='DELETE' OR [bit_sub_accion]='UPDATE' OR [bit_sub_accion]='INSERT'))
GO
ALTER TABLE [dbo].[tbl_bitacora_usuario]  WITH CHECK ADD CHECK  (([bit_user_accion]='DELETE' OR [bit_user_accion]='UPDATE' OR [bit_user_accion]='INSERT'))
GO
ALTER TABLE [dbo].[tbl_carrito_compra]  WITH CHECK ADD CHECK  (([carr_estado]='Procesado' OR [carr_estado]='En proceso'))
GO
ALTER TABLE [dbo].[tbl_cinta]  WITH CHECK ADD CHECK  (([cin_estado]='Dañada' OR [cin_estado]='Prestada' OR [cin_estado]='Disponible'))
GO
ALTER TABLE [dbo].[tbl_pelicula]  WITH CHECK ADD CHECK  (([pel_disponibilidad]='Disponible' OR [pel_disponibilidad]='No disponible'))
GO
ALTER TABLE [dbo].[tbl_pelicula_actor]  WITH CHECK ADD CHECK  (([pel_act_tipo_actor]='Secundario' OR [pel_act_tipo_actor]='Principal'))
GO
ALTER TABLE [dbo].[tbl_socio]  WITH CHECK ADD CHECK  (([soc_genero]='No binario' OR [soc_genero]='Femenino' OR [soc_genero]='Masculino'))
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_tbl_actor]    Script Date: 10/11/2022 15:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_delete_tbl_actor]
	( 
	@act_id_actor int
	)
AS
BEGIN
    
	delete from tbl_actor
	where act_id_actor = @act_id_actor

END
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_tbl_carrito_compra]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_delete_tbl_carrito_compra]
	( 
	@carr_id_carrito int
	)
AS
BEGIN
    
	delete from tbl_carrito_compra
	where carr_id_carrito = @carr_id_carrito

END
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_tbl_cinta]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_delete_tbl_cinta]
	( 
	@cin_numero_cinta varchar(13)
	)
AS
BEGIN
    
	delete from tbl_cinta
	where cin_numero_cinta = @cin_numero_cinta

END
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_tbl_detalle_prestamo]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_delete_tbl_detalle_prestamo] 
	( 
	@det_pres_id_detalle_prestamo int
	)
AS
BEGIN
    
	delete from tbl_detalle_prestamo
	where det_pres_id_detalle_prestamo = @det_pres_id_detalle_prestamo

END
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_tbl_devolucion_cinta]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_delete_tbl_devolucion_cinta]
( 
	@del_cin_id_devolucion_cinta int
)
AS
BEGIN
    
	delete from tbl_devolucion_cinta
	where del_cin_id_devolucion_cinta = @del_cin_id_devolucion_cinta

END

GO
/****** Object:  StoredProcedure [dbo].[sp_delete_tbl_director]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_delete_tbl_director]
	( 
	@dir_id_director int
	)
AS
BEGIN
    
	delete from tbl_director
	where dir_id_director = @dir_id_director

END
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_tbl_empresa]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_delete_tbl_empresa] 
	( 
	@emp_id_empresa int
	)
AS
BEGIN
    
	delete from tbl_empresa
	where emp_id_empresa = @emp_id_empresa

END
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_tbl_genero_pelicula]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_delete_tbl_genero_pelicula]
	( 
	@gen_id_genero int
	)
AS
BEGIN
    
	delete from tbl_genero_pelicula
	where gen_id_genero = @gen_id_genero

END
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_tbl_idioma]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_delete_tbl_idioma] 
( 
@idm_id_idioma int
)
AS
BEGIN
    
	delete from tbl_idioma
	where idm_id_idioma = @idm_id_idioma

END

GO
/****** Object:  StoredProcedure [dbo].[sp_delete_tbl_lista_espera]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_delete_tbl_lista_espera]
( 
	@list_id_lista_espera int
)
AS
BEGIN
    
	delete from tbl_lista_espera
	where list_id_lista_espera = @list_id_lista_espera

END

GO
/****** Object:  StoredProcedure [dbo].[sp_delete_tbl_llamada]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_delete_tbl_llamada]
( 
	@lla_id_llamada  int
)
AS
BEGIN
    
	delete from tbl_llamada
	where lla_id_llamada = @lla_id_llamada

END

GO
/****** Object:  StoredProcedure [dbo].[sp_delete_tbl_pelicula]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_delete_tbl_pelicula] ( 
	@pel_id_pelicula varchar(8)
	)
AS
BEGIN
    
	delete from tbl_pelicula
	where pel_id_pelicula = @pel_id_pelicula

END
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_tbl_pelicula_actor]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_delete_tbl_pelicula_actor] 
( 
@pel_act_id_pelicula_actor int
)
AS
BEGIN
    
	delete from tbl_pelicula_actor 
	where pel_act_id_pelicula_actor = @pel_act_id_pelicula_actor

END

GO
/****** Object:  StoredProcedure [dbo].[sp_delete_tbl_pelicula_director]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_delete_tbl_pelicula_director] 
	( 
	@pel_dir_id_pelicula_director int
	)
AS
BEGIN
    
	delete from tbl_pelicula_director
	where pel_dir_id_pelicula_director = @pel_dir_id_pelicula_director

END

GO
/****** Object:  StoredProcedure [dbo].[sp_delete_tbl_pelicula_genero]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_delete_tbl_pelicula_genero] 
( 
	@pel_gen_id_pelicula_genero int
)
AS
BEGIN
    
	delete from tbl_pelicula_genero 
	where pel_gen_id_pelicula_genero = @pel_gen_id_pelicula_genero

END

GO
/****** Object:  StoredProcedure [dbo].[sp_delete_tbl_pelicula_productora]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_delete_tbl_pelicula_productora] 
( 
@pel_prod_id_pelicula_productora int
)
AS
BEGIN
    
	delete from tbl_pelicula_productora
	where pel_prod_id_pelicula_productora = @pel_prod_id_pelicula_productora

END

GO
/****** Object:  StoredProcedure [dbo].[sp_delete_tbl_prestamo]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_delete_tbl_prestamo]
	( 
	@pres_id_prestamo int
	)
AS
BEGIN
    
	delete from tbl_prestamo
	where pres_id_prestamo = @pres_id_prestamo

END
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_tbl_productora]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_delete_tbl_productora] 
	( 
	@prod_id_productora int
	)
AS
BEGIN
    
	delete from tbl_productora 
	where prod_id_productora = @prod_id_productora

END
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_tbl_registro_prestamos]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_delete_tbl_registro_prestamos]
( 
	@reg_pres_id_registro_prestamos int
)
AS
BEGIN
    
	delete from tbl_registro_prestamos
	where reg_pres_id_registro_prestamos = @reg_pres_id_registro_prestamos

END

GO
/****** Object:  StoredProcedure [dbo].[sp_delete_tbl_rol]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_delete_tbl_rol]
	( 
	@rol_id_rol int
	)
AS
BEGIN
    
	delete from tbl_rol
	where rol_id_rol = @rol_id_rol

END

GO
/****** Object:  StoredProcedure [dbo].[sp_delete_tbl_socio]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_delete_tbl_socio] ( 
	@soc_codigo_socio varchar(12)
	)
AS
BEGIN
    
	delete from tbl_socio
	where soc_codigo_socio = @soc_codigo_socio

END
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_tbl_socio_actor]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_delete_tbl_socio_actor]
( 
	@soc_act_id_socio_actor int
)
AS
BEGIN
    
	delete from tbl_socio_actor
	where soc_act_id_socio_actor= @soc_act_id_socio_actor

END

GO
/****** Object:  StoredProcedure [dbo].[sp_delete_tbl_socio_director]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_delete_tbl_socio_director]
	( 
	@soc_dir_id_socio_director int
	)
AS
BEGIN
    
	delete from tbl_socio_director
	where soc_dir_id_socio_director = @soc_dir_id_socio_director

END

GO
/****** Object:  StoredProcedure [dbo].[sp_delete_tbl_socio_genero]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_delete_tbl_socio_genero]
	( 
	@soc_gen_id_socio_genero int
	)
AS
BEGIN
    
	delete from tbl_socio_genero
	where soc_gen_id_socio_genero= @soc_gen_id_socio_genero

END

GO
/****** Object:  StoredProcedure [dbo].[sp_delete_tbl_subtitulos_cinta]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_delete_tbl_subtitulos_cinta] 
( 
	@sub_subtitulos_cinta int
)
AS
BEGIN
    
	delete from tbl_subtitulos_cinta 
	where sub_subtitulos_cinta = @sub_subtitulos_cinta

END

GO
/****** Object:  StoredProcedure [dbo].[sp_delete_tbl_usuario]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_delete_tbl_usuario] 
	( 
	@user_id_usuario int
	)
AS
BEGIN
    
	delete from tbl_usuario
	where user_id_usuario = @user_id_usuario

END

GO
/****** Object:  StoredProcedure [dbo].[sp_insert_tbl_actor]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insert_tbl_actor] ( 

@act_nombre varchar(35),
@act_nombre_nacimiento varchar(40),
@act_nacionalidad varchar(15),
@act_biografia text,
@act_año_inicio int,
@act_fecha_nacimiento date,
@act_ocupacion varchar(100),
@act_imagen varchar(50)
)
AS
BEGIN

insert into tbl_actor (act_nombre,act_nombre_nacimiento,act_nacionalidad,act_biografia,act_año_inicio,act_fecha_nacimiento,act_ocupacion,act_imagen) 
values (@act_nombre,@act_nombre_nacimiento,@act_nacionalidad,@act_biografia,@act_año_inicio,@act_fecha_nacimiento,@act_ocupacion,@act_imagen) 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_tbl_carrito_compra]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insert_tbl_carrito_compra]
	( 
	@carr_pelicula_id varchar(8),
	@carr_codigo_socio varchar(12)
	)
AS
BEGIN
    
		insert into tbl_carrito_compra (carr_pelicula_id,carr_codigo_socio) 
		values (@carr_pelicula_id,@carr_codigo_socio)

END
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_tbl_cinta]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insert_tbl_cinta] ( 
	@cin_idioma varchar(3),
	@cin_pelicula_id varchar(8)
	)
AS
BEGIN
    
	declare  @id varchar(36),@cin_numero_cinta varchar(13)

	set @id =  newid()
	set @id = SUBSTRING(@id,1,4)
	set @cin_numero_cinta = @cin_pelicula_id + '-' + @id

	insert into tbl_cinta(cin_numero_cinta,cin_idioma,cin_pelicula_id) 
	values (@cin_numero_cinta,@cin_idioma,@cin_pelicula_id)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_tbl_detalle_prestamo]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insert_tbl_detalle_prestamo] 
	( 
	@det_pres_prestamo_id int,
	@pel_id_pelicula varchar(8)
	)
AS
BEGIN
    
	declare @det_pres_sub_total money,@det_pres_numero_cinta varchar(13)

	if exists (select top (1) cin_numero_cinta from tbl_cinta where (cin_pelicula_id = @pel_id_pelicula) and (cin_estado = 'Disponible'))
	begin
		set @det_pres_numero_cinta = (select top (1) cin_numero_cinta from tbl_cinta where (cin_pelicula_id = @pel_id_pelicula) and (cin_estado = 'Disponible'))

		set @det_pres_sub_total = (select pel_precio from tbl_pelicula where pel_id_pelicula = 
		(select cin_pelicula_id from tbl_cinta where (cin_numero_cinta = @det_pres_numero_cinta)))

		insert into tbl_detalle_prestamo(det_pres_prestamo_id,det_pres_numero_cinta,det_pres_sub_total) 
		values (@det_pres_prestamo_id,@det_pres_numero_cinta,@det_pres_sub_total)
	end

END
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_tbl_devolucion_cinta]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insert_tbl_devolucion_cinta] 
( 
	@del_cin_numero_cinta varchar(13),
	@del_cin_codigo_socio varchar(12),
	@del_cin_fecha_prestamo datetime,
	@del_cin_fecha_devolucion datetime
)
AS
BEGIN
	insert into tbl_devolucion_cinta(del_cin_numero_cinta,del_cin_codigo_socio,del_cin_fecha_prestamo,del_cin_fecha_devolucion)
	values (@del_cin_numero_cinta,@del_cin_codigo_socio,@del_cin_fecha_prestamo,@del_cin_fecha_devolucion)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_insert_tbl_director]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insert_tbl_director] 
( 
@dir_nombre varchar(30),
@dir_nombre_nacimiento varchar(50),
@dir_nacionalidad varchar(15),
@dir_biografia text,
@dir_fecha_nacimiento date,
@dir_imagen varchar(50)
)
AS
BEGIN
	insert into tbl_director (dir_nombre,dir_nombre_nacimiento,dir_nacionalidad,dir_biografia,dir_fecha_nacimiento,dir_imagen) 
	values (@dir_nombre,@dir_nombre_nacimiento,@dir_nacionalidad,@dir_biografia,@dir_fecha_nacimiento,@dir_imagen) 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_tbl_empresa]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insert_tbl_empresa] ( 
	@emp_nombre varchar(15),
	@emp_telefono varchar(8),
	@emp_direccion text,
	@emp_correo varchar(50),
	@emp_logo varchar(50)
	)
AS
BEGIN
    
	insert into tbl_empresa(emp_nombre,emp_telefono,emp_direccion,emp_correo,emp_logo) 
	values (@emp_nombre,@emp_telefono,@emp_direccion,@emp_correo,@emp_logo)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_tbl_genero_pelicula]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insert_tbl_genero_pelicula] 
( 
@gen_nombre varchar(20),
@gen_descripcion text,
@gen_imagen varchar(50)
)
AS
BEGIN
	insert into tbl_genero_pelicula (gen_nombre,gen_descripcion,gen_imagen) 
	values (@gen_nombre,@gen_descripcion,@gen_imagen) 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_tbl_idioma]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insert_tbl_idioma] 
( 
	@idm_nombre varchar (10)
)
AS
BEGIN
    
	insert into tbl_idioma(idm_nombre)
	values (@idm_nombre)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_insert_tbl_lista_espera]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insert_tbl_lista_espera]
( 
	@list_id_lista_espera int,
	@list_codigo_socio varchar(12),
	@list_pelicula_id varchar(8),
	@list_fecha_solicitud datetime
)
AS
BEGIN
    
	insert into tbl_lista_espera(list_codigo_socio,list_pelicula_id,list_fecha_solicitud)
	values (@list_codigo_socio,@list_pelicula_id,@list_fecha_solicitud)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_insert_tbl_llamada]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insert_tbl_llamada]
( 
	@lla_id_llamada int,
	@lla_codigo_socio varchar(12),
	@lla_pelicula_id varchar(8)
)
AS
BEGIN
    
	insert into tbl_llamada(lla_codigo_socio,lla_pelicula_id)
	values (@lla_codigo_socio,@lla_pelicula_id)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_insert_tbl_pelicula]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insert_tbl_pelicula] ( 
	@pel_titulo varchar(10),
	@pel_sinopsis text,
	@pel_clasificacion varchar(5),
	@pel_duracion time,
	@pel_año_publicacion int,
	@pel_pais varchar(20),
	@pel_precio money,
	@pel_portada varchar(50),
	@pel_trailer varchar(50)
	)
AS
BEGIN
    
	declare  @id varchar(36),@pel_id_pelicula varchar(8)

	set @id =  newid()
	set @id = SUBSTRING(@id,1,8)
	set @pel_id_pelicula = @id

	insert into tbl_pelicula(pel_id_pelicula,pel_titulo,pel_sinopsis,pel_clasificacion,pel_duracion,pel_año_publicacion,pel_pais,pel_precio,pel_portada,pel_trailer) 
	values (@pel_id_pelicula,@pel_titulo,@pel_sinopsis,@pel_clasificacion,@pel_duracion,@pel_año_publicacion,@pel_pais,@pel_precio,@pel_portada,@pel_trailer)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_tbl_pelicula_actor]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insert_tbl_pelicula_actor] 
( 
@pel_act_actor_id int,
@pel_act_tipo_actor varchar (10),
@pel_act_pelicula_id varchar (8)
)
AS
BEGIN
    
	insert into tbl_pelicula_actor(pel_act_actor_id ,pel_act_tipo_actor,pel_act_pelicula_id)
	values (@pel_act_actor_id,@pel_act_tipo_actor,@pel_act_pelicula_id)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_insert_tbl_pelicula_director]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insert_tbl_pelicula_director] 
	( 
	@pel_dir_pelicula_id varchar(15),
	@pel_dir_director_id int
	)
AS
BEGIN
	insert into tbl_pelicula_director(pel_dir_pelicula_id,pel_dir_director_id)
	values (@pel_dir_pelicula_id,@pel_dir_director_id)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_insert_tbl_pelicula_genero]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insert_tbl_pelicula_genero] 
( 
	@pel_gen_genero_id int,
	@pel_gen_pelicula_id varchar (8)
)
AS
BEGIN
    
	insert into tbl_pelicula_genero(pel_gen_genero_id,pel_gen_pelicula_id)
	values (@pel_gen_genero_id,@pel_gen_pelicula_id)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_insert_tbl_pelicula_productora]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insert_tbl_pelicula_productora] 
( 
	@pel_prod_productora_id int,
	@pel_prod_pelicula_id varchar (8)
)
AS
BEGIN
	insert into tbl_pelicula_productora(pel_prod_productora_id ,pel_prod_pelicula_id)
	values (@pel_prod_productora_id,@pel_prod_pelicula_id)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_insert_tbl_prestamo]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insert_tbl_prestamo] 
( 
@pres_fecha_prestamo datetime,
@pres_fecha_devolucion datetime,
@pres_codigo_socio varchar(12),
@pres_precio_total money
)
AS
BEGIN
	insert into tbl_prestamo (pres_fecha_prestamo,pres_fecha_devolucion,pres_codigo_socio,pres_precio_total) 
	values (@pres_fecha_prestamo,@pres_fecha_devolucion,@pres_codigo_socio,@pres_precio_total) 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_tbl_productora]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insert_tbl_productora] 
( 
@prod_nombre varchar(20),
@prod_año_fundacion int,
@prod_descripcion text,
@prod_sitio_web varchar(20),
@prod_logo varchar(50)
)
AS
BEGIN

insert into tbl_productora (prod_nombre,prod_año_fundacion,prod_descripcion,prod_sitio_web,prod_logo) 
values (@prod_nombre,@prod_año_fundacion,@prod_descripcion,@prod_sitio_web,@prod_logo) 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_tbl_registro_prestamos]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insert_tbl_registro_prestamos]
( 
	@reg_pres_numero_cinta varchar(13),
	@reg_pres_codigo_socio varchar(12),
	@reg_pres_fecha_prestamo datetime,
	@reg_pres_fecha_devolucion datetime
)
AS
BEGIN    
	insert into tbl_registro_prestamos(reg_pres_numero_cinta,reg_pres_codigo_socio,reg_pres_fecha_prestamo,reg_pres_fecha_devolucion)
	values (@reg_pres_numero_cinta,@reg_pres_codigo_socio,@reg_pres_fecha_prestamo,@reg_pres_fecha_devolucion)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_insert_tbl_rol]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insert_tbl_rol]
( 
    @rol_nombre varchar(20),
    @rol_descripcion varchar(100)
)
AS
BEGIN
	insert into tbl_rol(rol_nombre,rol_descripcion)
	values (@rol_nombre,@rol_descripcion)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_insert_tbl_socio]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insert_tbl_socio] ( 
	@soc_cedula varchar(9),
	@soc_nombre varchar(35),
	@soc_apellido1 varchar(40),
	@soc_apellido2 varchar(40),
	@soc_correo varchar(50),
	@soc_telefono varchar(8),
	@soc_codigo_postal varchar(5),
	@soc_direccion_exacta varchar(100),
	@soc_genero varchar(10),
	@soc_fecha_nacimiento date,
	@soc_foto_perfil varchar(50)
	)
AS
BEGIN
    
	declare  @id varchar(36), @soc_codigo_socio varchar(12)

	set @id = newid()
	set @id = SUBSTRING(@id,25,12)
	set @soc_codigo_socio = @id

	insert into tbl_socio (soc_codigo_socio,soc_cedula,soc_nombre,soc_apellido1,soc_apellido2,soc_correo,soc_telefono,soc_codigo_postal,soc_direccion_exacta,soc_genero,soc_fecha_nacimiento,soc_foto_perfil) 
	values (@soc_codigo_socio,@soc_cedula,@soc_nombre,@soc_apellido1,@soc_apellido2,@soc_correo,@soc_telefono,@soc_codigo_postal,@soc_direccion_exacta,@soc_genero,@soc_fecha_nacimiento,@soc_foto_perfil)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_tbl_socio_actor]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insert_tbl_socio_actor]
( 
	@soc_act_codigo_socio varchar(12),
	@soc_act_actor_id int
)
AS
BEGIN
    
	insert into tbl_socio_actor(soc_act_codigo_socio,soc_act_actor_id)
	values (@soc_act_codigo_socio,@soc_act_actor_id)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_insert_tbl_socio_director]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insert_tbl_socio_director]
( 
@soc_dir_codigo_socio varchar(12),
@soc_dir_director_id int
)
AS
BEGIN
    
	insert into tbl_socio_director(soc_dir_codigo_socio,soc_dir_director_id)
	values (@soc_dir_codigo_socio,@soc_dir_director_id)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_insert_tbl_socio_genero]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insert_tbl_socio_genero]
( 
@soc_gen_codigo_socio varchar(12),
@soc_gen_genero_id int
)
AS
BEGIN
    
	insert into tbl_socio_genero(soc_gen_codigo_socio,soc_gen_genero_id)
	values (@soc_gen_codigo_socio,@soc_gen_genero_id)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_insert_tbl_subtitulos_cinta]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insert_tbl_subtitulos_cinta] 
( 
	@sub_numero_cinta varchar(13),
	@sub_idioma_id varchar (3)
)
AS
BEGIN
	insert into tbl_subtitulos_cinta(sub_numero_cinta,sub_idioma_id)
	values (@sub_numero_cinta,@sub_idioma_id)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_insert_tbl_usuario]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insert_tbl_usuario]( 

@user_nombre varchar(35),
@user_correo varchar(50),
@user_contraseña varchar(75),
@user_rol_id int,
@user_foto varchar(50)
	)
AS
BEGIN
	insert into tbl_usuario(user_nombre,user_correo,user_contraseña,user_rol_id,user_foto)
	values (@user_nombre,@user_correo,@user_contraseña,@user_rol_id,@user_foto)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_select_all_tbl_actor]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_all_tbl_actor]
AS
BEGIN

	select 
	act_id_actor,
	act_nombre,
	act_nombre_nacimiento,
    act_nacionalidad,
    act_biografia,
    act_año_inicio,
    act_fecha_nacimiento,
    act_ocupacion,
    act_imagen
	from  tbl_actor

END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_all_tbl_carrito_compra]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_all_tbl_carrito_compra]
AS
BEGIN

	select 
	carr_id_carrito,
	carr_pelicula_id,
	carr_codigo_socio,
	carr_estado
	from tbl_carrito_compra

END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_all_tbl_cinta]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_all_tbl_cinta]
AS
BEGIN

    select cin_numero_cinta,cin_idioma,cin_pelicula_id,cin_estado from tbl_cinta

END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_all_tbl_detalle_prestamo]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_all_tbl_detalle_prestamo]
AS
BEGIN

	select 
	det_pres_id_detalle_prestamo,
	det_pres_prestamo_id,
	det_pres_numero_cinta,
	det_pres_sub_total
	from tbl_detalle_prestamo

END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_all_tbl_devolucion_cinta]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_all_tbl_devolucion_cinta]
AS
BEGIN

	select 
	del_cin_id_devolucion_cinta,
	del_cin_numero_cinta,
	del_cin_codigo_socio,
	del_cin_fecha_prestamo,
	del_cin_fecha_devolucion 
	from tbl_devolucion_cinta

END

GO
/****** Object:  StoredProcedure [dbo].[sp_select_all_tbl_director]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_all_tbl_director]
AS
BEGIN

	select 
	dir_nombre,
    dir_nombre_nacimiento ,
    dir_nacionalidad,
	dir_biografia,
	dir_fecha_nacimiento,
	dir_imagen
	from  tbl_director

END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_all_tbl_empresa]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_all_tbl_empresa]
AS
BEGIN

	select 
	emp_id_empresa,
	emp_nombre,
	emp_telefono,
	emp_direccion,
	emp_correo,
	emp_logo 
	from tbl_empresa

END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_all_tbl_genero_pelicula]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_all_tbl_genero_pelicula]
AS
BEGIN

	select 
	gen_id_genero,
	gen_nombre,
	gen_descripcion,
	gen_imagen
	from  tbl_genero_pelicula

END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_all_tbl_idioma]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_all_tbl_idioma]
AS
BEGIN

	select 
	idm_id_idioma,
	idm_nombre
	from tbl_idioma

END

GO
/****** Object:  StoredProcedure [dbo].[sp_select_all_tbl_lista_espera]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_all_tbl_lista_espera]
AS
BEGIN

	select 
	list_id_lista_espera,
	list_codigo_socio,
	list_pelicula_id,
	list_fecha_solicitud
	from tbl_lista_espera

END

GO
/****** Object:  StoredProcedure [dbo].[sp_select_all_tbl_llamada]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_all_tbl_llamada]
AS
BEGIN

	select 
	lla_id_llamada,
	lla_codigo_socio,
	lla_pelicula_id
	from tbl_llamada

END

GO
/****** Object:  StoredProcedure [dbo].[sp_select_all_tbl_pelicula]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_all_tbl_pelicula]
AS
BEGIN

    select pel_id_pelicula,pel_titulo,pel_sinopsis,pel_clasificacion,pel_duracion,pel_año_publicacion,pel_stock_cintas,pel_pais,pel_precio,pel_disponibilidad,pel_portada,pel_trailer from tbl_pelicula

END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_all_tbl_pelicula_actor]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_all_tbl_pelicula_actor]
AS
BEGIN

	select 
	pel_act_id_pelicula_actor,
	pel_act_actor_id,
	pel_act_tipo_actor,
	pel_act_pelicula_id
	from tbl_pelicula_actor

END

GO
/****** Object:  StoredProcedure [dbo].[sp_select_all_tbl_pelicula_director]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_all_tbl_pelicula_director]
AS
BEGIN

	select 
	pel_dir_id_pelicula_director,
	pel_dir_pelicula_id,
	pel_dir_director_id
	from tbl_pelicula_director

END

GO
/****** Object:  StoredProcedure [dbo].[sp_select_all_tbl_pelicula_genero]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_all_tbl_pelicula_genero]
AS
BEGIN

	select 
	pel_gen_id_pelicula_genero,
	pel_gen_genero_id,
	pel_gen_pelicula_id
	from tbl_pelicula_genero

END

GO
/****** Object:  StoredProcedure [dbo].[sp_select_all_tbl_pelicula_productora]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_all_tbl_pelicula_productora]
AS
BEGIN

	select 
	pel_prod_id_pelicula_productora,
	pel_prod_productora_id,
	pel_prod_pelicula_id
	from tbl_pelicula_productora

END

GO
/****** Object:  StoredProcedure [dbo].[sp_select_all_tbl_prestamo]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_all_tbl_prestamo]
AS
BEGIN
	select 
	pres_id_prestamo,
    pres_fecha_prestamo,
    pres_fecha_devolucion,
    pres_codigo_socio,
    pres_precio_total
	from  tbl_prestamo
END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_all_tbl_productora]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_all_tbl_productora]
AS
BEGIN

	select 
	prod_id_productora,
    prod_nombre,
    prod_año_fundacion,
    prod_descripcion,
    prod_sitio_web ,
    prod_logo 
	from  tbl_productora

END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_all_tbl_registro_prestamos]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_all_tbl_registro_prestamos]
AS
BEGIN

	select 
	reg_pres_id_registro_prestamos,
	reg_pres_numero_cinta,
	reg_pres_codigo_socio,
	reg_pres_fecha_prestamo,
	reg_pres_fecha_devolucion
	from tbl_registro_prestamos

END

GO
/****** Object:  StoredProcedure [dbo].[sp_select_all_tbl_rol]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_all_tbl_rol]
AS
BEGIN

	select 
	rol_id_rol,
	rol_nombre,
	rol_descripcion
	from tbl_rol

END

GO
/****** Object:  StoredProcedure [dbo].[sp_select_all_tbl_socio]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_all_tbl_socio]
AS
BEGIN

    select soc_codigo_socio,soc_cedula,soc_nombre,soc_apellido1,soc_apellido2,soc_correo,soc_telefono,soc_codigo_postal,soc_direccion_exacta,soc_genero,soc_fecha_nacimiento,soc_foto_perfil from tbl_socio

END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_all_tbl_socio_actor]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_all_tbl_socio_actor]
AS
BEGIN

	select 
    soc_act_id_socio_actor,
	soc_act_codigo_socio,
    soc_act_actor_id 
	from tbl_socio_actor

END

GO
/****** Object:  StoredProcedure [dbo].[sp_select_all_tbl_socio_director]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_all_tbl_socio_director]
AS
BEGIN

	select 
    soc_dir_id_socio_director,
   soc_dir_codigo_socio,
   soc_dir_director_id
	from tbl_socio_director

END

GO
/****** Object:  StoredProcedure [dbo].[sp_select_all_tbl_socio_genero]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_all_tbl_socio_genero]
AS
BEGIN

	select 
    soc_gen_id_socio_genero,
	soc_gen_codigo_socio,
    soc_gen_genero_id 
	from tbl_socio_genero

END

GO
/****** Object:  StoredProcedure [dbo].[sp_select_all_tbl_subtitulos_cinta]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_all_tbl_subtitulos_cinta]
AS
BEGIN

	select 
	sub_subtitulos_cinta,
	sub_numero_cinta,
	sub_idioma_id
	from tbl_subtitulos_cinta

END

GO
/****** Object:  StoredProcedure [dbo].[sp_select_all_tbl_usuario]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_all_tbl_usuario]
AS
BEGIN

	select 
	user_id_usuario,
   user_nombre,
   user_correo,
   user_contraseña ,
   user_rol_id,
   user_foto
	from tbl_usuario

END

GO
/****** Object:  StoredProcedure [dbo].[sp_select_tbl_actor]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_tbl_actor]
	(
	@act_id_actor int
	)
AS
BEGIN

	select 
	act_id_actor,
	act_nombre,
	act_nombre_nacimiento,
    act_nacionalidad,
    act_biografia,
    act_año_inicio,
    act_fecha_nacimiento,
    act_ocupacion,
    act_imagen
	from  tbl_actor
	where act_id_actor = @act_id_actor

END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_tbl_carrito_compra]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_tbl_carrito_compra]
	(
	@carr_id_carrito int
	)
AS
BEGIN

	select 
	carr_id_carrito,
	carr_pelicula_id,
	carr_codigo_socio,
	carr_estado
	from tbl_carrito_compra
	where carr_id_carrito = @carr_id_carrito

END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_tbl_cinta]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_tbl_cinta] (@cin_numero_cinta varchar(13))
AS
BEGIN

	select cin_numero_cinta,cin_idioma,cin_pelicula_id,cin_estado from tbl_cinta where cin_numero_cinta = @cin_numero_cinta

END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_tbl_detalle_prestamo]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_tbl_detalle_prestamo] 
	(
	@det_pres_id_detalle_prestamo int
	)
AS
BEGIN

	select 
	det_pres_id_detalle_prestamo,
	det_pres_prestamo_id,
	det_pres_numero_cinta,
	det_pres_sub_total
	from tbl_detalle_prestamo
	where det_pres_id_detalle_prestamo = @det_pres_id_detalle_prestamo

END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_tbl_devolucion_cinta]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_tbl_devolucion_cinta] 
(
	@del_cin_id_devolucion_cinta int
)
AS
BEGIN

	select 
	del_cin_id_devolucion_cinta,
	del_cin_numero_cinta,
	del_cin_codigo_socio,
	del_cin_fecha_prestamo,
	del_cin_fecha_devolucion 
	from tbl_devolucion_cinta
	where del_cin_id_devolucion_cinta = @del_cin_id_devolucion_cinta

END

GO
/****** Object:  StoredProcedure [dbo].[sp_select_tbl_director]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_tbl_director]
	(
	@dir_id_director int
	)
AS
BEGIN
	
	select 
	dir_nombre,
    dir_nombre_nacimiento ,
    dir_nacionalidad,
	dir_biografia,
	dir_fecha_nacimiento,
	dir_imagen
	from  tbl_director
	where dir_id_director = @dir_id_director

END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_tbl_empresa]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_tbl_empresa] 
	(
	@emp_id_empresa int
	)
AS
BEGIN

	select 
	emp_id_empresa,
	emp_nombre,
	emp_telefono,
	emp_direccion,
	emp_correo,
	emp_logo 
	from tbl_empresa 
	where emp_id_empresa = @emp_id_empresa

END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_tbl_genero_pelicula]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_tbl_genero_pelicula]
	(
	@gen_id_genero int
	)
AS
BEGIN
	
	select 
	gen_id_genero,
	gen_nombre,
	gen_descripcion,
	gen_imagen
	from  tbl_genero_pelicula
	where gen_id_genero = @gen_id_genero

END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_tbl_idioma]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_tbl_idioma]
	(
	@idm_id_idioma int
	)
AS
BEGIN

	select 
	idm_id_idioma,
	idm_nombre
	from tbl_idioma
	where idm_id_idioma = @idm_id_idioma

END

GO
/****** Object:  StoredProcedure [dbo].[sp_select_tbl_lista_espera]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_tbl_lista_espera]
(
	@list_id_lista_espera int
)
AS
BEGIN

	select 
	list_id_lista_espera,
	list_codigo_socio,
	list_pelicula_id,
	list_fecha_solicitud
	from tbl_lista_espera
	where list_id_lista_espera = @list_id_lista_espera

END

GO
/****** Object:  StoredProcedure [dbo].[sp_select_tbl_llamada]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_tbl_llamada]
(
	@lla_id_llamada int
)
AS
BEGIN

	select 
	lla_id_llamada,
    lla_codigo_socio,
	lla_pelicula_id
	from tbl_llamada
	where lla_id_llamada = @lla_id_llamada

END

GO
/****** Object:  StoredProcedure [dbo].[sp_select_tbl_pelicula]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_tbl_pelicula] (@pel_id_pelicula varchar(8))
AS
BEGIN

	select pel_id_pelicula,pel_titulo,pel_sinopsis,pel_clasificacion,pel_duracion,pel_año_publicacion,pel_stock_cintas,pel_pais,pel_precio,pel_disponibilidad,pel_portada,pel_trailer from tbl_pelicula where pel_id_pelicula = @pel_id_pelicula

END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_tbl_pelicula_actor]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_tbl_pelicula_actor] 
(
@pel_act_id_pelicula_actor int
)
AS
BEGIN

	select 
	pel_act_id_pelicula_actor,
	pel_act_actor_id,
	pel_act_tipo_actor,
	pel_act_pelicula_id
	from tbl_pelicula_actor
	where pel_act_id_pelicula_actor = @pel_act_id_pelicula_actor

END

GO
/****** Object:  StoredProcedure [dbo].[sp_select_tbl_pelicula_director]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_tbl_pelicula_director] 
	(
	@pel_dir_id_pelicula_director int
	)
AS
BEGIN

	select 
	pel_dir_id_pelicula_director,
	pel_dir_pelicula_id,
	pel_dir_director_id
	from tbl_pelicula_director
	where pel_dir_id_pelicula_director = @pel_dir_id_pelicula_director

END

GO
/****** Object:  StoredProcedure [dbo].[sp_select_tbl_pelicula_genero]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_tbl_pelicula_genero] 
(
@pel_gen_id_pelicula_genero int
)
AS
BEGIN

	select 
	pel_gen_id_pelicula_genero,
	pel_gen_genero_id,
	pel_gen_pelicula_id
	from tbl_pelicula_genero
	where pel_gen_id_pelicula_genero = @pel_gen_id_pelicula_genero

END

GO
/****** Object:  StoredProcedure [dbo].[sp_select_tbl_pelicula_productora]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_tbl_pelicula_productora] 
	(
	@pel_prod_id_pelicula_productora int
	)
AS
BEGIN

	select 
	pel_prod_id_pelicula_productora,
	pel_prod_productora_id,
	pel_prod_pelicula_id
	from tbl_pelicula_productora
	where pel_prod_id_pelicula_productora = @pel_prod_id_pelicula_productora

END

GO
/****** Object:  StoredProcedure [dbo].[sp_select_tbl_prestamo]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_tbl_prestamo]
	(
	@pres_id_prestamo int
	)
AS
BEGIN	
	select 
	pres_id_prestamo,
    pres_fecha_prestamo,
    pres_fecha_devolucion,
    pres_codigo_socio,
    pres_precio_total
	from  tbl_prestamo
	where pres_id_prestamo = @pres_id_prestamo
END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_tbl_productora]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_tbl_productora] 
	(
	@prod_id_productora int
	)
AS
BEGIN

	select 
	prod_id_productora,
    prod_nombre,
    prod_año_fundacion,
    prod_descripcion,
    prod_sitio_web ,
    prod_logo 
	from  tbl_productora
	where prod_id_productora = @prod_id_productora

END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_tbl_registro_prestamos]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_tbl_registro_prestamos] 
(
	@reg_pres_id_registro_prestamos int
)
AS
BEGIN

	select 
	reg_pres_id_registro_prestamos,
	reg_pres_numero_cinta,
	reg_pres_codigo_socio,
	reg_pres_fecha_prestamo,
	reg_pres_fecha_devolucion
	from tbl_registro_prestamos
	where reg_pres_id_registro_prestamos = @reg_pres_id_registro_prestamos

END

GO
/****** Object:  StoredProcedure [dbo].[sp_select_tbl_rol]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_tbl_rol] 
	(
	@rol_id_rol int
	)
AS
BEGIN

	select 
	rol_id_rol,
	rol_nombre,
	rol_descripcion
	from tbl_rol
	where rol_id_rol = @rol_id_rol

END

GO
/****** Object:  StoredProcedure [dbo].[sp_select_tbl_socio]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_tbl_socio] (@soc_codigo_socio varchar(12))
AS
BEGIN

    select soc_codigo_socio,soc_cedula,soc_nombre,soc_apellido1,soc_apellido2,soc_correo,soc_telefono,soc_codigo_postal,soc_direccion_exacta,soc_genero,soc_fecha_nacimiento,soc_foto_perfil from tbl_socio where soc_codigo_socio = @soc_codigo_socio

END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_tbl_socio_actor]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_tbl_socio_actor]
(
	@soc_act_id_socio_actor int
)
AS
BEGIN

	select 
	soc_act_id_socio_actor,
	soc_act_codigo_socio,
    soc_act_actor_id 
	from tbl_socio_actor
	where  soc_act_id_socio_actor= @soc_act_id_socio_actor

END

GO
/****** Object:  StoredProcedure [dbo].[sp_select_tbl_socio_director]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_tbl_socio_director]
	(
	@soc_dir_id_socio_director int
	)
AS
BEGIN

	select 
    soc_dir_id_socio_director,
   soc_dir_codigo_socio,
   soc_dir_director_id
	from tbl_socio_director
	where soc_dir_id_socio_director = @soc_dir_id_socio_director

END

GO
/****** Object:  StoredProcedure [dbo].[sp_select_tbl_socio_genero]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_tbl_socio_genero]
	(
	@soc_gen_id_socio_genero int
	)
AS
BEGIN

	select 
   soc_gen_id_socio_genero,
	soc_gen_codigo_socio,
    soc_gen_genero_id 
	from tbl_socio_genero
	where  soc_gen_id_socio_genero = @soc_gen_id_socio_genero

END

GO
/****** Object:  StoredProcedure [dbo].[sp_select_tbl_subtitulos_cinta]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_tbl_subtitulos_cinta] 
(
	@sub_subtitulos_cinta int
)
AS
BEGIN

	select 
	sub_subtitulos_cinta,
	sub_numero_cinta,
	sub_idioma_id
	from tbl_subtitulos_cinta
	where sub_subtitulos_cinta = @sub_subtitulos_cinta

END

GO
/****** Object:  StoredProcedure [dbo].[sp_select_tbl_usuario]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_tbl_usuario]
	(
	@user_id_usuario int
	)
AS
BEGIN

	select 
	user_id_usuario,
   user_nombre,
   user_correo,
   user_contraseña ,
   user_rol_id,
   user_foto
	from tbl_usuario
	where user_id_usuario = @user_id_usuario

END

GO
/****** Object:  StoredProcedure [dbo].[sp_update_tbl_actor]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_update_tbl_actor]
	( 

	@act_id_actor int,
	@act_nombre varchar(35),
    @act_nombre_nacimiento varchar(40),
    @act_nacionalidad varchar(15),
    @act_biografia text,
    @act_año_inicio int,
    @act_fecha_nacimiento date,
    @act_ocupacion varchar(100),
    @act_imagen varchar(50)
	)
AS
BEGIN
    
	update tbl_actor set 
	act_nombre= @act_nombre ,
    act_nombre_nacimiento= @act_nombre_nacimiento ,
    act_nacionalidad= @act_nacionalidad ,
    act_biografia= @act_biografia ,
    act_año_inicio= @act_año_inicio,
    act_fecha_nacimiento= @act_fecha_nacimiento ,
    act_ocupacion= @act_ocupacion ,
    act_imagen= @act_imagen 
	where act_id_actor = @act_id_actor

END
GO
/****** Object:  StoredProcedure [dbo].[sp_update_tbl_carrito_compra]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_update_tbl_carrito_compra]
	( 
	@carr_id_carrito int,
	@carr_pelicula_id varchar(8),
	@carr_codigo_socio varchar(12)
	)
AS
BEGIN
    
	update tbl_carrito_compra set 
	carr_pelicula_id = @carr_pelicula_id,
	carr_codigo_socio = @carr_codigo_socio
	where carr_id_carrito = @carr_id_carrito

END
GO
/****** Object:  StoredProcedure [dbo].[sp_update_tbl_cinta]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_update_tbl_cinta] ( 
	@cin_numero_cinta varchar(13),
	@cin_idioma varchar(3),
	@cin_pelicula_id varchar(8)
	)
AS
BEGIN
    if((select cin_pelicula_id from tbl_cinta where cin_numero_cinta = '@cin_numero_cinta') = '@cin_pelicula_id')
	begin
		update tbl_cinta set
		cin_idioma = @cin_idioma
		where cin_numero_cinta = @cin_numero_cinta
	end
	else
	begin
		delete tbl_cinta where cin_numero_cinta = @cin_numero_cinta;
		exec sp_insert_tbl_cinta @cin_idioma,@cin_pelicula_id;
	end
END
GO
/****** Object:  StoredProcedure [dbo].[sp_update_tbl_detalle_prestamo]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_update_tbl_detalle_prestamo] 
	( 
	@det_pres_id_detalle_prestamo int,
	@det_pres_prestamo_id int,
	@det_pres_numero_cinta varchar(13)
	)
AS
BEGIN
    
	declare @det_pres_sub_total money
	set @det_pres_sub_total = (select pel_precio from tbl_pelicula where pel_id_pelicula = 
	(select cin_pelicula_id from tbl_cinta where cin_numero_cinta = @det_pres_numero_cinta))

	update tbl_detalle_prestamo set 
	det_pres_prestamo_id = @det_pres_prestamo_id,
	det_pres_numero_cinta = @det_pres_numero_cinta,
	det_pres_sub_total = @det_pres_sub_total
	where det_pres_id_detalle_prestamo = @det_pres_id_detalle_prestamo

END
GO
/****** Object:  StoredProcedure [dbo].[sp_update_tbl_devolucion_cinta]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_update_tbl_devolucion_cinta]
( 
	@del_cin_id_devolucion_cinta int,
  	@del_cin_numero_cinta varchar(13),
	@del_cin_codigo_socio varchar(12),
	@del_cin_fecha_prestamo datetime,
	@del_cin_fecha_devolucion datetime
)
AS
BEGIN
    
	update tbl_devolucion_cinta  set 
	del_cin_numero_cinta= @del_cin_numero_cinta,
	del_cin_codigo_socio = @del_cin_codigo_socio,
	del_cin_fecha_prestamo =@del_cin_fecha_prestamo,
	del_cin_fecha_devolucion =@del_cin_fecha_devolucion	
	where del_cin_id_devolucion_cinta = @del_cin_id_devolucion_cinta

END

GO
/****** Object:  StoredProcedure [dbo].[sp_update_tbl_director]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_update_tbl_director]
	( 
	@dir_id_director int,
	@dir_nombre varchar(30),
    @dir_nombre_nacimiento varchar(50),
    @dir_nacionalidad varchar(15),
    @dir_biografia text,
    @dir_fecha_nacimiento date,
    @dir_imagen varchar(50)
	)
AS
BEGIN
  
   update tbl_director set 
	dir_nombre= @dir_nombre ,
    dir_nombre_nacimiento= @dir_nombre_nacimiento ,
    dir_nacionalidad= @dir_nacionalidad,
	dir_biografia=@dir_biografia,
	dir_fecha_nacimiento=@dir_fecha_nacimiento,
	dir_imagen=@dir_imagen
	where dir_id_director = @dir_id_director

END
GO
/****** Object:  StoredProcedure [dbo].[sp_update_tbl_empresa]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_update_tbl_empresa] 
	( 
	@emp_id_empresa int,
	@emp_nombre varchar(15),
	@emp_telefono varchar(8),
	@emp_direccion text,
	@emp_correo varchar(50),
	@emp_logo varchar(50)
	)
AS
BEGIN
    
	update tbl_empresa set 
	emp_nombre = @emp_nombre,
	emp_telefono = @emp_telefono,
	emp_direccion = @emp_direccion,
	emp_correo = @emp_correo,
	emp_logo = @emp_logo
	where emp_id_empresa = @emp_id_empresa

END
GO
/****** Object:  StoredProcedure [dbo].[sp_update_tbl_genero_pelicula]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_update_tbl_genero_pelicula]
	( 
	@gen_id_genero int,
    @gen_nombre varchar(20),
    @gen_descripcion text,
    @gen_imagen varchar(50)
	)
AS
BEGIN
      
   update tbl_genero_pelicula set 
	gen_nombre= @gen_nombre ,
    gen_descripcion= @gen_descripcion ,
    gen_imagen= @gen_imagen
	where gen_id_genero = @gen_id_genero

END
GO
/****** Object:  StoredProcedure [dbo].[sp_update_tbl_idioma]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_update_tbl_idioma]
( 
    @idm_id_idioma int,
	@idm_nombre varchar (10)
)
AS
BEGIN
    
	update tbl_idioma  set 
	idm_nombre= @idm_nombre
	where idm_id_idioma = @idm_id_idioma

END

GO
/****** Object:  StoredProcedure [dbo].[sp_update_tbl_lista_espera]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_update_tbl_lista_espera]
( 
	@list_id_lista_espera int,
	@list_codigo_socio varchar(12),
	@list_pelicula_id varchar(8),
	@list_fecha_solicitud datetime
)
AS
BEGIN
    
	update tbl_lista_espera set 
	list_codigo_socio = @list_codigo_socio,
	list_pelicula_id= @list_pelicula_id,
	list_fecha_solicitud = @list_fecha_solicitud
    where list_id_lista_espera  = @list_id_lista_espera

END

GO
/****** Object:  StoredProcedure [dbo].[sp_update_tbl_llamada]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_update_tbl_llamada]
( 
	@lla_id_llamada int,
	@lla_codigo_socio varchar(12),
	@lla_pelicula_id varchar(8)
)
AS
BEGIN
    
	update tbl_llamada set 
	lla_codigo_socio= @lla_codigo_socio,
	lla_pelicula_id = @lla_pelicula_id	
	where lla_id_llamada = @lla_id_llamada

END

GO
/****** Object:  StoredProcedure [dbo].[sp_update_tbl_pelicula]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_update_tbl_pelicula] ( 
	@pel_id_pelicula varchar(8),
	@pel_titulo varchar(10),
	@pel_sinopsis text,
	@pel_clasificacion varchar(5),
	@pel_duracion time,
	@pel_año_publicacion int,
	@pel_pais varchar(20),
	@pel_precio money,
	@pel_portada varchar(50),
	@pel_trailer varchar(50)
	)
AS
BEGIN
    
	update tbl_pelicula set 
	pel_titulo =@pel_titulo,
	pel_sinopsis =@pel_sinopsis,
	pel_clasificacion =@pel_clasificacion,
	pel_duracion =@pel_duracion,
	pel_año_publicacion =@pel_año_publicacion,
	pel_pais =@pel_pais,
	pel_precio =@pel_precio,
	pel_portada =@pel_portada,
	pel_trailer =@pel_trailer
	where pel_id_pelicula = @pel_id_pelicula

END
GO
/****** Object:  StoredProcedure [dbo].[sp_update_tbl_pelicula_actor]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_update_tbl_pelicula_actor]
( 
    @pel_act_id_pelicula_actor int,
	@pel_act_actor_id int,
	@pel_act_tipo_actor varchar (10),
	@pel_act_pelicula_id varchar (8)	
)
AS
BEGIN
    
	update tbl_pelicula_actor  set 	
	pel_act_actor_id= @pel_act_actor_id,
	pel_act_tipo_actor = @pel_act_tipo_actor,
	pel_act_pelicula_id= @pel_act_pelicula_id	
	where pel_act_id_pelicula_actor = @pel_act_id_pelicula_actor

END

GO
/****** Object:  StoredProcedure [dbo].[sp_update_tbl_pelicula_director]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_update_tbl_pelicula_director]
( 
    @pel_dir_id_pelicula_director int,
	@pel_dir_pelicula_id varchar(8),
	@pel_dir_director_id int
)
AS
BEGIN
    
	update tbl_pelicula_director  set 	
	pel_dir_pelicula_id= @pel_dir_pelicula_id,
	pel_dir_director_id = @pel_dir_director_id	
	where pel_dir_id_pelicula_director = @pel_dir_id_pelicula_director

END

GO
/****** Object:  StoredProcedure [dbo].[sp_update_tbl_pelicula_genero]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_update_tbl_pelicula_genero]
( 
    @pel_gen_id_pelicula_genero int,
	@pel_gen_genero_id int,
	@pel_gen_pelicula_id varchar (8)	
)
AS
BEGIN
    
	update tbl_pelicula_genero  set 	
	pel_gen_genero_id= @pel_gen_genero_id,
	pel_gen_pelicula_id = @pel_gen_pelicula_id	
	where pel_gen_id_pelicula_genero = @pel_gen_id_pelicula_genero

END

GO
/****** Object:  StoredProcedure [dbo].[sp_update_tbl_pelicula_productora]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_update_tbl_pelicula_productora]
( 
    @pel_prod_id_pelicula_productora int,
	@pel_prod_productora_id int,
	@pel_prod_pelicula_id varchar (8)	
)
AS
BEGIN
    
	update tbl_pelicula_productora  set 	
	pel_prod_productora_id= @pel_prod_productora_id,
	pel_prod_pelicula_id = @pel_prod_pelicula_id	
	where pel_prod_id_pelicula_productora = @pel_prod_id_pelicula_productora

END

GO
/****** Object:  StoredProcedure [dbo].[sp_update_tbl_prestamo]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_update_tbl_prestamo]
	( 
	@pres_id_prestamo int,
	@pres_fecha_prestamo datetime,
    @pres_fecha_devolucion datetime,
    @pres_codigo_socio varchar(12),
    @pres_precio_total money
	)
AS
BEGIN  
   update tbl_prestamo set 
	pres_fecha_prestamo= @pres_fecha_prestamo ,
    pres_fecha_devolucion= @pres_fecha_devolucion,
	pres_codigo_socio=@pres_codigo_socio,
	pres_precio_total=@pres_precio_total
	where pres_id_prestamo = @pres_id_prestamo

END
GO
/****** Object:  StoredProcedure [dbo].[sp_update_tbl_productora]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_update_tbl_productora]
	( 
	@prod_id_productora int,
    @prod_nombre varchar(20),
    @prod_año_fundacion int,
    @prod_descripcion text,
    @prod_sitio_web varchar(20),
    @prod_logo varchar(50)
	)
AS
BEGIN
    
	update tbl_productora set 
    prod_nombre = @prod_nombre,
    prod_año_fundacion = @prod_año_fundacion,
    prod_descripcion = @prod_descripcion,
    prod_sitio_web = @prod_sitio_web,
    prod_logo=@prod_logo
	where prod_id_productora = @prod_id_productora

END
GO
/****** Object:  StoredProcedure [dbo].[sp_update_tbl_registro_prestamos]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_update_tbl_registro_prestamos]
( 
	@reg_pres_id_registro_prestamos int,
    @reg_pres_numero_cinta varchar(13),
	@reg_pres_codigo_socio varchar(12),
	@reg_pres_fecha_prestamo datetime,
	@reg_pres_fecha_devolucion datetime
)
AS
BEGIN
    
	update tbl_registro_prestamos set 
	reg_pres_numero_cinta= @reg_pres_numero_cinta,
	reg_pres_codigo_socio = @reg_pres_codigo_socio,
	reg_pres_fecha_prestamo = @reg_pres_fecha_prestamo,
	reg_pres_fecha_devolucion = @reg_pres_fecha_devolucion
	where reg_pres_id_registro_prestamos = @reg_pres_id_registro_prestamos

END

GO
/****** Object:  StoredProcedure [dbo].[sp_update_tbl_rol]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_update_tbl_rol]
( 
    @rol_id_rol int,
	 @rol_nombre varchar(20),
    @rol_descripcion varchar(100)
)
AS
BEGIN
    
	update tbl_rol  set 	
	rol_nombre= @rol_nombre,
	rol_descripcion = @rol_descripcion
	where rol_id_rol = @rol_id_rol

END

GO
/****** Object:  StoredProcedure [dbo].[sp_update_tbl_socio]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_update_tbl_socio] ( 
	@soc_codigo_socio varchar(12),
	@soc_cedula varchar(9),
	@soc_nombre varchar(35),
	@soc_apellido1 varchar(40),
	@soc_apellido2 varchar(40),
	@soc_correo varchar(50),
	@soc_telefono varchar(8),
	@soc_codigo_postal varchar(5),
	@soc_direccion_exacta varchar(100),
	@soc_genero varchar(10),
	@soc_fecha_nacimiento date,
	@soc_foto_perfil varchar(50)
	)
AS
BEGIN
    
	update tbl_socio set 
	soc_cedula = @soc_cedula,
	soc_nombre = @soc_nombre,
	soc_apellido1 = @soc_apellido1,
	soc_apellido2 = @soc_apellido2,
	soc_correo = @soc_correo,
	soc_telefono = @soc_telefono,
	soc_codigo_postal = @soc_codigo_postal,
	soc_direccion_exacta = @soc_direccion_exacta,
	soc_genero = @soc_genero,
	soc_fecha_nacimiento = @soc_fecha_nacimiento,
	soc_foto_perfil = @soc_foto_perfil
	where soc_codigo_socio = @soc_codigo_socio

END
GO
/****** Object:  StoredProcedure [dbo].[sp_update_tbl_socio_actor]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE
PROCEDURE [dbo].[sp_update_tbl_socio_actor]
( 
	@soc_act_id_socio_actor int,
	@soc_act_codigo_socio varchar(12),
	@soc_act_actor_id int 
)
AS
BEGIN
    
	update tbl_socio_actor  set 
	soc_act_codigo_socio= @soc_act_codigo_socio,
	soc_act_actor_id = @soc_act_actor_id	
	where soc_act_id_socio_actor= @soc_act_id_socio_actor

END

GO
/****** Object:  StoredProcedure [dbo].[sp_update_tbl_socio_director]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_update_tbl_socio_director]
	( 
   @soc_dir_id_socio_director int ,
   @soc_dir_codigo_socio varchar(12),
   @soc_dir_director_id int
	)
AS
BEGIN
    
	update tbl_socio_director  set 
	soc_dir_codigo_socio= @soc_dir_codigo_socio,
	soc_dir_director_id = @soc_dir_director_id
	where soc_dir_id_socio_director = @soc_dir_id_socio_director

END

GO
/****** Object:  StoredProcedure [dbo].[sp_update_tbl_socio_genero]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_update_tbl_socio_genero]
( 
@soc_gen_id_socio_genero int,
@soc_gen_codigo_socio varchar(12),
@soc_gen_genero_id int
)
AS
BEGIN
    
	update tbl_socio_genero  set 
	soc_gen_codigo_socio= @soc_gen_codigo_socio,
	soc_gen_genero_id = @soc_gen_genero_id
	where soc_gen_id_socio_genero = @soc_gen_id_socio_genero

END

GO
/****** Object:  StoredProcedure [dbo].[sp_update_tbl_subtitulos_cinta]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_update_tbl_subtitulos_cinta]
( 
    @sub_subtitulos_cinta int,
	@sub_numero_cinta varchar(13),
	@sub_idioma_id varchar (3)
)
AS
BEGIN
    
	update tbl_subtitulos_cinta  set 	
	sub_numero_cinta= @sub_numero_cinta,
	sub_idioma_id = @sub_idioma_id	
	where sub_subtitulos_cinta = @sub_subtitulos_cinta

END

GO
/****** Object:  StoredProcedure [dbo].[sp_update_tbl_usuario]    Script Date: 10/11/2022 15:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_update_tbl_usuario]
( 
@user_id_usuario int,
@user_nombre varchar(35),
@user_correo varchar(50),
@user_contraseña varchar(75),
@user_rol_id int,
@user_foto varchar(50)
)
AS
BEGIN
    
	update tbl_usuario  set 
	user_nombre = @user_nombre,
	user_correo= @user_correo,
	user_contraseña = @user_contraseña,
	user_rol_id = @user_rol_id,
	user_foto = @user_foto
	where user_id_usuario = @user_id_usuario

END

GO
USE [master]
GO
ALTER DATABASE [VIDEOTEC] SET  READ_WRITE 
GO
