DROP DATABASE IF EXISTS aeropuerto;
CREATE DATABASE aeropuerto;
USE aeropuerto;

CREATE TABLE continente (
    id INT PRIMARY KEY AUTO_INCREMENT,
    codigo INT,
    nombre VARCHAR(100)
);

CREATE TABLE pais (
    id INT PRIMARY KEY AUTO_INCREMENT,
    codigo INT,
    nombre VARCHAR(100),
    continente_id INT,
    FOREIGN KEY (continente_id) REFERENCES continente(id)
);

CREATE TABLE estado (
    id INT PRIMARY KEY AUTO_INCREMENT,
    codigo INT,
    nombre VARCHAR(50),
    pais_id INT,
    FOREIGN KEY (pais_id) REFERENCES pais(id)
);

CREATE TABLE ciudad (
    id INT PRIMARY KEY AUTO_INCREMENT,
    codigo INT,
    nombre VARCHAR(100),
    estado_id INT,
    pais_id INT,
    FOREIGN KEY (estado_id) REFERENCES estado(id),
    FOREIGN KEY (pais_id) REFERENCES pais(id)
);

CREATE TABLE aerolinea(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    pais_id INT,
    FOREIGN KEY (pais_id) REFERENCES pais(id) 
);

CREATE TABLE aviones(
    id INT PRIMARY KEY AUTO_INCREMENT,
    matricula VARCHAR(50) NOT NULL,
    tipo_de_avion VARCHAR(100) NOT NULL,
    capacidad_de_carga INT,
    aerolinea_id INT,
    FOREIGN KEY (aerolinea_id) REFERENCES aerolinea(id)
);

CREATE TABLE estado_vuelo(
    id INT PRIMARY KEY AUTO_INCREMENT,
    horarios_real_despegue TIME,
    horarios_real_aterrizaje TIME,
    estado_actual VARCHAR(100) NOT NULL
);

CREATE TABLE vuelos(
    numero_de_vuelo INT PRIMARY KEY AUTO_INCREMENT,
    ciudad_de_origen VARCHAR(100) NOT NULL, 
    ciudad_de_destino VARCHAR(100) NOT NULL,
    fecha_entrada DATE,
    fecha_salida DATE,
    hora_programada_salida TIME,
    hora_programada_llegada TIME,
    aerolinea_id INT,
    avion_id INT,
    estado_vuelo_id INT,
    FOREIGN KEY (aerolinea_id) REFERENCES aerolinea(id),
    FOREIGN KEY (avion_id) REFERENCES aviones(id),
    FOREIGN KEY (estado_vuelo_id) REFERENCES estado_vuelo(id)
);

CREATE TABLE tripulacion(
    numero_de_identificacion INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    rol VARCHAR(100) NOT NULL
);

CREATE TABLE vuelo_tripulacion(
    vuelos_numero_de_vuelo INT,
    tripulacion_numero_identificacion INT,
    FOREIGN KEY (vuelos_numero_de_vuelo) REFERENCES vuelos(numero_de_vuelo),
    FOREIGN KEY (tripulacion_numero_identificacion) REFERENCES tripulacion(numero_de_identificacion)
);

-- Inserciones
INSERT INTO continente( codigo, nombre) VALUES ( 1876, 'jahdhsj');
INSERT INTO continente( codigo, nombre) VALUES ( 1943, 'aaahhqiq');
INSERT INTO continente( codigo, nombre) VALUES ( 1290, 'dsjiid');
SELECT * FROM continente;
INSERT INTO pais( codigo, nombre, continente_id) VALUES ( 1110, 'chile', 1);
INSERT INTO pais( codigo, nombre, continente_id) VALUES ( 1120, 'ecuador', 2);
INSERT INTO pais( codigo, nombre, continente_id) VALUES ( 1231, 'colombia', 3);
SELECT * FROM pais;
INSERT INTO estado( codigo, nombre, pais_id) VALUES ( 8712, 'eweww', 1);
INSERT INTO estado( codigo, nombre, pais_id) VALUES ( 0990, 'beeeweww', 2);
INSERT INTO estado( codigo, nombre, pais_id) VALUES ( 1707, 'ewwwwe', 3);
SELECT * FROM estado;
INSERT INTO ciudad( codigo, nombre, estado_id, pais_id) VALUES ( 3245, 'salvador', 3, 1);
INSERT INTO ciudad( codigo, nombre, estado_id, pais_id) VALUES ( 8090, 'sjaa', 2, 2);
INSERT INTO ciudad( codigo, nombre, estado_id, pais_id) VALUES ( 6543, 'bogota', 1, 3);
SELECT * FROM ciudad;
INSERT INTO aerolinea(id, nombre, pais_id) VALUES ( 1,'vianca', 2);
INSERT INTO aerolinea(id, nombre, pais_id) VALUES ( 2,'joda', 1);
SELECT * FROM aerolinea WHERE id IN (1,2);
INSERT INTO aviones(id, matricula, tipo_de_avion, capacidad_de_carga, aerolinea_id) VALUES (123,'543-QWE', 'jet privado', 1350, 1);
INSERT INTO aviones( id, matricula, tipo_de_avion, capacidad_de_carga, aerolinea_id) VALUES (124,'557-ASD', 'avion de carga', 15000, 2);
INSERT INTO aviones( id, matricula, tipo_de_avion, capacidad_de_carga, aerolinea_id) VALUES (125,'111-ZXC', 'avion pesado', 5000, 1);
SELECT * FROM aviones WHERE id IN (123, 124, 125);

INSERT INTO estado_vuelo(id, horarios_real_despegue, horarios_real_aterrizaje, estado_actual) VALUES (2345,'14:00:00', '18:00:00', 'en tierra');
INSERT INTO estado_vuelo(id, horarios_real_despegue, horarios_real_aterrizaje, estado_actual) VALUES (2098,'18:00:00', '20:00:00', 'en aire');
INSERT INTO estado_vuelo(id, horarios_real_despegue, horarios_real_aterrizaje, estado_actual) VALUES ( 1000,'20:00:00', '22:00:00', 'esta retrasado');
SELECT * FROM estado_vuelo WHERE id IN (2345,2098,1000);
INSERT INTO vuelos(numero_de_vuelo,aerolinea_id, ciudad_de_origen, ciudad_de_destino, fecha_entrada, fecha_salida, hora_programada_salida, hora_programada_llegada, avion_id, estado_vuelo_id) VALUES (1, 1, 'neiva', 'pitalito', '2024-09-17', '2024-09-18', '06:00:00', '10:00:00', 123, 2345);
INSERT INTO vuelos(numero_de_vuelo,aerolinea_id, ciudad_de_origen, ciudad_de_destino, fecha_entrada, fecha_salida, hora_programada_salida, hora_programada_llegada, avion_id, estado_vuelo_id) VALUES ( 2, 1, 'neiva', 'acevedo', '2024-09-18', '2024-09-19', '07:00:00', '11:00:00', 124, 2098);
INSERT INTO vuelos(numero_de_vuelo, aerolinea_id, ciudad_de_origen, ciudad_de_destino, fecha_entrada, fecha_salida, hora_programada_salida, hora_programada_llegada, avion_id, estado_vuelo_id) VALUES ( 3, 1, 'neiva', 'isnos', '2024-09-19', '2024-09-20', '07:30:00', '12:00:00', 125, 1000);
SELECT * FROM vuelos;
INSERT INTO tripulacion(numero_de_identificacion, nombre, rol) VALUES ( 3,'nicolas', 'piloto');
INSERT INTO tripulacion(numero_de_identificacion,nombre, rol) VALUES ( 2,'sebastian', 'copiloto');
INSERT INTO tripulacion(numero_de_identificacion,nombre, rol) VALUES (1,'karen', 'azafata');
SELECT*FROM tripulacion;

