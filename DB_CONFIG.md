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
    id_usuario INTEGER NOT NULL,
    nombre     VARCHAR2(20 BYTE) NOT NULL,
    apellidos  VARCHAR2(30 BYTE) NOT NULL,
    rol        VARCHAR2(20 BYTE) NOT NULL,
    celular    INTEGER NOT NULL,
    correo     VARCHAR2(40 BYTE) NOT NULL,
    dni        INTEGER NOT NULL,
    contraseña VARCHAR2(30 BYTE) NOT NULL
);

ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY (id_usuario);
```

### DIFUNTO
```sql
CREATE TABLE difunto (
    id_difunto          INTEGER NOT NULL,
    nombredif           VARCHAR2(20 BYTE) NOT NULL,
    apellidosdif        VARCHAR2(30 BYTE) NOT NULL,
    fec_nacimiento      DATE NOT NULL,
    fec_fallecimiento   DATE NOT NULL,
    lugar_fallecimiento VARCHAR2(30 BYTE) NOT NULL
);

ALTER TABLE difunto ADD CONSTRAINT difunto_pk PRIMARY KEY (id_difunto);
```

### SERVICIO
```sql
CREATE TABLE servicio (
    id_servicio INTEGER NOT NULL,
    nombreser   VARCHAR2(30 BYTE) NOT NULL,
    descripción VARCHAR2(50 BYTE) NOT NULL,
    id_plan     INTEGER NOT NULL,
    id_asesor   INTEGER NOT NULL
);

ALTER TABLE servicio ADD CONSTRAINT servicio_pk PRIMARY KEY (id_servicio);
```

### PLAN
```sql
CREATE TABLE plan (
    id_plan     INTEGER NOT NULL,
    nombreplan  VARCHAR2(30 BYTE) NOT NULL,
    descripción VARCHAR2(50 BYTE) NOT NULL,
    costo       NUMBER NOT NULL
);

ALTER TABLE plan ADD CONSTRAINT plan_pk PRIMARY KEY (id_plan);
```

### ASESOR
```sql
CREATE TABLE asesor (
    id_asesor    INTEGER NOT NULL,
    nombrease    VARCHAR2(20 BYTE) NOT NULL,
    apellidosase VARCHAR2(30 BYTE) NOT NULL,
    costo        NUMBER NOT NULL
);

ALTER TABLE asesor ADD CONSTRAINT asesor_pk PRIMARY KEY (id_asesor);
```

### PAGO
```sql
CREATE TABLE pago (
    id_pago          INTEGER NOT NULL,
    monto            NUMBER NOT NULL,
    fecha            DATE NOT NULL,
    metodo_papo      VARCHAR2(20 BYTE) NOT NULL,
    comprobante_pago VARCHAR2(20 BYTE) NOT NULL
);

ALTER TABLE pago ADD CONSTRAINT pago_pk PRIMARY KEY (id_pago);
```

### CONTRATO
```sql
CREATE TABLE contrato (
    id_contrato      INTEGER NOT NULL,
    fec_creacion     DATE NOT NULL,
    estado           VARCHAR2(30 BYTE) NOT NULL,
    fec_inicio       DATE NOT NULL,
    fec_finalización DATE NOT NULL,
    id_pago          INTEGER NOT NULL,
    id_usuario       INTEGER NOT NULL,
    id_servicio      INTEGER NOT NULL
);

ALTER TABLE contrato ADD CONSTRAINT contrato_pk PRIMARY KEY ( id_contrato );
```

### DETALLES_PAGO
```sql
CREATE TABLE detalles_pago (
    id_detalles_pago INTEGER NOT NULL,
    id_pago          INTEGER NOT NULL,
    id_cliente       INTEGER NOT NULL,
    id_difunto       INTEGER NOT NULL,
    id_servicio      INTEGER NOT NULL,
    id_empleado      INTEGER NOT NULL
);

ALTER TABLE detalles_pago ADD CONSTRAINT detalles_pago_pk PRIMARY KEY (id_detalles_pago);
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
