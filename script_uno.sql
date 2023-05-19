
CREATE DATABASE plataforma_cursosonline;

-- Seleccionar la base de datos
USE plataforma_cursosonline;

-- Crear la tabla Usuarios
CREATE TABLE Usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50)NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    rol ENUM('Estudiante', 'Docente')
);

-- Crear la tabla Cursos
CREATE TABLE Cursos (
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario) ON UPDATE CASCADE
);

-- Crear la tabla Lecciones
CREATE TABLE Lecciones (
    id_leccion INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(100) NOT NULL,
    duracion TIME UNSIGNED NOT NULL,
    id_curso INT NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso) ON UPDATE CASCADE
);

-- Crear la tabla Progreso
CREATE TABLE Progreso (
    id_progreso INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    id_leccion INT NOT NULL,
    id_curso INT NOT NULL,
    fecha_finalizacion DATE,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario) ON UPDATE CASCADE,
    FOREIGN KEY (id_leccion) REFERENCES Lecciones(id_leccion) ON UPDATE CASCADE,
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso) ON UPDATE CASCADE
);

-- insertar una nueva tabla al campo progreso
ALTER TABLE Progreso
ADD COLUMN id_curso INT NOT NULL,
ADD FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso) ON UPDATE CASCADE;