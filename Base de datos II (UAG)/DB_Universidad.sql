CREATE DATABASE DB_Universidad
USE DB_Universidad

CREATE TABLE academic (
  PK_Anoemplead char(8)   NOT NULL,
  Anombre varchar(42)   NOT NULL,
  Adomicilio varchar(40)   NOT NULL,
  Afecalta date NOT NULL,
  Anumayuda integer NOT NULL,
  Asueldo decimal(5,2) NOT NULL,
  FK_Anocarrera char(8) NOT NULL,
  PRIMARY KEY (PK_Anoemplead)
); 

CREATE TABLE carrera (
  PK_Cnocarrera char(8)  NOT NULL,
  Cnombre varchar(15)  NOT NULL,
  Cedificio varchar(6)  NOT NULL,
  FK_Ccoord char(8)  NOT NULL,
  PRIMARY KEY (PK_Cnocarrera)
);

CREATE TABLE estudian (
  PK_Enocuenta char(8)  NOT NULL,
  Enombre varchar(40)  NOT NULL,
  Edomicilio varchar(40)  NOT NULL,
  Etelefono char(10)  DEFAULT NULL,
  Efecnacim date NOT NULL,
  FK_Enocarrera char(8)  NOT NULL,
  PRIMARY KEY (PK_Enocuenta)
);

CREATE TABLE grupo (
  PK_Gnogrupo char(8)  NOT NULL,
  FK_Gnomateria char(8)  NOT NULL,
  FK_Gnomaestro char(8)  DEFAULT NULL,
  Gdias varchar(6)  NOT NULL,
  Ghora varchar(15)  NOT NULL,
  Gsalon varchar(6)  NOT NULL,
  PRIMARY KEY (PK_Gnogrupo)
) ;

CREATE TABLE inscrip (
  FK_Inogrupo char(8)  DEFAULT NULL,
  FK_Inocuenta char(8)  NOT NULL,
  Ifecalta date NOT NULL,
  Ihoraalta char(6)  NOT NULL,
  FK_Inocarrera char(8)  NOT NULL
) ;

CREATE TABLE materia (
  PK_Mnomateria char(8)  NOT NULL,
  Mnombre varchar(42)  NOT NULL,
  Mcred smallint DEFAULT NULL,
  Mcostolab decimal(5,2) DEFAULT NULL,
  FK_Mnocarrera char(8)  NOT NULL,
  PRIMARY KEY (PK_Mnomateria)
) ;

--
-- Volcado de datos para la tabla 'academic'
--

INSERT INTO academic (PK_Anoemplead, Anombre, Adomicilio, Afecalta, Anumayuda, Asueldo, FK_Anocarrera) VALUES
('72654545', 'Juan Mendez', 'Aragon', '1985-02-01', 2, '999.99', '32'),
('75165232', 'Alberto Alvarez', 'Ecatepec', '1991-02-01', 8, '999.99', '40'),
('75212122', 'Carlos Cuenca', 'Aragon', '1982-01-01', 5, '999.99', '38'),
('75521245', 'Armando Cruz', 'Cd. Neza', '1983-11-01', 2, '999.99', '38'),
('75656566', 'Pedro Benitez', 'Cd. Neza', '1983-02-02', 2, '999.99', '32');

-- --------------------------------------------------------

--
-- Volcado de datos para la tabla 'carrera'
--

INSERT INTO carrera (PK_Cnocarrera, Cnombre, Cedificio, FK_Ccoord) VALUES
('32', 'computacion', 'A202', '75656566'),
('38', 'Electronica', 'A501', '75521245'),
('40', 'Mecanica', 'A501', '75165232');

-- --------------------------------------------------------

--
-- Volcado de datos para la tabla 'estudian'
--

INSERT INTO estudian (PK_Enocuenta, Enombre, Edomicilio, Etelefono, Efecnacim, FK_Enocarrera) VALUES
('82323233', 'Pedro Sauza', 'Ecatepec', NULL, '1967-12-11', '40'),
('84254321', 'Carolina Biset', 'ARAGON', '7715421', '1968-02-01', '32'),
('84254322', 'Alejandro Sauza', 'Cd. Neza', '8545454', '1969-05-05', '38'),
('84321212', 'Juan Bisset', 'Aragon', '7212212', '1953-02-05', '32');

-- --------------------------------------------------------

--
-- Volcado de datos para la tabla 'grupo'
--

INSERT INTO grupo (PK_Gnogrupo, FK_Gnomateria, FK_Gnomaestro, Gdias, Ghora, Gsalon) VALUES
('1157', '0076', '72654545', 'LUMIVI', '11:30 13:30', 'A211'),
('1158', '0134', NULL, 'MAJU', '07:00 8:30', 'A521'),
('1159', '0119', '75656566', 'SA', '07:00 12:00', 'A121'),
('2501', '0138', '75165232', 'LUMIVI', '17:00 18:30', 'A213'),
('2504', '0024', '75165232', 'MAJU', '17:00 19:00', 'A212'),
('2705', '0028', '75212122', 'MAJU', '17:00 19:00', 'A525'),
('2706', '0130', '75521245', 'LUMIVI', '17:00 18:30', 'A808');

-- --------------------------------------------------------

--
-- Volcado de datos para la tabla inscrip
--

INSERT INTO inscrip (FK_Inogrupo, FK_Inocuenta, Ifecalta, Ihoraalta, FK_Inocarrera) VALUES
('1158', '84254321', '1994-02-01', '1130', '32'),
('1158', '84254321', '1994-02-01', '1130', '32'),
('1157', '84321212', '1994-02-02', '1150', '32'),
('1158', '84321212', '1994-02-02', '1150', '32'),
('1157', '84254322', '1994-02-15', '1550', '38'),
('1158', '84254322', '1994-02-15', '1550', '38'),
('1157', '82323233', '1994-02-16', '1420', '40'),
('1158', '82323233', '1994-02-16', '1420', '40');

-- --------------------------------------------------------

--
-- Volcado de datos para la tabla materia
--

INSERT INTO materia (PK_Mnomateria, Mnombre, Mcred, Mcostolab, FK_Mnocarrera) VALUES
('0024', 'Circuitos Electricos', 10, '150.00', '40'),
('0028', 'Analisis Dinamico de Maquinas', 8, '100.00', '38'),
('0056', 'Estructuras Discretas', 7, '0.00', '32'),
('0076', 'Bases de Datos', 8, '100.00', '32'),
('0119', 'Estructuras de Datos', 8, '0.00', '32'),
('0130', 'Elementos de Maquinas', 8, '50.00', '38'),
('0134', 'Sistemas Digitales', 8, '50.00', '32'),
('0138', 'Dispositivos Electronicos', 10, '90.00', '40'),
('0559', 'Memorias y Perifericos', 10, '100.00', '32'),
('0561', 'Microcomputadoras', 10, '500.00', '32');


ALTER TABLE academic
ADD CONSTRAINT FK_Anocarrera
FOREIGN KEY (FK_Anocarrera) REFERENCES carrera(PK_Cnocarrera)

ALTER TABLE carrera
ADD CONSTRAINT FK_Ccoord
FOREIGN KEY (FK_Ccoord) REFERENCES academic(PK_Anoemplead)

ALTER TABLE estudian
ADD CONSTRAINT FK_Enocarrera
FOREIGN KEY (FK_Enocarrera) REFERENCES carrera(PK_Cnocarrera)

ALTER TABLE grupo 
ADD CONSTRAINT FK_Gnomateria 
FOREIGN KEY (FK_Gnomateria) REFERENCES materia(PK_Mnomateria)

ALTER TABLE grupo 
ADD CONSTRAINT FK_Gnomaestro 
FOREIGN KEY (FK_Gnomaestro) REFERENCES academic(PK_Anoemplead)

ALTER TABLE inscrip
ADD CONSTRAINT FK_Inogrupo
FOREIGN KEY (FK_Inogrupo) REFERENCES grupo(PK_Gnogrupo)

ALTER TABLE inscrip
ADD CONSTRAINT FK_Inocuenta
FOREIGN KEY (FK_Inocuenta) REFERENCES estudian(PK_Enocuenta)

ALTER TABLE inscrip
ADD CONSTRAINT FK_Inocarrera
FOREIGN KEY (FK_Inocarrera) REFERENCES carrera(PK_Cnocarrera)

ALTER TABLE materia 
ADD CONSTRAINT FK_Mnocarrera
FOREIGN KEY (FK_Mnocarrera) REFERENCES carrera(PK_Cnocarrera)

declare @calificacion int;
set @calificacion = 10

-- valor maximo de laboratorio

set @v_maximo = (select max(Mcostolab) from materia);
select @v_maximo;

-- valor maximo y minimo

set @v_mascaro = (select max(Mcostolab) from materia);
set @v_menoscaro = (select min(Mcostolab) from materia);
select @v_maximo, @v_menoscaro;

set @numero = 25;
set @nombre = "Juan Ponce";
select @numero, @nombre;

set @costo = 100;
select * from materia
where Mcostolab = @costo

set @silaba = "%dro%";
select * from estudian
where Enombre like @silaba

-- obtenga el promedio de costo de laboratorio y seleccione las materia que tenga un costo superior al promedio

set @promedio = (select avg(Mcostolab) from materia);
select *, @promedio as promedio from materia
where Mcostolab > @promedio;


begin try
	select 1/0
	select 1
end try
begin catch 
	select ERROR_NUMBER()
	select ERROR_SEVERITY()
	select ERROR_PROCEDURE()
	select ERROR_LINE()
	select ERROR_MESSAGE()
	select 'Esta division no se puede'
end catch

--- If Exist

use DB_Universidad

declare @nombre varchar(30)
BEGIN
	set @nombre = 'Juan Ponce'
	
	if exists (select Enombre from estudian where Enombre = @nombre)
		BEGIN 
			--- print 'Ya existe el nombre'
			RAISERROR('Ya existe el nombre',16,16)
		END
	ELSE
		BEGIN
			insert into estudian(PK_Enocuenta, Enombre, Edomicilio, Etelefono, Efecnacim, FK_Enocarrera)
			values ('92323232', @nombre, 'ECATEPEC', '3474767971', '2000-07-15','40')
		END
END

 
select * from estudian

DECLARE @num INT
SET @num = 0
DECLARE @check int
set @check = 0

BEGIN
	WHILE @num < 100
	BEGIN
		SET @num += 1
		print @num
		set @check = @num % 3
		if(@check = 0) print convert(varchar,@num) + ' Es multiplo de 3'
		if(@num = 50) break
	END
END


use DB_Universidad
go

declare @tabla table (id varchar(max), nom varchar(max))
insert into @tabla(id,nom) select PK_Enocuenta, Enombre from estudian
select * from @tabla

begin 

	declare @contar int
	set @contar = (select count(*) from @tabla)
	print 'Los datos son: ' + convert(varchar,@contar)
	
	declare @id varchar(max)
	declare @nom varchar(max)

	while @contar > 0
	begin
		set @id = (select top(1)id from @tabla order by id)
		set @nom = (select top(1)nom from @tabla order by nom)
		print 'Hola ' + @nom + '!'
		delete from @tabla where id=@id
		set @contar -= 1;
	end
end


use DB_Universidad
go
CREATE TABLE ejemplo (
	ID int not null primary key,
	Fecha SMALLDATETIME not null default getdate()
);

insert into ejemplo(ID) values(1)

alter table inscrip
add constraint CN_FechaAlta default getdate() for Ifecalta


CREATE DATABASE EJERCICIO_CLASE
GO
DROP table aAlmacen
CREATE TABLE aAlmacen(
	NIdArticulo int identity(1,1) primary key,
	sNombre varchar(300),
	sDescripcion varchar(2000),
	sCosto money check(sCosto > 0),
	nMaximo int check(nMaximo < 50),
	nMinimo int check(nMinimo > 3),
	nExistencia int check(nExistencia > 0 and nExistencia <= 50),
	bActivo bit default 1,
	bCancelado bit default 0,
	bTransferible bit default 0
)

if exists(select * from estudian where Enombre like @xyz)
begin
	raiserror('Ya existe un estudiante con ese nombre',16,1)
end
else
begin
	print 'No se encontro estudiante con el nombre'
	insert into estudian values ('92323232','Jorge','Ecatepec','3474767971','21/07/2000','40')
	print 'El Estudiante fue creado'
end

insert into aAlmacen(sNombre, sDescripcion, sCosto, nMaximo, nMinimo, nExistencia)
values('Articulo 01','Descripcion del articulo 01',10.00,10,25,15),
('Articulo 02', 'Descripcion del articulo 02', 11.00,11,26,16),
('Articulo 03', 'Descripcion del articulo 03', 12.00,12,27,17),
('Articulo 04', 'Descriocion del articulo 04', 13.00,13,28,18),
('Articulo 05', 'Descripcion del articulo 05', 14.00,14,29,19), 
('Articulo 06', 'Descripcion del articulo 06', 15.00,50,30,20)

if exists(select * from aAlmacen where nMaximo >= 50)
begin
	RAISERROR('Error, el numero es mayor o igual a 50',1,1)	
end

INSERT INTO aAlmacen (sNombre, sDescripcion, sCosto, nMaximo, nMinimo, nExistencia) VALUES ('Articulo 06', 'Descripcion del artículo 06', 0.00, 1, 25, 15)
-- La sentencia de sCosto lanza error porque el valor de sCosto es 0 mientras que esta restrinjido a mayor que 0

INSERT INTO aAlmacen (sNombre, sDescripcion, sCosto, nMaximo, nMinimo, nExistencia) VALUES ('Articulo 07', 'Descripcion del artículo 07', -15.00, 100, 26, 16)
-- La sentencia de sCosto lanza error porque el valor de sCosto es 0 mientras que esta restrinjido a mayor que 0
-- La sentencia de nMaximo lanza error porque el valor de nMaximo restrinje que sea menor que 50


INSERT INTO aAlmacen (sNombre, sDescripcion, sCosto, nMaximo, nMinimo, nExistencia) VALUES ('Articulo 08', 'Descripcion del artículo 08', 50.00, 60, 27, 17)
-- La sentencia de nMaximo lanza error porque el valor de nMaximo restrinje que sea menor que 50, el valor de nMaximo es 60

DROP table aAlmacen

-- create procedure asd
-- as
-- begin
-- select * from materia where FK_Mnocarrera = @carrera
-- end
-- execute getMateria @carrera = '40'

-- -- Crearemos un store procedure cuando tienes un nombre parcial, digamos solo recuerda un apellido
-- -- Biset o Bisset en parte de su nombre

-- create procedure getNombre @nombre nvarchar(3)
-- as
-- begin
-- select Enombre from estudian where Enombre like '%' +@nombre + '%'
-- end

-- drop procedure getNombre

-- exec getNombre @nombre = 'dro'


use Uni_Na
go

drop procedure proc_estudian

--Procedimineo 1--
create procedure proc_estudian @Id char(4)
AS
select Enombre from estudian E, inscrip I, grupo G where E.Enocarrera = I.Inocarrera AND I.Inogrupo = G.Gnogrupo AND G.Gnomateria = @Id
go

EXEC FindEst @Id='0076';


--Procedimineo 2--
create procedure NumEst @Id char(4)
AS
select COUNT(*) from estudian E, inscrip I, grupo G where E.Enocarrera = I.Inocarrera AND I.Inogrupo = G.Gnogrupo AND G.Gnomateria = @Id
go

EXEC NumEst @Id='0076';



--Procedimineo 3--
CREATE PROCEDURE Maes @Id char(4)
AS
select Anombre from 

EXEC Maes @Id='0076';




CREATE PROCEDURE registrarPrestamo
(
	@p_codigoLibro varchar(10),
	@p_matriculaAlumno varchar(8)
)
AS
BEGIN
	declare @fechaPrestamo date = GETDATE()
	declare @fechaRetorno date
	declare @diasASumar int	
	
	SELECT @diasASumar = diasPrestamo 
	from libros l 
	where l.codigo = @p_codigoLibro      
	
	set @fechaRetorno = DATEADD(DAY, @diasASumar, @fechaPrestamo)


	INSERT INTO prestamos
	(
		fechaPrestamo,
		fechaRetorno,
		matricula_fk,
		codigo_fk,
		estado
	)
	VALUES
	(
		@fechaPrestamo,
		@fechaRetorno,
		@p_matriculaAlumno,
		@p_codigoLibro,
		'P'	
	)
	
	UPDATE alumnos
	SET numPrestamos += 1
	WHERE matricula = @p_matriculaAlumno;
	
	UPDATE almacen
	SET enPrestamo -= 1
	WHERE codigo = @p_codigoLibro;
	
END


execute registrarPrestamo '021W4AR','03120ZK'

execute registrarPrestamo '02HL03Z','03120ZK'

execute registrarPrestamo '04CS0Z6','047607Z'


select * from prestamos

select * from alumnos

select * from almacen