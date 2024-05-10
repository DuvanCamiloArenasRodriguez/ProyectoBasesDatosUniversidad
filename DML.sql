-- Inserts
    -- departamento
INSERT INTO departamento VALUES (1, 'Informática');
INSERT INTO departamento VALUES (2, 'Matemáticas');
INSERT INTO departamento VALUES (3, 'Economía y Empresa');
INSERT INTO departamento VALUES (4, 'Educación');
INSERT INTO departamento VALUES (5, 'Agronomía');
INSERT INTO departamento VALUES (6, 'Química y Física');
INSERT INTO departamento VALUES (7, 'Filología');
INSERT INTO departamento VALUES (8, 'Derecho');
INSERT INTO departamento VALUES (9, 'Biología y Geología');

    -- ciudad
INSERT INTO ciudad VALUES ('68001', 'Bucaramanga');
INSERT INTO ciudad VALUES ('11001', 'Bogotá');

    -- Grado
INSERT INTO grado VALUES (1, 'Grado en Ingeniería Agrícola (Plan 2015)');
INSERT INTO grado VALUES (2, 'Grado en Ingeniería Eléctrica (Plan 2014)');
INSERT INTO grado VALUES (3, 'Grado en Ingeniería Electrónica Industrial (Plan 2010)');
INSERT INTO grado VALUES (4, 'Grado en Ingeniería Informática (Plan 2015)');
INSERT INTO grado VALUES (5, 'Grado en Ingeniería Mecánica (Plan 2010)');
INSERT INTO grado VALUES (6, 'Grado en Ingeniería Química Industrial (Plan 2010)');
INSERT INTO grado VALUES (7, 'Grado en Biotecnología (Plan 2015)');
INSERT INTO grado VALUES (8, 'Grado en Ciencias Ambientales (Plan 2009)');
INSERT INTO grado VALUES (9, 'Grado en Matemáticas (Plan 2010)');
INSERT INTO grado VALUES (10, 'Grado en Química (Plan 2009)');

    -- Curso Escolar
INSERT INTO curso_escolar VALUES (1, 2014, 2015);
INSERT INTO curso_escolar VALUES (2, 2015, 2016);
INSERT INTO curso_escolar VALUES (3, 2016, 2017);
INSERT INTO curso_escolar VALUES (4, 2017, 2018);

    -- Tipo Asignatura
INSERT INTO tipo_asignatura VALUES (NULL, 'básica'); INSERT INTO tipo_asignatura VALUES (NULL, 'obligatoria');
INSERT INTO tipo_asignatura VALUES (NULL, 'optativa');

    -- Género
INSERT INTO sexo VALUES (NULL, 'H');
INSERT INTO sexo VALUES (NULL, 'M');

    -- Tipo_Teléfono
INSERT INTO tipo_telefono VALUES (1, 'Celular');
INSERT INTO tipo_telefono VALUES (2, 'Fijo');

    -- Alumno
INSERT INTO alumno VALUES (1, '89542419S', 'David', 'Ramírez', 'Gualdrón',  '1992/08/08', 1);
INSERT INTO alumno VALUES (2, '26902806M', 'Jaime', 'Villamizar', 'Jaimes', '1991/03/28', 1);
INSERT INTO alumno VALUES (4, '17105885A', 'Sergio', 'Cely', 'Topia', '2000/10/05', 1);
INSERT INTO alumno VALUES (6, '04233869Y', 'José', 'Abuchaibe', 'Pérez', '1998/01/28', 1);
INSERT INTO alumno VALUES (7, '97258166K', 'Andrés', 'Morales', 'Fuentes', '1999/05/24', 1);
INSERT INTO alumno VALUES (9, '82842571K', 'Luis', 'Tarazona', 'Bohórquez', '1996/11/21', 1);
INSERT INTO alumno VALUES (11, '46900725E', 'Daniel', 'Merchán', 'Pico',  '1997/04/26', 1);
INSERT INTO alumno VALUES (19, '11578526G', 'Heidy', 'Blanco', 'Ortiz', '1998/09/01', 2);
INSERT INTO alumno VALUES (21, '79089577Y', 'Juan', 'Mecánico', 'Benz', '1998/01/01', 1);
INSERT INTO alumno VALUES (22, '41491230N', 'Alejandro', 'Acevedo', 'Martínez', '1999/02/11', 1);
INSERT INTO alumno VALUES (23, '64753215G', 'Irene', 'Vélez', 'Lara', '1996/03/12', 2);
INSERT INTO alumno VALUES (24, '85135690V', 'Gabriela', 'Doncel', 'Alfonso', '1995/04/13', 2);

    -- Insertar Profesor
INSERT INTO profesor VALUES (3, '11105554G', 'Lusvin', 'Amado', 'Forero', '1979/08/19', 2, 1);
INSERT INTO profesor VALUES (5, '38223286T', 'Mario', 'Morales', 'Cordero', '1978/01/19', 1, 2);
INSERT INTO profesor VALUES (8, '79503962T', 'Silvia', 'Becerra', 'Bayona', '1977/08/21', 2, 3);
INSERT INTO profesor VALUES (10, '61142000L', 'Deisy', 'Rincón', 'Albarracín', '1977/05/19', 2, 4);
INSERT INTO profesor VALUES (12, '85366986W', 'Carmen', 'Aristegui', 'Beltrán', '1971-04-29', 2, 4);
INSERT INTO profesor VALUES (13, '73571384L', 'Victor', 'Solarte', 'David', '1980/02/01', 1, 6);
INSERT INTO profesor VALUES (14, '82937751G', 'Óscar', 'Gelvez', 'Ramírez', '1977/01/02', 1, 1);
INSERT INTO profesor VALUES (15, '80502866Z', 'Alejandro', 'Arboleda', 'Beltrán', '1980/03/14', 1, 2);
INSERT INTO profesor VALUES (16, '10485008K', 'Antonio', 'Banderas', 'Arrieta', '1982/03/18', 1, 3);
INSERT INTO profesor VALUES (17, '85869555K', 'Juan', 'Quijano', 'Rodríguez', '1973/05/05', 1, 4);
INSERT INTO profesor VALUES (18, '04326833G', 'Michael', 'Chacón', 'Martínez', '1976/02/25', 1, 5);
INSERT INTO profesor VALUES (20, '79221403L', 'Francia', 'Marquez', 'Petro', '1980/10/31', 1, 6);
INSERT INTO profesor VALUES (21, '13175769N', 'Pedro', 'Afanador', 'Ramírez', '1980/10/16', 1, 1);
INSERT INTO profesor VALUES (22, '98816696W', 'Juan', 'Martínez', 'Acuña', '1980/11/21', 1, 1);
INSERT INTO profesor VALUES (23, '77194445M', 'Rodolfo', 'Llinás', 'Hernández', '1980/12/13', 2, 2);

    -- Insertar Asignatura
INSERT INTO asignatura VALUES (1, 'Álgegra lineal y matemática discreta', 6, 1, 1, NULL, 4, 1);
INSERT INTO asignatura VALUES (2, 'Cálculo', 6, 1, 1, NULL, 4, 1);
INSERT INTO asignatura VALUES (3, 'Física para informática', 6, 1, 1, NULL, 4, 1);
INSERT INTO asignatura VALUES (4, 'Introducción a la programación', 6, 1, 1, NULL, 4, 1);
INSERT INTO asignatura VALUES (5, 'Organización y gestión de empresas', 6, 1, 1, NULL, 4, 1);
INSERT INTO asignatura VALUES (6, 'Estadística', 6, 1, 2, NULL, 4, 1);
INSERT INTO asignatura VALUES (7, 'Estructura y tecnología de computadores', 6, 1, 2, NULL, 4, 1);
INSERT INTO asignatura VALUES (8, 'Fundamentos de electrónica', 6, 1, 2, NULL, 4, 1);
INSERT INTO asignatura VALUES (9, 'Lógica y algorítmica', 6, 1, 2, NULL, 4, 1);
INSERT INTO asignatura VALUES (10, 'Metodología de la programación', 6, 1, 2, NULL, 4, 1);
INSERT INTO asignatura VALUES (11, 'Arquitectura de Computadores', 6, 2, 1, 3, 4, 1);
INSERT INTO asignatura VALUES (12, 'Estructura de Datos y Algoritmos I', 6, 2, 1, 3, 4, 2);
INSERT INTO asignatura VALUES (13, 'Ingeniería del Software', 6, 2, 1, 14, 4, 2);
INSERT INTO asignatura VALUES (14, 'Sistemas Inteligentes', 6, 2, 1, 3, 4, 2);
INSERT INTO asignatura VALUES (15, 'Sistemas Operativos', 6, 2, 1, 14, 4, 2);
INSERT INTO asignatura VALUES (16, 'Bases de Datos', 6, 2, 2, 14, 4, 1);
INSERT INTO asignatura VALUES (17, 'Estructura de Datos y Algoritmos II', 6, 2, 2, 14, 4, 2);
INSERT INTO asignatura VALUES (18, 'Fundamentos de Redes de Computadores', 6, 2, 2, 3, 4, 2);
INSERT INTO asignatura VALUES (19, 'Planificación y Gestión de Proyectos Informáticos', 6, 2, 2, 3, 4, 2);
INSERT INTO asignatura VALUES (20, 'Programación de Servicios Software', 6, 2, 2, 14, 4, 2);
INSERT INTO asignatura VALUES (21, 'Desarrollo de interfaces de usuario', 6, 3, 1, 14, 4, 2);
INSERT INTO asignatura VALUES (22, 'Ingeniería de Requisitos', 6, 3, 1, NULL, 4, 3);
INSERT INTO asignatura VALUES (23, 'Integración de las Tecnologías de la Información en las Organizaciones', 6, 3, 1, NULL, 4, 3);
INSERT INTO asignatura VALUES (24, 'Modelado y Diseño del Software 1', 6, 3, 1, NULL, 4, 3);
INSERT INTO asignatura VALUES (25, 'Multiprocesadores', 6, 3, 1, NULL, 4, 3);
INSERT INTO asignatura VALUES (26, 'Seguridad y cumplimiento normativo', 6, 3, 1, NULL, 4, 3);
INSERT INTO asignatura VALUES (27, 'Sistema de Información para las Organizaciones', 6, 3, 1, NULL, 4, 3); 
INSERT INTO asignatura VALUES (28, 'Tecnologías web', 6, 3, 1, NULL, 4, 3);
INSERT INTO asignatura VALUES (29, 'Teoría de códigos y criptografía', 6, 3, 1, NULL, 4, 3);
INSERT INTO asignatura VALUES (30, 'Administración de bases de datos', 6, 3, 2, NULL, 4, 3);
INSERT INTO asignatura VALUES (31, 'Herramientas y Métodos de Ingeniería del Software', 6, 3, 2, NULL, 4, 3);
INSERT INTO asignatura VALUES (32, 'Informática industrial y robótica', 6, 3, 2, NULL, 4, 3);
INSERT INTO asignatura VALUES (33, 'Ingeniería de Sistemas de Información', 6, 3, 2, NULL, 4, 3);
INSERT INTO asignatura VALUES (34, 'Modelado y Diseño del Software 2', 6, 3, 2, NULL, 4, 3);
INSERT INTO asignatura VALUES (35, 'Negocio Electrónico', 6, 3, 2, NULL, 4, 3);
INSERT INTO asignatura VALUES (36, 'Periféricos e interfaces', 6, 3, 2, NULL, 4, 3);
INSERT INTO asignatura VALUES (37, 'Sistemas de tiempo real', 6, 3, 2, NULL, 4, 3);
INSERT INTO asignatura VALUES (38, 'Tecnologías de acceso a red', 6, 3, 2, NULL, 4, 3);
INSERT INTO asignatura VALUES (39, 'Tratamiento digital de imágenes', 6, 3, 2, NULL, 4, 3);
INSERT INTO asignatura VALUES (40, 'Administración de redes y sistemas operativos', 6, 4, 1, NULL, 4, 3);
INSERT INTO asignatura VALUES (41, 'Almacenes de Datos', 6, 4, 1, NULL, 4, 3);
INSERT INTO asignatura VALUES (42, 'Fiabilidad y Gestión de Riesgos', 6, 4, 1, NULL, 4, 3);
INSERT INTO asignatura VALUES (43, 'Líneas de Productos Software', 6, 4, 1, NULL, 4, 3);
INSERT INTO asignatura VALUES (44, 'Procesos de Ingeniería del Software 1', 6, 4, 1, NULL, 4, 3);
INSERT INTO asignatura VALUES (45, 'Tecnologías multimedia', 6, 4, 1, NULL, 4, 3);
INSERT INTO asignatura VALUES (46, 'Análisis y planificación de las TI', 6, 4, 2, NULL, 4, 3);
INSERT INTO asignatura VALUES (47, 'Desarrollo Rápido de Aplicaciones', 6, 4, 2, NULL, 4, 3);
INSERT INTO asignatura VALUES (48, 'Gestión de la Calidad y de la Innovación Tecnológica', 6, 4, 2, NULL, 4, 3);
INSERT INTO asignatura VALUES (49, 'Inteligencia del Negocio', 6, 4, 2, NULL, 4, 3);
INSERT INTO asignatura VALUES (50, 'Procesos de Ingeniería del Software 2', 6, 4, 2, NULL, 4, 3);
INSERT INTO asignatura VALUES (51, 'Seguridad Informática', 6, 4, 2, NULL, 4, 3);
INSERT INTO asignatura VALUES (52, 'Biologia celular', 6, 1, 1, NULL, 7, 1);
INSERT INTO asignatura VALUES (53, 'Física', 6, 1, 1, NULL, 7, 1);
INSERT INTO asignatura VALUES (54, 'Matemáticas I', 6, 1, 1, NULL, 7, 1);
INSERT INTO asignatura VALUES (55, 'Química general', 6, 1, 1, NULL, 7, 1);
INSERT INTO asignatura VALUES (56, 'Química orgánica', 6, 1, 1, NULL, 7, 1);
INSERT INTO asignatura VALUES (57, 'Biología vegetal y animal', 6, 1, 2, NULL, 7, 1);
INSERT INTO asignatura VALUES (58, 'Bioquímica', 6, 1, 2, NULL, 7, 1);
INSERT INTO asignatura VALUES (59, 'Genética', 6, 1, 2, NULL, 7, 1);
INSERT INTO asignatura VALUES (60, 'Matemáticas II', 6, 1, 2, NULL, 7, 1);
INSERT INTO asignatura VALUES (61, 'Microbiología', 6, 1, 2, NULL, 7, 1);
INSERT INTO asignatura VALUES (62, 'Botánica agrícola', 6, 2, 1, NULL, 7, 2);
INSERT INTO asignatura VALUES (63, 'Fisiología vegetal', 6, 2, 1, NULL, 7, 2);
INSERT INTO asignatura VALUES (64, 'Genética molecular', 6, 2, 1, NULL, 7, 2);
INSERT INTO asignatura VALUES (65, 'Ingeniería bioquímica', 6, 2, 1, NULL, 7, 2);
INSERT INTO asignatura VALUES (66, 'Termodinámica y cinética química aplicada', 6, 2, 1, NULL, 7, 2);
INSERT INTO asignatura VALUES (67, 'Biorreactores', 6, 2, 2, NULL, 7, 2);
INSERT INTO asignatura VALUES (68, 'Biotecnología microbiana', 6, 2, 2, NULL, 7, 2);
INSERT INTO asignatura VALUES (69, 'Ingeniería genética', 6, 2, 2, NULL, 7, 2);
INSERT INTO asignatura VALUES (70, 'Inmunología', 6, 2, 2, NULL, 7, 2);
INSERT INTO asignatura VALUES (71, 'Virología', 6, 2, 2, NULL, 7, 2);
INSERT INTO asignatura VALUES (72, 'Bases moleculares del desarrollo vegetal', 4.5, 3, 1, NULL, 7, 2);
INSERT INTO asignatura VALUES (73, 'Fisiología animal', 4.5, 3, 1, NULL, 7, 2);
INSERT INTO asignatura VALUES (74, 'Metabolismo y biosíntesis de biomoléculas', 6, 3, 1, NULL, 7, 2);
INSERT INTO asignatura VALUES (75, 'Operaciones de separación', 6, 3, 1, NULL, 7, 2);
INSERT INTO asignatura VALUES (76, 'Patología molecular de plantas', 4.5, 3, 1, NULL, 7, 2);
INSERT INTO asignatura VALUES (77, 'Técnicas instrumentales básicas', 4.5, 3, 1, NULL, 7, 2);
INSERT INTO asignatura VALUES (78, 'Bioinformática', 4.5, 3, 2, NULL, 7, 2);
INSERT INTO asignatura VALUES (79, 'Biotecnología de los productos hortofrutículas', 4.5, 3, 2, NULL, 7, 2);
INSERT INTO asignatura VALUES (80, 'Biotecnología vegetal', 6, 3, 2, NULL, 7, 2);
INSERT INTO asignatura VALUES (81, 'Genómica y proteómica', 4.5, 3, 2, NULL, 7, 2);
INSERT INTO asignatura VALUES (82, 'Procesos biotecnológicos', 6, 3, 2, NULL, 7, 2);
INSERT INTO asignatura VALUES (83, 'Técnicas instrumentales avanzadas', 4.5, 3, 2, NULL, 7, 2);


    -- Insert Alumno-asignatura

INSERT INTO alumno_se_matricula_asignatura VALUES (23, 2, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 1, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 2, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 3, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 4, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 5, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 6, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 7, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 8, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 9, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 10, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 1, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 2, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 3, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 1, 3);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 2, 3);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 3, 3);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 1, 4);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 2, 4);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 3, 4);
INSERT INTO alumno_se_matricula_asignatura VALUES (2, 1, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (2, 2, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (2, 3, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 1, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 2, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 3, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 1, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 2, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 3, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 4, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 5, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 6, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 7, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 8, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 9, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 10, 2);

    -- Dirección Alumno
INSERT INTO direccionAlumno (barrio, calle, carrera, codigo_ciudad, codigo_alumno) VALUES ('Centro', 'Calle 36', 'Carrera 15', '68001', 1);
INSERT INTO direccionAlumno (barrio, calle, carrera, codigo_ciudad, codigo_alumno) VALUES ('Cabecera', 'Calle 48', 'Carrera 27', '68001', 2);
INSERT INTO direccionAlumno (barrio, calle, carrera, codigo_ciudad, codigo_alumno) VALUES ('Floridablanca', 'Calle 200', 'Carrera 33', '68001', 4);
INSERT INTO direccionAlumno (barrio, calle, carrera, codigo_ciudad, codigo_alumno) VALUES ('Provenza', 'Calle 38', 'Carrera 29', '68001', 6);
INSERT INTO direccionAlumno (barrio, calle, carrera, codigo_ciudad, codigo_alumno) VALUES ('La Floresta', 'Calle 45', 'Carrera 20', '68001', 7);
INSERT INTO direccionAlumno (barrio, calle, carrera, codigo_ciudad, codigo_alumno) VALUES ('San Francisco', 'Calle 34', 'Carrera 18', '68001', 9);
INSERT INTO direccionAlumno (barrio, calle, carrera, codigo_ciudad, codigo_alumno) VALUES ('La Universidad', 'Calle 42', 'Carrera 27', '68001', 11);
INSERT INTO direccionAlumno (barrio, calle, carrera, codigo_ciudad, codigo_alumno) VALUES ('El Prado', 'Calle 38', 'Carrera 29', '68001', 21);
INSERT INTO direccionAlumno (barrio, calle, carrera, codigo_ciudad, codigo_alumno) VALUES ('Cañaveral', 'Calle 44', 'Carrera 20', '68001', 22);

    -- Dirección Profesor
INSERT INTO direccion_profesor (barrio, calle, carrera, codigo_ciudad, codigo_profesor) VALUES ('Centro', 'Calle 36', 'Carrera 15', '68001', 3);
INSERT INTO direccion_profesor (barrio, calle, carrera, codigo_ciudad, codigo_profesor) VALUES ('Cabecera', 'Calle 52', 'Carrera 35', '68001', 5);
INSERT INTO direccion_profesor (barrio, calle, carrera, codigo_ciudad, codigo_profesor) VALUES ('Floridablanca', 'Calle 157', 'Carrera 23', '68001', 8);
INSERT INTO direccion_profesor (barrio, calle, carrera, codigo_ciudad, codigo_profesor) VALUES ('Provenza', 'Calle 107', 'Carrera 45', '68001', 10);
INSERT INTO direccion_profesor (barrio, calle, carrera, codigo_ciudad, codigo_profesor) VALUES ('La Floresta', 'Calle 64', 'Carrera 46', '68001', 12);
INSERT INTO direccion_profesor (barrio, calle, carrera, codigo_ciudad, codigo_profesor) VALUES ('San Alonso', 'Calle 9', 'Carrera 27', '68001', 13);
INSERT INTO direccion_profesor (barrio, calle, carrera, codigo_ciudad, codigo_profesor) VALUES ('Mejoras Públicas', 'Calle 35', 'Carrera 32', '68001', 14);
INSERT INTO direccion_profesor (barrio, calle, carrera, codigo_ciudad, codigo_profesor) VALUES ('La Aurora', 'Calle 37', 'Carrera 22', '68001', 15);
INSERT INTO direccion_profesor (barrio, calle, carrera, codigo_ciudad, codigo_profesor) VALUES ('El Prado', 'Calle 33', 'Carrera 38', '68001', 16);
INSERT INTO direccion_profesor (barrio, calle, carrera, codigo_ciudad, codigo_profesor) VALUES ('Cañaveral', 'Calle 40', 'Carrera 24', '68001', 17);

        -- Bogotá
    INSERT INTO direccion_profesor (barrio, calle, carrera, codigo_ciudad, codigo_profesor) VALUES ('Chapinero', 'Calle 63', 'Carrera 7', '11001', 18);
    
    INSERT INTO direccion_profesor (barrio, calle, carrera, codigo_ciudad, codigo_profesor) VALUES ('Santa Bárbara', 'Calle 116', 'Carrera 7A', '11001', 20);
    INSERT INTO direccion_profesor (barrio, calle, carrera, codigo_ciudad, codigo_profesor) VALUES ('Chapinero Norte', 'Calle 63', 'Carrera 13', '11001', 21);
    INSERT INTO direccion_profesor (barrio, calle, carrera, codigo_ciudad, codigo_profesor) VALUES ('Usaquén', 'Calle 119', 'Carrera 6A', '11001', 22);

    INSERT INTO telefono_profesor VALUES (NULL, 4661126900, 1, 3);
    INSERT INTO telefono_profesor VALUES (NULL, 7411613211, 2, 5);
    INSERT INTO telefono_profesor VALUES (NULL, 2319647555, 1, 8);
    INSERT INTO telefono_profesor VALUES (NULL, 4444444444, 1, 10);
    INSERT INTO telefono_profesor VALUES (NULL, 8677886777, 2, 12);
    INSERT INTO telefono_profesor VALUES (NULL, 4534788888, 1, 13);