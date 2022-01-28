create database Noty
create schema ope

create table ope.NotiCatUsuarios
(ClaUsuario int identity(1,1),
 ClaveUsuario varchar(100),
 Password varchar(200),
 Nombre varchar(100),
 Correo varchar(100),
 Activo int,
 FechaUltimaMod datetime,
 FechaIns datetime,
 ClaUsuarioMod int,
 ClaUsuarioIns int,
 NombrePCMod varchar(100),
 constraint pk_Usuarios primary key clustered(
  ClaUsuario
 ))

-- drop table NotiCatUsuarios
create table ope.NotiTraTareas
(ClaTarea int identity(1,1),
 ClaUsuario int,
 ClaClasificacion int,
 SeRepite int,
 CadaCuandoSeRepite int,
 CadaCuandoSeRepiteUnidad varchar(100),
 NombreTarea varchar(100),
 Descripcion varchar(1000),
 Activo int,
 FechaUltimaMod datetime,
 FechaIns datetime,
 ClaUsuarioMod int,
 ClaUsuarioIns int,
 NombrePCMod varchar(100),
 constraint pk_Tareas primary key clustered(
 ClaTarea, ClaUsuario, ClaClasificacion
 ))

 alter table ope.NotiTraTareas
 add FechaIni datetime

 --drop table ope.NotiCatClasificaciones

 create table ope.NotiCatClasificaciones
 (ClaClasificacion int identity(1,1) primary key,
 NombreClasificacion varchar(100),
 Activo int,
 FechaUltimaMod datetime,
 FechaIns datetime,
 ClaUsuarioMod int,
 ClaUsuarioIns int,
 NombrePCMod varchar(100))
 

 ------------------- DML
 --- insert
 insert into ope.NotiCatUsuarios
 (ClaveUsuario, Password, Nombre, Correo)
 values('Jorge', '123456', 'Jorge Vargas', 'jorgevargas@clase.com')

 insert into ope.NotiCatUsuarios
 (ClaveUsuario, Password, Nombre, Correo)
 select 'Dario', '123456', 'Dario Perez', 'darioperez@clase.com' union all
 select 'Jorge', '123456', 'Jorge Vargas', 'jorgevargas@clase.com' union all
 select 'Sergio', '123456', 'Sergio Tello', 'sergiotello@clase.com' union all
 select 'Edwin', '123456', 'Edwin Gaytan', 'edwingaytan@clase.com' union all
 select 'Joel', '123456', 'Joel Ortiz', 'joelortiz@clase.com'

 insert into ope.NotiCatClasificaciones
 (NombreClasificacion)
 select 'Trabajo' union all
 select 'Pagos' union all
 select 'Ejercicio'
 
 select * from  ope.NotiCatClasificaciones

 insert into ope.NotiTraTareas
 (ClaUsuario, ClaClasificacion, NombreTarea, Descripcion, SeRepite, CadaCuandoSeRepite, CadaCuandoSeRepiteUnidad, FechaIni)
 select 1, 1, 'Junta Analisis de Proyecto', 'Junta con lideres de proyecto para dar el kickoff', 0, null, null, '2021-01-24 09:00:00.000'

  insert into ope.NotiTraTareas
 (ClaUsuario, ClaClasificacion, NombreTarea, Descripcion, SeRepite, CadaCuandoSeRepite, CadaCuandoSeRepiteUnidad, FechaIni)
 select 1, 2, 'Pago CFE', 'Recordatorio de Pago Enero', 1, 1, 'Mes', '2021-01-01 13:00:00.000'

  insert into ope.NotiTraTareas
 (ClaUsuario, ClaClasificacion, NombreTarea, Descripcion, SeRepite, CadaCuandoSeRepite, CadaCuandoSeRepiteUnidad, FechaIni)
 select 1, 3, 'Salir a correr', 'Salir a correr 10 km', 1, 2, 'Dia', '2021-01-10 19:30:00.000'


  --- delete 
 delete from ope.NotiCatUsuarios where ClaUsuario = 2
 truncate table ope.NotiCatUsuarios
 --- update
 update ope.NotiCatUsuarios
 set Activo = 1,
  FechaIns = getdate(),
  ClaUsuarioIns = host_id(),
  NombrePCMod = host_name()
 where ClaUsuario = 1

 update ope.NotiCatUsuarios
 set Activo = 1,
  FechaUltimaMod = getdate(),
  ClaUsuarioMod = host_id(),
  NombrePCMod = host_name()
 where ClaUsuario in (4)
 
 --select

 select * from ope.NotiCatUsuarios
 select Nombre, Correo from ope.NotiCatUsuarios
 select Nombre, Correo from ope.NotiCatUsuarios where ClaUsuario = 2
 select * from ope.NotiCatUsuarios where ClaUsuario in (2, 4)
 select * from ope.NotiCatUsuarios where Activo = 1
 select ncu.* from ope.NotiCatUsuarios ncu where Activo = 1

 select * from ope.NotiCatUsuarios 
 where Activo = 1 and Nombre like '%Jor%'

 select *
 from ope.NotiCatUsuarios ncu,
 ope.NotiTraTareas ntt
 where ncu.Activo = 1

 -- inner join
  select *
 from ope.NotiCatUsuarios ncu
 inner join ope.NotiTraTareas ntt
 on ncu.ClaUsuario = ntt.ClaUsuario
 where ncu.Activo = 1

 select ncu.Nombre, ncu.Correo,
	ntt.NombreTarea, ntt.Descripcion
 from ope.NotiCatUsuarios ncu
 inner join ope.NotiTraTareas ntt
 on ncu.ClaUsuario = ntt.ClaUsuario
 where ncu.Activo = 1

 select ClaUsuario
 from ope.NotiCatUsuarios ncu
 inner join ope.NotiTraTareas ntt
 on ncu.ClaUsuario = ntt.ClaUsuario
 where ncu.Activo = 1

 select *
 from ope.NotiCatUsuarios ncu
 left join ope.NotiTraTareas ntt
 on ncu.ClaUsuario = ntt.ClaUsuario
 where ncu.Activo = 1

 select *
 from ope.NotiCatUsuarios ncu
 right join ope.NotiTraTareas ntt
 on ncu.ClaUsuario = ntt.ClaUsuario
 where ncu.Activo = 1


 select *
 from ope.NotiCatUsuarios ncu
 inner join ope.NotiTraTareas ntt
 on ncu.ClaUsuario = ntt.ClaUsuario
 inner join ope.NotiCatClasificaciones ncc
 on ncc.ClaClasificacion = ntt.ClaClasificacion
 where ncu.Activo = 1

 ------------------------------------------------------ Stored Procedures
 exec ope.LoginSel 'Dario', '123457'
 create procedure ope.LoginSel
(@ClaveUsuario varchar(100), @Password varchar(100))
 as
 begin
	if exists(select 1 from ope.NotiCatUsuarios where ClaveUsuario = @ClaveUsuario and Password = @Password)
	begin
		select 'Entrar al Sistema' as Mensaje
	end
	else
	begin
		select 'No Entrar al Sistema'  as Mensaje
	end
 end

 alter procedure ope.UsuariosIns
 (@ClaveUsuario varchar(100), @Password varchar(100), @Nombre varchar(100), @Correo varchar(100))
 as
begin
	if exists(select 1 from ope.NotiCatUsuarios where ClaveUsuario = @ClaveUsuario)
		begin
			update ope.NotiCatUsuarios
			set Password = @Password,
			    Nombre = @Nombre,
				Correo = @Correo,
				FechaUltimaMod = getdate(),
				NombrePCMod = host_name()
			where ClaveUsuario = @ClaveUsuario

			select 'Fue actualizado correctamente' as Mensaje
		end
	else
		begin
			 insert into ope.NotiCatUsuarios
			(ClaveUsuario, Password, Nombre, Correo)
			select @ClaveUsuario, @Password, @Nombre, @Correo

			select 'Fue insertado correctamente' as Mensaje
		end
end

exec ope.UsuariosIns 'Jorge','123456', 'Jorge Vargas', 'jvargas@clase.com'

 select * from ope.NotiCatUsuarios

 ---- Condicional IF
	declare @Suma int, @Numero1 int, @Numero2 int
	/*set @Numero1 = 10
	set @Numero2 = 20*/
	select @Numero1 = 10, @Numero2 = 12

	select @Suma = @Numero1 + @Numero2

	if @Suma >= 25
	begin
		select 'Bienvenido al sistema' as Mensaje
	end
	else
	begin
		select 'Intenta Nuevamente' as Mensaje
	end

	select @Suma
	print @Suma

---- Ciclo While
    declare @Suma int, @Numero1 int, @Numero2 int, @Ciclo int

	/*set @Numero1 = 10
	set @Numero2 = 20*/
	select @Numero1 = 10, @Numero2 = 2, @Ciclo = 0

	select @Suma = @Numero1 + @Numero2

	while @Ciclo < @Suma
	begin
		select @Ciclo as NumeroDeCiclo
		set @Ciclo = @Ciclo + 1
	end

	select @Suma
	print @Suma