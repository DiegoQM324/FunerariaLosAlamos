# Configuración y Estructura de la Base de Datos

## Índice
1. [Información General](#información-general)
2. [Configuración de la Base de Datos](#configuración-de-la-base-de-datos)
3. [Estructura de las Tablas](#estructura-de-las-tablas)
4. [Relaciones entre Tablas](#relaciones-entre-tablas)


## Información General

Este documento proporciona información sobre la configuración y estructura de la base de datos para nuestra plataforma de streaming de música.

## Configuración de la Base de Datos

### Sistema de Gestión de Base de Datos
Utilizamos Oracle como nuestro sistema de gestión de base de datos .

## Estructura de las Tablas

A continuación se presentan algunas de las tablas principales con sus estructuras:

### USUARIO
```sql
CREATE TABLE usuario (
    id_usuario INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    apellidos VARCHAR(30) NOT NULL,
    rol VARCHAR(20) NOT NULL,
    celular BIGINT NOT NULL,
    correo VARCHAR(40) NOT NULL,
    dni BIGINT NOT NULL,
    contraseña VARCHAR(30) NOT NULL,
    PRIMARY KEY (id_usuario)
);
```

### DIFUNTO
```sql
CREATE TABLE difunto (
    id_difunto INT NOT NULL AUTO_INCREMENT,
    nombredif VARCHAR(20) NOT NULL,
    apellidosdif VARCHAR(30) NOT NULL,
    fec_nacimiento DATE NOT NULL,
    fec_fallecimiento DATE NOT NULL,
    lugar_fallecimiento VARCHAR(30) NOT NULL,
    PRIMARY KEY (id_difunto)
);
```

### SERVICIO
```sql
CREATE TABLE servicio (
    id_servicio INT NOT NULL AUTO_INCREMENT,
    nombreser VARCHAR(30) NOT NULL,
    descripcion VARCHAR(50) NOT NULL,
    id_plan INT NOT NULL,
    id_asesor INT NOT NULL,
    PRIMARY KEY (id_servicio)
);
```

### PLAN
```sql
CREATE TABLE plan (
    id_plan INT NOT NULL AUTO_INCREMENT,
    nombreplan VARCHAR(30) NOT NULL,
    descripcion VARCHAR(50) NOT NULL,
    costo DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_plan)
);
```

### ASESOR
```sql
CREATE TABLE asesor (
    id_asesor INT NOT NULL AUTO_INCREMENT,
    nombrease VARCHAR(20) NOT NULL,
    apellidosase VARCHAR(30) NOT NULL,
    costo DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_asesor)
);
```

### PAGO
```sql
CREATE TABLE pago (
    id_pago INT NOT NULL AUTO_INCREMENT,
    monto DECIMAL(10,2) NOT NULL,
    fecha DATE NOT NULL,
    metodo_pago VARCHAR(20) NOT NULL,
    comprobante_pago VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_pago)
);
```

### CONTRATO
```sql
CREATE TABLE contrato (
    id_contrato INT NOT NULL AUTO_INCREMENT,
    fec_creacion DATE NOT NULL,
    estado VARCHAR(30) NOT NULL,
    fec_inicio DATE NOT NULL,
    fec_finalizacion DATE NOT NULL,
    id_pago INT NOT NULL,
    id_usuario INT NOT NULL,
    id_servicio INT NOT NULL,
    PRIMARY KEY (id_contrato),
    FOREIGN KEY (id_pago) REFERENCES pago(id_pago),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_servicio) REFERENCES servicio(id_servicio)
);
```

### DETALLES_PAGO
```sql
CREATE TABLE detalles_pago (
    id_detalles_pago INT NOT NULL AUTO_INCREMENT,
    id_pago INT NOT NULL,
    id_cliente INT NOT NULL,
    id_difunto INT NOT NULL,
    id_servicio INT NOT NULL,
    id_empleado INT NOT NULL,
    PRIMARY KEY (id_detalles_pago),
    FOREIGN KEY (id_pago) REFERENCES pago(id_pago),
    FOREIGN KEY (id_difunto) REFERENCES difunto(id_difunto),
    FOREIGN KEY (id_servicio) REFERENCES servicio(id_servicio)
);
```

## Relaciones entre Tablas

```sql
-- Llaves Foráneas

ALTER TABLE detalles_pago ADD CONSTRAINT fk_detalles_pago_pago
    FOREIGN KEY (id_pago) REFERENCES pago (id_pago);

ALTER TABLE detalles_pago ADD CONSTRAINT fk_detalles_pago_difunto
    FOREIGN KEY (id_difunto) REFERENCES difunto (id_difunto);

ALTER TABLE detalles_pago ADD CONSTRAINT fk_detalles_pago_servicio
    FOREIGN KEY (id_servicio) REFERENCES servicio (id_servicio);

ALTER TABLE detalles_pago ADD CONSTRAINT fk_detalles_pago_empleado
    FOREIGN KEY (id_empleado) REFERENCES usuario (id_usuario);

ALTER TABLE servicio ADD CONSTRAINT fk_servicio_plan
    FOREIGN KEY (id_plan) REFERENCES plan (id_plan);

ALTER TABLE servicio ADD CONSTRAINT fk_servicio_asesor
    FOREIGN KEY (id_asesor) REFERENCES asesor (id_asesor);
    
ALTER TABLE contrato ADD CONSTRAINT fk_contrato_pago
    FOREIGN KEY (id_pago) REFERENCES pago (id_pago);
    
ALTER TABLE contrato ADD CONSTRAINT fk_contrato_usuario
    FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario);
    
ALTER TABLE contrato ADD CONSTRAINT fk_contrato_servicio
    FOREIGN KEY (id_servicio) REFERENCES servicio (id_servicio);

```
Para más detalles sobre las tablas y relaciones, consulte el diagrama de la base de datos en el archivo `diagrama entidad-relación.png`.
