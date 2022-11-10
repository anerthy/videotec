/* =================================================================
 
Proyecto Final de Administracion de base de datos

	Integrantes:
		-	Aaron Villegas Mora, 504400644
		-	Fiorella Bonilla González, 504390363
		-	Glenda Sofía Moraga Gutiérrez, 504350894
		-	Fauricio Andrés Mejías González, 504460444

==================================================================== */

-- ==================================
--	CREACION DE LA BASE DE DATOS --
-- ==================================
use master
go
create database VIDEOTEC
On Primary
(
	NAME='VIDEOTEC_Data',
	FILENAME='C:\SQLData\VIDEOTEC_Data.mdf',
	SIZE=4GB,
	MAXSIZE=32GB,
	FILEGROWTH=2GB
)
Log On
(
	NAME='VIDEOTEC_Log',
	FILENAME='C:\SQLLog\VIDEOTEC_Log.ldf',
	SIZE=2GB,
	MAXSIZE=8GB,
	FILEGROWTH=1GB
)
go

sp_helpdb VIDEOTECuse master
go
alter database VIDEOTEC
add Filegroup SISTEMA
go

use master
go
alter database VIDEOTEC
add Filegroup PRESTAMOS
go

use master
go
alter database VIDEOTEC
add Filegroup PELICULAS
go

use master
go
alter database VIDEOTEC
add Filegroup SOCIOS
go

use master
go
alter database VIDEOTEC
add Filegroup BITACORAS
go

use master
go
alter database VIDEOTEC
add file
(
	NAME=SISTEMA_Data,
	FILENAME='C:\SQLData\SISTEMA_Data.ndf',
	SIZE=500MB,
	MAXSIZE=2GB,
	FILEGROWTH=500MB
)
TO FILEGROUP SISTEMA
go

use master
go
alter database VIDEOTEC
add file
(
	NAME=PRESTAMOS_Data,
	FILENAME='C:\SQLData\PRESTAMOS_Data.ndf',
	SIZE=500MB,
	MAXSIZE=2GB,
	FILEGROWTH=500MB
)
TO FILEGROUP PRESTAMOS
go

use master
go
alter database VIDEOTEC
add file
(
	NAME=PELICULAS_Data,
	FILENAME='C:\SQLData\PELICULAS_Data.ndf',
	SIZE=500MB,
	MAXSIZE=2GB,
	FILEGROWTH=500MB
)
TO FILEGROUP PELICULAS
go

use master
go
alter database VIDEOTEC
add file
(
	NAME=SOCIOS_Data,
	FILENAME='C:\SQLData\SOCIOS_Data.ndf',
	SIZE=500MB,
	MAXSIZE=2GB,
	FILEGROWTH=500MB
)
TO FILEGROUP SOCIOS
go

use master
go
alter database VIDEOTEC
add file
(
	NAME=BITACORAS_Data,
	FILENAME='C:\SQLData\BITACORAS_Data.ndf',
	SIZE=500MB,
	MAXSIZE=2GB,
	FILEGROWTH=500MB
)
TO FILEGROUP BITACORAS
go

use VIDEOTEC
go
Sp_HelpFileGroup
go