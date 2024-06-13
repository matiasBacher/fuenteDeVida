drop table PROPIEDADES_PRODUCTOS;

drop table CAJEROS_VENTAS;

drop table LISTAPRECIOS;

drop table DETALLESDEPAGO;

drop table REMPLAZADOS;

drop table DETALLEDECOMPRAS;

drop table DETALLEDEVENTAS;

drop table CORRECCIONVENTAS;

drop table FACTURACOMPRAS;

drop table ESTADOSRCEPCIONES;

drop table ESTADOSENVIOPEDIDOS;

drop table FACTURASVENTAS;

drop table DEVOLUCIONES;

drop table ESTADOSDEPAGOS;

drop table PEDIDOS;

drop table PROVEEDORES;

drop table CLIENTES;

drop table DOMICILIOS;

drop table LOCALIDADES;

drop table LOTES;

drop table PRODUCTOS;

drop table VENTAS;

drop table PROVINCIAS;

drop table CAJEROS;

drop table PROPIEDADES;

drop table CATEGORIAS;

create table CATEGORIAS
(
    ID_CATEGORIA                    INTEGER               not null,
    NOMBRE_CATEGORIA                VARCHAR(250)                  ,
    primary key (ID_CATEGORIA)
);

create unique index CATEGORIAS_PK on CATEGORIAS (ID_CATEGORIA asc);

create table PROPIEDADES
(
    ID_PROPIEDADES                  INTEGER               not null,
    NOMBRE_PROPIEDADES              VARCHAR(250)                  ,
    primary key (ID_PROPIEDADES)
);

create unique index PROPIEDADES_PK on PROPIEDADES (ID_PROPIEDADES asc);

create table CAJEROS
(
    CUIT_CAJERO                     INTEGER               not null,
    NOMBRE_CAJERO                   VARCHAR(250)          not null,
    APELLIDO_CAJERO                 VARCHAR(250)          not null,
    primary key (CUIT_CAJERO)
);

create unique index CAJEROS_PK on CAJEROS (CUIT_CAJERO asc);

create table PROVINCIAS
(
    ID_PROVINCIA                    INTEGER               not null,
    NOMBRE_PROVINCIA                VARCHAR(250)          not null,
    primary key (ID_PROVINCIA)
);

create unique index PROVINCIAS_PK on PROVINCIAS (ID_PROVINCIA asc);

create table VENTAS
(
    ID_VENTA                        INTEGER               not null,
    NUMEROFACTURAVENTAS             INTEGER                       ,
    VEN_ID_VENTA                    INTEGER                       ,
    COR_ID_VENTA                    INTEGER                       ,
    COR_VEN_ID_VENTA                INTEGER                       ,
    COR2_ID_VENTA                   INTEGER                       ,
    FECHA_VENTA                     DATE                  not null,
    HORA_VENTA                      TIME                  not null,
    METODODEPAGO_VENTA              VARCHAR(250)          not null,
    ERROR_VENTA                     NUMERIC(1)            not null,
    primary key (ID_VENTA),
    foreign key  (NUMEROFACTURAVENTAS)
       references FACTURASVENTAS (NUMEROFACTURAVENTAS),
    foreign key  (VEN_ID_VENTA, COR_ID_VENTA)
       references CORRECCIONVENTAS (VEN_ID_VENTA, ID_VENTA),
    foreign key  (COR_VEN_ID_VENTA, COR2_ID_VENTA)
       references CORRECCIONVENTAS (VEN_ID_VENTA, ID_VENTA)
);

create unique index VENTAS_PK on VENTAS (ID_VENTA asc);

create index VENTAS_FACTURAVENTAS_FK2 on VENTAS (NUMEROFACTURAVENTAS asc);

create index CORRECIONDEVENTA_FK2 on VENTAS (VEN_ID_VENTA asc, COR_ID_VENTA asc);

create index VENTACORREGIDA_FK2 on VENTAS (COR_VEN_ID_VENTA asc, COR2_ID_VENTA asc);

create table PRODUCTOS
(
    ID_PRODUCTO                     INTEGER               not null,
    ID_CATEGORIA                    INTEGER                       ,
    NOMBRE_PRODUCTO                 VARCHAR(250)                  ,
    PRECIODEVENTA_PRODUCTO          INTEGER                       ,
    GANANCIA_PRODUCTO               INTEGER                       ,
    primary key (ID_PRODUCTO),
    foreign key  (ID_CATEGORIA)
       references CATEGORIAS (ID_CATEGORIA)
);

create unique index PRODUCTOS_PK on PRODUCTOS (ID_PRODUCTO asc);

create index CATEGORIAS_PRODUCTOS_FK on PRODUCTOS (ID_CATEGORIA asc);

create table LOTES
(
    ID_LOTE                         INTEGER               not null,
    ID_PRODUCTO                     INTEGER               not null,
    ID_PROVEEDOR                    INTEGER                       ,
    FECHAVENCIMEINTO_LOTE           DATE                  not null,
    CANTIDAD_LOTE                   INTEGER               not null,
    primary key (ID_LOTE),
    foreign key  (ID_PRODUCTO)
       references PRODUCTOS (ID_PRODUCTO),
    foreign key  (ID_PROVEEDOR)
       references PROVEEDORES (ID_PROVEEDOR)
);

create unique index LOTES_PK on LOTES (ID_LOTE asc);

create index RELATION_193_FK on LOTES (ID_PRODUCTO asc);

create index LOTES_PROVEEDORES_FK on LOTES (ID_PROVEEDOR asc);

create table LOCALIDADES
(
    ID_LOCALIDAD                    INTEGER               not null,
    ID_PROVINCIA                    INTEGER               not null,
    NOMBRE_LOCALIDAD                VARCHAR(250)          not null,
    primary key (ID_LOCALIDAD),
    foreign key  (ID_PROVINCIA)
       references PROVINCIAS (ID_PROVINCIA)
);

create unique index LOCALIDADES_PK on LOCALIDADES (ID_LOCALIDAD asc);

create index PROVINCIAS_LOCALIDADES_FK on LOCALIDADES (ID_PROVINCIA asc);

create table DOMICILIOS
(
    ID_DOMICILIO                    INTEGER               not null,
    ID_LOCALIDAD                    INTEGER               not null,
    DIRECCION_DOMICILIO             VARCHAR(250)          not null,
    primary key (ID_DOMICILIO),
    foreign key  (ID_LOCALIDAD)
       references LOCALIDADES (ID_LOCALIDAD)
);

create unique index DOMICILIOS_PK on DOMICILIOS (ID_DOMICILIO asc);

create index LOCALIDADES_DOMICILIOS_FK on DOMICILIOS (ID_LOCALIDAD asc);

create table CLIENTES
(
    CUIL_CLIENTE                    INTEGER               not null,
    ID_DOMICILIO                    INTEGER                       ,
    NOMBRE_CLIENTE                  VARCHAR(250)          not null,
    primary key (CUIL_CLIENTE),
    foreign key  (ID_DOMICILIO)
       references DOMICILIOS (ID_DOMICILIO)
);

create unique index CLIENTES_PK on CLIENTES (CUIL_CLIENTE asc);

create index RELATION_174_FK on CLIENTES (ID_DOMICILIO asc);

create table PROVEEDORES
(
    ID_PROVEEDOR                    INTEGER               not null,
    ID_DOMICILIO                    INTEGER                       ,
    CUIL_PROVEEDOR                  INTEGER                       ,
    NOMBRE_PROVEEDOR                VARCHAR(250)          not null,
    APELIIDO_PROVEEDOR              VARCHAR(250)          not null,
    TEL_PROVEEDOR                   INTEGER               not null,
    EMAIL_PROVEEDOR                 VARCHAR(250)          not null,
    primary key (ID_PROVEEDOR),
    foreign key  (ID_DOMICILIO)
       references DOMICILIOS (ID_DOMICILIO)
);

create unique index PROVEEDORES_PK on PROVEEDORES (ID_PROVEEDOR asc);

create index PROVEEDOR_DOMICILIOS_FK on PROVEEDORES (ID_DOMICILIO asc);

create table PEDIDOS
(
    ID_PEDIDO                       INTEGER               not null,
    EST_ID_PEDIDO                   INTEGER                       ,
    EST2_ID_PEDIDO                  INTEGER                       ,
    EST3_ID_PEDIDO                  INTEGER                       ,
    FAC_ID_PEDIDO                   INTEGER                       ,
    NUMEROFACTURACOMPRAS            INTEGER                       ,
    ID_PROVEEDOR                    INTEGER               not null,
    TOTALPRECIO_PEDIDO              INTEGER               not null,
    primary key (ID_PEDIDO),
    foreign key  (EST_ID_PEDIDO)
       references ESTADOSENVIOPEDIDOS (ID_PEDIDO),
    foreign key  (EST2_ID_PEDIDO)
       references ESTADOSRCEPCIONES (ID_PEDIDO),
    foreign key  (EST3_ID_PEDIDO)
       references ESTADOSDEPAGOS (ID_PEDIDO),
    foreign key  (FAC_ID_PEDIDO, NUMEROFACTURACOMPRAS)
       references FACTURACOMPRAS (ID_PEDIDO, NUMEROFACTURACOMPRAS),
    foreign key  (ID_PROVEEDOR)
       references PROVEEDORES (ID_PROVEEDOR)
);

create unique index PEDIDOS_PK on PEDIDOS (ID_PEDIDO asc);

create index PEDIDOS_ESTADOENVIOPEDIDOS_FK on PEDIDOS (EST_ID_PEDIDO asc);

create index PEDIDOS_ESTADORECEPCIONES_FK on PEDIDOS (EST2_ID_PEDIDO asc);

create index PEDIDOS_ESTADOSDEPAGOS_FK on PEDIDOS (EST3_ID_PEDIDO asc);

create index FACTURACOMPRAS_PEDIDOS_FK2 on PEDIDOS (FAC_ID_PEDIDO asc, NUMEROFACTURACOMPRAS asc);

create index PROVEEDORES_PEDIDOS_FK on PEDIDOS (ID_PROVEEDOR asc);

create table ESTADOSDEPAGOS
(
    ID_PEDIDO                       INTEGER               not null,
    FECHA_ESTADODEPAGO              DATE                  not null,
    PAGOFALTANTE_ESTADODEPAGO       INTEGER               not null,
    ESTADO_ESTADODEPAGO             VARCHAR(250)          not null,
    primary key (ID_PEDIDO),
    foreign key  (ID_PEDIDO)
       references PEDIDOS (ID_PEDIDO)
);

create unique index ESTADOSDEPAGOS_PK on ESTADOSDEPAGOS (ID_PEDIDO asc);

create table DEVOLUCIONES
(
    ID_DEVOLUCION                   INTEGER               not null,
    ID_VENTA                        INTEGER               not null,
    DINEROARESTITUIR_DEVOLUCION     INTEGER                       ,
    primary key (ID_DEVOLUCION),
    foreign key  (ID_VENTA)
       references VENTAS (ID_VENTA)
);

create unique index DEVOLUCIONES_PK on DEVOLUCIONES (ID_DEVOLUCION asc);

create index VENTAS_DEVOLUCIONES_FK on DEVOLUCIONES (ID_VENTA asc);

create table FACTURASVENTAS
(
    NUMEROFACTURAVENTAS             INTEGER               not null,
    ID_VENTA                        INTEGER               not null,
    CUIL_CLIENTE                    INTEGER               not null,
    TIPO_FACTURAVENTA               VARCHAR(250)          not null,
    primary key (NUMEROFACTURAVENTAS),
    foreign key  (ID_VENTA)
       references VENTAS (ID_VENTA),
    foreign key  (CUIL_CLIENTE)
       references CLIENTES (CUIL_CLIENTE)
);

create unique index FACTURASVENTAS_PK on FACTURASVENTAS (NUMEROFACTURAVENTAS asc);

create index VENTAS_FACTURAVENTAS_FK on FACTURASVENTAS (ID_VENTA asc);

create index FACTURADEVENTAS_CLIENTES_FK on FACTURASVENTAS (CUIL_CLIENTE asc);

create table ESTADOSENVIOPEDIDOS
(
    ID_PEDIDO                       INTEGER               not null,
    PRECIO_ESTADOENVIOPEDIDO        INTEGER               not null,
    FECHA_ESTADOENVIOPEDIDO         DATE                  not null,
    ESTADO_ESTADOENVIOPEDIDO        VARCHAR(250)          not null,
    primary key (ID_PEDIDO),
    foreign key  (ID_PEDIDO)
       references PEDIDOS (ID_PEDIDO)
);

create unique index ESTADOSENVIOPEDIDOS_PK on ESTADOSENVIOPEDIDOS (ID_PEDIDO asc);

create table ESTADOSRCEPCIONES
(
    ID_PEDIDO                       INTEGER               not null,
    FECHA_ESTADORECEPCION           DATE                  not null,
    ESTADO_ESTADORECEPCION          VARCHAR(250)          not null,
    primary key (ID_PEDIDO),
    foreign key  (ID_PEDIDO)
       references PEDIDOS (ID_PEDIDO)
);

create unique index ESTADOSRCEPCIONES_PK on ESTADOSRCEPCIONES (ID_PEDIDO asc);

create table FACTURACOMPRAS
(
    ID_PEDIDO                       INTEGER               not null,
    NUMEROFACTURACOMPRAS            INTEGER               not null,
    TIPO_FACTURACOMRPAS             VARCHAR(10)           not null,
    primary key (ID_PEDIDO, NUMEROFACTURACOMPRAS),
    foreign key  (ID_PEDIDO)
       references PEDIDOS (ID_PEDIDO)
);

create unique index FACTURACOMPRAS_PK on FACTURACOMPRAS (ID_PEDIDO asc, NUMEROFACTURACOMPRAS asc);

create index FACTURACOMPRAS_PEDIDOS_FK on FACTURACOMPRAS (ID_PEDIDO asc);

create table CORRECCIONVENTAS
(
    VEN_ID_VENTA                    INTEGER               not null,
    ID_VENTA                        INTEGER               not null,
    MOTIVO_CORRECIONVENTA           VARCHAR(250)          not null,
    primary key (VEN_ID_VENTA, ID_VENTA),
    foreign key  (ID_VENTA)
       references VENTAS (ID_VENTA),
    foreign key  (VEN_ID_VENTA)
       references VENTAS (ID_VENTA)
);

create unique index CORRECCIONVENTAS_PK on CORRECCIONVENTAS (VEN_ID_VENTA asc, ID_VENTA asc);

create index CORRECIONDEVENTA_FK on CORRECCIONVENTAS (ID_VENTA asc);

create index VENTACORREGIDA_FK on CORRECCIONVENTAS (VEN_ID_VENTA asc);

create table DETALLEDEVENTAS
(
    ID_VENTA                        INTEGER               not null,
    ID_LOTE                         INTEGER               not null,
    CANTIDAD_DETALLEVENTA           INTEGER                       ,
    primary key (ID_VENTA),
    foreign key  (ID_VENTA)
       references VENTAS (ID_VENTA),
    foreign key  (ID_LOTE)
       references LOTES (ID_LOTE)
);

create unique index DETALLEDEVENTAS_PK on DETALLEDEVENTAS (ID_VENTA asc);

create index LOTES_DETALLEDEVENTAS_FK on DETALLEDEVENTAS (ID_LOTE asc);

create table DETALLEDECOMPRAS
(
    ID_PEDIDO                       INTEGER               not null,
    ID_PRODUCTO                     INTEGER               not null,
    CANTIDAD                        INTEGER               not null,
    PRECIOUNITARIO                  INTEGER               not null,
    primary key (ID_PEDIDO),
    foreign key  (ID_PRODUCTO)
       references PRODUCTOS (ID_PRODUCTO),
    foreign key  (ID_PEDIDO)
       references PEDIDOS (ID_PEDIDO)
);

create index DETALLEDECOMPRAS_PRODUCTOS_FK on DETALLEDECOMPRAS (ID_PRODUCTO asc);

create unique index DETALLEDECOMPRAS_PK on DETALLEDECOMPRAS (ID_PEDIDO asc);

create table REMPLAZADOS
(
    ID_DEVOLUCION                   INTEGER               not null,
    REM_ID_DEVOLUCION               INTEGER                       ,
    ID_LOTE                         INTEGER               not null,
    MOTIVO_REMPLAZADOS              VARCHAR(250)                  ,
    CANTIDAD_REMPLAZADO             INTEGER               not null,
    PARADESCARTAR_REMPLAZADOS       NUMERIC(1)            not null,
    primary key (ID_DEVOLUCION),
    foreign key  (ID_DEVOLUCION)
       references DEVOLUCIONES (ID_DEVOLUCION),
    foreign key  (ID_LOTE)
       references LOTES (ID_LOTE)
);

create unique index REMPLAZADOS_PK on REMPLAZADOS (ID_DEVOLUCION asc);

create index LOTES_REMPLAZADOS_FK on REMPLAZADOS (ID_LOTE asc);

create table DETALLESDEPAGO
(
    ID_PEDIDO                       INTEGER               not null,
    METODO_DETALLEDEPAGO            VARCHAR(250)          not null,
    MONTO_DETALLEDEPAGO             INTEGER               not null,
    FECHA_DETALLEDEPAGO             DATE                  not null,
    ESTADODEACREDITACION_DETALLEDE  NUMERIC(1)                    ,
    primary key (ID_PEDIDO),
    foreign key  (ID_PEDIDO)
       references ESTADOSDEPAGOS (ID_PEDIDO)
);

create unique index DETALLESDEPAGO_PK on DETALLESDEPAGO (ID_PEDIDO asc);

create table LISTAPRECIOS
(
    ID_PRODUCTO                     INTEGER               not null,
    ID_PROVEEDOR                    INTEGER               not null,
    PRECIO_LISTAPRECIO              INTEGER               not null,
    primary key (ID_PRODUCTO, ID_PROVEEDOR),
    foreign key  (ID_PROVEEDOR)
       references PROVEEDORES (ID_PROVEEDOR),
    foreign key  (ID_PRODUCTO)
       references PRODUCTOS (ID_PRODUCTO)
);

create unique index LISTAPRECIOS_PK on LISTAPRECIOS (ID_PRODUCTO asc, ID_PROVEEDOR asc);

create index LISTAPRECIOS_PROVEEDORES_FK on LISTAPRECIOS (ID_PROVEEDOR asc);

create index LISTAPRECIOS_PRODUCTOES_FK on LISTAPRECIOS (ID_PRODUCTO asc);

create table CAJEROS_VENTAS
(
    CUIT_CAJERO                     INTEGER               not null,
    ID_VENTA                        INTEGER               not null,
    primary key (CUIT_CAJERO, ID_VENTA),
    foreign key  (CUIT_CAJERO)
       references CAJEROS (CUIT_CAJERO),
    foreign key  (ID_VENTA)
       references VENTAS (ID_VENTA)
);

create unique index CAJEROS_VENTAS_PK on CAJEROS_VENTAS (CUIT_CAJERO asc, ID_VENTA asc);

create index CAJEROS_VENTAS_FK2 on CAJEROS_VENTAS (CUIT_CAJERO asc);

create index CAJEROS_VENTAS_FK on CAJEROS_VENTAS (ID_VENTA asc);

create table PROPIEDADES_PRODUCTOS
(
    ID_PROPIEDADES                  INTEGER               not null,
    ID_PRODUCTO                     INTEGER               not null,
    primary key (ID_PROPIEDADES, ID_PRODUCTO),
    foreign key  (ID_PROPIEDADES)
       references PROPIEDADES (ID_PROPIEDADES),
    foreign key  (ID_PRODUCTO)
       references PRODUCTOS (ID_PRODUCTO)
);

create unique index PROPIEDADES_PRODUCTOS_PK on PROPIEDADES_PRODUCTOS (ID_PROPIEDADES asc, ID_PRODUCTO asc);

create index PROPIEDADES_PRODUCTOS_FK2 on PROPIEDADES_PRODUCTOS (ID_PROPIEDADES asc);

create index PROPIEDADES_PRODUCTOS_FK on PROPIEDADES_PRODUCTOS (ID_PRODUCTO asc);

