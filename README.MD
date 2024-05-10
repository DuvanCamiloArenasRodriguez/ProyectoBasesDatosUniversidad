# Proyecto de SQL - Parte 2

A continuación se realizan las diferentes consultas solicitadas por el docente:

**Nombre: ** Duván Camilo Arenas Rodríguez

### Consultas sobre una tabla

1. Devuelve un listado con el primer apellido, segundo apellido y el nombre de  todos los alumnos. El listado deberá estar ordenado alfabéticamente de  menor a mayor por el primer apellido, segundo apellido y nombre.

   ```mysql
   SELECT apellido1, apellido2, nombre_alumno
   FROM alumno
   ORDER BY apellido1 ASC, apellido2 ASC, nombre_alumno ASC;
   
   +------------+-----------+---------------+
   | apellido1  | apellido2 | nombre_alumno |
   +------------+-----------+---------------+
   | Abuchaibe  | Pérez     | José          |
   | Acevedo    | Martínez  | Alejandro     |
   | Blanco     | Ortiz     | Heidy         |
   | Cely       | Topia     | Sergio        |
   | Doncel     | Alfonso   | Gabriela      |
   | Mecánico   | Benz      | Juan          |
   | Merchán    | Pico      | Daniel        |
   | Morales    | Fuentes   | Andrés        |
   | Ramírez    | Gualdrón  | David         |
   | Tarazona   | Bohórquez | Luis          |
   | Vélez      | Lara      | Irene         |
   | Villamizar | Jaimes    | Jaime         |
   +------------+-----------+---------------+
   ```

   

2. Averigua el nombre y los dos apellidos de los alumnos que no han dado de  alta su número de teléfono en la base de datos. 

   ```mysql
   SELECT a.nombre_alumno, a.apellido1, a.apellido2
   FROM alumno as a
   LEFT JOIN telefono_alumno as ta ON ta.codigo_alumno_tel = a.id_alumno
   WHERE ta.codigo_alumno_tel IS NULL;
   
   +---------------+------------+-----------+
   | nombre_alumno | apellido1  | apellido2 |
   +---------------+------------+-----------+
   | David         | Ramírez    | Gualdrón  |
   | Jaime         | Villamizar | Jaimes    |
   | Sergio        | Cely       | Topia     |
   | José          | Abuchaibe  | Pérez     |
   | Andrés        | Morales    | Fuentes   |
   | Luis          | Tarazona   | Bohórquez |
   | Daniel        | Merchán    | Pico      |
   | Heidy         | Blanco     | Ortiz     |
   | Juan          | Mecánico   | Benz      |
   | Alejandro     | Acevedo    | Martínez  |
   | Irene         | Vélez      | Lara      |
   | Gabriela      | Doncel     | Alfonso   |
   +---------------+------------+-----------+
   ```

   

3. Devuelve el listado de los alumnos que nacieron en 1999.

   ```mysql
   SELECT id_alumno, nif_alumno, nombre_alumno, apellido1, apellido2, fecha_nacimiento_al, codigo_sexo
   FROM alumno 
   WHERE YEAR(fecha_nacimiento_al) = 1999;
   
   +-----------+------------+---------------+-----------+-----------+---------------------+-------------+
   | id_alumno | nif_alumno | nombre_alumno | apellido1 | apellido2 | fecha_nacimiento_al | codigo_sexo |
   +-----------+------------+---------------+-----------+-----------+---------------------+-------------+
   |         7 | 97258166K  | Andrés        | Morales   | Fuentes   | 1999-05-24          |           1 |
   |        22 | 41491230N  | Alejandro     | Acevedo   | Martínez  | 1999-02-11          |           1 |
   +-----------+------------+---------------+-----------+-----------+---------------------+-------------+
   ```

    

4. Devuelve el listado de profesores que no han dado de alta su número de  teléfono en la base de datos y además su nif termina en K. 

   ```mysql
   SELECT p.nombre_profesor, p.apellido1, p.apellido2
   FROM profesor as p
   LEFT JOIN telefono_profesor as tp ON tp.codigo_profesor_tel = p.id_profesor
   WHERE tp.codigo_profesor_tel IS NULL AND p.nif_profesor LIKE '%K';
   
   +-----------------+-----------+-----------+
   | nombre_profesor | apellido1 | apellido2 |
   +-----------------+-----------+-----------+
   | Antonio         | Banderas  | Arrieta   |
   | Juan            | Quijano   | Rodríguez |
   +-----------------+-----------+-----------+
   ```

   

5. Devuelve el listado de las asignaturas que se imparten en el primer  cuatrimestre, en el tercer curso del grado que tiene el identificador 7.

   ```mysql
   SELECT id_asignatura, nombre_asignatura, creditos, curso, cuatrimestre, id_profesor_asignatura, id_grado_asignatura, codigo_tipo_asignatura
   FROM asignatura
   WHERE cuatrimestre = 1 AND curso = 3 AND id_grado_asignatura = 7;
   
   +---------------+-------------------------------------------+----------+-------+--------------+------------------------+---------------------+------------------------+
   | id_asignatura | nombre_asignatura                         | creditos | curso | cuatrimestre | id_profesor_asignatura | id_grado_asignatura | codigo_tipo_asignatura |
   +---------------+-------------------------------------------+----------+-------+--------------+------------------------+---------------------+------------------------+
   |            72 | Bases moleculares del desarrollo vegetal  |      4.5 |     3 |            1 |                   NULL |                   7 |                      2 |
   |            73 | Fisiología animal                         |      4.5 |     3 |            1 |                   NULL |                   7 |                      2 |
   |            74 | Metabolismo y biosíntesis de biomoléculas |        6 |     3 |            1 |                   NULL |                   7 |                      2 |
   |            75 | Operaciones de separación                 |        6 |     3 |            1 |                   NULL |                   7 |                      2 |
   |            76 | Patología molecular de plantas            |      4.5 |     3 |            1 |                   NULL |                   7 |                      2 |
   |            77 | Técnicas instrumentales básicas           |      4.5 |     3 |            1 |                   NULL |                   7 |                      2 |
   +---------------+-------------------------------------------+----------+-------+--------------+------------------------+---------------------+------------------------+
   ```

   

### Consultas multitabla (Composición interna)

1. . Devuelve un listado con los datos de todas las alumnas que se han matriculado alguna vez en el Grado en Ingeniería Informática (Plan 2015).

   ```mysql
   SELECT a.id_alumno, a.nif_alumno, a.nombre_alumno, a.apellido1, a.apellido2, a.fecha_nacimiento_al, a.codigo_sexo
   FROM alumno as a 
   INNER JOIN alumno_se_matricula_asignatura as asm ON asm.id_alumno_asignatura = a.id_alumno
   INNER JOIN asignatura as asi ON asi.id_asignatura = asm.id_asignatura
   INNER JOIN grado as g ON g.id_grado = asi.id_grado_asignatura
   INNER JOIN sexo as s ON s.id_sexo = a.codigo_sexo 
   WHERE g.nombre_grado = 'Grado en Ingeniería Informática (Plan 2015)' AND s.id_sexo = 2;
   
   +-----------+------------+---------------+-----------+-----------+---------------------+-------------+
   | id_alumno | nif_alumno | nombre_alumno | apellido1 | apellido2 | fecha_nacimiento_al | codigo_sexo |
   +-----------+------------+---------------+-----------+-----------+---------------------+-------------+
   |        23 | 64753215G  | Irene         | Vélez     | Lara      | 1996-03-12          |           2 |
   +-----------+------------+---------------+-----------+-----------+---------------------+-------------+
   ```

   

2. Devuelve un listado con todas las asignaturas ofertadas en el Grado en Ingeniería Informática (Plan 2015).

   ```mysql
   SELECT a.id_asignatura as 'ID', a.nombre_asignatura as 'Nombre Asignatura', a.creditos as 'Créditos', a.curso as 'Curso', a.cuatrimestre as 'Cuatrimestre'
   FROM asignatura as a
   INNER JOIN grado as g ON g.id_grado = a.id_grado_asignatura
   WHERE g.nombre_grado = 'Grado en Ingeniería Informática (Plan 2015)';
   
   +----+------------------------------------------------------------------------+----------+-------+--------------+
   | ID | Nombre Asignatura                                                      | Créditos | Curso | Cuatrimestre |
   +----+------------------------------------------------------------------------+----------+-------+--------------+
   |  1 | Álgegra lineal y matemática discreta                                   |        6 |     1 |            1 |
   |  2 | Cálculo                                                                |        6 |     1 |            1 |
   |  3 | Física para informática                                                |        6 |     1 |            1 |
   |  4 | Introducción a la programación                                         |        6 |     1 |            1 |
   |  5 | Organización y gestión de empresas                                     |        6 |     1 |            1 |
   |  6 | Estadística                                                            |        6 |     1 |            2 |
   |  7 | Estructura y tecnología de computadores                                |        6 |     1 |            2 |
   |  8 | Fundamentos de electrónica                                             |        6 |     1 |            2 |
   |  9 | Lógica y algorítmica                                                   |        6 |     1 |            2 |
   | 10 | Metodología de la programación                                         |        6 |     1 |            2 |
   | 11 | Arquitectura de Computadores                                           |        6 |     2 |            1 |
   | 12 | Estructura de Datos y Algoritmos I                                     |        6 |     2 |            1 |
   | 13 | Ingeniería del Software                                                |        6 |     2 |            1 |
   | 14 | Sistemas Inteligentes                                                  |        6 |     2 |            1 |
   | 15 | Sistemas Operativos                                                    |        6 |     2 |            1 |
   | 16 | Bases de Datos                                                         |        6 |     2 |            2 |
   | 17 | Estructura de Datos y Algoritmos II                                    |        6 |     2 |            2 |
   | 18 | Fundamentos de Redes de Computadores                                   |        6 |     2 |            2 |
   | 19 | Planificación y Gestión de Proyectos Informáticos                      |        6 |     2 |            2 |
   | 20 | Programación de Servicios Software                                     |        6 |     2 |            2 |
   | 21 | Desarrollo de interfaces de usuario                                    |        6 |     3 |            1 |
   | 22 | Ingeniería de Requisitos                                               |        6 |     3 |            1 |
   | 23 | Integración de las Tecnologías de la Información en las Organizaciones |        6 |     3 |            1 |
   | 24 | Modelado y Diseño del Software 1                                       |        6 |     3 |            1 |
   | 25 | Multiprocesadores                                                      |        6 |     3 |            1 |
   | 26 | Seguridad y cumplimiento normativo                                     |        6 |     3 |            1 |
   | 27 | Sistema de Información para las Organizaciones                         |        6 |     3 |            1 |
   | 28 | Tecnologías web                                                        |        6 |     3 |            1 |
   | 29 | Teoría de códigos y criptografía                                       |        6 |     3 |            1 |
   | 30 | Administración de bases de datos                                       |        6 |     3 |            2 |
   | 31 | Herramientas y Métodos de Ingeniería del Software                      |        6 |     3 |            2 |
   | 32 | Informática industrial y robótica                                      |        6 |     3 |            2 |
   | 33 | Ingeniería de Sistemas de Información                                  |        6 |     3 |            2 |
   | 34 | Modelado y Diseño del Software 2                                       |        6 |     3 |            2 |
   | 35 | Negocio Electrónico                                                    |        6 |     3 |            2 |
   | 36 | Periféricos e interfaces                                               |        6 |     3 |            2 |
   | 37 | Sistemas de tiempo real                                                |        6 |     3 |            2 |
   | 38 | Tecnologías de acceso a red                                            |        6 |     3 |            2 |
   | 39 | Tratamiento digital de imágenes                                        |        6 |     3 |            2 |
   | 40 | Administración de redes y sistemas operativos                          |        6 |     4 |            1 |
   | 41 | Almacenes de Datos                                                     |        6 |     4 |            1 |
   | 42 | Fiabilidad y Gestión de Riesgos                                        |        6 |     4 |            1 |
   | 43 | Líneas de Productos Software                                           |        6 |     4 |            1 |
   | 44 | Procesos de Ingeniería del Software 1                                  |        6 |     4 |            1 |
   | 45 | Tecnologías multimedia                                                 |        6 |     4 |            1 |
   | 46 | Análisis y planificación de las TI                                     |        6 |     4 |            2 |
   | 47 | Desarrollo Rápido de Aplicaciones                                      |        6 |     4 |            2 |
   | 48 | Gestión de la Calidad y de la Innovación Tecnológica                   |        6 |     4 |            2 |
   | 49 | Inteligencia del Negocio                                               |        6 |     4 |            2 |
   | 50 | Procesos de Ingeniería del Software 2                                  |        6 |     4 |            2 |
   | 51 | Seguridad Informática                                                  |        6 |     4 |            2 |
   +----+------------------------------------------------------------------------+----------+-------+--------------+
   ```

    

3. Devuelve un listado de los profesores junto con el nombre del departamento al que están vinculados. El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del departamento. El resultado estará ordenado alfabéticamente de menor a mayor por los apellidos y el nombre.

   ```mysql
   SELECT  p.apellido1 as 'Promer apellido', p.apellido2 as 'Segundo apellido', p.nombre_profesor as 'Nombre Profesor', d.nombre_departamento as 'Nombre Departamento'
   FROM profesor as p
   INNER JOIN departamento as d ON d.id_departamento = p.id_departamento
   ORDER BY p.apellido1 ASC, p.apellido2 ASC, p.nombre_profesor ASC;
   
   +-----------------+------------------+-----------------+---------------------+
   | Promer apellido | Segundo apellido | Nombre Profesor | Nombre Departamento |
   +-----------------+------------------+-----------------+---------------------+
   | Afanador        | Ramírez          | Pedro           | Informática         |
   | Amado           | Forero           | Lusvin          | Informática         |
   | Arboleda        | Beltrán          | Alejandro       | Matemáticas         |
   | Aristegui       | Beltrán          | Carmen          | Educación           |
   | Banderas        | Arrieta          | Antonio         | Economía y Empresa  |
   | Becerra         | Bayona           | Silvia          | Economía y Empresa  |
   | Chacón          | Martínez         | Michael         | Agronomía           |
   | Gelvez          | Ramírez          | Óscar           | Informática         |
   | Llinás          | Hernández        | Rodolfo         | Matemáticas         |
   | Marquez         | Petro            | Francia         | Química y Física    |
   | Martínez        | Acuña            | Juan            | Informática         |
   | Morales         | Cordero          | Mario           | Matemáticas         |
   | Quijano         | Rodríguez        | Juan            | Educación           |
   | Rincón          | Albarracín       | Deisy           | Educación           |
   | Solarte         | David            | Victor          | Química y Física    |
   +-----------------+------------------+-----------------+---------------------+
   ```

   

4. Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno con nif 26902806M.

   ```mysql
   SELECT a.nombre_asignatura as 'Nombre Asignatura', c.anyo_inicio as 'Año Inicio', c.anyo_fin as 'Año Fin' 
   FROM asignatura as a
   INNER JOIN alumno_se_matricula_asignatura as asm ON a.id_asignatura = asm.id_asignatura
   INNER JOIN curso_escolar as c ON c.id_curso_escolar = asm.id_curso_escolar
   INNER JOIN alumno as al ON al.id_alumno = asm.id_alumno_asignatura
   WHERE al.nif_alumno = '26902806M';
   
   +--------------------------------------+------------+---------+
   | Nombre Asignatura                    | Año Inicio | Año Fin |
   +--------------------------------------+------------+---------+
   | Álgegra lineal y matemática discreta |       2014 |    2015 |
   | Cálculo                              |       2014 |    2015 |
   | Física para informática              |       2014 |    2015 |
   +--------------------------------------+------------+---------+
   ```

   

5. Devuelve un listado con el nombre de todos los departamentos que tienen profesores que imparten alguna asignatura en el Grado en Ingeniería Informática (Plan 2015).

   ```mysql
   SELECT DISTINCT d.nombre_departamento
   FROM departamento as d
   INNER JOIN profesor as p ON p.id_departamento = d.id_departamento
   INNER JOIN asignatura as a ON a.id_profesor_asignatura = p.id_profesor
   INNER JOIN grado as g ON g.id_grado = a.id_grado_asignatura
   WHERE g.nombre_grado = 'Grado en Ingeniería Informática (Plan 2015)';
   
   +---------------------+
   | nombre_departamento |
   +---------------------+
   | Informática         |
   +---------------------+
   ```

   

6. Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura durante el curso escolar 2018/2019.

   ```mysql
   SELECT a.id_alumno, a.nif_alumno, a.nombre_alumno, a.apellido1, a.apellido2, a.fecha_nacimiento_al, a.codigo_sexo
   FROM alumno as a
   INNER JOIN alumno_se_matricula_asignatura as asm ON asm.id_alumno_asignatura = a.id_alumno
   INNER JOIN curso_escolar as c ON c.id_curso_escolar = asm.id_curso_escolar
   WHERE c.anyo_inicio = 2018 AND c.anyo_fin = 2019;
   
   Esta consulta da como resultado un vacío
   ```

   

### Consultas multitabla (Composición externa)

1. Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados. El listado también debe mostrar aquellos profesores que no tienen ningún departamento asociado. El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor. El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y el nombre.

   ```mysql
   SELECT d.nombre_departamento as 'Nombre Departamento', p.apellido1, p.apellido2, p.nombre_profesor as 'Nombre profesor'
   FROM profesor as p
   LEFT JOIN departamento as d ON d.id_departamento = p.id_departamento
   ORDER BY d.nombre_departamento ASC, p.apellido1 asc, p.apellido2 ASC, p.nombre_profesor ASC;
   
   +---------------------+-----------+------------+-----------------+
   | Nombre Departamento | apellido1 | apellido2  | Nombre profesor |
   +---------------------+-----------+------------+-----------------+
   | Agronomía           | Chacón    | Martínez   | Michael         |
   | Economía y Empresa  | Banderas  | Arrieta    | Antonio         |
   | Economía y Empresa  | Becerra   | Bayona     | Silvia          |
   | Educación           | Aristegui | Beltrán    | Carmen          |
   | Educación           | Quijano   | Rodríguez  | Juan            |
   | Educación           | Rincón    | Albarracín | Deisy           |
   | Informática         | Afanador  | Ramírez    | Pedro           |
   | Informática         | Amado     | Forero     | Lusvin          |
   | Informática         | Gelvez    | Ramírez    | Óscar           |
   | Informática         | Martínez  | Acuña      | Juan            |
   | Matemáticas         | Arboleda  | Beltrán    | Alejandro       |
   | Matemáticas         | Llinás    | Hernández  | Rodolfo         |
   | Matemáticas         | Morales   | Cordero    | Mario           |
   | Química y Física    | Marquez   | Petro      | Francia         |
   | Química y Física    | Solarte   | David      | Victor          |
   +---------------------+-----------+------------+-----------------+
   ```

   

2. Devuelve un listado con los profesores que no están asociados a un departamento.

   ```mysql
   SELECT p.id_profesor as 'ID', p.nombre_profesor as 'Nombre Profesor'
   FROM profesor as p 
   LEFT JOIN departamento as d ON d.id_departamento = p.id_departamento
   WHERE d.id_departamento IS NULL;
   
   En este caso, la consulta es vacía porque todos los docentes tienen un departamento asociado
   ```

   

3. Devuelve un listado con los departamentos que no tienen profesores asociados.

   ```mysql
   SELECT d.nombre_departamento as 'Nombre'
   FROM profesor as p 
   RIGHT JOIN departamento as d ON d.id_departamento = p.id_departamento
   WHERE p.id_departamento IS NULL;
   
   +---------------------+
   | Nombre              |
   +---------------------+
   | Filología           |
   | Derecho             |
   | Biología y Geología |
   +---------------------+
   ```

   

4. Devuelve un listado con los profesores que no imparten ninguna asignatura.

   ```mysql
   SELECT p.nombre_profesor as 'Nombre Profesor', p.apellido1, p.apellido2
   FROM profesor as p
   LEFT JOIN asignatura as a ON p.id_profesor = a.id_profesor_asignatura
   WHERE a.id_profesor_asignatura IS NULL;
   
   +-----------------+-----------+------------+
   | Nombre Profesor | apellido1 | apellido2  |
   +-----------------+-----------+------------+
   | Mario           | Morales   | Cordero    |
   | Silvia          | Becerra   | Bayona     |
   | Deisy           | Rincón    | Albarracín |
   | Carmen          | Aristegui | Beltrán    |
   | Victor          | Solarte   | David      |
   | Alejandro       | Arboleda  | Beltrán    |
   | Antonio         | Banderas  | Arrieta    |
   | Juan            | Quijano   | Rodríguez  |
   | Michael         | Chacón    | Martínez   |
   | Francia         | Marquez   | Petro      |
   | Pedro           | Afanador  | Ramírez    |
   | Juan            | Martínez  | Acuña      |
   | Rodolfo         | Llinás    | Hernández  |
   +-----------------+-----------+------------+
   ```

   

5. Devuelve un listado con las asignaturas que no tienen un profesor asignado.

   ```mysql
   SELECT a.id_asignatura, a.nombre_asignatura
   FROM profesor as p
   RIGHT JOIN asignatura as a ON p.id_profesor = a.id_profesor_asignatura
   WHERE a.id_profesor_asignatura IS NULL;
   
   +---------------+------------------------------------------------------------------------+
   | id_asignatura | nombre_asignatura                                                      |
   +---------------+------------------------------------------------------------------------+
   |             1 | Álgegra lineal y matemática discreta                                   |
   |             2 | Cálculo                                                                |
   |             3 | Física para informática                                                |
   |             4 | Introducción a la programación                                         |
   |             5 | Organización y gestión de empresas                                     |
   |             6 | Estadística                                                            |
   |             7 | Estructura y tecnología de computadores                                |
   |             8 | Fundamentos de electrónica                                             |
   |             9 | Lógica y algorítmica                                                   |
   |            10 | Metodología de la programación                                         |
   |            22 | Ingeniería de Requisitos                                               |
   |            23 | Integración de las Tecnologías de la Información en las Organizaciones |
   |            24 | Modelado y Diseño del Software 1                                       |
   |            25 | Multiprocesadores                                                      |
   |            26 | Seguridad y cumplimiento normativo                                     |
   |            27 | Sistema de Información para las Organizaciones                         |
   |            28 | Tecnologías web                                                        |
   |            29 | Teoría de códigos y criptografía                                       |
   |            30 | Administración de bases de datos                                       |
   |            31 | Herramientas y Métodos de Ingeniería del Software                      |
   |            32 | Informática industrial y robótica                                      |
   |            33 | Ingeniería de Sistemas de Información                                  |
   |            34 | Modelado y Diseño del Software 2                                       |
   |            35 | Negocio Electrónico                                                    |
   |            36 | Periféricos e interfaces                                               |
   |            37 | Sistemas de tiempo real                                                |
   |            38 | Tecnologías de acceso a red                                            |
   |            39 | Tratamiento digital de imágenes                                        |
   |            40 | Administración de redes y sistemas operativos                          |
   |            41 | Almacenes de Datos                                                     |
   |            42 | Fiabilidad y Gestión de Riesgos                                        |
   |            43 | Líneas de Productos Software                                           |
   |            44 | Procesos de Ingeniería del Software 1                                  |
   |            45 | Tecnologías multimedia                                                 |
   |            46 | Análisis y planificación de las TI                                     |
   |            47 | Desarrollo Rápido de Aplicaciones                                      |
   |            48 | Gestión de la Calidad y de la Innovación Tecnológica                   |
   |            49 | Inteligencia del Negocio                                               |
   |            50 | Procesos de Ingeniería del Software 2                                  |
   |            51 | Seguridad Informática                                                  |
   |            52 | Biologia celular                                                       |
   |            53 | Física                                                                 |
   |            54 | Matemáticas I                                                          |
   |            55 | Química general                                                        |
   |            56 | Química orgánica                                                       |
   |            57 | Biología vegetal y animal                                              |
   |            58 | Bioquímica                                                             |
   |            59 | Genética                                                               |
   |            60 | Matemáticas II                                                         |
   |            61 | Microbiología                                                          |
   |            62 | Botánica agrícola                                                      |
   |            63 | Fisiología vegetal                                                     |
   |            64 | Genética molecular                                                     |
   |            65 | Ingeniería bioquímica                                                  |
   |            66 | Termodinámica y cinética química aplicada                              |
   |            67 | Biorreactores                                                          |
   |            68 | Biotecnología microbiana                                               |
   |            69 | Ingeniería genética                                                    |
   |            70 | Inmunología                                                            |
   |            71 | Virología                                                              |
   |            72 | Bases moleculares del desarrollo vegetal                               |
   |            73 | Fisiología animal                                                      |
   |            74 | Metabolismo y biosíntesis de biomoléculas                              |
   |            75 | Operaciones de separación                                              |
   |            76 | Patología molecular de plantas                                         |
   |            77 | Técnicas instrumentales básicas                                        |
   |            78 | Bioinformática                                                         |
   |            79 | Biotecnología de los productos hortofrutículas                         |
   |            80 | Biotecnología vegetal                                                  |
   |            81 | Genómica y proteómica                                                  |
   |            82 | Procesos biotecnológicos                                               |
   |            83 | Técnicas instrumentales avanzadas                                      |
   +---------------+------------------------------------------------------------------------+
   ```

   

6. Devuelve un listado con todos los departamentos que tienen alguna asignatura que no se haya impartido en ningún curso escolar. El resultado debe mostrar el nombre del departamento y el nombre de la asignatura que no se haya impartido nunca.

   ```mysql
   SELECT d.nombre_departamento, asi.nombre_asignatura
   FROM departamento as d
   LEFT JOIN profesor as p ON p.id_departamento = d.id_departamento
   LEFT JOIN asignatura as asi ON asi.id_profesor_asignatura = p.id_profesor
   LEFT JOIN alumno_se_matricula_asignatura as asm ON asm.id_asignatura = asi.id_asignatura
   LEFT JOIN curso_escolar as c ON c.id_curso_escolar = asm.id_curso_escolar
   WHERE asm.id_asignatura IS NULL;
   
   +---------------------+---------------------------------------------------+
   | nombre_departamento | nombre_asignatura                                 |
   +---------------------+---------------------------------------------------+
   | Informática         | Arquitectura de Computadores                      |
   | Informática         | Estructura de Datos y Algoritmos I                |
   | Informática         | Sistemas Inteligentes                             |
   | Informática         | Fundamentos de Redes de Computadores              |
   | Informática         | Planificación y Gestión de Proyectos Informáticos |
   | Informática         | Ingeniería del Software                           |
   | Informática         | Sistemas Operativos                               |
   | Informática         | Bases de Datos                                    |
   | Informática         | Estructura de Datos y Algoritmos II               |
   | Informática         | Programación de Servicios Software                |
   | Informática         | Desarrollo de interfaces de usuario               |
   | Informática         | NULL                                              |
   | Informática         | NULL                                              |
   | Matemáticas         | NULL                                              |
   | Matemáticas         | NULL                                              |
   | Matemáticas         | NULL                                              |
   | Economía y Empresa  | NULL                                              |
   | Economía y Empresa  | NULL                                              |
   | Educación           | NULL                                              |
   | Educación           | NULL                                              |
   | Educación           | NULL                                              |
   | Agronomía           | NULL                                              |
   | Química y Física    | NULL                                              |
   | Química y Física    | NULL                                              |
   | Filología           | NULL                                              |
   | Derecho             | NULL                                              |
   | Biología y Geología | NULL                                              |
   +---------------------+---------------------------------------------------+
   ```

   

### Consultas resumen

1. Devuelve el número total de alumnas que hay.

   ```mysql
   SELECT COUNT(id_alumno) as 'Total de alumnas'
   FROM alumno
   WHERE codigo_sexo = 2;
   
   +------------------+
   | Total de alumnas |
   +------------------+
   |                3 |
   +------------------+
   ```

   

2. Calcula cuántos alumnos nacieron en 1999.

   ```mysql
   SELECT COUNT(id_alumno) as 'Total alumnos nacidos 1999'
   FROM alumno
   WHERE YEAR(fecha_nacimiento_al) = 1999;
   
   +----------------------------+
   | Total alumnos nacidos 1999 |
   +----------------------------+
   |                          2 |
   +----------------------------+
   ```

   

3. Calcula cuántos profesores hay en cada departamento. El resultado sólo debe mostrar dos columnas, una con el nombre del departamento y otra con el número de profesores que hay en ese departamento. El resultado sólo debe incluir los departamentos que tienen profesores asociados y deberá estar ordenado de mayor a menor por el número de profesores.

   ```mysql
   SELECT d.nombre_departamento, COUNT(p.id_profesor)
   FROM profesor as p
   INNER JOIN departamento as d ON p.id_departamento = d.id_departamento
   GROUP BY d.nombre_departamento;
   
   +---------------------+----------------------+
   | nombre_departamento | COUNT(p.id_profesor) |
   +---------------------+----------------------+
   | Informática         |                    4 |
   | Matemáticas         |                    3 |
   | Economía y Empresa  |                    2 |
   | Educación           |                    3 |
   | Agronomía           |                    1 |
   | Química y Física    |                    2 |
   +---------------------+----------------------+
   ```

   

4. Devuelve un listado con todos los departamentos y el número de profesores que hay en cada uno de ellos. Tenga en cuenta que pueden existir departamentos que no tienen profesores asociados. Estos departamentos también tienen que aparecer en el listado.

   ```mysql
   SELECT d.nombre_departamento, COUNT(p.id_profesor)
   FROM profesor as p
   RIGHT JOIN departamento as d ON p.id_departamento = d.id_departamento
   GROUP BY d.nombre_departamento;
   
   +---------------------+----------------------+
   | nombre_departamento | COUNT(p.id_profesor) |
   +---------------------+----------------------+
   | Informática         |                    4 |
   | Matemáticas         |                    3 |
   | Economía y Empresa  |                    2 |
   | Educación           |                    3 |
   | Agronomía           |                    1 |
   | Química y Física    |                    2 |
   | Filología           |                    0 |
   | Derecho             |                    0 |
   | Biología y Geología |                    0 |
   +---------------------+----------------------+
   ```

   

5. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. Tenga en cuenta que pueden existir grados que no tienen asignaturas asociadas. Estos grados también tienen que aparecer en el listado. El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.

   ```mysql
   SELECT g.nombre_grado, COUNT(a.id_asignatura)
   FROM grado as g
   LEFT JOIN asignatura as a ON a.id_grado_asignatura = g.id_grado
   GROUP BY g.nombre_grado
   ORDER BY COUNT(a.id_asignatura);
   
   +--------------------------------------------------------+------------------------+
   | nombre_grado                                           | COUNT(a.id_asignatura) |
   +--------------------------------------------------------+------------------------+
   | Grado en Ingeniería Agrícola (Plan 2015)               |                      0 |
   | Grado en Ingeniería Eléctrica (Plan 2014)              |                      0 |
   | Grado en Ingeniería Electrónica Industrial (Plan 2010) |                      0 |
   | Grado en Ingeniería Mecánica (Plan 2010)               |                      0 |
   | Grado en Ingeniería Química Industrial (Plan 2010)     |                      0 |
   | Grado en Ciencias Ambientales (Plan 2009)              |                      0 |
   | Grado en Matemáticas (Plan 2010)                       |                      0 |
   | Grado en Química (Plan 2009)                           |                      0 |
   | Grado en Biotecnología (Plan 2015)                     |                     32 |
   | Grado en Ingeniería Informática (Plan 2015)            |                     51 |
   +--------------------------------------------------------+------------------------+
   ```

   

6. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas.

   ```mysql
   SELECT g.nombre_grado, COUNT(a.id_asignatura) as 'Número de asignaturas'
   FROM grado as g
   INNER JOIN asignatura as a ON a.id_grado_asignatura = g.id_grado
   GROUP BY g.nombre_grado
   HAVING COUNT(a.id_asignatura) > 40;
   
   +---------------------------------------------+-----------------------+
   | nombre_grado                                | Número de asignaturas |
   +---------------------------------------------+-----------------------+
   | Grado en Ingeniería Informática (Plan 2015) |                    51 |
   +---------------------------------------------+-----------------------+
   ```

   

7. Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos que hay para cada tipo de asignatura. El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que hay de ese tipo. Ordene el resultado de mayor a menor por el número total de crédidos. 

   ```mysql
   SELECT g.nombre_grado as 'Nombre Grado', ta.nombre_asignatura, SUM(a.creditos)
   FROM grado as g
   INNER JOIN asignatura as a ON a.id_grado_asignatura = g.id_grado
   INNER JOIN tipo_asignatura as ta ON ta.id_tipo_asignatura = a.codigo_tipo_asignatura
   GROUP BY g.nombre_grado, ta.nombre_asignatura
   ORDER BY SUM(a.creditos) DESC;
   
   +---------------------------------------------+-------------------+-----------------+
   | Nombre Grado                                | nombre_asignatura | SUM(a.creditos) |
   +---------------------------------------------+-------------------+-----------------+
   | Grado en Ingeniería Informática (Plan 2015) | optativa          |             180 |
   | Grado en Biotecnología (Plan 2015)          | obligatoria       |             120 |
   | Grado en Ingeniería Informática (Plan 2015) | básica            |              72 |
   | Grado en Biotecnología (Plan 2015)          | básica            |              60 |
   | Grado en Ingeniería Informática (Plan 2015) | obligatoria       |              54 |
   +---------------------------------------------+-------------------+-----------------+
   ```

   

8. Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. El resultado deberá mostrar dos columnas, una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados.

   ```mysql
   SELECT c.anyo_inicio as 'Año de inicio', COUNT(a.id_alumno) as 'Alumnos Matriculados'
   FROM alumno as a
   INNER JOIN alumno_se_matricula_asignatura as asm ON asm.id_alumno_asignatura = a.id_alumno
   INNER JOIN curso_escolar as c ON c.id_curso_escolar = asm.id_curso_escolar
   GROUP BY anyo_inicio;
   
   +---------------+----------------------+
   | Año de inicio | Alumnos Matriculados |
   +---------------+----------------------+
   |          2014 |                   17 |
   |          2015 |                   13 |
   |          2016 |                    3 |
   |          2017 |                    3 |
   +---------------+----------------------+
   ```

   

9. Devuelve un listado con el número de asignaturas que imparte cada profesor. El listado debe tener en cuenta aquellos profesores que no imparten ninguna asignatura. El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. El resultado estará ordenado de mayor a menor por el número de asignaturas.

   ```mysql
   SELECT p.id_profesor as 'ID', p.nombre_profesor as 'Nombre profesor', p.apellido1, p.apellido2, COUNT(a.id_asignatura)
   FROM asignatura as a
   RIGHT JOIN profesor as p ON p.id_profesor = a.id_profesor_asignatura
   GROUP BY p.id_profesor
   ORDER BY COUNT(a.id_asignatura) DESC;
   
   +----+-----------------+-----------+------------+------------------------+
   | ID | Nombre profesor | apellido1 | apellido2  | COUNT(a.id_asignatura) |
   +----+-----------------+-----------+------------+------------------------+
   | 14 | Óscar           | Gelvez    | Ramírez    |                      6 |
   |  3 | Lusvin          | Amado     | Forero     |                      5 |
   |  5 | Mario           | Morales   | Cordero    |                      0 |
   |  8 | Silvia          | Becerra   | Bayona     |                      0 |
   | 10 | Deisy           | Rincón    | Albarracín |                      0 |
   | 12 | Carmen          | Aristegui | Beltrán    |                      0 |
   | 13 | Victor          | Solarte   | David      |                      0 |
   | 15 | Alejandro       | Arboleda  | Beltrán    |                      0 |
   | 16 | Antonio         | Banderas  | Arrieta    |                      0 |
   | 17 | Juan            | Quijano   | Rodríguez  |                      0 |
   | 18 | Michael         | Chacón    | Martínez   |                      0 |
   | 20 | Francia         | Marquez   | Petro      |                      0 |
   | 21 | Pedro           | Afanador  | Ramírez    |                      0 |
   | 22 | Juan            | Martínez  | Acuña      |                      0 |
   | 23 | Rodolfo         | Llinás    | Hernández  |                      0 |
   +----+-----------------+-----------+------------+------------------------+
   ```

   

### Subconsultas

1. Devuelve todos los datos del alumno más joven. 

   ```mysql
   SELECT a.id_alumno, a.nif_alumno, a.nombre_alumno as 'Nombre', a.apellido1, a.apellido2, a.fecha_nacimiento_al, a.codigo_sexo
   FROM alumno as a
   WHERE a.fecha_nacimiento_al = (
       SELECT MAX(fecha_nacimiento_al)
       FROM alumno
   );
   +-----------+------------+--------+-----------+-----------+---------------------+-------------+
   | id_alumno | nif_alumno | Nombre | apellido1 | apellido2 | fecha_nacimiento_al | codigo_sexo |
   +-----------+------------+--------+-----------+-----------+---------------------+-------------+
   |         4 | 17105885A  | Sergio | Cely      | Topia     | 2000-10-05          |           1 |
   +-----------+------------+--------+-----------+-----------+---------------------+-------------+
   ```

   

2. Devuelve un listado con los profesores que no están asociados a un departamento.

   ```mysql
   SELECT p.id_profesor, p.nombre_profesor, p.nif_profesor
   FROM profesor as p
   WHERE p.id_departamento = (
       SELECT id_departamento
       FROM profesor
       WHERE id_departamento IS NULL
   );
   
   La consulta está vacía porque todos los docentes están asociados a un departamento
   ```

   

3. Devuelve un listado con los departamentos que no tienen profesores asociados.

   ```mysql
   SELECT d.id_departamento, d.nombre_departamento
   FROM departamento as d
   WHERE d.id_departamento IN (
       SELECT d.id_departamento
       FROM profesor as p
       RIGHT JOIN departamento as d ON d.id_departamento = p.id_departamento
       WHERE p.id_departamento IS NULL
   );
   
   +-----------------+---------------------+
   | id_departamento | nombre_departamento |
   +-----------------+---------------------+
   |               7 | Filología           |
   |               8 | Derecho             |
   |               9 | Biología y Geología |
   +-----------------+---------------------+
   ```

   

4. Devuelve un listado con los profesores que tienen un departamento asociado y que no imparten ninguna asignatura.

   ```mysql
   SELECT p.nombre_profesor, p.apellido1, p.apellido2
   FROM profesor as p
   INNER JOIN departamento as d ON d.id_departamento = p.id_departamento
   WHERE p.id_profesor NOT IN (
       SELECT pr.id_profesor
       FROM profesor as pr
       INNER JOIN asignatura as a ON a.id_profesor_asignatura = pr.id_profesor
   );
   
   +-----------------+-----------+------------+
   | nombre_profesor | apellido1 | apellido2  |
   +-----------------+-----------+------------+
   | Mario           | Morales   | Cordero    |
   | Silvia          | Becerra   | Bayona     |
   | Deisy           | Rincón    | Albarracín |
   | Carmen          | Aristegui | Beltrán    |
   | Victor          | Solarte   | David      |
   | Alejandro       | Arboleda  | Beltrán    |
   | Antonio         | Banderas  | Arrieta    |
   | Juan            | Quijano   | Rodríguez  |
   | Michael         | Chacón    | Martínez   |
   | Francia         | Marquez   | Petro      |
   | Pedro           | Afanador  | Ramírez    |
   | Juan            | Martínez  | Acuña      |
   | Rodolfo         | Llinás    | Hernández  |
   +-----------------+-----------+------------+
   ```

   

5. Devuelve un listado con las asignaturas que no tienen un profesor asignado.

   ```mysql
   SELECT asi.nombre_asignatura
   FROM asignatura as asi 
   WHERE id_asignatura IN (
       SELECT a.id_asignatura
       FROM asignatura as a
       LEFT JOIN profesor as p ON p.id_profesor = a.id_profesor_asignatura
       WHERE a.id_profesor_asignatura IS NULL
   );
   
   +------------------------------------------------------------------------+
   | nombre_asignatura                                                      |
   +------------------------------------------------------------------------+
   | Álgegra lineal y matemática discreta                                   |
   | Cálculo                                                                |
   | Física para informática                                                |
   | Introducción a la programación                                         |
   | Organización y gestión de empresas                                     |
   | Estadística                                                            |
   | Estructura y tecnología de computadores                                |
   | Fundamentos de electrónica                                             |
   | Lógica y algorítmica                                                   |
   | Metodología de la programación                                         |
   | Ingeniería de Requisitos                                               |
   | Integración de las Tecnologías de la Información en las Organizaciones |
   | Modelado y Diseño del Software 1                                       |
   | Multiprocesadores                                                      |
   | Seguridad y cumplimiento normativo                                     |
   | Sistema de Información para las Organizaciones                         |
   | Tecnologías web                                                        |
   | Teoría de códigos y criptografía                                       |
   | Administración de bases de datos                                       |
   | Herramientas y Métodos de Ingeniería del Software                      |
   | Informática industrial y robótica                                      |
   | Ingeniería de Sistemas de Información                                  |
   | Modelado y Diseño del Software 2                                       |
   | Negocio Electrónico                                                    |
   | Periféricos e interfaces                                               |
   | Sistemas de tiempo real                                                |
   | Tecnologías de acceso a red                                            |
   | Tratamiento digital de imágenes                                        |
   | Administración de redes y sistemas operativos                          |
   | Almacenes de Datos                                                     |
   | Fiabilidad y Gestión de Riesgos                                        |
   | Líneas de Productos Software                                           |
   | Procesos de Ingeniería del Software 1                                  |
   | Tecnologías multimedia                                                 |
   | Análisis y planificación de las TI                                     |
   | Desarrollo Rápido de Aplicaciones                                      |
   | Gestión de la Calidad y de la Innovación Tecnológica                   |
   | Inteligencia del Negocio                                               |
   | Procesos de Ingeniería del Software 2                                  |
   | Seguridad Informática                                                  |
   | Biologia celular                                                       |
   | Física                                                                 |
   | Matemáticas I                                                          |
   | Química general                                                        |
   | Química orgánica                                                       |
   | Biología vegetal y animal                                              |
   | Bioquímica                                                             |
   | Genética                                                               |
   | Matemáticas II                                                         |
   | Microbiología                                                          |
   | Botánica agrícola                                                      |
   | Fisiología vegetal                                                     |
   | Genética molecular                                                     |
   | Ingeniería bioquímica                                                  |
   | Termodinámica y cinética química aplicada                              |
   | Biorreactores                                                          |
   | Biotecnología microbiana                                               |
   | Ingeniería genética                                                    |
   | Inmunología                                                            |
   | Virología                                                              |
   | Bases moleculares del desarrollo vegetal                               |
   | Fisiología animal                                                      |
   | Metabolismo y biosíntesis de biomoléculas                              |
   | Operaciones de separación                                              |
   | Patología molecular de plantas                                         |
   | Técnicas instrumentales básicas                                        |
   | Bioinformática                                                         |
   | Biotecnología de los productos hortofrutículas                         |
   | Biotecnología vegetal                                                  |
   | Genómica y proteómica                                                  |
   | Procesos biotecnológicos                                               |
   | Técnicas instrumentales avanzadas                                      |
   +------------------------------------------------------------------------+
   ```

   

6. Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.

   ```mysql
   SELECT nombre_departamento
   FROM departamento 
   WHERE id_departamento NOT IN (
       SELECT DISTINCT d.id_departamento
       FROM departamento as d
       LEFT JOIN profesor as p ON p.id_departamento = d.id_departamento
       LEFT JOIN asignatura as asi ON p.id_profesor = asi.id_profesor_asignatura
       WHERE asi.id_asignatura IS NOT NULL
   );
   
   +---------------------+
   | nombre_departamento |
   +---------------------+
   | Matemáticas         |
   | Economía y Empresa  |
   | Educación           |
   | Agronomía           |
   | Química y Física    |
   | Filología           |
   | Derecho             |
   | Biología y Geología |
   +---------------------+
   ```



### Vistas 

1. Vista para listar el primer apellido, segundo apellido y el nombre de todos los alumnos

   ```mysql
   CREATE VIEW listaAlumnos AS
   SELECT apellido1, apellido2, nombre_alumno
   FROM alumno
   ORDER BY apellido1 ASC, apellido2 ASC, nombre_alumno ASC;
   ```

   

2. Vista para listar nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos

   ```mysql
   CREATE VIEW listaAlumnosNoTelefono AS
   SELECT a.nombre_alumno, a.apellido1, a.apellido2
   FROM alumno as a
   LEFT JOIN telefono_alumno as ta ON ta.codigo_alumno_tel = a.id_alumno
   WHERE ta.codigo_alumno_tel IS NULL
   ```

3. Vista para listar los alumnos que nacieron en 1999.

   ```mysql
   CREATE VIEW listaAlumnosNoventaNueve AS
   SELECT id_alumno, nif_alumno, nombre_alumno, apellido1, apellido2, fecha_nacimiento_al, codigo_sexo
   FROM alumno 
   WHERE YEAR(fecha_nacimiento_al) = 1999;
   ```

4. Vista para listar las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que tiene el identificador 7.

   ```mysql
   CREATE VIEW listaAsignaturasPrimerCuatrimestre AS
   SELECT id_asignatura, nombre_asignatura, creditos, curso, cuatrimestre, id_profesor_asignatura, id_grado_asignatura, codigo_tipo_asignatura
   FROM asignatura
   WHERE cuatrimestre = 1 AND curso = 3 AND id_grado_asignatura = 7;
   ```

5. Vista para listarlas alumnas que se han matriculado alguna vez en el Grado en Ingeniería Informática (Plan 2015)

   ```mysql
   CREATE VIEW listaAlumnasInformatica AS
   SELECT a.id_alumno, a.nif_alumno, a.nombre_alumno, a.apellido1, a.apellido2, a.fecha_nacimiento_al, a.codigo_sexo
   FROM alumno as a 
   INNER JOIN alumno_se_matricula_asignatura as asm ON asm.id_alumno_asignatura = a.id_alumno
   INNER JOIN asignatura as asi ON asi.id_asignatura = asm.id_asignatura
   INNER JOIN grado as g ON g.id_grado = asi.id_grado_asignatura
   INNER JOIN sexo as s ON s.id_sexo = a.codigo_sexo 
   WHERE g.nombre_grado = 'Grado en Ingeniería Informática (Plan 2015)' AND s.id_sexo = 2;
   ```

6. Vista para listar los profesores que no están asociados a un departamento

   ```mysql
   CREATE VIEW profesoresNoAsociadosDepartamento
   SELECT p.id_profesor as 'ID', p.nombre_profesor as 'Nombre Profesor'
   FROM profesor as p 
   LEFT JOIN departamento as d ON d.id_departamento = p.id_departamento
   WHERE d.id_departamento IS NULL;
   ```

7. Vista para listar los departamentos que no tienen profesores asociados.

   ```mysql
   CREATE VIEW departamentosNoProfesores
   SELECT d.nombre_departamento as 'Nombre'
   FROM profesor as p 
   RIGHT JOIN departamento as d ON d.id_departamento = p.id_departamento
   WHERE p.id_departamento IS NULL;
   ```

8. Vista para listar  los profesores que no imparten ninguna asignatura

   ```mysql
   CREATE VIEW profesoresNoAsignatura
   SELECT p.nombre_profesor as 'Nombre Profesor', p.apellido1, p.apellido2
   FROM profesor as p
   LEFT JOIN asignatura as a ON p.id_profesor = a.id_profesor_asignatura
   WHERE a.id_profesor_asignatura IS NULL;
   ```

9. Vista para las asignaturas que no tienen un profesor asignado

   ```mysql
   CREATE VIEW asignaturaNoProfesor
   SELECT a.id_asignatura, a.nombre_asignatura
   FROM profesor as p
   RIGHT JOIN asignatura as a ON p.id_profesor = a.id_profesor_asignatura
   WHERE a.id_profesor_asignatura IS NULL;
   ```

10. Vista para listar el número total de alumnas que hay

    ```mysql
    CREATE VIEW numeroAlumnas
    SELECT COUNT(id_alumno) as 'Total de alumnas'
    FROM alumno
    WHERE codigo_sexo = 2;
    ```

    