

CREATE TABLE empresa(
id_empresa int PRIMARY KEY AUTO_INCREMENT,
nombre_empresa varchar(30),
NIT_empresa int(8),
Pais varchar(50),
poblacion varchar(30),
domicilio int(30),
telefono int(8),
correo varchar(50)
);



CREATE TABLE jornada(
id_jornada int PRIMARY KEY AUTO_INCREMENT,
tipo_jornadal varchar(30),
hora_jornada time
);

CREATE TABLE cuenta_ban(
id_cuenta int PRIMARY KEY AUTO_INCREMENT,
nombre_banco varchar(30),
numero_cuenta int(30)
);

CREATE TABLE salario(
id_salario int PRIMARY KEY AUTO_INCREMENT,
tipo_salario varchar(30),
cantidad_salario int
);

CREATE TABLE horario(
id_horario int PRIMARY KEY AUTO_INCREMENT,
hora_entrada date,
hora_salida date

);


CREATE TABLE departamento(
id_departamento int PRIMARY KEY AUTO_INCREMENT,
nombre_dep varchar(45) not null,
funcion_dep varchar(45) not null,
fecha_ingreso date not null
);

CREATE TABLE estado(
id_estado int PRIMARY KEY AUTO_INCREMENT,
estado_nom varchar(5) not null,
fecha_alta date not null,
fecha_baja date not null
);

CREATE TABLE puesto(
id_puesto int PRIMARY KEY AUTO_INCREMENT,
nombre_puesto varchar(35) not null
);

CREATE TABLE cargo(
id_cargo int PRIMARY KEY AUTO_INCREMENT,
nombre_cargo varchar(30),
requisitos varchar(50),
funciones varchar(30),
resolucion varchar(30),
nivel_utilizacion varchar(30),
escala varchar(30)
);

CREATE TABLE  contrato(
id_contrato int PRIMARY KEY AUTO_INCREMENT,
tipo_contrato varchar(30) not null,
descripcion_contrato varchar(100),
contrato_inicio date not null,
contrato_fin date not null
);

CREATE TABLE  nivel_escolaridad(
id_escolaridad int PRIMARY KEY AUTO_INCREMENT,
nombre_nivel varchar(30),
tipo_nivel varchar(30),
especialidad_nivel varchar(30),
Nombre_centro varchar(30)
);


CREATE TABLE empleado(
id_empleado int PRIMARY KEY AUTO_INCREMENT,
dpi VARCHAR(15) not null,
nombre varchar(30) not null,
nit int(8),
apellido varchar(30) not null,
edad int(2) not null,
nacionalidad varchar(45),
fecha_nacimiento date,
telefono int(8),
sexo varchar(9) not null,
estado_civil varchar(7),

id_jornada int,
id_cuenta int,
id_salario int,
id_horario int,
id_departamento int,
id_empresa int,
id_estado int,
id_puesto int,
id_cargo int,
id_contrato int,
id_escolaridad int,

FOREIGN KEY(id_empresa) REFERENCES empresa(id_empresa),
FOREIGN KEY(id_departamento) REFERENCES departamento(id_departamento),
FOREIGN key(id_puesto) REFERENCES puesto(id_puesto),
FOREIGN key(id_horario) REFERENCES horario(id_horario),
FOREIGN key(id_jornada) REFERENCES jornada(id_jornada),
FOREIGN KEY(id_estado) REFERENCES estado(id_estado),
FOREIGN KEY(id_cargo) REFERENCES cargo(id_cargo),
FOREIGN KEY(id_contrato) REFERENCES contrato(id_contrato),
FOREIGN KEY(id_escolaridad) REFERENCES nivel_escolaridad(id_escolaridad),
FOREIGN KEY(id_cuenta) REFERENCES cuenta_ban(id_cuenta),
FOREIGN KEY(id_salario) REFERENCES salario(id_salario)
);


CREATE TABLE usuario(
id_usuario int PRIMARY KEY AUTO_INCREMENT,
usser varchar(30),
pass varchar(50),
rol_usuario varchar(50),
id_empleado int,
FOREIGN KEY(id_empleado) REFERENCES empleado(id_empleado)
);



CREATE TABLE nomina(
id_nomina int PRIMARY KEY AUTO_INCREMENT,
ejercicio_fiscal varchar(30),
mes date,
numeroOrden int,
id_empleado int,
FOREIGN KEY(id_empleado) REFERENCES empleado(id_empleado)
);

CREATE TABLE Asignaciones(
  id_asignaciones int PRIMARY KEY AUTO_INCREMENT,
  cantidad_asig int,
  concepto varchar(30),
  id_nomina int,
  FOREIGN KEY(id_nomina) REFERENCES nomina(id_nomina)
);

CREATE TABLE deducciones(
  id_deducciones int PRIMARY KEY AUTO_INCREMENT,
  cantidad_dedu int,
  base int,
  porcentaje int,
  id_nomina int,
  FOREIGN KEY(id_nomina) REFERENCES nomina(id_nomina)
);

CREATE TABLE vacaciones(
id_vacaciones int PRIMARY KEY AUTO_INCREMENT,
va_inicio date not null,
va_fin date not null,
dias_usados int(2) not null,
id_empleado int,
FOREIGN KEY(id_empleado) REFERENCES empleado(id_empleado)
);


CREATE TABLE  capacitacion(
id_capacitacion int PRIMARY KEY AUTO_INCREMENT,
titulo_capa varchar(30),
tipo_capa varchar(30),
capa_inicio date,
capa_fin date,
centro_capa varchar(30),
facultadad varchar(30),
tomo varchar(30),
folio varchar(30),
id_empleado int,
FOREIGN KEY(id_empleado) REFERENCES empleado(id_empleado)
);



CREATE TABLE trabajo_extra(
id_Extra int PRIMARY KEY AUTO_INCREMENT,
nombre_trabajo varchar(45) not null,
extra_inicio date not null,
extra_fin date not null,
id_empleado int,
FOREIGN KEY(id_empleado) REFERENCES empleado(id_empleado)
);

CREATE TABLE Ausencia(
id_ausencia int PRIMARY KEY AUTO_INCREMENT,
tipo_ausencia varchar(30),
ausencia_inicio date not null,
ausencia_fin date not null,
id_empleado int,
FOREIGN KEY(id_empleado) REFERENCES empleado(id_empleado)
);
