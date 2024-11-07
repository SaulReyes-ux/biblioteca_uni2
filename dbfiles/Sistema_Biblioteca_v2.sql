USE BD_Sistema_BiBlioteca;

-- Crear tabla libros
CREATE TABLE IF NOT EXISTS tbl_libro (
    cveLibro INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tituloLibro VARCHAR(255) NOT NULL,
    autor VARCHAR(255) NOT NULL,
    fechaPublicacion DATE,
    genero VARCHAR(100),
    estatusPrestamo BOOLEAN,
    estatus BOOLEAN,
    imagen VARCHAR(2000)
);

-- Crear tabla usuarios
CREATE TABLE IF NOT EXISTS tbl_usuario (
    cveUsuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    apellidoPa VARCHAR(255) NOT NULL,
    apellidoMa VARCHAR(255) NOT NULL,
    correo VARCHAR(255) NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    telefono INT(10) NOT NULL,
    rol BOOLEAN,
    estatus BOOLEAN
);

-- Crear tabla historial_prestamo
CREATE TABLE IF NOT EXISTS tbl_historialPrestamo (
    cveHistorial INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cveUsuario INT NOT NULL,
    cveLibro INT NOT NULL,
    fechaPrestamo DATE,
    fechaDevolucion DATE,
    FOREIGN KEY (cveUsuario) REFERENCES tbl_usuario(cveUsuario),
    FOREIGN KEY (cveLibro) REFERENCES tbl_libro(cveLibro)
);

-- Crear tabla prestamo_digital
CREATE TABLE IF NOT EXISTS tbl_prestamoDigital (
    cveDigital INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cveUsuario INT NOT NULL,
    cveLibro INT NOT NULL,
    fechaDevolucion DATE,
    muestra BOOLEAN,
    FOREIGN KEY (cveUsuario) REFERENCES tbl_usuario(cveUsuario),
    FOREIGN KEY (cveLibro) REFERENCES tbl_libro(cveLibro)
);
