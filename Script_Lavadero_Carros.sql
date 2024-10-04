
CREATE TABLE cliente (
    n_id_cliente                     INTEGER NOT NULL,
    nombre                           NVARCHAR2(50) NOT NULL,
    apellido                         NVARCHAR2(50) NOT NULL,
    dirección                        NVARCHAR2(50),
    teléfono                         NVARCHAR2(15), 
--  ERROR: Column name length exceeds maximum allowed length(30) 
    tipo_documento_id_tipo_identidad INTEGER NOT NULL
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( n_id_cliente );

CREATE TABLE empleado (
    n_id_empleado                    INTEGER NOT NULL,
    nombre                           NVARCHAR2(30) NOT NULL,
    apellido                         NVARCHAR2(30) NOT NULL,
    teléfono                         NVARCHAR2(15) NOT NULL, 
--  ERROR: Column name length exceeds maximum allowed length(30) 
    tipo_documento_id_tipo_identidad INTEGER NOT NULL,
    fecha_ingreso                    DATE NOT NULL,
    fecha_salida                     DATE
);

ALTER TABLE empleado ADD CONSTRAINT empleado_pk PRIMARY KEY ( n_id_empleado );

CREATE TABLE liquidación_pago_emp (
    empleado_n_id_empleado INTEGER NOT NULL,
    producido              NUMBER NOT NULL,
    comisión               NUMBER NOT NULL,
    parametro_id           INTEGER NOT NULL,
    pago_id_pago           INTEGER NOT NULL,
    id_liquidación         INTEGER NOT NULL
);

ALTER TABLE liquidación_pago_emp ADD CONSTRAINT liquidación_pago_emp_pk PRIMARY KEY ( id_liquidación );

CREATE TABLE marca (
    nombre_marca NVARCHAR2(30) NOT NULL,
    id_marca     INTEGER NOT NULL
);

ALTER TABLE marca ADD CONSTRAINT marca_pk PRIMARY KEY ( id_marca );

CREATE TABLE pago (
    empleado_n_id_empleado INTEGER NOT NULL,
    fecha                  DATE NOT NULL,
    total_pago             NUMBER NOT NULL,
    registro_id_registro   INTEGER NOT NULL,
    id_pago                INTEGER NOT NULL
);

ALTER TABLE pago ADD CONSTRAINT pago_pk PRIMARY KEY ( id_pago );

CREATE TABLE parametro (
    id         INTEGER NOT NULL,
    porcentaje NUMBER NOT NULL,
    festivo    CHAR(1) NOT NULL
);

ALTER TABLE parametro ADD CONSTRAINT parametro_pk PRIMARY KEY ( id );

CREATE TABLE precio_servicio (
    servicio_id_servicio INTEGER NOT NULL,
    tipo_carroceria_id   INTEGER NOT NULL,
    precio               NUMBER NOT NULL,
    id_precio            INTEGER NOT NULL
);

ALTER TABLE precio_servicio ADD CONSTRAINT precio_servicio_pk PRIMARY KEY ( id_precio );

CREATE TABLE registro (
    vehiculo_placa            NVARCHAR2(7) NOT NULL,
    id_registro               INTEGER NOT NULL,
    fecha_hora_ingreso        DATE NOT NULL,
    fecha_hora_salida         DATE NOT NULL,
    precio_servicio_id_precio INTEGER NOT NULL
);

ALTER TABLE registro ADD CONSTRAINT registro_pk PRIMARY KEY ( id_registro );

CREATE TABLE servicio (
    id_servicio INTEGER NOT NULL,
    nombre      NVARCHAR2(30) NOT NULL,
    descripción NVARCHAR2(100)
);

ALTER TABLE servicio ADD CONSTRAINT servicio_pk PRIMARY KEY ( id_servicio );

CREATE TABLE tipo_carroceria (
    id          INTEGER NOT NULL,
    descripción NVARCHAR2(80) NOT NULL,
    nombre      NVARCHAR2(20) NOT NULL
);

ALTER TABLE tipo_carroceria ADD CONSTRAINT tipo_carroceria_pk PRIMARY KEY ( id );

CREATE TABLE tipo_documento (
    id_tipo_identidad INTEGER NOT NULL,
    descripción       NVARCHAR2(100) NOT NULL
);

ALTER TABLE tipo_documento ADD CONSTRAINT tipo_documento_pk PRIMARY KEY ( id_tipo_identidad );

CREATE TABLE vehiculo (
    placa                NVARCHAR2(7) NOT NULL,
    modelo               INTEGER NOT NULL,
    cliente_n_id_cliente INTEGER NOT NULL,
    tipo_carroceria_id   INTEGER NOT NULL,
    marca_id_marca       INTEGER NOT NULL
);

ALTER TABLE vehiculo ADD CONSTRAINT vehiculo_pk PRIMARY KEY ( placa );

ALTER TABLE cliente
    ADD CONSTRAINT cliente_tipo_documento_fk FOREIGN KEY ( tipo_documento_id_tipo_identidad )
        REFERENCES tipo_documento ( id_tipo_identidad );

ALTER TABLE empleado
    ADD CONSTRAINT empleado_tipo_documento_fk FOREIGN KEY ( tipo_documento_id_tipo_identidad )
        REFERENCES tipo_documento ( id_tipo_identidad );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE liquidación_pago_emp
    ADD CONSTRAINT liquidación_pago_emp_empleado_fk FOREIGN KEY ( empleado_n_id_empleado )
        REFERENCES empleado ( n_id_empleado );

ALTER TABLE liquidación_pago_emp
    ADD CONSTRAINT liquidación_pago_emp_pago_fk FOREIGN KEY ( pago_id_pago )
        REFERENCES pago ( id_pago );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE liquidación_pago_emp
    ADD CONSTRAINT liquidación_pago_emp_parametro_fk FOREIGN KEY ( parametro_id )
        REFERENCES parametro ( id );

ALTER TABLE pago
    ADD CONSTRAINT pago_empleado_fk FOREIGN KEY ( empleado_n_id_empleado )
        REFERENCES empleado ( n_id_empleado );

ALTER TABLE pago
    ADD CONSTRAINT pago_registro_fk FOREIGN KEY ( registro_id_registro )
        REFERENCES registro ( id_registro );

ALTER TABLE precio_servicio
    ADD CONSTRAINT precio_servicio_servicio_fk FOREIGN KEY ( servicio_id_servicio )
        REFERENCES servicio ( id_servicio );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE precio_servicio
    ADD CONSTRAINT precio_servicio_tipo_carroceria_fk FOREIGN KEY ( tipo_carroceria_id )
        REFERENCES tipo_carroceria ( id );

ALTER TABLE registro
    ADD CONSTRAINT registro_precio_servicio_fk FOREIGN KEY ( precio_servicio_id_precio )
        REFERENCES precio_servicio ( id_precio );

ALTER TABLE registro
    ADD CONSTRAINT registro_vehiculo_fk FOREIGN KEY ( vehiculo_placa )
        REFERENCES vehiculo ( placa );

ALTER TABLE vehiculo
    ADD CONSTRAINT vehiculo_cliente_fk FOREIGN KEY ( cliente_n_id_cliente )
        REFERENCES cliente ( n_id_cliente );

ALTER TABLE vehiculo
    ADD CONSTRAINT vehiculo_marca_fk FOREIGN KEY ( marca_id_marca )
        REFERENCES marca ( id_marca );

ALTER TABLE vehiculo
    ADD CONSTRAINT vehiculo_tipo_carroceria_fk FOREIGN KEY ( tipo_carroceria_id )
        REFERENCES tipo_carroceria ( id );



INSERT INTO MARCA (ID_marca, Nombre_marca) VALUES (1, 'Chevrolet');
INSERT INTO MARCA (ID_marca, Nombre_marca) VALUES (2, 'Renault');
INSERT INTO MARCA (ID_marca, Nombre_marca) VALUES (3, 'Toyota');
INSERT INTO MARCA (ID_marca, Nombre_marca) VALUES (4, 'Ford');
INSERT INTO MARCA (ID_marca, Nombre_marca) VALUES (5, 'Nissan');
INSERT INTO MARCA (ID_marca, Nombre_marca) VALUES (6, 'Mazda');
INSERT INTO MARCA (ID_marca, Nombre_marca) VALUES (7, 'Hyundai');
INSERT INTO MARCA (ID_marca, Nombre_marca) VALUES (8, 'Volkswagen');
INSERT INTO MARCA (ID_marca, Nombre_marca) VALUES (9, 'Kia');
INSERT INTO MARCA (ID_marca, Nombre_marca) VALUES (10, 'Honda');
INSERT INTO MARCA (ID_marca, Nombre_marca) VALUES (11, 'Jeep');
INSERT INTO MARCA (ID_marca, Nombre_marca) VALUES (12, 'BMW');
INSERT INTO MARCA (ID_marca, Nombre_marca) VALUES (13, 'Mercedes-Benz');
INSERT INTO MARCA (ID_marca, Nombre_marca) VALUES (14, 'Audi');
INSERT INTO MARCA (ID_marca, Nombre_marca) VALUES (15, 'Subaru');

SELECT* 
FROM MARCA

INSERT INTO TIPO_DOCUMENTO (ID_tipo_identidad, Descripción) VALUES (1, 'Carnet Diplomatico');
INSERT INTO TIPO_DOCUMENTO (ID_tipo_identidad, Descripción) VALUES (2, 'Cedula ciudadania');
INSERT INTO TIPO_DOCUMENTO (ID_tipo_identidad, Descripción) VALUES (3, 'Cedula de extranjeria');
INSERT INTO TIPO_DOCUMENTO (ID_tipo_identidad, Descripción) VALUES (4, 'Pasaporte');
INSERT INTO TIPO_DOCUMENTO (ID_tipo_identidad, Descripción) VALUES (5, 'Tarjeta de Identidad');
INSERT INTO TIPO_DOCUMENTO (ID_tipo_identidad, Descripción) VALUES (6, 'NIT');
INSERT INTO TIPO_DOCUMENTO (ID_tipo_identidad, Descripción) VALUES (7, 'Registro Civil');


SELECT* 
FROM TIPO_DOCUMENTO


INSERT INTO TIPO_CARROCERIA (ID, Nombre, Descripción) VALUES (1, 'Sedan', 'Carrocería de cuatro puertas con espacio para pasajeros y maletero.');
INSERT INTO TIPO_CARROCERIA (ID, Nombre, Descripción) VALUES (2, 'SUV', 'Vehículo utilitario deportivo con espacio para pasajeros y carga.');
INSERT INTO TIPO_CARROCERIA (ID, Nombre, Descripción) VALUES (3, 'Coupe', 'Carrocería de dos puertas con diseño deportivo y techo bajo.');
INSERT INTO TIPO_CARROCERIA (ID, Nombre, Descripción) VALUES (4, 'Camioneta', 'Vehículo con espacio de carga en la parte trasera.');
INSERT INTO TIPO_CARROCERIA (ID, Nombre, Descripción) VALUES (5, 'Furgoneta', 'Vehículo utilitario con espacio de carga y asientos para pasajeros.');
INSERT INTO TIPO_CARROCERIA (ID, Nombre, Descripción) VALUES (6, 'Convertible', 'Carrocería con techo desmontable o plegable.');
INSERT INTO TIPO_CARROCERIA (ID, Nombre, Descripción) VALUES (7, 'Hatchback', 'Carrocería compacta con portón trasero y espacio para pasajeros.');
INSERT INTO TIPO_CARROCERIA (ID, Nombre, Descripción) VALUES (8, 'Pick-up', 'Vehículo con espacio de carga en la parte trasera y cabina para pasajeros.');



select *
from TIPO_CARROCERIA


INSERT INTO SERVICIO (ID_servicio, Nombre, Descripción) VALUES (1, 'Sencillo', 'Lavado exterior y aspirado interior.');
INSERT INTO SERVICIO (ID_servicio, Nombre, Descripción) VALUES (2, 'Sencillo+motor', 'Lavado exterior, aspirado interior y limpieza del motor.');
INSERT INTO SERVICIO (ID_servicio, Nombre, Descripción) VALUES (3, 'Lavado general', 'Lavado exterior, interior y limpieza de detalles.');
INSERT INTO SERVICIO (ID_servicio, Nombre, Descripción) VALUES (4, 'General+motor', 'Lavado completo con atención al motor y detalles.');
INSERT INTO SERVICIO (ID_servicio, Nombre, Descripción) VALUES (5, 'Polichado americano', 'Lavado, pulido y encerado con productos americanos.');
INSERT INTO SERVICIO (ID_servicio, Nombre, Descripción) VALUES (6, 'Polichado orbital', 'Lavado, pulido y encerado con técnica de pulido orbital.');
INSERT INTO SERVICIO (ID_servicio, Nombre, Descripción) VALUES (7, 'Desmanchado', 'Lavado con atención especial a manchas difíciles.');
INSERT INTO SERVICIO (ID_servicio, Nombre, Descripción) VALUES (8, 'Tapizado', 'Limpieza y acondicionamiento del interior y tapizado del vehículo.');
    
SELECT * FROM DUAL;

SELECT * 
FROM SERVICIO;


INSERT INTO PRECIO_SERVICIO (ID_precio, SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio) VALUES (1, 1, 1, 15000);
INSERT INTO PRECIO_SERVICIO (ID_precio, SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio) VALUES (2, 2, 1, 24000);
INSERT INTO PRECIO_SERVICIO (ID_precio, SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio) VALUES (3, 3, 1, 36000);
INSERT INTO PRECIO_SERVICIO (ID_precio, SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio) VALUES (4, 4, 1, 40000);
INSERT INTO PRECIO_SERVICIO (ID_precio, SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio) VALUES (5, 5, 1, 70000);
INSERT INTO PRECIO_SERVICIO (ID_precio, SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio) VALUES (6, 6, 1, 120000);
INSERT INTO PRECIO_SERVICIO (ID_precio, SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio) VALUES (7, 7, 1, 50000);
INSERT INTO PRECIO_SERVICIO (ID_precio, SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio) VALUES (8, 8, 1, 150000);
INSERT INTO PRECIO_SERVICIO (ID_precio, SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio) VALUES (9, 1, 2, 20000);
INSERT INTO PRECIO_SERVICIO (ID_precio, SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio) VALUES (10, 2, 2, 30000);
INSERT INTO PRECIO_SERVICIO (ID_precio, SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio) VALUES (11, 3, 2, 45000);
INSERT INTO PRECIO_SERVICIO (ID_precio, SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio) VALUES (12, 4, 2, 50000);
INSERT INTO PRECIO_SERVICIO (ID_precio, SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio) VALUES (13, 5, 2, 80000);
INSERT INTO PRECIO_SERVICIO (ID_precio, SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio) VALUES (14, 6, 2, 130000);
INSERT INTO PRECIO_SERVICIO (ID_precio, SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio) VALUES (15, 7, 2, 55000);
INSERT INTO PRECIO_SERVICIO (ID_precio, SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio) VALUES (16, 8, 2, 160000);
INSERT INTO PRECIO_SERVICIO (ID_precio, SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio) VALUES (17, 1, 3, 15000);
INSERT INTO PRECIO_SERVICIO (ID_precio, SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio) VALUES (18, 2, 3, 24000);
INSERT INTO PRECIO_SERVICIO (ID_precio, SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio) VALUES (19, 3, 3, 36000);
INSERT INTO PRECIO_SERVICIO (ID_precio, SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio) VALUES (20, 4, 3, 40000);
INSERT INTO PRECIO_SERVICIO (ID_precio, SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio) VALUES (21, 5, 3, 70000);
INSERT INTO PRECIO_SERVICIO (ID_precio, SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio) VALUES (22, 6, 3, 120000);
INSERT INTO PRECIO_SERVICIO (ID_precio, SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio) VALUES (23, 7, 3, 50000);
INSERT INTO PRECIO_SERVICIO (ID_precio, SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio) VALUES (24, 8, 3, 150000);
INSERT INTO PRECIO_SERVICIO (ID_precio, SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio) VALUES (25, 1, 4, 22000);
INSERT INTO PRECIO_SERVICIO (ID_precio, SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio) VALUES (26, 2, 4, 35000);
INSERT INTO PRECIO_SERVICIO (ID_precio, SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio) VALUES (27, 3, 4, 45000);
INSERT INTO PRECIO_SERVICIO (ID_precio, SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio) VALUES (28, 4, 4, 50000);
INSERT INTO PRECIO_SERVICIO (ID_precio, SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio) VALUES (29, 5, 4, 90000);
INSERT INTO PRECIO_SERVICIO (ID_precio, SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio) VALUES (30, 6, 4, 120000);
INSERT INTO PRECIO_SERVICIO (ID_precio, SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio) VALUES (31, 7, 4, 60000);
INSERT INTO PRECIO_SERVICIO (ID_precio, SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio) VALUES (32, 8, 4, 190000);
INSERT INTO PRECIO_SERVICIO (ID_precio, SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio) VALUES (33, 1, 5, 28000);
INSERT INTO PRECIO_SERVICIO (ID_precio, SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio) VALUES (34, 2, 5, 40000);
INSERT INTO PRECIO_SERVICIO (ID_precio, SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio) VALUES (35, 3, 5, 50000);
INSERT INTO PRECIO_SERVICIO (ID_precio, SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio) VALUES (36, 4, 5, 60000);
INSERT INTO PRECIO_SERVICIO (ID_precio, SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio) VALUES (37, 5, 5, 90000);
INSERT INTO PRECIO_SERVICIO (ID_precio, SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio) VALUES (38, 6, 5, 140000);
INSERT INTO PRECIO_SERVICIO (ID_precio, SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio) VALUES (39, 7, 5, 80000);
INSERT INTO PRECIO_SERVICIO (ID_precio, SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio) VALUES (40, 8, 5, 200000);

INSERT INTO PRECIO_SERVICIO (SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio, ID_precio) VALUES (1, 6, 15000, 41);
INSERT INTO PRECIO_SERVICIO (SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio, ID_precio) VALUES (2, 6, 24000, 42);
INSERT INTO PRECIO_SERVICIO (SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio, ID_precio) VALUES (3, 6, 36000, 43);
INSERT INTO PRECIO_SERVICIO (SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio, ID_precio) VALUES (4, 6, 40000, 44);
INSERT INTO PRECIO_SERVICIO (SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio, ID_precio) VALUES (5, 6, 70000, 45);
INSERT INTO PRECIO_SERVICIO (SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio, ID_precio) VALUES (6, 6, 120000, 46);
INSERT INTO PRECIO_SERVICIO (SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio, ID_precio) VALUES (7, 6, 50000, 47);
INSERT INTO PRECIO_SERVICIO (SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio, ID_precio) VALUES (8, 6, 150000, 48);
INSERT INTO PRECIO_SERVICIO (SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio, ID_precio) VALUES (1, 7, 15000, 49);
INSERT INTO PRECIO_SERVICIO (SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio, ID_precio) VALUES (2, 7, 24000, 50);
INSERT INTO PRECIO_SERVICIO (SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio, ID_precio) VALUES (3, 7, 36000, 51);
INSERT INTO PRECIO_SERVICIO (SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio, ID_precio) VALUES (4, 7, 40000, 52);
INSERT INTO PRECIO_SERVICIO (SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio, ID_precio) VALUES (5, 7, 70000, 53);
INSERT INTO PRECIO_SERVICIO (SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio, ID_precio) VALUES (6, 7, 120000, 54);
INSERT INTO PRECIO_SERVICIO (SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio, ID_precio) VALUES (7, 7, 50000, 55);
INSERT INTO PRECIO_SERVICIO (SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio, ID_precio) VALUES (8, 7, 150000, 56);
INSERT INTO PRECIO_SERVICIO (SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio, ID_precio) VALUES (1, 8, 28000, 57);
INSERT INTO PRECIO_SERVICIO (SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio, ID_precio) VALUES (2, 8, 40000, 58);
INSERT INTO PRECIO_SERVICIO (SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio, ID_precio) VALUES (3, 8, 50000, 59);
INSERT INTO PRECIO_SERVICIO (SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio, ID_precio) VALUES (4, 8, 60000, 60);
INSERT INTO PRECIO_SERVICIO (SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio, ID_precio) VALUES (5, 8, 90000, 61);
INSERT INTO PRECIO_SERVICIO (SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio, ID_precio) VALUES (6, 8, 140000, 62);
INSERT INTO PRECIO_SERVICIO (SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio, ID_precio) VALUES (7, 8, 80000, 63);
INSERT INTO PRECIO_SERVICIO (SERVICIO_ID_servicio, TIPO_CARROCERIA_ID, Precio, ID_precio) VALUES (8, 8, 200000, 64);


SELECT*
FROM PRECIO_SERVICIO


INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013206856, 'Dennis', 'Hobbs Griffin', '3015348681', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013077243, 'Cody', 'Gonzalez Malone', '3012849476', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013430683, 'Scott', 'Barber Edwards', '3157823589', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013320698, 'John', 'Pugh Brown', '3128307530', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013474466, 'Bonnie', 'Simmons Johnson', '3153278258', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013027496, 'Tonya', 'Landry Wilson', '3155494687', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013310206, 'Patrick', 'Ball Ward', '3211862268', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013186704, 'Douglas', 'Mora Jordan', '3012336449', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013118190, 'Sherry', 'Camacho Soto', '3014526685', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013070679, 'Cindy', 'Daugherty Banks', '3157663130', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013389644, 'Daniel', 'Graham Clark', '3153873284', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013840322, 'Dwayne', 'Adams Cherry', '3018708528', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013597430, 'Manuel', 'Sanders Williams', '3214735495', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013185559, 'Ronald', 'Anderson Freeman', '3127691112', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013584415, 'Dillon', 'Blackwell Scott', '3017432760', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013451127, 'Jose', 'Maldonado Cain', '3122063998', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013335401, 'Michael', 'Ibarra Sparks', '3151778694', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013415091, 'Samantha', 'Thompson Aguilar', '3016743021', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013556242, 'Billy', 'Whitaker Robertson', '3016251417', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013054637, 'Savannah', 'Morales Perry', '3219611951', 2, 'Bogota');

INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013180351, 'Barbara', 'Macdonald Taylor', '3154547617', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013080855, 'Joseph', 'Gonzalez Dixon', '3219574087', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013355002, 'Kaitlyn', 'Price Schultz', '3129294621', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013474404, 'Jennifer', 'Thomas Morgan', '3128294179', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013183427, 'Joe', 'Preston Dean', '3215405403', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013775449, 'Renee', 'Mooney Thompson', '3126789384', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013169182, 'Brian', 'Thompson Perez', '3155604884', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013441040, 'Jacqueline', 'Kim Harvey', '3016419525', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013048988, 'Connor', 'Wilson Wilkinson', '3216184425', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013004183, 'James', 'Perez Glenn', '3152622471', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013406645, 'Victoria', 'Salinas Burns', '3217013216', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013926750, 'Benjamin', 'Obrien Vaughan', '3125765564', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013101748, 'Kristy', 'Thomas Hernandez', '3017785910', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013957059, 'Jessica', 'Mcneil Dixon', '3120329113', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013319015, 'Nicholas', 'Park Kennedy', '3216070007', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013889819, 'Michael', 'Washington Shepherd', '3018927850', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013934499, 'Kevin', 'Horton Gay', '3120506559', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013060697, 'Erica', 'Clark Velazquez', '3121852535', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013940314, 'Nicole', 'Pace Haas', '3218155848', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013735982, 'Brian', 'Graves Miller', '3218929479', 2, 'Bogota');

INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013096656, 'Michele', 'Jones Anthony', '3123738297', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013743386, 'Victor', 'Willis Pace', '3152161669', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013981437, 'Elizabeth', 'Strong Wilson', '3016849033', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013487500, 'Michelle', 'Mills Reid', '3210466048', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013462227, 'Krystal', 'Shannon Phillips', '3019743729', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013061759, 'Daniel', 'Lawson Rivera', '3212039822', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013315734, 'Eddie', 'Vaughn Boyle', '3152551726', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013418802, 'Paige', 'Thomas Roberts', '3125861048', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013666407, 'Timothy', 'Wagner Davis', '3155880701', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013185309, 'Melanie', 'Salinas Gates', '3216002191', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013090419, 'Nancy', 'Cannon Jackson', '3157299428', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013529695, 'Patricia', 'Miles Love', '3150667585', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013269002, 'George', 'Patel Cruz', '3151816895', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013707141, 'Steven', 'Ortiz Hoover', '3215063842', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013423183, 'Veronica', 'Brown Mclaughlin', '3128261829', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013370217, 'Louis', 'Russell Hardy', '3214957977', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013418480, 'Roy', 'Wells Morales', '3129789852', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013006627, 'Omar', 'Watkins Walsh', '3010355191', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013211255, 'Jeremy', 'Reid Miller', '3128756273', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013437376, 'Gregory', 'Martinez Frank', '3153117837', 2, 'Bogota');

INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013833241, 'Jerry', 'Jenkins Rosales', '3128746203', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013492123, 'Ashley', 'Contreras Williams', '3219703972', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013289220, 'Sandra', 'Stokes Obrien', '3158900436', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013125240, 'Clayton', 'Thompson Hall', '3216850744', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013754856, 'Lisa', 'Kane Gamble', '3019435643', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013665738, 'John', 'Thomas Barker', '3154222892', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013819384, 'Kelly', 'Johnson Alvarado', '3218775559', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013971956, 'Morgan', 'Jackson Mendez', '3013068891', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013842583, 'Steven', 'Wise Meza', '3125964588', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013881011, 'Jason', 'Lee Washington', '3015924760', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013050761, 'Rhonda', 'Middleton Barr', '3155865078', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013022781, 'David', 'Hernandez Brown', '3016533840', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013322309, 'Lance', 'Wong Murray', '3155638677', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013832821, 'Pamela', 'Moyer Cooper', '3014246447', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013442130, 'Mark', 'Clark Harper', '3218635785', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013290809, 'Sandra', 'Richardson Lucero', '3122129588', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013612072, 'Grace', 'Kerr Brooks', '3153570412', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013128311, 'Joshua', 'Mcguire Woods', '3211909432', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013065694, 'Jennifer', 'Rogers Williams', '3210030603', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013697493, 'Elizabeth', 'Tate Fernandez', '3159029476', 2, 'Bogota');

INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013960835, 'Angela', 'Lopez Alexander', '3013282563', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013518905, 'Anthony', 'Allen Ballard', '3128311794', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013161920, 'Nicholas', 'Warner Olson', '3158093915', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013286293, 'Jessica', 'Grant Rodriguez', '3151124560', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013653304, 'Carol', 'Rodriguez Gonzalez', '3154569457', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013448214, 'Rachel', 'Lindsey Carroll', '3151952359', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013442564, 'Heather', 'Dixon Baker', '3216177766', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013180081, 'Jennifer', 'Sanders Mullins', '3212573449', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013801712, 'Melissa', 'Washington Warren', '3154877287', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013788702, 'Megan', 'Roberts Jefferson', '3214964043', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013147536, 'Clinton', 'Dalton Schwartz', '3013425207', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013257619, 'Peter', 'Smith Johnson', '3214642069', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013288881, 'Matthew', 'Gordon Schwartz', '3154832695', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013073683, 'Shelby', 'Oneal Herman', '3152563428', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013693678, 'Dustin', 'House Dunn', '3215224982', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013837152, 'Jennifer', 'Phelps Rogers', '3125913221', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013989330, 'Tanya', 'Rios Morris', '3212028655', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013888944, 'Kenneth', 'Johnson Oconnor', '3219791874', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013517559, 'Kimberly', 'Shields Baker', '3012586919', 2, 'Bogota');
INSERT INTO CLIENTE (N_ID_cliente, Nombre, Apellido, Teléfono, TIPO_DOCUMENTO_ID_tipo_identidad, Dirección) VALUES (1013858923, 'Chelsea', 'Petty Marquez', '3219608727', 2, 'Bogota');

SELECT*
from CLIENTE


INSERT INTO EMPLEADO (N_ID_empleado, TIPO_DOCUMENTO_ID_tipo_identidad, Nombre, Apellido, Teléfono, Fecha_ingreso) VALUES (1013232263, 2, 'Leonardo', 'Santos Ruiz', '3217122282', '03/07/2021'); 

INSERT INTO EMPLEADO (N_ID_empleado, TIPO_DOCUMENTO_ID_tipo_identidad, Nombre, Apellido, Teléfono, Fecha_ingreso) VALUES (1013091016, 2, 'Arturo', 'Reyes Díaz', '3013777688', '27/07/2021'); 

INSERT INTO EMPLEADO (N_ID_empleado, TIPO_DOCUMENTO_ID_tipo_identidad, Nombre, Apellido, Teléfono, Fecha_ingreso) VALUES (1013971833, 2, 'Hernán', 'Mendoza Rodríguez', '3158134240', '18/08/2021'); 

INSERT INTO EMPLEADO (N_ID_empleado, TIPO_DOCUMENTO_ID_tipo_identidad, Nombre, Apellido, Teléfono, Fecha_ingreso) VALUES (1013408271, 2, 'José María', 'Soto Guerra', '3015020014', '20/08/2021'); 

INSERT INTO EMPLEADO (N_ID_empleado, TIPO_DOCUMENTO_ID_tipo_identidad, Nombre, Apellido, Teléfono, Fecha_ingreso) VALUES (1013049665, 2, 'Salvador', 'Torres Guerrero', '3212139169', '17/09/2021'); 

INSERT INTO EMPLEADO (N_ID_empleado, TIPO_DOCUMENTO_ID_tipo_identidad, Nombre, Apellido, Teléfono, Fecha_ingreso) VALUES (1013261919, 2, 'Andrés', 'Flores Villanueva', '3122759821', '22/09/2021'); 

INSERT INTO EMPLEADO (N_ID_empleado, TIPO_DOCUMENTO_ID_tipo_identidad, Nombre, Apellido, Teléfono, Fecha_ingreso) VALUES (1013746130, 3, 'Melquíades', 'Ortega Martínez', '3125396187', '26/09/2021'); 

INSERT INTO EMPLEADO (N_ID_empleado, TIPO_DOCUMENTO_ID_tipo_identidad, Nombre, Apellido, Teléfono, Fecha_ingreso) VALUES (1013631341, 2, 'José', 'Villanueva León', '3153464467', '04/10/2021'); 

INSERT INTO EMPLEADO (N_ID_empleado, TIPO_DOCUMENTO_ID_tipo_identidad, Nombre, Apellido, Teléfono, Fecha_ingreso) VALUES (1013299935, 2, 'Ciro', 'Navarro Figueroa', '3012058261', '08/10/2021'); 

INSERT INTO EMPLEADO (N_ID_empleado, TIPO_DOCUMENTO_ID_tipo_identidad, Nombre, Apellido, Teléfono, Fecha_ingreso) VALUES (1013170129, 2, 'Oscar', 'Ramos Rojas', '3016683287', '10/10/2021'); 


SELECT*
from EMPLEADO

INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('OXT639', 2021, 1013206856, 3, 1);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('JUR325', 2018, 1013077243, 7, 13);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('QSQ689', 2023, 1013430683, 7, 15);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('TVU466', 2001, 1013320698, 6, 7);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('CXS568', 2011, 1013474466, 1, 8);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('OER446', 2023, 1013027496, 3, 11);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('TKY702', 2010, 1013310206, 4, 2);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('DSQ992', 1993, 1013186704, 7, 2);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('IUA561', 1996, 1013118190, 2, 8);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('PVM757', 2010, 1013070679, 5, 7);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('RLQ482', 1999, 1013389644, 3, 8);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('HOX134', 1999, 1013840322, 8, 15);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('ZPB666', 2011, 1013597430, 6, 1);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('MQN969', 1997, 1013185559, 5, 5);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('CYQ078', 2014, 1013584415, 1, 13);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('CCU808', 2023, 1013451127, 2, 7);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('XMN769', 2017, 1013335401, 4, 10);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('ICG294', 2020, 1013415091, 2, 3);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('ODG657', 2011, 1013556242, 3, 15);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('TBS562', 2017, 1013054637, 1, 2);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('LLI973', 2001, 1013180351, 8, 2);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('IKD531', 2011, 1013080855, 5, 12);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('NPE070', 2020, 1013355002, 2, 9);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('BMY846', 1995, 1013474404, 3, 15);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('SUS387', 2006, 1013183427, 5, 1);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('RYB044', 2013, 1013775449, 2, 13);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('KLY678', 1994, 1013169182, 4, 8);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('BUD057', 2008, 1013441040, 7, 11);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('SRI730', 2023, 1013048988, 1, 4);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('UED074', 2016, 1013004183, 4, 7);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('SSB554', 2018, 1013406645, 6, 9);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('PHX836', 1995, 1013926750, 6, 7);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('KAW679', 2023, 1013101748, 6, 9);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('HSN638', 2018, 1013957059, 8, 15);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('WYE201', 1990, 1013319015, 2, 8);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('PZY732', 1993, 1013889819, 3, 9);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('YFK412', 2004, 1013934499, 5, 1);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('PIJ154', 2016, 1013060697, 6, 14);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('CAK618', 2020, 1013940314, 1, 13);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('XHI454', 2002, 1013735982, 2, 4);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('MXE031', 2003, 1013096656, 5, 11);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('QXN771', 2011, 1013743386, 6, 6);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('IIC240', 2012, 1013981437, 6, 9);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('QLB427', 2005, 1013487500, 1, 15);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('QCE742', 1997, 1013462227, 3, 11);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('QLK163', 2017, 1013061759, 3, 11);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('QPY814', 2016, 1013315734, 1, 8);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('CSM615', 2010, 1013418802, 7, 12);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('YIU389', 2001, 1013666407, 7, 3);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('FCE934', 1990, 1013185309, 8, 6);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('PKJ349', 2013, 1013090419, 4, 12);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('EZL100', 2015, 1013529695, 1, 11);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('EBX798', 1996, 1013269002, 2, 7);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('UEM379', 2013, 1013707141, 1, 7);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('YQN419', 2008, 1013423183, 8, 13);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('QZT234', 2008, 1013370217, 5, 15);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('JYT346', 2011, 1013418480, 8, 2);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('HEV920', 2003, 1013006627, 7, 6);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('AFS096', 2003, 1013211255, 6, 8);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('TOW895', 1999, 1013437376, 4, 8);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('IIN290', 2002, 1013833241, 1, 13);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('KZF410', 2016, 1013492123, 8, 10);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('FEU831', 1993, 1013289220, 5, 8);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('XQH077', 1993, 1013125240, 6, 12);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('EWQ389', 2001, 1013754856, 5, 10);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('SBL822', 1999, 1013665738, 4, 1);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('XSS158', 2010, 1013819384, 2, 6);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('NKT368', 1997, 1013971956, 8, 8);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('HQV431', 2010, 1013842583, 2, 8);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('MLK176', 2018, 1013881011, 2, 6);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('JBO099', 2009, 1013050761, 8, 4);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('LTW290', 2023, 1013022781, 2, 13);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('TMM807', 2020, 1013322309, 8, 9);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('GBV448', 2011, 1013832821, 3, 7);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('LFL840', 2021, 1013442130, 8, 10);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('MMD893', 1996, 1013290809, 1, 13);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('EAN052', 2013, 1013612072, 1, 10);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('OYD933', 1997, 1013128311, 6, 5);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('LMS826', 2000, 1013065694, 4, 10);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('FRW375', 2007, 1013697493, 2, 15);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('GEP199', 2018, 1013960835, 2, 7);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('MSQ042', 1994, 1013518905, 3, 2);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('VOP694', 2020, 1013161920, 3, 7);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('NAV806', 2008, 1013286293, 3, 5);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('GBF476', 1994, 1013653304, 3, 3);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('CVY277', 2010, 1013448214, 1, 3);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('AOR334', 2010, 1013442564, 7, 5);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('TTT098', 2000, 1013180081, 3, 15);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('JIE960', 2010, 1013801712, 4, 7);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('FTN445', 2022, 1013788702, 1, 5);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('BKH435', 2023, 1013147536, 3, 6);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('EVN787', 2007, 1013257619, 8, 3);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('SHS507', 1990, 1013288881, 8, 15);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('OIW180', 1996, 1013073683, 5, 11);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('LQP772', 2004, 1013693678, 8, 7);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('OMG637', 2011, 1013837152, 8, 6);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('OWS195', 2015, 1013989330, 4, 1);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('WLT214', 2013, 1013888944, 7, 12);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('KJP007', 2003, 1013517559, 6, 4);
INSERT INTO VEHICULO (Placa, Modelo, CLIENTE_N_ID_cliente, TIPO_CARROCERIA_ID, MARCA_ID_marca) VALUES ('WTA649', 2020, 1013858923, 4, 1);

SELECT*
FROM VEHICULO

------------ JULIO 2021---------------

-- 3 de julio 
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('OXT639', 1, TO_DATE('2021-07-03 12:00:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-07-03 01:20:20', 'YYYY-MM-DD HH24:MI:SS'), 20);

-- 4 de julio 
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('JUR325', 2, TO_DATE('2021-07-04 09:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-07-04 17:30:00', 'YYYY-MM-DD HH24:MI:SS'), 33);

-- 5 de julio 
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('QSQ689', 3, TO_DATE('2021-07-05 09:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-07-05 12:15:00', 'YYYY-MM-DD HH24:MI:SS'), 40);
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('OXT639', 4, TO_DATE('2021-07-05 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-07-05 12:15:00', 'YYYY-MM-DD HH24:MI:SS'), 20);

-- 9 de julio 
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('TVU466', 5, TO_DATE('2021-07-09 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-07-09 16:45:00', 'YYYY-MM-DD HH24:MI:SS'), 17);

-- 10 de junio de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('OXT639', 6, TO_DATE('2021-07-10 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-07-10 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), 20);

-- 14 de julio 
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('CXS568', 7, TO_DATE('2021-07-14 08:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-07-14 11:10:00', 'YYYY-MM-DD HH24:MI:SS'), 42);

-- 15 de julio de 2021
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('OXT639', 8, TO_DATE('2021-07-15 11:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-07-15 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 20);

-- 18 de julio 
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('OER446', 9, TO_DATE('2021-07-18 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-07-18 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 26);

-- 23 de julio 
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('TKY702', 10, TO_DATE('2021-07-23 13:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-07-23 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), 50);
	


------------AGOSTO 2021-----------------------
-- 5 de agosto
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('DSQ992', 11, TO_DATE('2021-08-05 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-08-05 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), 33);
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('OXT639', 12, TO_DATE('2021-08-05 10:30:15', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-08-05 01:10:40', 'YYYY-MM-DD HH24:MI:SS'), 20);

-- 9 de agosto
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('IUA561', 13, TO_DATE('2021-08-09 16:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-08-09 18:30:00', 'YYYY-MM-DD HH24:MI:SS'), 52);
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('TVU466', 14, TO_DATE('2021-08-09 13:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-08-09 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 17);

-- 14 de agosto
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('PVM757', 15, TO_DATE('2021-08-14 10:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-08-14 13:10:00', 'YYYY-MM-DD HH24:MI:SS'), 46);

-- 15 de agosto de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('OXT639', 16, TO_DATE('2021-08-15 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-08-15 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), 20);

-- 18 de agosto
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('RLQ482', 17, TO_DATE('2021-08-18 12:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-08-18 15:20:00', 'YYYY-MM-DD HH24:MI:SS'), 19);
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('OER446', 18, TO_DATE('2021-08-18 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-08-18 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 26);

-- 22 de agosto
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('HOX134', 19, TO_DATE('2021-08-22 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-08-22 17:45:00', 'YYYY-MM-DD HH24:MI:SS'), 41);

-- 26 de agosto
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('ZPB666', 20, TO_DATE('2021-08-26 09:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-08-26 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 47);

-- 30 de agosto
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('MQN969', 21, TO_DATE('2021-08-30 13:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-08-30 16:45:00', 'YYYY-MM-DD HH24:MI:SS'), 24);



----------------SEPTIEMBRE 2021-----------------
-- 5 de septiembre
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('CYQ078', 22, TO_DATE('2021-09-05 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-09-05 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), 27);

-- 9 de septiembre
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('CCU808', 23, TO_DATE('2021-09-09 16:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-09-09 18:30:00', 'YYYY-MM-DD HH24:MI:SS'), 57);
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('TVU466', 24, TO_DATE('2021-09-09 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-09-09 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), 17);

-- 10 de septiembre de 2021
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('OXT639', 25, TO_DATE('2021-09-10 09:15:20', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-09-10 01:05:50', 'YYYY-MM-DD HH24:MI:SS'), 20);

-- 14 de septiembre
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('XMN769', 26, TO_DATE('2021-09-14 10:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-09-14 13:10:00', 'YYYY-MM-DD HH24:MI:SS'), 11);
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('PVM757', 27, TO_DATE('2021-09-14 10:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-09-14 13:10:00', 'YYYY-MM-DD HH24:MI:SS'), 46);

-- 18 de septiembre
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('ICG294', 28, TO_DATE('2021-09-18 12:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-09-18 15:20:00', 'YYYY-MM-DD HH24:MI:SS'), 17);
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('OER446', 29, TO_DATE('2021-09-18 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-09-18 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 26);

-- 22 de septiembre
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('ODG657', 30, TO_DATE('2021-09-22 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-09-22 17:45:00', 'YYYY-MM-DD HH24:MI:SS'), 21);

-- 23 de septiembre
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('TKY702', 31, TO_DATE('2021-09-23 13:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-09-23 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), 50);

-- 25 de septiembre de 2021
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('OXT639', 32, TO_DATE('2021-09-25 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-09-25 18:15:00', 'YYYY-MM-DD HH24:MI:SS'), 20);
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('OXT639', 33, TO_DATE('2021-09-25 12:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-09-25 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 20);

-- 26 de septiembre
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('TBS562', 34, TO_DATE('2021-09-26 09:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-09-26 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 1);

-- 30 de septiembre
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('LLI973', 35, TO_DATE('2021-09-30 13:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-09-30 16:45:00', 'YYYY-MM-DD HH24:MI:SS'), 60);
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('MQN969', 36, TO_DATE('2021-09-30 13:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-09-30 16:45:00', 'YYYY-MM-DD HH24:MI:SS'), 24);



--------OCTUBRE 2021---------------
-- 5 de octubre
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('IKD531', 37, TO_DATE('2021-10-05 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-10-05 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), 25);
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('CYQ078', 38, TO_DATE('2021-10-05 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-10-05 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), 27);


-- 9 de octubre
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('NPE070', 39, TO_DATE('2021-10-09 16:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-10-09 18:30:00', 'YYYY-MM-DD HH24:MI:SS'), 49);
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('TVU466', 40, TO_DATE('2021-10-09 09:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-10-09 13:30:00', 'YYYY-MM-DD HH24:MI:SS'), 17);

-- 10 de octubre 
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('OXT639', 41, TO_DATE('2021-10-10 14:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-10-10 18:30:00', 'YYYY-MM-DD HH24:MI:SS'), 20);

-- 14 de octubre
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('BMY846', 42, TO_DATE('2021-10-14 10:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-10-14 13:10:00', 'YYYY-MM-DD HH24:MI:SS'), 57);
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('PVM757', 43, TO_DATE('2021-10-14 10:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-10-14 13:10:00', 'YYYY-MM-DD HH24:MI:SS'), 46);

-- 18 de octubre
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('SUS387', 44, TO_DATE('2021-10-18 12:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-10-18 15:20:00', 'YYYY-MM-DD HH24:MI:SS'), 40);
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('OER446', 45, TO_DATE('2021-10-18 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-10-18 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 26);

-- 22 de octubre
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('RYB044', 46, TO_DATE('2021-10-22 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-10-22 17:45:00', 'YYYY-MM-DD HH24:MI:SS'), 41);

-- 26 de octubre
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('KLY678', 47, TO_DATE('2021-10-26 09:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-10-26 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 64);
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('ZPB666', 48, TO_DATE('2021-10-26 09:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-10-26 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 47);

-- 30 de octubre
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('BUD057', 49, TO_DATE('2021-10-30 13:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-10-30 16:45:00', 'YYYY-MM-DD HH24:MI:SS'), 10);


 
----------NOVIEMBRE 2021---------------------
-- 1 de noviembre
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('SRI730', 50, TO_DATE('2021-11-01 08:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-11-01 11:45:00', 'YYYY-MM-DD HH24:MI:SS'), 13);

-- 5 de noviembre
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('UED074', 51, TO_DATE('2021-11-05 14:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-11-05 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), 49);

-- 9 de noviembre de 2021
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('TVU466', 52, TO_DATE('2021-11-09 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-11-09 19:15:00', 'YYYY-MM-DD HH24:MI:SS'), 17);

-- 10 de noviembre
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('SSB554', 53, TO_DATE('2021-11-10 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-11-10 13:15:00', 'YYYY-MM-DD HH24:MI:SS'), 15);

-- 14 de noviembre
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('PVM757', 54, TO_DATE('2021-11-14 10:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-11-14 13:10:00', 'YYYY-MM-DD HH24:MI:SS'), 46);

-- 15 de noviembre
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('PHX836', 55, TO_DATE('2021-11-15 08:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-11-15 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), 41);

-- 18 Noviembre 2021
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('OER446', 56, TO_DATE('2021-11-18 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-11-18 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 26);

-- 20 de noviembre
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('KAW679', 57, TO_DATE('2021-11-20 13:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-11-20 16:05:00', 'YYYY-MM-DD HH24:MI:SS'), 55);
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('OXT639', 58, TO_DATE('2021-11-20 06:45:30', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-11-20 00:50:10', 'YYYY-MM-DD HH24:MI:SS'), 20);

-- 25 de noviembre
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('HSN638', 59, TO_DATE('2021-11-25 15:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-11-25 17:25:00', 'YYYY-MM-DD HH24:MI:SS'), 41);

-- 30 de noviembre
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('WYE201', 60, TO_DATE('2021-11-30 10:50:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-11-30 13:05:00', 'YYYY-MM-DD HH24:MI:SS'), 28);


----------DICIEMBRE 2021----------------
-- 1 de diciembre
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('PZY732', 61, TO_DATE('2021-12-01 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-12-01 12:45:00', 'YYYY-MM-DD HH24:MI:SS'), 57);

-- 5 de diciembre
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('YFK412', 62, TO_DATE('2021-12-05 14:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-12-05 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), 48);
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('CYQ078', 63, TO_DATE('2021-12-05 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-12-05 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), 27);

-- 9 de diciembre de 2021
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('TVU466', 64, TO_DATE('2021-12-09 12:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-12-09 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 17);

-- 10 de diciembre
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('PIJ154', 65, TO_DATE('2021-12-10 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-12-10 13:15:00', 'YYYY-MM-DD HH24:MI:SS'), 17);

-- 14 Diciembre 2021
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('PVM757', 66, TO_DATE('2021-12-14 10:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-12-14 13:10:00', 'YYYY-MM-DD HH24:MI:SS'), 46);

-- 15 de diciembre
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('CAK618', 67, TO_DATE('2021-12-15 08:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-12-15 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), 9);
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('OXT639', 68, TO_DATE('2021-12-15 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-12-15 15:45:00', 'YYYY-MM-DD HH24:MI:SS'), 20);

-- 18 Diciembre 2021
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('OER446', 69, TO_DATE('2021-12-18 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-12-18 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 26);

-- 20 de diciembre
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('XHI454', 70, TO_DATE('2021-12-20 13:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-12-20 16:05:00', 'YYYY-MM-DD HH24:MI:SS'), 17);

-- 23 de diciembre
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('TKY702', 71, TO_DATE('2021-12-23 13:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-12-23 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), 50);

-- 25 de diciembre
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('MXE031', 72, TO_DATE('2021-12-25 15:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-12-25 17:25:00', 'YYYY-MM-DD HH24:MI:SS'), 32);

-- 26 Diciembre 2021
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('ZPB666', 73, TO_DATE('2021-12-26 09:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-12-26 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 47);

-- 30 Diciembre 2021
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('MQN969', 74, TO_DATE('2021-12-30 13:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-12-30 16:45:00', 'YYYY-MM-DD HH24:MI:SS'), 24);

-- 31 de diciembre
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('QXN771', 75, TO_DATE('2021-12-31 10:50:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-12-31 13:05:00', 'YYYY-MM-DD HH24:MI:SS'), 1);
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('OXT639', 76, TO_DATE('2021-12-31 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-12-31 22:15:00', 'YYYY-MM-DD HH24:MI:SS'), 20);


-----------ENERO 2022--------------------
-- 1 de enero de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('IIC240', 77, TO_DATE('2022-01-01 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-01-01 12:45:00', 'YYYY-MM-DD HH24:MI:SS'), 46);

-- 5 de enero de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('QLB427', 78, TO_DATE('2022-01-05 14:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-01-05 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), 5);
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('OXT639', 79, TO_DATE('2022-01-05 04:15:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-01-05 00:30:30', 'YYYY-MM-DD HH24:MI:SS'), 20);

-- 9 de enero de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('TVU466', 80, TO_DATE('2022-01-09 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-01-09 18:45:00', 'YYYY-MM-DD HH24:MI:SS'), 17);

-- 10 de enero de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('QCE742', 81, TO_DATE('2022-01-10 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-01-10 13:15:00', 'YYYY-MM-DD HH24:MI:SS'), 20);
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('PVM757', 82, TO_DATE('2022-01-10 10:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-01-10 13:10:00', 'YYYY-MM-DD HH24:MI:SS'), 46);

-- 15 de enero de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('QLK163', 83, TO_DATE('2022-01-15 08:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-01-15 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), 33);

-- 18 Enero 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('OER446', 84, TO_DATE('2022-01-18 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-01-18 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 26);

-- 20 de enero de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('QPY814', 85, TO_DATE('2022-01-20 13:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-01-20 16:05:00', 'YYYY-MM-DD HH24:MI:SS'), 35);

-- 23 de enero
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('TKY702', 86, TO_DATE('2022-01-23 13:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-01-23 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), 50);

-- 25 de enero de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('CSM615', 87, TO_DATE('2022-01-25 15:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-01-25 17:25:00', 'YYYY-MM-DD HH24:MI:SS'), 40);

-- 26 Enero 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('ZPB666', 88, TO_DATE('2022-01-26 09:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-01-26 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 47);


-- 31 de enero de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('YIU389', 89, TO_DATE('2022-01-31 10:50:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-01-31 13:05:00', 'YYYY-MM-DD HH24:MI:SS'), 62);
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('OXT639', 90, TO_DATE('2022-01-31 20:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-01-31 23:45:00', 'YYYY-MM-DD HH24:MI:SS'), 20);


-----------FEBRERO 2022---------------------
-- 1 de febrero de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('FCE934', 91, TO_DATE('2022-02-01 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-02-01 11:45:00', 'YYYY-MM-DD HH24:MI:SS'), 11);

-- 5 de febrero de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('PKJ349', 92, TO_DATE('2022-02-05 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-02-05 16:15:00', 'YYYY-MM-DD HH24:MI:SS'), 22);

-- 9 de febrero de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('TVU466', 93, TO_DATE('2022-02-09 11:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-02-09 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 17);

-- 10 de febrero de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('EZL100', 94, TO_DATE('2022-02-10 10:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-02-10 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 25);
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('OXT639', 95, TO_DATE('2022-02-10 03:00:45', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-02-10 00:20:40', 'YYYY-MM-DD HH24:MI:SS'), 20);

-- 15 de febrero de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('EBX798', 96, TO_DATE('2022-02-15 11:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-02-15 13:35:00', 'YYYY-MM-DD HH24:MI:SS'), 16);
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('PVM757', 97, TO_DATE('2022-02-15 10:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-02-15 13:10:00', 'YYYY-MM-DD HH24:MI:SS'), 46);

-- 18 Febrero 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('OER446', 98, TO_DATE('2022-02-18 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-02-18 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 26);

-- 20 de febrero de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('UEM379', 99, TO_DATE('2022-02-20 14:50:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-02-20 17:05:00', 'YYYY-MM-DD HH24:MI:SS'), 28);

-- 25 de febrero de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('YQN419', 100, TO_DATE('2022-02-25 08:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-02-25 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), 23);
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('OXT639', 101, TO_DATE('2022-02-25 22:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-02-26 02:00:00', 'YYYY-MM-DD HH24:MI:SS'), 20);

-- 28 de febrero de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('QZT234', 102, TO_DATE('2022-02-28 12:40:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-02-28 14:55:00', 'YYYY-MM-DD HH24:MI:SS'), 1);
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('MQN969', 103, TO_DATE('2022-02-28 13:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-02-28 16:45:00', 'YYYY-MM-DD HH24:MI:SS'), 24);



----------------MARZO 2022--------------
-- 1 de marzo de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('JYT346', 104, TO_DATE('2022-03-01 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-03-01 11:45:00', 'YYYY-MM-DD HH24:MI:SS'), 18);

-- 5 de marzo de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('HEV920', 105, TO_DATE('2022-03-05 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-03-05 16:15:00', 'YYYY-MM-DD HH24:MI:SS'), 42);

-- 9 de marzo de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('TVU466', 106, TO_DATE('2022-03-09 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-03-09 20:15:00', 'YYYY-MM-DD HH24:MI:SS'), 17);

-- 10 de marzo de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('AFS096', 107, TO_DATE('2022-03-10 10:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-03-10 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 36);
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('OXT639', 108, TO_DATE('2022-03-10 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-03-10 13:45:00', 'YYYY-MM-DD HH24:MI:SS'), 20);

-- 15 de marzo de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('TOW895', 109, TO_DATE('2022-03-15 11:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-03-15 13:35:00', 'YYYY-MM-DD HH24:MI:SS'), 7);

-- 16 de marzo
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('YQN419', 110, TO_DATE('2022-03-16 08:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-03-16 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), 23);

-- 18 Marzo 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('OER446', 111, TO_DATE('2022-03-18 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-03-18 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 26);
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('PVM757', 112, TO_DATE('2022-03-18 10:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-03-18 13:10:00', 'YYYY-MM-DD HH24:MI:SS'), 46);

-- 20 de marzo de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('IIN290', 113, TO_DATE('2022-03-20 14:50:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-03-20 17:05:00', 'YYYY-MM-DD HH24:MI:SS'), 37);

-- 25 de marzo de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('KZF410',114, TO_DATE('2022-03-25 08:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-03-25 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), 25);

-- 26 Marzo 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('ZPB666', 115, TO_DATE('2022-03-26 09:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-03-26 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 47);

-- 30 Marzo 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('MQN969', 116, TO_DATE('2022-03-30 13:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-03-30 16:45:00', 'YYYY-MM-DD HH24:MI:SS'), 24);

-- 31 de marzo de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('FEU831', 117, TO_DATE('2022-03-31 12:40:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-03-31 14:55:00', 'YYYY-MM-DD HH24:MI:SS'), 39);


--------------ABRIL 2022------------------
-- 1 de abril de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('XQH077', 118, TO_DATE('2022-04-01 08:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-04-01 10:45:00', 'YYYY-MM-DD HH24:MI:SS'), 54);

-- 5 de abril de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('EWQ389', 119, TO_DATE('2022-04-05 12:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-04-05 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 54);
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('OXT639', 120, TO_DATE('2022-04-05 11:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-04-05 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 20);
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('CYQ078', 121, TO_DATE('2022-04-05 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-04-05 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), 27);


-- 9 de abril de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('TVU466', 122, TO_DATE('2022-04-09 18:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-04-09 22:45:00', 'YYYY-MM-DD HH24:MI:SS'), 17);

-- 10 de abril de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('SBL822', 123, TO_DATE('2022-04-10 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-04-10 11:15:00', 'YYYY-MM-DD HH24:MI:SS'), 42);

-- 14 Abril 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('PVM757', 124, TO_DATE('2022-04-14 10:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-04-14 13:10:00', 'YYYY-MM-DD HH24:MI:SS'), 46);

-- 15 de abril de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('XSS158', 125, TO_DATE('2022-04-15 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-04-15 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 31);

-- 18 Abril 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('OER446', 126, TO_DATE('2022-04-18 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-04-18 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 26);

-- 20 de abril de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('NKT368', 127, TO_DATE('2022-04-20 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-04-20 13:45:00', 'YYYY-MM-DD HH24:MI:SS'), 51);

-- 23 de abril
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('TKY702', 128, TO_DATE('2022-04-23 13:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-04-23 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), 50);

-- 25 de abril de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('HQV431', 129, TO_DATE('2022-04-25 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-04-25 15:15:00', 'YYYY-MM-DD HH24:MI:SS'), 46);



-- 26 de abril 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('ZPB666', 130, TO_DATE('2022-04-26 09:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-04-26 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 47);

-- 30 de abril de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio) 
VALUES ('MLK176', 131, TO_DATE('2022-04-30 10:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-04-30 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 33);
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('MQN969', 132, TO_DATE('2022-04-30 13:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-04-30 16:45:00', 'YYYY-MM-DD HH24:MI:SS'), 24);


SELECT*
FROM REGISTRO

 -----------MAYO 2022-------------------
-- 1 de mayo de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('JBO099', 133, TO_DATE('2022-05-01 08:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-05-01 10:45:00', 'YYYY-MM-DD HH24:MI:SS'), 33);

-- 5 de mayo de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('LTW290', 134, TO_DATE('2022-05-05 12:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-05-05 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 7);

-- 9 de mayo de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('TVU466', 135, TO_DATE('2022-05-09 08:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-05-09 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 17);

-- 10 de mayo de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('TMM807', 136, TO_DATE('2022-05-10 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-05-10 11:15:00', 'YYYY-MM-DD HH24:MI:SS'), 47);

-- 15 de mayo de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('GBV448', 137, TO_DATE('2022-05-15 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-05-15 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 9);
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('PVM757', 138, TO_DATE('2022-05-15 10:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-05-15 13:10:00', 'YYYY-MM-DD HH24:MI:SS'), 46);

-- 20 de mayo de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('LFL840', 139, TO_DATE('2022-05-20 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-05-20 13:45:00', 'YYYY-MM-DD HH24:MI:SS'), 11);
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('OXT639', 140, TO_DATE('2022-05-20 01:45:50', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-05-20 00:10:50', 'YYYY-MM-DD HH24:MI:SS'), 20);

-- 25 de mayo de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('MMD893', 141, TO_DATE('2022-05-25 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-05-25 15:15:00', 'YYYY-MM-DD HH24:MI:SS'), 25);

-- 30 de mayo de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('EAN052', 142, TO_DATE('2022-05-30 10:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-05-30 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 1);


----------JUNIO 2022----------------
-- 1 de junio de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('OYD933', 143, TO_DATE('2022-06-01 08:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-06-01 10:45:00', 'YYYY-MM-DD HH24:MI:SS'), 9);

-- 5 de junio de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('LMS826', 144, TO_DATE('2022-06-05 12:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-06-05 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 2);
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('CYQ078', 145, TO_DATE('2022-06-05 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-06-05 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), 27);

-- 9 de junio de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('TVU466', 146, TO_DATE('2022-06-09 12:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-06-09 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), 17);

-- 10 de junio de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('FRW375', 147, TO_DATE('2022-06-10 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-06-10 11:15:00', 'YYYY-MM-DD HH24:MI:SS'), 9);

-- 14 Junio 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('PVM757', 148, TO_DATE('2022-06-14 10:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-06-14 13:10:00', 'YYYY-MM-DD HH24:MI:SS'), 46);

-- 15 de junio de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('GEP199', 149, TO_DATE('2022-06-15 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-06-15 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 10);

-- 20 de junio de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('MSQ042', 150, TO_DATE('2022-06-20 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-06-20 13:45:00', 'YYYY-MM-DD HH24:MI:SS'), 33);

-- 25 de junio de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('VOP694', 151, TO_DATE('2022-06-25 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-06-25 15:15:00', 'YYYY-MM-DD HH24:MI:SS'), 19);

-- 30 de junio de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('NAV806', 152, TO_DATE('2022-06-30 10:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-06-30 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 17);


-----------------JULIO 2022------------------------
-- 1 de julio de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('GBF476', 153, TO_DATE('2022-07-01 08:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-07-01 10:45:00', 'YYYY-MM-DD HH24:MI:SS'), 27);

-- 5 de julio de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('CVY277', 154, TO_DATE('2022-07-05 12:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-07-05 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 41);

-- 10 de julio de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('AOR334', 155, TO_DATE('2022-07-10 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-07-10 11:15:00', 'YYYY-MM-DD HH24:MI:SS'), 12);

-- 9 de julio de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('TVU466', 156, TO_DATE('2022-07-09 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-07-09 13:15:00', 'YYYY-MM-DD HH24:MI:SS'), 17);

-- 15 de julio de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('TTT098', 157, TO_DATE('2022-07-15 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-07-15 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1);

-- 20 de julio de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('JIE960', 158, TO_DATE('2022-07-20 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-07-20 13:45:00', 'YYYY-MM-DD HH24:MI:SS'), 14);

-- 25 de julio de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('FTN445', 159, TO_DATE('2022-07-25 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-07-25 15:15:00', 'YYYY-MM-DD HH24:MI:SS'), 25);

-- 27 de julio de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('BKH435', 160, TO_DATE('2022-07-27 10:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-07-27 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 21);



---------AGOSTO 2022
-- 1 de agosto de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('EVN787', 161, TO_DATE('2022-08-01 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-08-01 15:45:00', 'YYYY-MM-DD HH24:MI:SS'), 49);

-- 2 de agosto de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('SHS507', 162, TO_DATE('2022-08-02 14:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-08-02 18:20:00', 'YYYY-MM-DD HH24:MI:SS'), 3);

-- 3 de agosto de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('OIW180', 163, TO_DATE('2022-08-03 11:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-08-03 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), 64);

-- 4 de agosto de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('LQP772', 164, TO_DATE('2022-08-04 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-08-04 19:15:00', 'YYYY-MM-DD HH24:MI:SS'), 50);

-- 5 de agosto de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('OMG637', 165, TO_DATE('2022-08-05 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-08-05 17:45:00', 'YYYY-MM-DD HH24:MI:SS'), 35);
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('CYQ078', 166, TO_DATE('2022-08-05 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-08-05 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), 27);

-- 6 de agosto de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('OWS195', 167, TO_DATE('2022-08-06 12:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-08-06 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), 15);

-- 7 de agosto de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('WLT214', 168, TO_DATE('2022-08-07 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-08-07 18:45:00', 'YYYY-MM-DD HH24:MI:SS'), 49);

-- 8 de agosto de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('KJP007', 169, TO_DATE('2022-08-08 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-08-08 18:15:00', 'YYYY-MM-DD HH24:MI:SS'), 47);

-- 9 de agosto de 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('WTA649', 170, TO_DATE('2022-08-09 10:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-08-09 14:55:00', 'YYYY-MM-DD HH24:MI:SS'), 25);

-- 14 de agosto 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('PVM757', 171, TO_DATE('2022-08-14 10:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-08-14 13:10:00', 'YYYY-MM-DD HH24:MI:SS'), 46);

-- 28 Agosto 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('MQN969', 172, TO_DATE('2022-08-30 13:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-08-30 16:45:00', 'YYYY-MM-DD HH24:MI:SS'), 24);

--Septiembre 2022

-- 3 de Septiembre 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('OXT639', 173, TO_DATE('2022-09-03 12:00:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-09-03 01:20:20', 'YYYY-MM-DD HH24:MI:SS'), 20);

-- 4 de Septiembre 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('JUR325', 174, TO_DATE('2022-09-04 09:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-09-04 17:30:00', 'YYYY-MM-DD HH24:MI:SS'), 33);

-- 7 de Septiembre 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('QSQ689', 175, TO_DATE('2022-09-07 09:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-09-07 12:15:00', 'YYYY-MM-DD HH24:MI:SS'), 40);

-- 9 de Septiembre 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('TVU466', 176, TO_DATE('2022-09-09 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-09-09 16:45:00', 'YYYY-MM-DD HH24:MI:SS'), 17);

-- 14 de Septiembre 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('CXS568', 177, TO_DATE('2022-09-14 08:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-09-14 11:10:00', 'YYYY-MM-DD HH24:MI:SS'), 42);

-- 18 de Septiembre 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('OER446', 178, TO_DATE('2022-09-18 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-09-18 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 26);

-- 23 de Septiembre 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('TKY702', 179, TO_DATE('2022-09-23 13:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-09-23 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), 50);

--Octubre 2022

-- 5 de Octubre 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('DSQ992', 180, TO_DATE('2022-10-05 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-10-05 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), 33);

-- 9 de Octubre 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('IUA561', 181, TO_DATE('2022-10-09 16:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-10-09 18:30:00', 'YYYY-MM-DD HH24:MI:SS'), 52);

-- 14 de Octubre 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('PVM757', 182, TO_DATE('2022-10-14 10:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-10-14 13:10:00', 'YYYY-MM-DD HH24:MI:SS'), 46);

-- 18 de Octubre 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('RLQ482', 183, TO_DATE('2022-10-18 12:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-10-18 15:20:00', 'YYYY-MM-DD HH24:MI:SS'), 19);

-- 22 de Octubre 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('HOX134', 184, TO_DATE('2022-10-22 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-10-22 17:45:00', 'YYYY-MM-DD HH24:MI:SS'), 41);

-- 26 de Octubre 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('ZPB666', 185, TO_DATE('2022-10-26 09:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-10-26 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 47);

-- 30 de Octubre 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('MQN969', 186, TO_DATE('2022-10-30 13:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-10-30 16:45:00', 'YYYY-MM-DD HH24:MI:SS'), 24);


--Noviembre 2022

-- 1 de Noviembre 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('JBO099', 187, TO_DATE('2022-11-01 08:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-11-01 10:45:00', 'YYYY-MM-DD HH24:MI:SS'), 33);

-- 5 de Noviembre 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('LTW290', 188, TO_DATE('2022-11-05 12:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-11-05 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 7);

-- 10 de Noviembre 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('TMM807', 189, TO_DATE('2022-11-10 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-11-10 11:15:00', 'YYYY-MM-DD HH24:MI:SS'), 47);

-- 15 de Noviembre 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('GBV448', 190, TO_DATE('2022-11-15 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-11-15 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 9);

-- 20 Noviembre 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('LFL840', 191, TO_DATE('2022-11-20 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-11-20 13:45:00', 'YYYY-MM-DD HH24:MI:SS'), 11);

-- 25 Noviembre 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('MMD893', 192, TO_DATE('2022-11-25 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-11-25 15:15:00', 'YYYY-MM-DD HH24:MI:SS'), 25);

-- 30 Noviembre 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('EAN052', 193, TO_DATE('2022-11-30 10:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-11-30 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 1);


--Diciembre 2022

-- 1 de Diciembre 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('FCE934', 194, TO_DATE('2022-12-03 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-12-03 11:45:00', 'YYYY-MM-DD HH24:MI:SS'), 11);

-- 5 de Diciembre 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('PKJ349', 195, TO_DATE('2022-12-05 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-12-05 16:15:00', 'YYYY-MM-DD HH24:MI:SS'), 22);

-- 10 de Diciembre 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('EZL100', 196, TO_DATE('2022-12-10 10:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-12-10 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 25);

-- 12 de Diciembre 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('DSQ992', 197, TO_DATE('2022-12-12 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-12-12 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), 33);

-- 15 de Diciembre 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('EBX798', 198, TO_DATE('2022-12-15 11:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-12-15 13:35:00', 'YYYY-MM-DD HH24:MI:SS'), 16);

--17 de Diciembre 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('LLI973', 199, TO_DATE('2022-12-17 13:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-12-17 16:45:00', 'YYYY-MM-DD HH24:MI:SS'), 60);

-- 20 de Diciembre 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('UEM379', 200, TO_DATE('2022-12-20 14:50:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-12-20 17:05:00', 'YYYY-MM-DD HH24:MI:SS'), 28);

--21 Diciembre 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('YQN419', 201, TO_DATE('2022-12-21 08:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-12-21 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), 23);

-- 24 de Diciembre 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('YQN419', 202, TO_DATE('2022-12-24 08:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-12-24 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), 23);

-- 28 de Diciembre 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('QZT234', 203, TO_DATE('2022-02-28 12:40:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-02-28 14:55:00', 'YYYY-MM-DD HH24:MI:SS'), 1);

-- 31 de Diciembre 2022
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('YQN419', 204, TO_DATE('2022-12-31 08:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-12-31 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), 23);

SELECT*
FROM REGISTRO
--Enero 2023

-- 03 de Enero 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('GBV448', 205, TO_DATE('2023-01-03 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-01-03 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 9);

-- 5 de Enero 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('IKD531', 206, TO_DATE('2023-01-05 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-01-05 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), 25);

--7 de Enero 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('KLY678', 207, TO_DATE('2023-01-03 09:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-01-03 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 64);

-- 9 de Enero 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('NPE070', 208, TO_DATE('2023-01-09 16:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-01-09 18:30:00', 'YYYY-MM-DD HH24:MI:SS'), 49);

-- 14 de Enero 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('BMY846', 209, TO_DATE('2023-01-14 10:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-01-14 13:10:00', 'YYYY-MM-DD HH24:MI:SS'), 57);

-- 18 de Enero 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('SUS387', 210, TO_DATE('2023-01-18 12:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-01-18 15:20:00', 'YYYY-MM-DD HH24:MI:SS'), 40);

-- 22 de Enero 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('RYB044', 211, TO_DATE('2023-01-22 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-01-22 20:45:00', 'YYYY-MM-DD HH24:MI:SS'), 41);

-- 26 de Enero 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('KLY678', 212, TO_DATE('2023-01-26 09:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-01-26 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 64);

-- 30 de Enero 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('BUD057', 213, TO_DATE('2023-01-30 13:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-01-30 16:45:00', 'YYYY-MM-DD HH24:MI:SS'), 10);

--Febrero 2023

-- 5 de Febrero 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('IKD531', 214, TO_DATE('2023-02-05 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-02-05 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), 25);

-- 9 de Febrero 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('NPE070', 215, TO_DATE('2023-02-09 16:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-02-09 18:30:00', 'YYYY-MM-DD HH24:MI:SS'), 49);

-- 14 de Febrero 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('BMY846', 216, TO_DATE('2023-02-14 10:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-02-14 13:10:00', 'YYYY-MM-DD HH24:MI:SS'), 57);

-- 18 de Febrero 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('SUS387', 217, TO_DATE('2023-02-18 12:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-02-18 15:20:00', 'YYYY-MM-DD HH24:MI:SS'), 40);

-- 22 de Febrero 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('RYB044', 218, TO_DATE('2023-02-22 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-02-22 20:45:00', 'YYYY-MM-DD HH24:MI:SS'), 41);

-- 26 de Febrero 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('KLY678', 219, TO_DATE('2023-02-26 09:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-02-26 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 64);

--Marzo 2023

-- 3 de Marzo 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('IKD531', 220, TO_DATE('2023-03-03 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-03-03 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), 25);

-- 9 de Marzo 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('NPE070', 221, TO_DATE('2023-03-09 16:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-03-09 18:30:00', 'YYYY-MM-DD HH24:MI:SS'), 49);

-- 14 de Marzo 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('BMY846', 222, TO_DATE('2023-03-14 10:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-03-14 13:10:00', 'YYYY-MM-DD HH24:MI:SS'), 57);

--17 de Marzo 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('JUR325', 223, TO_DATE('2023-03-17 09:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-03-17 17:30:00', 'YYYY-MM-DD HH24:MI:SS'), 33);

--25 de Marzo 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('QSQ689', 224, TO_DATE('2023-03-17 09:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-03-25 12:15:00', 'YYYY-MM-DD HH24:MI:SS'), 40);

--29 de Marzo 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('TVU466', 225, TO_DATE('2023-03-29 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-03-29 16:45:00', 'YYYY-MM-DD HH24:MI:SS'), 17);

--30 de Marzo 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('BUD057', 226, TO_DATE('2023-03-30 13:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-03-30 16:45:00', 'YYYY-MM-DD HH24:MI:SS'), 10);

--Abril 2023

-- 1 de Abril 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('IIC240', 227, TO_DATE('2023-04-01 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-04-01 12:45:00', 'YYYY-MM-DD HH24:MI:SS'), 46);

-- 5 de Abril 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('QLB427', 228, TO_DATE('2023-04-05 14:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-04-05 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), 5);

-- 10 de Abril 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('QCE742', 229, TO_DATE('2023-04-10 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-04-10 13:15:00', 'YYYY-MM-DD HH24:MI:SS'), 20);


-- 20 de Abril 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('QPY814', 230, TO_DATE('2023-04-20 13:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-04-20 16:05:00', 'YYYY-MM-DD HH24:MI:SS'), 35);

-- 25 de Abril 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('CSM615', 231, TO_DATE('2023-04-25 15:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-04-25 17:25:00', 'YYYY-MM-DD HH24:MI:SS'), 40);

-- 30 de Abril 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('YIU389', 232, TO_DATE('2023-04-30 10:50:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-04-30 :05:00', 'YYYY-MM-DD HH24:MI:SS'), 62);
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('MQN969', 233, TO_DATE('2023-04-30 13:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-08-30 16:45:00', 'YYYY-MM-DD HH24:MI:SS'), 24);


--Mayo 2023

-- 5 de Mayo 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('IKD531', 234, TO_DATE('2023-05-05 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-05-05 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), 25);

-- 9 de Mayo 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('NPE070', 235, TO_DATE('2023-05-09 16:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-05-09 18:30:00', 'YYYY-MM-DD HH24:MI:SS'), 49);

-- 14 de Mayo 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('BMY846', 236, TO_DATE('2023-05-14 10:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-05-14 13:10:00', 'YYYY-MM-DD HH24:MI:SS'), 57);

-- 18 de Mayo 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('SUS387', 237, TO_DATE('2023-05-18 12:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-05-18 15:20:00', 'YYYY-MM-DD HH24:MI:SS'), 40);

-- 22 de Mayo 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('RYB044', 238, TO_DATE('2023-05-22 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-05-22 17:45:00', 'YYYY-MM-DD HH24:MI:SS'), 41);

-- 26 de Mayo 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('KLY678', 239, TO_DATE('2023-05-26 09:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-05-26 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 64);

-- 30 de Mayo 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('BUD057', 240, TO_DATE('2023-05-30 13:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-05-30 16:45:00', 'YYYY-MM-DD HH24:MI:SS'), 10);

--Junio 2023

-- 3 de Junio 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('OXT639', 241, TO_DATE('2023-06-03 12:00:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-06-03 01:20:20', 'YYYY-MM-DD HH24:MI:SS'), 20);

-- 4 de Junio 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('JUR325', 242, TO_DATE('2023-06-04 09:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-06-04 17:30:00', 'YYYY-MM-DD HH24:MI:SS'), 33);

-- 7 de Junio 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('QSQ689', 243, TO_DATE('2023-06-07 09:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-06-07 12:15:00', 'YYYY-MM-DD HH24:MI:SS'), 40);

-- 9 de Junio 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('TVU466', 244, TO_DATE('2023-06-09 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-06-09 16:45:00', 'YYYY-MM-DD HH24:MI:SS'), 17);

-- 14 de Junio 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('CXS568', 245, TO_DATE('2023-06-14 08:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-06-14 11:10:00', 'YYYY-MM-DD HH24:MI:SS'), 42);

-- 18 de Junio 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('OER446', 246, TO_DATE('2023-06-18 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-06-18 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 26);

-- 23 de Junio 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('TKY702', 247, TO_DATE('2023-06-23 13:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-06-23 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), 50);


--Julio 2023

-- 1 de Julio 20223
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('OYD933', 248, TO_DATE('2023-07-01 08:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-07-01 10:45:00', 'YYYY-MM-DD HH24:MI:SS'), 9);

-- 5 de Julio 20223
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('LMS826', 249, TO_DATE('2023-07-05 12:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-07-05 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 2);

-- 10 de Julio 20223
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('FRW375', 250, TO_DATE('2023-07-10 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-07-10 11:15:00', 'YYYY-MM-DD HH24:MI:SS'), 9);

-- 15 de Julio 20223
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('GEP199', 251, TO_DATE('2023-07-15 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-07-15 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 10);

-- 20 de Julio 20223
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('MSQ042', 252, TO_DATE('2023-07-20 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-07-20 13:45:00', 'YYYY-MM-DD HH24:MI:SS'), 33);

-- 25 de Julio 20223
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('VOP694', 253, TO_DATE('2023-07-25 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-07-25 15:15:00', 'YYYY-MM-DD HH24:MI:SS'), 19);

-- 26 de Julio 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('ZPB666', 254, TO_DATE('2023-07-26 09:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-07-26 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 47);

-- 30 de Julio 20223
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('NAV806', 255, TO_DATE('2023-07-30 10:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-07-30 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 17);

--Agosto 2023

-- 1 de Agosto 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('PZY732', 256, TO_DATE('2023-08-01 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-01 12:45:00', 'YYYY-MM-DD HH24:MI:SS'), 57);

-- 5 de Agosto 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('YFK412', 257, TO_DATE('2023-08-05 14:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-04-05 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), 48);

-- 10 de Agosto 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('PIJ154', 258, TO_DATE('2023-08-10 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-10 13:15:00', 'YYYY-MM-DD HH24:MI:SS'), 17);

-- 15 de Agosto 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('CAK618', 259, TO_DATE('2023-08-15 08:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-15 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), 9);

-- 20 de Agosto 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('XHI454', 260, TO_DATE('2023-08-20 13:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-20 16:05:00', 'YYYY-MM-DD HH24:MI:SS'), 17);

--24 de Agosto 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('YIU389', 261, TO_DATE('2023-08-24 10:50:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-24 13:05:00', 'YYYY-MM-DD HH24:MI:SS'), 64);

-- 25 de Agosto 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('MXE031', 262, TO_DATE('2023-08-25 15:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-25 17:25:00', 'YYYY-MM-DD HH24:MI:SS'), 32);

-- 30 de agosto
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('MQN969', 263, TO_DATE('2023-08-30 13:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-30 16:45:00', 'YYYY-MM-DD HH24:MI:SS'), 24);

-- 31 de Agosto 2023
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('QXN771', 264, TO_DATE('2023-08-31 10:50:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-31 13:05:00', 'YYYY-MM-DD HH24:MI:SS'), 1);


--Septiembre 2023

-- 1 de Septiembre
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('SRI730', 265, TO_DATE('2023-09-01 08:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-09-01 11:45:00', 'YYYY-MM-DD HH24:MI:SS'), 13);

-- 3 de Septiembre
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('IKD531', 266, TO_DATE('2023-09-03 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-09-03 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), 25);

-- 5 de noviembre
INSERT INTO REGISTRO (VEHICULO_Placa, ID_registro, Fecha_hora_ingreso, Fecha_hora_salida, PRECIO_SERVICIO_ID_precio)
VALUES ('UED074', 267, TO_DATE('2023-09-05 14:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-09-05 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), 49);

SELECT*
FROM REGISTRO



INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago)
VALUES (1013232263, TO_DATE('2021-07-03', 'YYYY-MM-DD'), 40000, 1, 1);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago)
VALUES (1013091016, TO_DATE('2021-07-04', 'YYYY-MM-DD'), 28000, 2, 2);

INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago)
VALUES (1013971833, TO_DATE('2021-07-05', 'YYYY-MM-DD'), 200000, 3, 3);

INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago)
VALUES (1013408271, TO_DATE('2021-07-05', 'YYYY-MM-DD'), 40000, 4, 4);

INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago)
VALUES (1013049665, TO_DATE('2021-07-09', 'YYYY-MM-DD'), 15000, 5, 5);

INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago)
VALUES (1013261919, TO_DATE('2021-07-10', 'YYYY-MM-DD'), 40000, 6, 6);

INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago)
VALUES (1013746130, TO_DATE('2021-07-14', 'YYYY-MM-DD'), 24000, 7, 7);

INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago)
VALUES (1013631341, TO_DATE('2021-07-15', 'YYYY-MM-DD'), 40000, 8, 8);

INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago)
VALUES (1013299935, TO_DATE('2021-07-18', 'YYYY-MM-DD'), 35000, 9, 9);

INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago)
VALUES (1013170129, TO_DATE('2021-07-23', 'YYYY-MM-DD'), 24000, 10, 10);

INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago)
VALUES (1013232263, TO_DATE('2021-08-05', 'YYYY-MM-DD'), 28000, 11, 11);

INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago)
VALUES (1013091016, TO_DATE('2021-08-05', 'YYYY-MM-DD'), 40000, 12, 12);

INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago)
VALUES (1013971833, TO_DATE('2021-08-09', 'YYYY-MM-DD'), 40000, 13, 13);

INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago)
VALUES (1013408271, TO_DATE('2021-08-09', 'YYYY-MM-DD'), 15000, 14, 14);

INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago)
VALUES (1013049665, TO_DATE('2021-08-14', 'YYYY-MM-DD'), 120000, 15, 15);

INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago)
VALUES (1013261919, TO_DATE('2021-08-15', 'YYYY-MM-DD'), 40000, 16, 16);

INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago)
VALUES (1013746130, TO_DATE('2021-08-18', 'YYYY-MM-DD'), 36000, 17, 17);

INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago)
VALUES (1013631341, TO_DATE('2021-08-18', 'YYYY-MM-DD'), 35000, 18, 18);

INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago)
VALUES (1013299935, TO_DATE('2021-08-22', 'YYYY-MM-DD'), 15000, 19, 19);

INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago)
VALUES (1013170129, TO_DATE('2021-08-26', 'YYYY-MM-DD'), 50000, 20, 20);

INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES ('1013232263', TO_DATE('30/08/2021', 'DD/MM/YYYY'), 150000, 21, 21);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES ('1013091016', TO_DATE('05/09/2021', 'DD/MM/YYYY'), 45000, 22, 22);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES ('1013971833', TO_DATE('09/09/2021', 'DD/MM/YYYY'), 28000, 23, 23);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES ('1013408271', TO_DATE('09/09/2021', 'DD/MM/YYYY'), 15000, 24, 24);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES ('1013049665', TO_DATE('10/09/2021', 'DD/MM/YYYY'), 40000, 25, 25);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES ('1013261919', TO_DATE('14/09/2021', 'DD/MM/YYYY'), 45000, 26, 26);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES ('1013746130', TO_DATE('14/09/2021', 'DD/MM/YYYY'), 120000, 27, 27);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES ('1013631341', TO_DATE('18/09/2021', 'DD/MM/YYYY'), 15000, 28, 28);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES ('1013299935', TO_DATE('18/09/2021', 'DD/MM/YYYY'), 35000, 29, 29);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES ('1013170129', TO_DATE('22/09/2021', 'DD/MM/YYYY'), 70000, 30, 30);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES ('1013232263', TO_DATE('23/09/2021', 'DD/MM/YYYY'), 24000, 31, 31);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES ('1013091016', TO_DATE('25/09/2021', 'DD/MM/YYYY'), 40000, 32, 32);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES ('1013971833', TO_DATE('25/09/2021', 'DD/MM/YYYY'), 40000, 33, 33);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES ('1013408271', TO_DATE('26/09/2021', 'DD/MM/YYYY'), 15000, 34, 34);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES ('1013049665', TO_DATE('30/09/2021', 'DD/MM/YYYY'), 60000, 35, 35);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES ('1013261919', TO_DATE('30/09/2021', 'DD/MM/YYYY'), 150000, 36, 36);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES ('1013746130', TO_DATE('05/10/2021', 'DD/MM/YYYY'), 22000, 37, 37);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES ('1013631341', TO_DATE('05/10/2021', 'DD/MM/YYYY'), 45000, 38, 38);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES ('1013299935', TO_DATE('09/10/2021', 'DD/MM/YYYY'), 15000, 39, 39);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES ('1013170129', TO_DATE('09/10/2021', 'DD/MM/YYYY'), 15000, 40, 40);

INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013232263, TO_DATE('10/10/2021', 'DD/MM/YYYY'), 40000, 41, 41);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013091016, TO_DATE('14/10/2021', 'DD/MM/YYYY'), 28000, 42, 42);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013971833, TO_DATE('14/10/2021', 'DD/MM/YYYY'), 120000, 43, 43);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013408271, TO_DATE('18/10/2021', 'DD/MM/YYYY'), 200000, 44, 44);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013049665, TO_DATE('18/10/2021', 'DD/MM/YYYY'), 35000, 45, 45);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013261919, TO_DATE('22/10/2021', 'DD/MM/YYYY'), 15000, 46, 46);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013746130, TO_DATE('26/10/2021', 'DD/MM/YYYY'), 200000, 47, 47);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013631341, TO_DATE('26/10/2021', 'DD/MM/YYYY'), 50000, 48, 48);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013299935, TO_DATE('30/10/2021', 'DD/MM/YYYY'), 30000, 49, 49);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013170129, TO_DATE('01/11/2021', 'DD/MM/YYYY'), 80000, 50, 50);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013232263, TO_DATE('05/11/2021', 'DD/MM/YYYY'), 15000, 51, 51);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013091016, TO_DATE('09/11/2021', 'DD/MM/YYYY'), 15000, 52, 52);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013971833, TO_DATE('10/11/2021', 'DD/MM/YYYY'), 55000, 53, 53);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013408271, TO_DATE('14/11/2021', 'DD/MM/YYYY'), 120000, 54, 54);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013049665, TO_DATE('15/11/2021', 'DD/MM/YYYY'), 15000, 55, 55);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013261919, TO_DATE('18/11/2021', 'DD/MM/YYYY'), 35000, 56, 56);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013746130, TO_DATE('20/11/2021', 'DD/MM/YYYY'), 50000, 57, 57);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013631341, TO_DATE('20/11/2021', 'DD/MM/YYYY'), 40000, 58, 58);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013299935, TO_DATE('25/11/2021', 'DD/MM/YYYY'), 15000, 59, 59);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013170129, TO_DATE('30/11/2021', 'DD/MM/YYYY'), 50000, 60, 60);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013232263, TO_DATE('01/12/2021', 'DD/MM/YYYY'), 28000, 61, 61);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013091016, TO_DATE('05/12/2021', 'DD/MM/YYYY'), 150000, 62, 62);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013971833, TO_DATE('05/12/2021', 'DD/MM/YYYY'), 45000, 63, 63);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013408271, TO_DATE('09/12/2021', 'DD/MM/YYYY'), 15000, 64, 64);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013049665, TO_DATE('10/12/2021', 'DD/MM/YYYY'), 15000, 65, 65);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013261919, TO_DATE('14/12/2021', 'DD/MM/YYYY'), 120000, 66, 66);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013746130, TO_DATE('15/12/2021', 'DD/MM/YYYY'), 20000, 67, 67);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013631341, TO_DATE('15/12/2021', 'DD/MM/YYYY'), 40000, 68, 68);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013299935, TO_DATE('18/12/2021', 'DD/MM/YYYY'), 35000, 69, 69);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013170129, TO_DATE('20/12/2021', 'DD/MM/YYYY'), 15000, 70, 70);

INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013232263, TO_DATE('23/12/2021', 'DD/MM/YYYY'), 190000, 71, 71);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013091016, TO_DATE('25/12/2021', 'DD/MM/YYYY'), 50000, 72, 72);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013971833, TO_DATE('26/12/2021', 'DD/MM/YYYY'), 24000, 73, 73);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013408271, TO_DATE('30/12/2021', 'DD/MM/YYYY'), 150000, 74, 74);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013049665, TO_DATE('31/12/2021', 'DD/MM/YYYY'), 15000, 75, 75);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013261919, TO_DATE('31/12/2021', 'DD/MM/YYYY'), 40000, 76, 76);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013746130, TO_DATE('01/01/2022', 'DD/MM/YYYY'), 120000, 77, 77);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013631341, TO_DATE('05/01/2022', 'DD/MM/YYYY'), 70000, 78, 78);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013299935, TO_DATE('05/01/2022', 'DD/MM/YYYY'), 40000, 79, 79);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013170129, TO_DATE('09/01/2022', 'DD/MM/YYYY'), 15000, 80, 80);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013232263, TO_DATE('10/01/2022', 'DD/MM/YYYY'), 40000, 81, 81);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013091016, TO_DATE('10/01/2022', 'DD/MM/YYYY'), 120000, 82, 82);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013971833, TO_DATE('15/01/2022', 'DD/MM/YYYY'), 28000, 83, 83);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013408271, TO_DATE('18/01/2022', 'DD/MM/YYYY'), 35000, 84, 84);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013049665, TO_DATE('20/01/2022', 'DD/MM/YYYY'), 50000, 85, 85);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013261919, TO_DATE('23/01/2022', 'DD/MM/YYYY'), 24000, 86, 86);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013746130, TO_DATE('25/01/2022', 'DD/MM/YYYY'), 200000, 87, 87);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013631341, TO_DATE('26/01/2022', 'DD/MM/YYYY'), 50000, 88, 88);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013299935, TO_DATE('31/01/2022', 'DD/MM/YYYY'), 140000, 89, 89);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013170129, TO_DATE('31/01/2022', 'DD/MM/YYYY'), 40000, 90, 90);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013232263, TO_DATE('01/02/2022', 'DD/MM/YYYY'), 45000, 91, 91);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013091016, TO_DATE('05/02/2022', 'DD/MM/YYYY'), 120000, 92, 92);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013971833, TO_DATE('09/02/2022', 'DD/MM/YYYY'), 15000, 93, 93);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013408271, TO_DATE('10/02/2022', 'DD/MM/YYYY'), 22000, 94, 94);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013049665, TO_DATE('10/02/2022', 'DD/MM/YYYY'), 40000, 95, 95);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013261919, TO_DATE('15/02/2022', 'DD/MM/YYYY'), 160000, 96, 96);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013746130, TO_DATE('15/02/2022', 'DD/MM/YYYY'), 120000, 97, 97);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013631341, TO_DATE('18/02/2022', 'DD/MM/YYYY'), 35000, 98, 98);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013299935, TO_DATE('20/02/2022', 'DD/MM/YYYY'), 50000, 99, 99);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013170129, TO_DATE('25/02/2022', 'DD/MM/YYYY'), 50000, 100, 100);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013232263, TO_DATE('25/02/2022', 'DD/MM/YYYY'), 40000, 101, 101);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013091016, TO_DATE('28/02/2022', 'DD/MM/YYYY'), 15000, 102, 102);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013971833, TO_DATE('28/02/2022', 'DD/MM/YYYY'), 150000, 103, 103);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013408271, TO_DATE('01/03/2022', 'DD/MM/YYYY'), 24000, 104, 104);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013049665, TO_DATE('05/03/2022', 'DD/MM/YYYY'), 24000, 105, 105);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013261919, TO_DATE('09/03/2022', 'DD/MM/YYYY'), 15000, 106, 106);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013746130, TO_DATE('10/03/2022', 'DD/MM/YYYY'), 60000, 107, 107);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013631341, TO_DATE('10/03/2022', 'DD/MM/YYYY'), 40000, 108, 108);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013299935, TO_DATE('15/03/2022', 'DD/MM/YYYY'), 50000, 109, 109);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013170129, TO_DATE('16/03/2022', 'DD/MM/YYYY'), 50000, 110, 110);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013232263, TO_DATE('18/03/2022', 'DD/MM/YYYY'), 35000, 111, 111);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013091016, TO_DATE('18/03/2022', 'DD/MM/YYYY'), 120000, 112, 112);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013971833, TO_DATE('20/03/2022', 'DD/MM/YYYY'), 90000, 113, 113);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013408271, TO_DATE('25/03/2022', 'DD/MM/YYYY'), 22000, 114, 114);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013049665, TO_DATE('26/03/2022', 'DD/MM/YYYY'), 50000, 115, 115);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013261919, TO_DATE('30/03/2022', 'DD/MM/YYYY'), 150000, 116, 116);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013746130, TO_DATE('31/03/2022', 'DD/MM/YYYY'), 80000, 117, 117);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013631341, TO_DATE('01/04/2022', 'DD/MM/YYYY'), 120000, 118, 118);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013299935, TO_DATE('05/04/2022', 'DD/MM/YYYY'), 120000, 119, 119);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013170129, TO_DATE('05/04/2022', 'DD/MM/YYYY'), 40000, 120, 120);

INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013232263, TO_DATE('05/04/2022', 'DD/MM/YYYY'), 45000, 121, 121);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013091016, TO_DATE('09/04/2022', 'DD/MM/YYYY'), 15000, 122, 122);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013971833, TO_DATE('10/04/2022', 'DD/MM/YYYY'), 24000, 123, 123);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013408271, TO_DATE('14/04/2022', 'DD/MM/YYYY'), 120000, 124, 124);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013049665, TO_DATE('15/04/2022', 'DD/MM/YYYY'), 60000, 125, 125);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013261919, TO_DATE('18/04/2022', 'DD/MM/YYYY'), 35000, 126, 126);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013746130, TO_DATE('20/04/2022', 'DD/MM/YYYY'), 36000, 127, 127);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013631341, TO_DATE('23/04/2022', 'DD/MM/YYYY'), 120000, 128, 128);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013299935, TO_DATE('25/04/2022', 'DD/MM/YYYY'), 24000, 129, 129);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013170129, TO_DATE('26/04/2022', 'DD/MM/YYYY'), 50000, 130, 130);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013232263, TO_DATE('30/04/2022', 'DD/MM/YYYY'), 28000, 131, 131);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013091016, TO_DATE('30/04/2022', 'DD/MM/YYYY'), 150000, 132, 132);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013971833, TO_DATE('01/05/2022', 'DD/MM/YYYY'), 28000, 133, 133);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013408271, TO_DATE('05/05/2022', 'DD/MM/YYYY'), 50000, 134, 134);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013049665, TO_DATE('09/05/2022', 'DD/MM/YYYY'), 15000, 135, 135);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013261919, TO_DATE('10/05/2022', 'DD/MM/YYYY'), 50000, 136, 136);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013746130, TO_DATE('15/05/2022', 'DD/MM/YYYY'), 20000, 137, 137);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013631341, TO_DATE('15/05/2022', 'DD/MM/YYYY'), 120000, 138, 138);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013299935, TO_DATE('20/05/2022', 'DD/MM/YYYY'), 45000, 139, 139);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013170129, TO_DATE('20/05/2022', 'DD/MM/YYYY'), 40000, 140, 140);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013232263, TO_DATE('25/05/2022', 'DD/MM/YYYY'), 22000, 141, 141);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013091016, TO_DATE('30/05/2022', 'DD/MM/YYYY'), 15000, 142, 142);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013971833, TO_DATE('01/06/2022', 'DD/MM/YYYY'), 20000, 143, 143);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013408271, TO_DATE('05/06/2022', 'DD/MM/YYYY'), 24000, 144, 144);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013049665, TO_DATE('05/06/2022', 'DD/MM/YYYY'), 45000, 145, 145);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013261919, TO_DATE('09/06/2022', 'DD/MM/YYYY'), 15000, 146, 146);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013746130, TO_DATE('10/06/2022', 'DD/MM/YYYY'), 20000, 147, 147);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013631341, TO_DATE('14/06/2022', 'DD/MM/YYYY'), 120000, 148, 148);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013299935, TO_DATE('15/06/2022', 'DD/MM/YYYY'), 30000, 149, 149);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013170129, TO_DATE('20/06/2022', 'DD/MM/YYYY'), 28000, 150, 150);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013232263, TO_DATE('25/06/2022', 'DD/MM/YYYY'), 36000, 151, 151);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013091016, TO_DATE('30/06/2022', 'DD/MM/YYYY'), 15000, 152, 152);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013971833, TO_DATE('01/07/2022', 'DD/MM/YYYY'), 45000, 153, 153);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013408271, TO_DATE('05/07/2022', 'DD/MM/YYYY'), 15000, 154, 154);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013049665, TO_DATE('10/07/2022', 'DD/MM/YYYY'), 15000, 155, 155);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013261919, TO_DATE('09/07/2022', 'DD/MM/YYYY'), 50000, 156, 156);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013746130, TO_DATE('15/07/2022', 'DD/MM/YYYY'), 15000, 157, 157);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013631341, TO_DATE('20/07/2022', 'DD/MM/YYYY'), 130000, 158, 158);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013299935, TO_DATE('25/07/2022', 'DD/MM/YYYY'), 22000, 159, 159);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013170129, TO_DATE('27/07/2022', 'DD/MM/YYYY'), 70000, 160, 160);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013232263, TO_DATE('01/08/2022', 'DD/MM/YYYY'), 15000, 161, 161);

INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013091016, TO_DATE('02/08/2022', 'DD/MM/YYYY'), 36000, 162, 162);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013971833, TO_DATE('03/08/2022', 'DD/MM/YYYY'), 200000, 163, 163);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013408271, TO_DATE('04/08/2022', 'DD/MM/YYYY'), 24000, 164, 164);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013049665, TO_DATE('05/08/2022', 'DD/MM/YYYY'), 50000, 165, 165);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013261919, TO_DATE('05/08/2022', 'DD/MM/YYYY'), 45000, 166, 166);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013746130, TO_DATE('06/08/2022', 'DD/MM/YYYY'), 55000, 167, 167);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013631341, TO_DATE('07/08/2022', 'DD/MM/YYYY'), 15000, 168, 168);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013299935, TO_DATE('08/08/2022', 'DD/MM/YYYY'), 50000, 169, 169);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013170129, TO_DATE('09/08/2022', 'DD/MM/YYYY'), 22000, 170, 170);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013232263, TO_DATE('14/08/2022', 'DD/MM/YYYY'), 120000, 171, 171);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013091016, TO_DATE('30/08/2022', 'DD/MM/YYYY'), 150000, 172, 172);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013971833, TO_DATE('03/09/2022', 'DD/MM/YYYY'), 40000, 173, 173);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013408271, TO_DATE('04/09/2022', 'DD/MM/YYYY'), 28000, 174, 174);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013049665, TO_DATE('07/09/2022', 'DD/MM/YYYY'), 200000, 175, 175);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013261919, TO_DATE('09/09/2022', 'DD/MM/YYYY'), 15000, 176, 176);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013746130, TO_DATE('14/09/2022', 'DD/MM/YYYY'), 24000, 177, 177);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013631341, TO_DATE('18/09/2022', 'DD/MM/YYYY'), 35000, 178, 178);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013299935, TO_DATE('23/09/2022', 'DD/MM/YYYY'), 24000, 179, 179);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013170129, TO_DATE('05/10/2022', 'DD/MM/YYYY'), 28000, 180, 180);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013232263, TO_DATE('09/10/2022', 'DD/MM/YYYY'), 40000, 181, 181);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013091016, TO_DATE('14/10/2022', 'DD/MM/YYYY'), 120000, 182, 182);

INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013971833, TO_DATE('18/10/2022', 'DD/MM/YYYY'), 36000, 183, 183);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013408271, TO_DATE('22/10/2022', 'DD/MM/YYYY'), 15000, 184, 184);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013049665, TO_DATE('26/10/2022', 'DD/MM/YYYY'), 50000, 185, 185);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013261919, TO_DATE('30/10/2022', 'DD/MM/YYYY'), 150000, 186, 186);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013746130, TO_DATE('01/11/2022', 'DD/MM/YYYY'), 28000, 187, 187);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013631341, TO_DATE('05/11/2022', 'DD/MM/YYYY'), 50000, 188, 188);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013299935, TO_DATE('10/11/2022', 'DD/MM/YYYY'), 50000, 189, 189);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013170129, TO_DATE('15/11/2022', 'DD/MM/YYYY'), 20000, 190, 190);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013232263, TO_DATE('20/11/2022', 'DD/MM/YYYY'), 45000, 191, 191);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013091016, TO_DATE('25/11/2022', 'DD/MM/YYYY'), 22000, 192, 192);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013971833, TO_DATE('30/11/2022', 'DD/MM/YYYY'), 15000, 193, 193);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013408271, TO_DATE('03/12/2022', 'DD/MM/YYYY'), 45000, 194, 194);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013049665, TO_DATE('05/12/2022', 'DD/MM/YYYY'), 120000, 195, 195);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013261919, TO_DATE('10/12/2022', 'DD/MM/YYYY'), 22000, 196, 196);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013746130, TO_DATE('12/12/2022', 'DD/MM/YYYY'), 28000, 197, 197);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013631341, TO_DATE('15/12/2022', 'DD/MM/YYYY'), 160000, 198, 198);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013299935, TO_DATE('17/12/2022', 'DD/MM/YYYY'), 60000, 199, 199);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013170129, TO_DATE('20/12/2022', 'DD/MM/YYYY'), 50000, 200, 200);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013232263, TO_DATE('21/12/2022', 'DD/MM/YYYY'), 50000, 201, 201);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013091016, TO_DATE('24/12/2022', 'DD/MM/YYYY'), 50000, 202, 202);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013971833, TO_DATE('28/02/2022', 'DD/MM/YYYY'), 15000, 203, 203);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013408271, TO_DATE('31/12/2022', 'DD/MM/YYYY'), 50000, 204, 204);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013049665, TO_DATE('03/01/2023', 'DD/MM/YYYY'), 20000, 205, 205);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013261919, TO_DATE('05/01/2023', 'DD/MM/YYYY'), 200000, 206, 206);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013746130, TO_DATE('03/01/2023', 'DD/MM/YYYY'), 22000, 207, 207);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013631341, TO_DATE('09/01/2023', 'DD/MM/YYYY'), 15000, 208, 208);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013299935, TO_DATE('14/01/2023', 'DD/MM/YYYY'), 28000, 209, 209);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013170129, TO_DATE('18/01/2023', 'DD/MM/YYYY'), 200000, 210, 210);

INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013232263, TO_DATE('22/01/2023', 'DD/MM/YYYY'), 15000, 211, 211);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013091016, TO_DATE('26/01/2023', 'DD/MM/YYYY'), 200000, 212, 212);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013971833, TO_DATE('30/01/2023', 'DD/MM/YYYY'), 30000, 213, 213);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013408271, TO_DATE('05/02/2023', 'DD/MM/YYYY'), 22000, 214, 214);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013049665, TO_DATE('09/02/2023', 'DD/MM/YYYY'), 15000, 215, 215);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013261919, TO_DATE('14/02/2023', 'DD/MM/YYYY'), 28000, 216, 216);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013746130, TO_DATE('18/02/2023', 'DD/MM/YYYY'), 200000, 217, 217);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013631341, TO_DATE('22/02/2023', 'DD/MM/YYYY'), 15000, 218, 218);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013299935, TO_DATE('26/02/2023', 'DD/MM/YYYY'), 200000, 219, 219);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013170129, TO_DATE('03/03/2023', 'DD/MM/YYYY'), 22000, 220, 220);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013232263, TO_DATE('09/03/2023', 'DD/MM/YYYY'), 15000, 221, 221);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013091016, TO_DATE('14/03/2023', 'DD/MM/YYYY'), 28000, 222, 222);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013971833, TO_DATE('17/03/2023', 'DD/MM/YYYY'), 28000, 223, 223);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013408271, TO_DATE('17/03/2023', 'DD/MM/YYYY'), 200000, 224, 224);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013049665, TO_DATE('29/03/2023', 'DD/MM/YYYY'), 15000, 225, 225);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013261919, TO_DATE('30/03/2023', 'DD/MM/YYYY'), 30000, 226, 226);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013746130, TO_DATE('01/04/2023', 'DD/MM/YYYY'), 120000, 227, 227);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013631341, TO_DATE('05/04/2023', 'DD/MM/YYYY'), 70000, 228, 228);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013299935, TO_DATE('10/04/2023', 'DD/MM/YYYY'), 40000, 229, 229);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013170129, TO_DATE('20/04/2023', 'DD/MM/YYYY'), 50000, 230, 230);


INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013232263, TO_DATE('25/04/2023', 'DD/MM/YYYY'), 200000, 231, 231);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013091016, TO_DATE('30/04/2023', 'DD/MM/YYYY'), 140000, 232, 232);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013971833, TO_DATE('30/04/2023', 'DD/MM/YYYY'), 150000, 233, 233);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013408271, TO_DATE('05/05/2023', 'DD/MM/YYYY'), 22000, 234, 234);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013049665, TO_DATE('09/05/2023', 'DD/MM/YYYY'), 15000, 235, 235);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013261919, TO_DATE('14/05/2023', 'DD/MM/YYYY'), 28000, 236, 236);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013746130, TO_DATE('18/05/2023', 'DD/MM/YYYY'), 200000, 237, 237);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013631341, TO_DATE('22/05/2023', 'DD/MM/YYYY'), 15000, 238, 238);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013299935, TO_DATE('26/05/2023', 'DD/MM/YYYY'), 200000, 239, 239);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013170129, TO_DATE('30/05/2023', 'DD/MM/YYYY'), 30000, 240, 240);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013232263, TO_DATE('03/06/2023', 'DD/MM/YYYY'), 40000, 241, 241);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013091016, TO_DATE('04/06/2023', 'DD/MM/YYYY'), 28000, 242, 242);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013971833, TO_DATE('07/06/2023', 'DD/MM/YYYY'), 200000, 243, 243);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013408271, TO_DATE('09/06/2023', 'DD/MM/YYYY'), 15000, 244, 244);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013049665, TO_DATE('14/06/2023', 'DD/MM/YYYY'), 24000, 245, 245);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013261919, TO_DATE('18/06/2023', 'DD/MM/YYYY'), 35000, 246, 246);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013746130, TO_DATE('23/06/2023', 'DD/MM/YYYY'), 24000, 247, 247);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013631341, TO_DATE('01/07/2023', 'DD/MM/YYYY'), 20000, 248, 248);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013299935, TO_DATE('05/07/2023', 'DD/MM/YYYY'), 24000, 249, 249);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013170129, TO_DATE('10/07/2023', 'DD/MM/YYYY'), 20000, 250, 250);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013232263, TO_DATE('15/07/2023', 'DD/MM/YYYY'), 30000, 251, 251);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013091016, TO_DATE('20/07/2023', 'DD/MM/YYYY'), 28000, 252, 252);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013971833, TO_DATE('25/07/2023', 'DD/MM/YYYY'), 36000, 253, 253);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013408271, TO_DATE('26/07/2023', 'DD/MM/YYYY'), 50000, 254, 254);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013049665, TO_DATE('30/07/2023', 'DD/MM/YYYY'), 15000, 255, 255);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013261919, TO_DATE('01/08/2023', 'DD/MM/YYYY'), 28000, 256, 256);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013746130, TO_DATE('05/08/2023', 'DD/MM/YYYY'), 150000, 257, 257);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013631341, TO_DATE('10/08/2023', 'DD/MM/YYYY'), 15000, 258, 258);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013299935, TO_DATE('15/08/2023', 'DD/MM/YYYY'), 20000, 259, 259);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013170129, TO_DATE('20/08/2023', 'DD/MM/YYYY'), 15000, 260, 260);

INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013232263, TO_DATE('24/08/2023', 'DD/MM/YYYY'), 200000, 261, 261);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013091016, TO_DATE('25/08/2023', 'DD/MM/YYYY'), 190000, 262, 262);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013971833, TO_DATE('30/08/2023', 'DD/MM/YYYY'), 150000, 263, 263);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013408271, TO_DATE('31/08/2023', 'DD/MM/YYYY'), 15000, 264, 264);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013049665, TO_DATE('01/09/2023', 'DD/MM/YYYY'), 80000, 265, 265);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013261919, TO_DATE('03/09/2023', 'DD/MM/YYYY'), 22000, 266, 266);
INSERT INTO PAGO (EMPLEADO_N_ID_empleado, Fecha, Total_pago, REGISTRO_ID_registro, ID_pago) VALUES (1013746130, TO_DATE('05/09/2023', 'DD/MM/YYYY'), 15000, 267, 267);



SELECT*
FROM PAGO

INSERT INTO PARAMETRO (ID,Porcentaje,Festivo) VALUES (1,0.5,'si');
INSERT INTO PARAMETRO (ID,Porcentaje,Festivo) VALUES (2,0.4,'no');

SELECT*
FROM PARAMETRO

INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013232263, 40000, 16000, 2, 1, 1);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013091016, 28000, 14000, 1, 2, 2);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013971833, 200000, 100000, 1, 3, 3);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013408271, 40000, 20000, 1, 4, 4);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013049665, 15000, 6000, 2, 5, 5);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013261919, 40000, 16000, 2, 6, 6);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013746130, 24000, 9600, 2, 7, 7);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013631341, 40000, 16000, 2, 8, 8);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013299935, 35000, 17500, 1, 9, 9);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013170129, 24000, 9600, 2, 10, 10);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013232263, 28000, 11200, 2, 11, 11);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013091016, 40000, 16000, 2, 12, 12);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013971833, 40000, 16000, 2, 13, 13);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013408271, 15000, 6000, 2, 14, 14);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013049665, 120000, 48000, 2, 15, 15);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013261919, 40000, 20000, 1, 16, 16);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013746130, 36000, 14400, 2, 17, 17);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013631341, 35000, 14000, 2, 18, 18);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013299935, 15000, 7500, 1, 19, 19);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013170129, 50000, 20000, 2, 20, 20);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013232263, 150000, 60000, 2, 21, 21);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013091016, 45000, 22500, 1, 22, 22);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013971833, 28000, 11200, 2, 23, 23);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013408271, 15000, 6000, 2, 24, 24);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013049665, 40000, 16000, 2, 25, 25);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013261919, 45000, 18000, 2, 26, 26);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013746130, 120000, 48000, 2, 27, 27);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013631341, 15000, 6000, 2, 28, 28);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013299935, 35000, 14000, 2, 29, 29);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013170129, 70000, 28000, 2, 30, 30);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013232263, 24000, 9600, 2, 31, 31);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013091016, 40000, 16000, 2, 32, 32);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013971833, 40000, 16000, 2, 33, 33);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013408271, 15000, 7500, 1, 34, 34);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013049665, 60000, 24000, 2, 35, 35);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013261919, 150000, 60000, 2, 36, 36);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013746130, 22000, 8800, 2, 37, 37);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013631341, 45000, 18000, 2, 38, 38);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013299935, 15000, 6000, 2, 39, 39);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013170129, 15000, 6000, 2, 40, 40);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013232263, 40000, 20000, 1, 41, 41);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013091016, 28000, 11200, 2, 42, 42);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013971833, 120000, 48000, 2, 43, 43);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013408271, 200000, 100000, 1, 44, 44);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013049665, 35000, 17500, 1, 45, 45);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013261919, 15000, 6000, 2, 46, 46);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013746130, 200000, 80000, 2, 47, 47);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013631341, 50000, 20000, 2, 48, 48);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013299935, 30000, 12000, 2, 49, 49);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013170129, 80000, 40000, 1, 50, 50);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013232263, 15000, 6000, 2, 51, 51);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013091016, 15000, 6000, 2, 52, 52);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013971833, 55000, 22000, 2, 53, 53);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013408271, 120000, 60000, 1, 54, 54);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013049665, 15000, 7500, 1, 55, 55);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013261919, 35000, 14000, 2, 56, 56);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013746130, 50000, 20000, 2, 57, 57);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013631341, 40000, 16000, 2, 58, 58);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013299935, 15000, 6000, 2, 59, 59);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013170129, 50000, 20000, 2, 60, 60);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013232263, 28000, 11200, 2, 61, 61);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013091016, 150000, 75000, 1, 62, 62);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013971833, 45000, 22500, 1, 63, 63);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013408271, 15000, 6000, 2, 64, 64);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013049665, 15000, 7500, 1, 65, 65);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013261919, 120000, 48000, 2, 66, 66);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013746130, 20000, 8000, 2, 67, 67);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013631341, 40000, 16000, 2, 68, 68);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013299935, 35000, 14000, 2, 69, 69);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013170129, 15000, 7500, 2, 70, 70);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013232263, 190000, 76000, 2, 71, 71);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013091016, 50000, 25000, 1, 72, 72);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013971833, 24000, 12000, 1, 73, 73);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013408271, 150000, 60000, 2, 74, 74);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013049665, 15000, 7500, 1, 75, 75);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013261919, 40000, 20000, 1, 76, 76);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013746130, 120000, 60000, 1, 77, 77);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013631341, 70000, 28000, 2, 78, 78);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013299935, 40000, 16000, 2, 79, 79);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013170129, 15000, 7500, 1, 80, 80);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013232263, 40000, 20000, 1, 81, 81);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013091016, 120000, 60000, 1, 82, 82);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013971833, 28000, 11200, 2, 83, 83);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013408271, 35000, 14000, 2, 84, 84);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013049665, 50000, 20000, 2, 85, 85);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013261919, 24000, 12000, 1, 86, 86);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013746130, 200000, 80000, 2, 87, 87);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013631341, 50000, 20000, 2, 88, 88);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013299935, 140000, 56000, 2, 89, 89);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013170129, 40000, 16000, 2, 90, 90);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013232263, 45000, 18000, 2, 91, 91);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013091016, 120000, 48000, 2, 92, 92);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013971833, 15000, 6000, 2, 93, 93);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013408271, 22000, 8800, 2, 94, 94);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013049665, 40000, 16000, 2, 95, 95);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013261919, 160000, 64000, 2, 96, 96);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013746130, 120000, 48000, 2, 97, 97);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013631341, 35000, 14000, 2, 98, 98);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013299935, 50000, 25000, 1, 99, 99);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013170129, 50000, 20000, 2, 100, 100);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013232263, 40000, 16000, 2, 101, 101);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013091016, 15000, 6000, 2, 102, 102);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013971833, 150000, 60000, 2, 103, 103);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013408271, 24000, 9600, 2, 104, 104);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013049665, 24000, 9600, 2, 105, 105);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013261919, 15000, 6000, 2, 106, 106);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013746130, 60000, 24000, 2, 107, 107);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013631341, 40000, 16000, 2, 108, 108);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013299935, 50000, 20000, 2, 109, 109);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013170129, 50000, 20000, 2, 110, 110);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013232263, 35000, 14000, 2, 111, 111);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013091016, 120000, 48000, 2, 112, 112);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013971833, 90000, 45000, 1, 113, 113);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013408271, 22000, 8800, 2, 114, 114);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013049665, 50000, 20000, 2, 115, 115);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013261919, 150000, 60000, 2, 116, 116);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013746130, 80000, 32000, 2, 117, 117);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013631341, 120000, 48000, 2, 118, 118);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013299935, 120000, 48000, 2, 119, 119);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013170129, 40000, 16000, 2, 120, 120);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013232263, 45000, 18000, 2, 121, 121);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013091016, 15000, 6000, 2, 122, 122);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013971833, 24000, 12000, 1, 123, 123);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013408271, 120000, 60000, 1, 124, 124);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013049665, 60000, 30000, 1, 125, 125);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013261919, 35000, 14000, 2, 126, 126);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013746130, 36000, 14400, 2, 127, 127);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013631341, 120000, 48000, 2, 128, 128);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013299935, 24000, 9600, 2, 129, 129);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013170129, 50000, 20000, 2, 130, 130);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013232263, 28000, 11200, 2, 131, 131);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013091016, 150000, 60000, 2, 132, 132);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013971833, 28000, 14000, 1, 133, 133);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013408271, 50000, 20000, 2, 134, 134);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013049665, 15000, 6000, 2, 135, 135);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013261919, 50000, 20000, 2, 136, 136);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013746130, 20000, 10000, 1, 137, 137);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013631341, 120000, 60000, 1, 138, 138);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013299935, 45000, 18000, 2, 139, 139);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013170129, 40000, 16000, 2, 140, 140);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013232263, 22000, 8800, 2, 141, 141);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013091016, 15000, 7500, 1, 142, 142);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013971833, 20000, 8000, 2, 143, 143);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013408271, 24000, 12000, 1, 144, 144);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013049665, 45000, 22500, 1, 145, 145);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013261919, 15000, 6000, 2, 146, 146);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013746130, 20000, 8000, 2, 147, 147);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013631341, 120000, 48000, 2, 148, 148);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013299935, 30000, 12000, 2, 149, 149);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013170129, 28000, 14000, 1, 150, 150);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013232263, 36000, 14400, 2, 151, 151);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013091016, 15000, 6000, 2, 152, 152);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013971833, 45000, 18000, 2, 153, 153);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013408271, 15000, 6000, 2, 154, 154);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013049665, 50000, 20000, 2, 155, 155);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013261919, 15000, 7500, 1, 156, 156);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013746130, 15000, 6000, 2, 157, 157);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013631341, 130000, 65000, 1, 158, 158);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013299935, 22000, 8800, 2, 159, 159);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013170129, 70000, 28000, 2, 160, 160);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013232263, 15000, 6000, 2, 161, 161);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013091016, 36000, 14400, 2, 162, 162);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013971833, 200000, 80000, 2, 163, 163);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013408271, 24000, 9600, 2, 164, 164);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013049665, 50000, 20000, 2, 165, 165);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013261919, 45000, 18000, 2, 166, 166);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013746130, 55000, 22000, 2, 167, 167);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013631341, 15000, 7500, 1, 168, 168);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013299935, 50000, 20000, 2, 169, 169);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013170129, 22000, 8800, 2, 170, 170);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013232263, 120000, 60000, 1, 171, 171);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013091016, 150000, 60000, 2, 172, 172);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013971833, 40000, 16000, 2, 173, 173);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013408271, 28000, 14000, 1, 174, 174);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013049665, 200000, 80000, 2, 175, 175);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013261919, 15000, 6000, 2, 176, 176);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013746130, 24000, 9600, 2, 177, 177);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013631341, 35000, 17500, 1, 178, 178);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013299935, 24000, 9600, 2, 179, 179);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013170129, 28000, 11200, 2, 180, 180);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013232263, 40000, 20000, 1, 181, 181);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013091016, 120000, 48000, 2, 182, 182);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013971833, 36000, 14400, 2, 183, 183);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013408271, 15000, 6000, 2, 184, 184);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013049665, 50000, 20000, 2, 185, 185);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013261919, 150000, 75000, 1, 186, 186);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013746130, 28000, 11200, 2, 187, 187);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013631341, 50000, 20000, 2, 188, 188);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013299935, 50000, 20000, 2, 189, 189);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013170129, 20000, 8000, 2, 190, 190);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013232263, 45000, 22500, 1, 191, 191);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013091016, 22000, 8800, 2, 192, 192);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013971833, 15000, 6000, 2, 193, 193);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013408271, 45000, 18000, 2, 194, 194);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013049665, 120000, 48000, 2, 195, 195);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013261919, 22000, 8800, 2, 196, 196);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013746130, 28000, 11200, 2, 197, 197);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013631341, 160000, 64000, 2, 198, 198);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013299935, 60000, 24000, 2, 199, 199);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013170129, 50000, 20000, 2, 200, 200);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013232263, 50000, 20000, 2, 201, 201);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013091016, 50000, 25000, 1, 202, 202);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013971833, 15000, 6000, 2, 203, 203);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013408271, 50000, 25000, 1, 204, 204);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013049665, 20000, 10000, 1, 205, 205);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013261919, 22000, 8800, 2, 206, 206);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013746130, 200000, 80000, 2, 207, 207);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013631341, 15000, 7500, 1, 208, 208);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013299935, 28000, 11200, 2, 209, 209);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013170129, 200000, 80000, 2, 210, 210);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013232263, 15000, 7500, 1, 211, 211);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013091016, 200000, 80000, 2, 212, 212);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013971833, 30000, 12000, 2, 213, 213);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013408271, 22000, 11000, 1, 214, 214);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013049665, 15000, 6000, 2, 215, 215);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013261919, 28000, 11200, 2, 216, 216);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013746130, 200000, 80000, 2, 217, 217);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013631341, 15000, 6000, 2, 218, 218);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013299935, 200000, 100000, 1, 219, 219);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013170129, 22000, 8800, 2, 220, 220);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013232263, 15000, 6000, 2, 221, 221);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013091016, 28000, 11200, 2, 222, 222);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013971833, 28000, 11200, 2, 223, 223);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013408271, 200000, 80000, 2, 224, 224);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013049665, 15000, 6000, 2, 225, 225);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013261919, 30000, 12000, 2, 226, 226);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013746130, 120000, 48000, 2, 227, 227);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013631341, 70000, 28000, 2, 228, 228);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013299935, 40000, 16000, 2, 229, 229);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013170129, 50000, 20000, 2, 230, 230);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013232263, 200000, 80000, 2, 231, 231);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013091016, 140000, 70000, 1, 232, 232);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013971833, 150000, 75000, 1, 233, 233);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013408271, 22000, 8800, 2, 234, 234);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013049665, 15000, 6000, 2, 235, 235);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013261919, 28000, 14000, 1, 236, 236);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013746130, 200000, 80000, 2, 237, 237);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013631341, 15000, 7500, 1, 238, 238);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013299935, 200000, 80000, 2, 239, 239);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013170129, 30000, 12000, 2, 240, 240);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013232263, 40000, 16000, 2, 241, 241);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013091016, 28000, 14000, 1, 242, 242);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013971833, 200000, 80000, 2, 243, 243);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013408271, 15000, 6000, 2, 244, 244);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013049665, 24000, 9600, 2, 245, 245);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013261919, 35000, 17500, 1, 246, 246);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013746130, 24000, 9600, 2, 247, 247);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013631341, 20000, 8000, 2, 248, 248);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013299935, 24000, 9600, 2, 249, 249);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013170129, 20000, 8000, 2, 250, 250);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013232263, 30000, 12000, 2, 251, 251);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013091016, 28000, 14000, 1, 252, 252);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013971833, 36000, 14400, 2, 253, 253);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013408271, 50000, 20000, 2, 254, 254);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013049665, 15000, 7500, 1, 255, 255);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013261919, 28000, 11200, 2, 256, 256);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013746130, 150000, 60000, 2, 257, 257);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013631341, 15000, 6000, 2, 258, 258);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013299935, 20000, 8000, 2, 259, 259);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013170129, 15000, 7500, 1, 260, 260);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013232263, 200000, 80000, 2, 261, 261);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013091016, 190000, 76000, 2, 262, 262);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013971833, 150000, 60000, 2, 263, 263);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013408271, 15000, 6000, 2, 264, 264);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013049665, 80000, 32000, 2, 265, 265);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013261919, 22000, 11000, 1, 266, 266);
INSERT INTO LIQUIDACIÓN_PAGO_EMP (EMPLEADO_N_ID_empleado, Producido, Comisión, PARAMETRO_ID, PAGO_ID_pago, ID_liquidación) VALUES (1013746130, 15000, 6000, 2, 267, 267);

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

----------------------------GANANCIA NETA MENSUAL
SELECT
    TO_CHAR(P.Fecha, 'YYYY-MM') AS Mes,
    SUM(LP.Producido) AS Total_Pago,
    SUM(LP.Comisión) AS Comision,
    SUM(LP.Producido - LP.Comisión) AS GananciaNetaMensual
FROM
    LIQUIDACIÓN_PAGO_EMP LP
INNER JOIN
    PAGO P ON LP.PAGO_ID_pago = P.ID_pago
GROUP BY
    TO_CHAR(P.Fecha, 'YYYY-MM')
ORDER BY
    Mes ASC;
    
 ---------------clientes con numero de registros mayor a 4   -    diario
 SELECT
    c.N_ID_cliente,
    c.Nombre,
    c.Apellido,
    COUNT(r.ID_registro) AS Total_registros
FROM
    CLIENTE c
JOIN
    VEHICULO v ON c.N_ID_cliente = v.CLIENTE_N_ID_cliente
JOIN
    REGISTRO r ON v.Placa = r.VEHICULO_Placa
GROUP BY
    c.N_ID_cliente, c.Nombre, c.Apellido
HAVING
    COUNT(r.ID_registro) >= 4
ORDER BY
    Total_registros DESC;   

-----------------------   diario ------
SELECT 
    S.ID_servicio AS ID_de_Servicio,
    S.Nombre AS Tipo_de_Servicio,
    TC.ID AS ID_de_Carrocería,
    TC.Descripción AS Tipo_de_Carrocería,
    ROUND(AVG((R.Fecha_hora_salida - R.Fecha_hora_ingreso) * 24 * 60)) AS Promedio_de_Tiempo_en_Minutos
FROM 
    (SELECT DISTINCT ID_servicio, Nombre FROM SERVICIO) S
CROSS JOIN 
    (SELECT DISTINCT ID, Descripción FROM TIPO_CARROCERIA) TC
LEFT JOIN
    REGISTRO R ON S.ID_servicio = R.PRECIO_SERVICIO_ID_precio
    JOIN VEHICULO V ON R.VEHICULO_Placa = V.Placa
    JOIN TIPO_CARROCERIA T ON V.TIPO_CARROCERIA_ID = T.ID
GROUP BY 
    S.ID_servicio, S.Nombre, TC.ID, TC.Descripción
ORDER BY 
    S.ID_servicio, TC.ID;

----------------------    diario -------
SELECT
    M.Nombre_marca AS Marca_vehículo,
    COUNT(*) AS Cantidad_de_Visitas
FROM MARCA M
LEFT JOIN VEHICULO V ON M.ID_marca = V.MARCA_ID_marca
LEFT JOIN REGISTRO R ON V.Placa = R.VEHICULO_Placa
GROUP BY M.Nombre_marca
ORDER BY Cantidad_de_Visitas DESC;

----------------------   anual --------


 SELECT 
    tc.Nombre AS Tipo_carroceria, 
    SUM(CASE WHEN TO_CHAR(r.Fecha_hora_ingreso, 'YYYY') = '2021' THEN 1 ELSE 0 END) AS Total_registros_2021, 
    SUM(CASE WHEN TO_CHAR(r.Fecha_hora_ingreso, 'YYYY') = '2022' THEN 1 ELSE 0 END) AS Total_registros_2022 
FROM 
    REGISTRO r 
JOIN 
     VEHICULO v ON r.VEHICULO_Placa = v.Placa 
JOIN 
    TIPO_CARROCERIA tc ON v.TIPO_CARROCERIA_ID = tc.ID 
WHERE 
    TO_CHAR(r.Fecha_hora_ingreso, 'YYYY') IN ('2021', '2022') 
GROUP BY 
    tc.Nombre 
ORDER BY 
    Tipo_carroceria; 
    
    
-----------------------------------  diario --------
SELECT 
    C.N_ID_cliente,
    ROUND(AVG(P.Total_pago), 1) AS Ingreso_Promedio
FROM CLIENTE C
INNER JOIN VEHICULO V ON C.N_ID_cliente = V.CLIENTE_N_ID_cliente
INNER JOIN REGISTRO R ON V.Placa = R.VEHICULO_Placa
INNER JOIN PAGO P ON R.ID_registro = P.REGISTRO_ID_registro
GROUP BY C.N_ID_cliente;

---------------------

