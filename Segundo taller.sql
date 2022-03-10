use tallerdos;

create table tallerdos.Estado_Compra(
Id	 int not null,
Estado varchar(50),
primary key(Id)
);

create table tallerdos.Tipo_Envio(
Id	 int not null,
Nombre_Tipo_Envio varchar(50),
primary key(Id)
);

create table tallerdos.Datos_TC(
Numero_tarjeta	 int not null,
Fecha_Expiracion_Año date,
Fecha_Expiracion_Dia date,
Codigo_Seguridad varchar(50),
primary key(Numero_tarjeta)
);

create table tallerdos.Tipo_de_Pago(
Id	 int not null,
Metodo_pago varchar(50),
Tarjeta	 int not null,
primary key(Id),
foreign key(Tarjeta) references tallerdos.Datos_TC(Numero_tarjeta)
);

create table tallerdos.Tipo_Usuario(
Id	 int not null,
Roll_Usuario varchar(50),
primary key(Id)
);

create table tallerdos.Tipo_Documento(
Id	 int not null,
Nombre_Tipo_Documento varchar(50),
primary key(Id)
);

create table tallerdos.Usuario(
Id	 int not null,
Nombre varchar(50),
Telefono int,
CorreoElectronico varchar(50),
Contraseña varchar(50),
Direccion  varchar(50),
Ciudad  varchar(50),
Id_Tipo_Usuario int not null,
Id_Tipo_Documento int not null,
primary key(Id),
foreign key(Id_Tipo_Usuario) references tallerdos.Tipo_Usuario(Id),
foreign key(Id_Tipo_Documento) references tallerdos.Tipo_Documento(Id)
);

create table tallerdos.Estado_Producto(
Id	 int not null,
Estado varchar(50),
primary key(Id)
);

create table tallerdos.Estado_Variante(
Id	 int not null,
Color varchar(50),
Talla varchar(50),
primary key(Id)
);

create table tallerdos.Producto(
Id	 int not null,
Nombre varchar(50),
Marca varchar(50),
Categoria varchar(50),
Foto varchar(50),
Precio float,
Caracteristica varchar(50),
Descripcion varchar(50),
Cantidad int(50),
Id_Variante_Producto int not null,
Id_Estado_Producto int not null,
primary key(Id),
foreign key(Id_Variante_Producto) references tallerdos.Estado_Variante(Id),
foreign key(Id_Estado_Producto) references tallerdos.Estado_Producto(Id)
);

create table tallerdos.Compra(
Id	 int not null,
Direccion_Envio varchar(50),
Id_Tipo_Pago int not null,
Id_Tipo_Envio int not null,
Id_Producto int not null,
Id_Estado_Compra int not null,
Id_Usuario int not null,
primary key(Id),
foreign key(Id_Tipo_Pago) references tallerdos.Tipo_de_Pago(Id),
foreign key(Id_Tipo_Envio) references tallerdos.Tipo_Envio(Id),
foreign key(Id_Producto) references tallerdos.producto(Id),
foreign key(Id_Estado_Compra) references tallerdos.Estado_Compra(Id),
foreign key(Id_Usuario) references tallerdos.usuario(Id)
);

##drop table taller1.compra
create table tallerdos.Venta(
Id	 int not null,
Producto varchar(50),
Fecha_Venta date,
Id_compra int not null,
primary key(Id),
foreign key(Id_compra) references tallerdos.Compra(Id)
);


create table tallerdos.Proveedor_Venta(
Id	 int not null,
Id_Usuario int not null,
Id_Venta int not null,
primary key(Id),
foreign key(Id_Usuario) references tallerdos.Usuario(Id),
foreign key(Id_Venta) references tallerdos.Venta(Id)
);

insert into tipo_usuario values(1,'Administrador');
insert into tipo_usuario values(2,'Proveedor');
insert into tipo_usuario values(3,'Comprador');


insert into tipo_envio values(10,'Expres');
insert into tipo_envio values(20,'Estandar');

insert into tipo_documento values(11,'NIT');
insert into tipo_documento values(21,'CEDULA');
insert into tipo_documento values(31,'CEDULA DE EXTRANJERIA');

insert into datos_tc values(1238647,'2021-01-16','2023-01-16',123);
insert into datos_tc values(346553,'2021-01-17','2023-01-16',1234);
insert into datos_tc values(535466,'2021-01-18','2023-01-16',12345);

insert into tipo_de_pago values(112,'TARJETA DE CREDITO',1238647);
insert into tipo_de_pago values(22,'TRANSFERENCIA  BANCARIA',346553);
insert into tipo_de_pago values(32,'CONTRAENTREGA',535466);


insert into estado_compra  values(13,'EN PREPARACION');
insert into estado_compra  values(23,'ENVIADO');
insert into estado_compra  values(33,'RECIBIDO');
insert into estado_compra  values(43,'CANCELADO');

insert into estado_producto  values(14,'DISPONIBLE');
insert into estado_producto  values(24,'NO DISPONIBLE');

insert into estado_variante  values(15,'ROJO','S');
insert into estado_variante  values(25,'VERDE','M');
insert into estado_variante  values(35,'AZUL','L');
insert into estado_variante  values(65,'ROSADO','XL');
insert into estado_variante  values(55,'AMARILLO','XXL');


insert into producto values(111,'Iphone 13','Apple','Tecnologia','ssdd',50000,'ddre','ewteh',100,15,14);
insert into producto values(222,'Escoba multiusos','SAS','Aseo','xxxsd',320000,'rfhtrj','mhhf',200,25,14);
insert into producto values(333,'Borrador','FABER CASTEL','Papeleria','rrrrr',70000,'grwg','yjrgd',300,35,24);


insert into usuario values(11112,'Diego Mogollón',319545,'dookeep77@gmail.com','1929','carrera 10','Bogota',1,11);
insert into usuario values(22223,'Luis Ospina',56454,'lospina@gmail.com','153629','calle 68','Cali',2,21);
insert into usuario values(33334,'Helman Fernandez',65654,'helman@gmail.com','195729','calle 72','Medellin',3,31);

select * from tallerdos.compra
select * from tallerdos.datos_tc
select * from tallerdos.estado_compra
select * from tallerdos.estado_producto
select * from tallerdos.estado_variante
select * from tallerdos.producto
select * from tallerdos.proveedor_venta
select * from tallerdos.tipo_de_pago
select * from tallerdos.tipo_documento
select * from tallerdos.tipo_envio
select * from tallerdos.tipo_usuario
select * from tallerdos.usuario
select * from tallerdos.venta
# Falta la tabla compra y la tabla proveedor venta y la tabla venta

insert into compra values(0001,'Calle 128 c',22,10,111,13,22223);
insert into compra values(0002,'Carrera 53 bis',32,20,222,23,11112);


insert into venta values(001,'Iphone 13','08-03-22',0001);
insert into venta values(002,'Escoba multiusos','06-03-22',0002);

insert into proveedor_venta values(9991,22223,001);
insert into proveedor_venta values(9992,22223,002);


create table tallerdos.product_audit(
Id	 int not null,
Nombre varchar(50),
Marca varchar(50),
Categoria varchar(50),
Foto varchar(50),
Precio float,
Caracteristica varchar(50),
Descripcion varchar(50),
Cantidad int(50),
Id_Variante_Producto int not null,
Id_Estado_Producto int not null,
primary key(Id),
foreign key(Id_Variante_Producto) references tallerdos.Estado_Variante(Id),
foreign key(Id_Estado_Producto) references tallerdos.Estado_Producto(Id)
);



	create table tallerdos.variant_audit(
	Id	 int not null,
	Color varchar(50),
	Talla varchar(50),
	primary key(Id)
	);
    
    
    # SEGUNDO TALLER


## TRIGGER PARA INSERTAR
DELIMITER //
CREATE TRIGGER producto_insertar after insert  on producto
for each row  begin
    insert into  product_audit(Id,Nombre,Marca,Categoria,Foto,Precio,Caracteristica,Descripcion,Cantidad,Id_Variante_Producto,Id_Estado_Producto)
    value(new.Id,new.Nombre,new.Marca,new.Categoria,new.Foto,new.Precio,new.Caracteristica,new.Descripcion,new.Cantidad,new.Id_Variante_Producto,new.Id_Estado_Producto);
end//
delimiter ;
insert into producto values(555,'Iphone 12','Apple','Tecnologia','ssdd',50000,'ddre','ewteh',100,15,14);
select * from product_audit

DELIMITER //
CREATE TRIGGER producto_modificar after update  on producto
for each row  begin
    insert into  product_audit(Id,Nombre,Marca,Categoria,Foto,Precio,Caracteristica,Descripcion,Cantidad,Id_Variante_Producto,Id_Estado_Producto)
    value(new.Id,new.Nombre,new.Marca,new.Categoria,new.Foto,new.Precio,new.Caracteristica,new.Descripcion,new.Cantidad,new.Id_Variante_Producto,new.Id_Estado_Producto);
end//
delimiter ;
update producto set Nombre = 'iphone pro max' where id = 111
select * from product_audit
# trigger que se ejecuta cuando se elimina algo
DELIMITER //
CREATE TRIGGER producto_eliminar after delete  on producto
for each row  begin
    insert into  product_audit(Id,Nombre,Marca,Categoria,Foto,Precio,Caracteristica,Descripcion,Cantidad,Id_Variante_Producto,Id_Estado_Producto)
    value(old.Id,old.Nombre,old.Marca,old.Categoria,old.Foto,old.Precio,old.Caracteristica,old.Descripcion,old.Cantidad,old.Id_Variante_Producto,old.Id_Estado_Producto);
end//
delimiter ;

# Ahora se hara para la tabla variant_audit
DELIMITER //
CREATE TRIGGER producto_insertar_variable after insert  on estado_variante
for each row  begin
    insert into  variant_audit(Id,Color,Talla)
    value(new.Id,new.Color,new.Talla);
end//
delimiter ;
SELECT * FROM variant_audit

DELIMITER //
CREATE TRIGGER producto_modificar_variable after update  on estado_variante
for each row  begin
    insert into  variant_audit(Id,Color,Talla)
    value(new.Id,new.Color,new.Talla);
end//
delimiter ;
SELECT * FROM variant_audit

DELIMITER //
CREATE TRIGGER producto_eliminar_variable after delete  on estado_variante
for each row  begin
    insert into  variant_audit(Id,Color,Talla)
    value(old.Id,old.Color,old.Talla);
end//
delimiter ;


	create table tallerdos.carrito_compra(
	Id	 int not null,
	Id_compra int not null,
	Id_usuario int not null,
    foreign key(Id_compra) references tallerdos.compra(Id),
    foreign key(Id_usuario) references tallerdos.usuario(Id),
	primary key(Id)
	);
    
    
# 2 punto 
delimiter $$
create function Unica_orden(Id int) returns int
begin
#declare  Id int;
IF new.Id = Old.Id  then
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'LA ORDEN YA EXISTE';
END IF;
#return new;
# fin de accion 
end //
delimiter ; 

DELIMITER //
CREATE TRIGGER before_insert_orden 
before  insert  on carrito_compra
for each row  begin
 call  Unica_orden(Id);
end//
delimiter ;

# 3 punto

create table tallerdos.vendedor(
Id	 int not null,
Id_Usuario int not null,
Id_Venta int not null,
primary key(Id),
foreign key(Id_Usuario) references tallerdos.Usuario(Id),
foreign key(Id_Venta) references tallerdos.Venta(Id)
);

create table tallerdos.reputacion_vendedor(
	Id	 int not null,
	id_vendor int not null,
	id_compra int not null,
    comentarios varchar(200),
    Calificacion int not null,
    foreign key(id_vendor) references tallerdos.vendedor(Id),
    foreign key(id_compra) references tallerdos.compra(Id),
	primary key(Id)
	);
    
create table tallerdos.weekly_reputation(
	id_vendor int not null,
    reputacion varchar(200),
    foreign key(id_vendor) references tallerdos.vendedor(Id)
	);
    drop table weekly_reputation; 
    # PROCESAMIENTO ALMACENADO
delimiter  //
create procedure procedimiento()
begin
declare id_vendedor int;
declare Calificacion int;
declare reputacion varchar(100);
select id_vendor, sum(Calificacion) from reputacion_vendedor
group by id_vendor;

if Calificacion <= 5 then
 select reputacion = 'Baja';
 elseif Calificacion <= 10 then
 select reputacion = 'Baja-Media';
 elseif Calificacion <= 15 then 
 select reputacion =  'Media';
  elseif Calificacion <= 20 then
  select reputacion = 'Media - Alta';
  elseif Calificacion > 20 then
  select reputacion = 'Alta';
  end if;
insert into weekly_reputation (id_vendor,reputacion) values(id_vendedor,reputacion);
 end//
delimiter ;

drop procedure procedimiento;

#CREACION DEL EVENTO PARA LA EJECUCION DEL PROCEDIMIENTO ALMACENADO
SET GLOBAL event_scheduler = ON;

DELIMITER //

CREATE EVENT e_Actualiza_reputacion_vendedor
ON SCHEDULE EVERY 1 HOUR
STARTS '2022-03-13 00:00.00'
DO call procedimiento();
BEGIN
 IF (DAYOFMONTH(NOW()) BETWEEN 1 AND 7 AND
                 DAYNAME(NOW()) = 'Sunday' AND HOUR(NOW()) = 24) THEN
             END IF;
           END//

DELIMITER ;

call procedimiento();

select * from weekly_reputation;
