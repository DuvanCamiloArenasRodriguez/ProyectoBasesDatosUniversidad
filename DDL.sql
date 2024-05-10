CREATE DATABASE universidad;

CREATE TABLE departamento(
    id_departamento INT(10) AUTO_INCREMENT NOT NULL,
    nombre_departamento VARCHAR(50) NOT NULL,
    CONSTRAINT PK_departamento PRIMARY KEY (id_departamento)
)ENGINE = InnoDB;

CREATE TABLE ciudad (
    id_ciudad VARCHAR(5) NOT NULL,
    nombre_ciudad VARCHAR(20) NOT NULL,
    CONSTRAINT PK_ciudad PRIMARY KEY (id_ciudad)
)ENGINE = InnoDB;

CREATE TABLE grado(
    id_grado INT(10) NOT NULL,
    nombre_grado VARCHAR(100) NOT NULL,
    CONSTRAINT PK_grado PRIMARY KEY (id_grado)
)ENGINE = InnoDB;

CREATE TABLE curso_escolar(
    id_curso_escolar INT AUTO_INCREMENT NOT NULL,
    anyo_inicio YEAR(4) NOT NULL,
    anyo_fin YEAR(4) NOT NULL,
    CONSTRAINT PK_curso_escolar PRIMARY KEY (id_curso_escolar)
)ENGINE = InnoDB;

CREATE TABLE tipo_asignatura(
    id_tipo_asignatura INT AUTO_INCREMENT NOT NULL,
    nombre_asignatura VARCHAR(30) NOT NULL,
    CONSTRAINT pk_tipo_asignatura PRIMARY  KEY (id_tipo_asignatura)
)ENGINE = InnoDB;

CREATE TABLE sexo(
    id_sexo INT AUTO_INCREMENT NOT NULL,
    nombre_sexo VARCHAR(1) NOT NULL,
    CONSTRAINT PK_sexo PRIMARY KEY (id_sexo)
)ENGINE = InnoDB;

CREATE TABLE tipo_telefono(
    id_tipo_telefono TINYINT(1) NOT NULL,
    descripcion_tipo_tel VARCHAR(20) NOT NULL,
    CONSTRAINT PK_tipo_telefono PRIMARY KEY (id_tipo_telefono)
)ENGINE=InnoDB;



CREATE TABLE alumno(
    id_alumno INT AUTO_INCREMENT NOT NULL,
    nif_alumno VARCHAR(9) NULL,
    nombre_alumno VARCHAR(25) NOT NULL,
    apellido1 VARCHAR(30) NOT NULL,
    apellido2 VARCHAR(30) NULL,
    fecha_nacimiento_al DATE NOT NULL,
    codigo_sexo INT(11) NOT NULL, 
    CONSTRAINT PK_alumno PRIMARY KEY (id_alumno),
    CONSTRAINT FK_sexo_alumno FOREIGN KEY (codigo_sexo) REFERENCES sexo(id_sexo)
)ENGINE = InnoDB;

CREATE TABLE profesor(
    id_profesor INT AUTO_INCREMENT NOT NULL,
    nif_profesor VARCHAR(9) NULL,
    nombre_profesor VARCHAR(25) NOT NULL,
    apellido1 VARCHAR(30) NOT NULL,
    apellido2 VARCHAR(30) NULL,
    fecha_nacimiento_prof DATE NOT NULL,
    codigo_sexo INT(11) NOT NULL,
    id_departamento INT(11) NULL,
    CONSTRAINT PK_profesor PRIMARY KEY (id_profesor),
    CONSTRAINT FK_sexo_profesor FOREIGN KEY (codigo_sexo) REFERENCES sexo(id_sexo),
    CONSTRAINT FK_departamento_profesor FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento)
)ENGINE = InnoDB;

CREATE TABLE direccion_profesor (
    id_direccion_profesor INT NOT NULL AUTO_INCREMENT,
    barrio VARCHAR(25) NULL,
    calle VARCHAR(25) NULL,
    carrera VARCHAR(25) NULL,
    codigo_ciudad VARCHAR(5) NULL,
    codigo_profesor INT(11) NULL,
    CONSTRAINT PK_direccion_profesor PRIMARY KEY (id_direccion_profesor),
    CONSTRAINT FK_codigo_ciudad_direccion_profesor FOREIGN KEY (codigo_ciudad) REFERENCES ciudad(id_ciudad),
    CONSTRAINT FK_codigo_profesor FOREIGN KEY(codigo_profesor) REFERENCES profesor(id_profesor)
)ENGINE = InnoDB;

CREATE TABLE direccion_alumno (
    id_direccion_alumno INT NOT NULL AUTO_INCREMENT,
    barrio VARCHAR(25) NULL,
    calle VARCHAR(25) NULL,
    carrera VARCHAR(25) NULL,
    codigo_ciudad VARCHAR(5) NULL,
    codigo_alumno INT(11) NULL,
    CONSTRAINT PK_direccion_alumno PRIMARY KEY (id_direccion_alumno),
    CONSTRAINT FK_codigo_ciudad_direccion_alumno FOREIGN KEY (codigo_ciudad) REFERENCES ciudad(id_ciudad),
    CONSTRAINT FK_alumno_direccion_alumno FOREIGN KEY(codigo_alumno) REFERENCES alumno(id_alumno)
)ENGINE = InnoDB;

CREATE TABLE asignatura(
    id_asignatura INT AUTO_INCREMENT NOT NULL,
    nombre_asignatura VARCHAR(100) NOT NULL,
    creditos FLOAT NOT NULL,
    curso TINYINT(3) NOT NULL,
    cuatrimestre TINYINT(3) NOT NULL,
    id_profesor_asignatura INT(11) NULL,
    id_grado_asignatura INT(11) NOT NULL,
    codigo_tipo_asignatura INT(11) NOT NULL,
    CONSTRAINT PK_direccion_asignatura PRIMARY KEY (id_asignatura),
    CONSTRAINT FK_profesor_asignatura FOREIGN KEY (id_profesor_asignatura) REFERENCES profesor(id_profesor),
    CONSTRAINT FK_grado_asignatura FOREIGN KEY(id_grado_asignatura) REFERENCES grado(id_grado),
    CONSTRAINT FK_tipo_asignatura_asignatura FOREIGN KEY (codigo_tipo_asignatura) REFERENCES tipo_asignatura(id_tipo_asignatura)
)ENGINE = InnoDB;

CREATE TABLE telefono_profesor(
    id_telefono_profesor INT AUTO_INCREMENT NOT NULL,
    numero BIGINT NOT NULL,
    codigo_tipo_telefono TINYINT(1) NOT NULL, 
    codigo_profesor_tel INT(11) NULL,
    CONSTRAINT PK_telefono_profesor PRIMARY KEY (id_telefono_profesor),
    CONSTRAINT FK_tipo_telefono_telefono_profesor FOREIGN KEY (codigo_tipo_telefono) REFERENCES tipo_telefono(id_tipo_telefono),
    CONSTRAINT FK_profesor_telefono_profesor FOREIGN KEY (codigo_profesor_tel) REFERENCES profesor(id_profesor)
)ENGINE=InnoDB;

CREATE TABLE telefono_alumno(
    id_telefono_alumno INT AUTO_INCREMENT NOT NULL,
    numero BIGINT NOT NULL,
    codigo_tipo_telefono TINYINT(1) NOT NULL, 
    codigo_alumno_tel INT(11) NULL,
    CONSTRAINT PK_telefono_alumno PRIMARY KEY (id_telefono_alumno),
    CONSTRAINT FK_tipo_telefono_telefono_alumno FOREIGN KEY (codigo_tipo_telefono) REFERENCES tipo_telefono(id_tipo_telefono),
    CONSTRAINT FK_alumno_telefono_alumno FOREIGN KEY (codigo_alumno_tel) REFERENCES alumno(id_alumno)
)ENGINE=InnoDB;

CREATE TABLE alumno_se_matricula_asignatura(
    id_alumno_asignatura INT(11) NOT NULL,
    id_asignatura INT(11) NOT NULL,
    id_curso_escolar INT(11) NOT NULL,
    CONSTRAINT PK_alumno_se_matricula_asignatura PRIMARY KEY(id_alumno_asignatura, id_asignatura, id_curso_escolar), 
    CONSTRAINT FK_alumno_alumno_se_matricula_asignatura FOREIGN KEY (id_alumno_asignatura) REFERENCES alumno(id_alumno),
    CONSTRAINT FK_asignatura_alumno_se_matricula_asignatura FOREIGN KEY (id_asignatura) REFERENCES asignatura(id_asignatura),
    CONSTRAINT FK_curso_escolar_alumno_se_matricula_asignatura FOREIGN KEY (id_curso_escolar) REFERENCES curso_escolar(id_curso_escolar)
)ENGINE = InnoDB;