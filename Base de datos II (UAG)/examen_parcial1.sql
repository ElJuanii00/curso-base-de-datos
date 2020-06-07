-- Se crea la base de datos
create database Examen_Parcial_1
go

-- Se crean las tabla tarifa
create table tarifa(
	idtarifa int not null primary key identity(1,1),
	clase varchar(20) not null,
	precio money not null,
	impuesto money not null
)
go

-- Se insertan informacion a las tablas
INSERT INTO tarifa (clase, precio, impuesto) VALUES ('Clase 1', 1500, 300)
INSERT INTO tarifa (clase, precio, impuesto) VALUES ('Clase 2', 750, 300)
INSERT INTO tarifa (clase, precio, impuesto) VALUES ('Clase 3', 350, 300)
INSERT INTO tarifa (clase, precio, impuesto) VALUES ('Clase 4', 1750, 300)
INSERT INTO tarifa (clase, precio, impuesto) VALUES ('Clase 5', 850, 300)
INSERT INTO tarifa (clase, precio, impuesto) VALUES ('Clase 6', 100, 300)
go

-- Se crea el procedimiento aumentar donde aumenta el precio un 15% si su promedio es menor que $2000
create procedure aumentar
as
begin 
	declare @promedio money = (select avg(precio) from tarifa)
	declare @id int = (select top(1) idtarifa from tarifa)
	
	while (@promedio < $2000)
	begin
		if(select precio from tarifa where idtarifa = @id) < $2000
			UPDATE tarifa
			set precio *= 1.15, @promedio = (select avg(precio) from tarifa)
			where idtarifa = @id
		else
			set @id += 1
	end
end
