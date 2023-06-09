PGDMP     %    :        	        {            Grupo8DB    15.2    15.2 +   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    28526    Grupo8DB    DATABASE     }   CREATE DATABASE "Grupo8DB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE "Grupo8DB";
                postgres    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false            �           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    5            �            1259    28527 
   area_comun    TABLE     x   CREATE TABLE public.area_comun (
    id_area_comun smallint NOT NULL,
    descripcion character varying(50) NOT NULL
);
    DROP TABLE public.area_comun;
       public         heap    postgres    false    5            �           0    0    TABLE area_comun    COMMENT     `   COMMENT ON TABLE public.area_comun IS '1 gimnasio
2 juego niños
3 parque interno
4 piscina

';
          public          postgres    false    214            �            1259    28530    banco    TABLE     `   CREATE TABLE public.banco (
    id_banco integer NOT NULL,
    descripcion character varying
);
    DROP TABLE public.banco;
       public         heap    postgres    false    5            �            1259    28535    id_casa_seq    SEQUENCE     t   CREATE SEQUENCE public.id_casa_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.id_casa_seq;
       public          postgres    false    5            �            1259    28536    casa    TABLE        CREATE TABLE public.casa (
    id_casa integer DEFAULT nextval('public.id_casa_seq'::regclass) NOT NULL,
    id_predio integer,
    id_estado integer,
    id_predio_mdu integer,
    numero smallint NOT NULL,
    piso smallint,
    area numeric NOT NULL,
    participacion numeric(6,2)
);
    DROP TABLE public.casa;
       public         heap    postgres    false    216    5            �            1259    28542    casa_deposito    TABLE     �   CREATE TABLE public.casa_deposito (
    id_casa integer NOT NULL,
    id_deposito integer NOT NULL,
    fecha_registro date NOT NULL,
    id_estado smallint NOT NULL
);
 !   DROP TABLE public.casa_deposito;
       public         heap    postgres    false    5            �           0    0    TABLE casa_deposito    COMMENT     �   COMMENT ON TABLE public.casa_deposito IS 'esta relacion se captura con la finalidad de mantener un registro del propietario del inmueble';
          public          postgres    false    218            �           0    0 #   COLUMN casa_deposito.fecha_registro    COMMENT     �   COMMENT ON COLUMN public.casa_deposito.fecha_registro IS 'se refiere a la fecha en que se vincula a la casa-habitacion mediante su registro';
          public          postgres    false    218            �            1259    28545    casa_estacionamiento    TABLE     �   CREATE TABLE public.casa_estacionamiento (
    id_estacionamiento integer NOT NULL,
    id_casa integer NOT NULL,
    fecha_registro date NOT NULL,
    id_estado smallint
);
 (   DROP TABLE public.casa_estacionamiento;
       public         heap    postgres    false    5            �           0    0 *   COLUMN casa_estacionamiento.fecha_registro    COMMENT     �   COMMENT ON COLUMN public.casa_estacionamiento.fecha_registro IS 'se refiere a la fecha en que se vincula a la casa-habitacion mediante su registro';
          public          postgres    false    219            �            1259    28548    casa_estado    TABLE     k   CREATE TABLE public.casa_estado (
    id_estado integer NOT NULL,
    descripcion character varying(30)
);
    DROP TABLE public.casa_estado;
       public         heap    postgres    false    5            �           0    0    TABLE casa_estado    COMMENT     ^   COMMENT ON TABLE public.casa_estado IS '1 habitada
2 alquilada
3 no habitada
4 abandonada

';
          public          postgres    false    220            �            1259    28551    id_casa_infraccion_seq    SEQUENCE        CREATE SEQUENCE public.id_casa_infraccion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.id_casa_infraccion_seq;
       public          postgres    false    5            �            1259    28552    casa_infraccion    TABLE     &  CREATE TABLE public.casa_infraccion (
    id_casa_infraccion integer DEFAULT nextval('public.id_casa_infraccion_seq'::regclass) NOT NULL,
    id_infraccion integer,
    id_gasto integer,
    periodo character varying(8) NOT NULL,
    fecha_infraccion date NOT NULL,
    importe numeric(6,2)
);
 #   DROP TABLE public.casa_infraccion;
       public         heap    postgres    false    221    5            �            1259    28556    clase_gasto    TABLE     q   CREATE TABLE public.clase_gasto (
    id_clase_gasto smallint NOT NULL,
    descripcion character varying(30)
);
    DROP TABLE public.clase_gasto;
       public         heap    postgres    false    5            �           0    0    TABLE clase_gasto    COMMENT     S   COMMENT ON TABLE public.clase_gasto IS '1 servicios comunes
2 consumo individual';
          public          postgres    false    223            �            1259    28559    id_contrato_seq    SEQUENCE     x   CREATE SEQUENCE public.id_contrato_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.id_contrato_seq;
       public          postgres    false    5            �            1259    28560    contrato    TABLE     \  CREATE TABLE public.contrato (
    id_contrato integer DEFAULT nextval('public.id_contrato_seq'::regclass) NOT NULL,
    id_solicitud integer,
    id_personal integer,
    id_solicitante integer,
    fecha_contrato date,
    fecha_firma_solicitante date,
    fecha_firma_personal date,
    fecha_registro date,
    minuta character varying(100)
);
    DROP TABLE public.contrato;
       public         heap    postgres    false    224    5            �            1259    28564    id_cuenta_seq    SEQUENCE     v   CREATE SEQUENCE public.id_cuenta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.id_cuenta_seq;
       public          postgres    false    5            �            1259    28565    cuenta    TABLE     �   CREATE TABLE public.cuenta (
    id_cuenta integer DEFAULT nextval('public.id_cuenta_seq'::regclass) NOT NULL,
    id_persona integer,
    id_banco integer,
    id_tipo_moneda smallint,
    ncuenta bigint
);
    DROP TABLE public.cuenta;
       public         heap    postgres    false    226    5            �            1259    28569    id_cuenta_predio_seq    SEQUENCE     }   CREATE SEQUENCE public.id_cuenta_predio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.id_cuenta_predio_seq;
       public          postgres    false    5            �            1259    28570    cuenta_predio    TABLE     �  CREATE TABLE public.cuenta_predio (
    id_cuenta_predio smallint DEFAULT nextval('public.id_cuenta_predio_seq'::regclass) NOT NULL,
    id_predio integer,
    id_estado smallint,
    id_tipo_autorizacion smallint,
    id_banco integer,
    id_tipo_moneda smallint,
    ncuenta bigint NOT NULL,
    ntarjeta bigint,
    fecha_apertura date NOT NULL,
    fecha_autorizacion date,
    fecha_cierre date,
    correo_autorizado character varying(40)
);
 !   DROP TABLE public.cuenta_predio;
       public         heap    postgres    false    228    5            �            1259    28574    id_deposito_seq    SEQUENCE     x   CREATE SEQUENCE public.id_deposito_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.id_deposito_seq;
       public          postgres    false    5            �            1259    28575    deposito    TABLE     �   CREATE TABLE public.deposito (
    id_deposito integer DEFAULT nextval('public.id_deposito_seq'::regclass) NOT NULL,
    id_casa integer,
    numero character varying(6) NOT NULL,
    descripcion character varying(60) NOT NULL,
    area numeric
);
    DROP TABLE public.deposito;
       public         heap    postgres    false    230    5            �           0    0    COLUMN deposito.numero    COMMENT     z   COMMENT ON COLUMN public.deposito.numero IS 'este valor es en funcion a lo establecido en los planos de los condominios';
          public          postgres    false    231            �            1259    28581    id_estacionamiento_seq    SEQUENCE        CREATE SEQUENCE public.id_estacionamiento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.id_estacionamiento_seq;
       public          postgres    false    5            �            1259    28582    estacionamiento    TABLE     �   CREATE TABLE public.estacionamiento (
    id_estacionamiento integer DEFAULT nextval('public.id_estacionamiento_seq'::regclass) NOT NULL,
    id_casa integer,
    numero character varying(6),
    descripcion character varying(60),
    area numeric
);
 #   DROP TABLE public.estacionamiento;
       public         heap    postgres    false    232    5            �            1259    28588    estado    TABLE     p   CREATE TABLE public.estado (
    id_estado smallint NOT NULL,
    descripcion character varying(15) NOT NULL
);
    DROP TABLE public.estado;
       public         heap    postgres    false    5            �           0    0    TABLE estado    COMMENT     9   COMMENT ON TABLE public.estado IS '1 activo
2 inactivo';
          public          postgres    false    234            �            1259    28591    gasto    TABLE     �   CREATE TABLE public.gasto (
    id_gasto integer NOT NULL,
    id_tipo_gasto integer,
    descripcion character varying(100) NOT NULL
);
    DROP TABLE public.gasto;
       public         heap    postgres    false    5            �           0    0    TABLE gasto    COMMENT     e  COMMENT ON TABLE public.gasto IS '1 planilla
2 administracion y contabilidad
3 telefono fijo e internet
4 consumo de luz mensual
5 mantenimiento mensual asensores
...
40 caja chica
41 gastos bancarios
43 sedapal, servicio individual
43 sedapal, servicio comun
44 fondo de contingencia
45 reintegro gastos bancarios
46 sanciones por infracciones
47 ajuste';
          public          postgres    false    235            �            1259    28594    id_inquilino_seq    SEQUENCE     y   CREATE SEQUENCE public.id_inquilino_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.id_inquilino_seq;
       public          postgres    false    5            �            1259    28595    id_inventario_predio_seq    SEQUENCE     �   CREATE SEQUENCE public.id_inventario_predio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.id_inventario_predio_seq;
       public          postgres    false    5            �            1259    28596    id_mant_recibo_det_seq    SEQUENCE        CREATE SEQUENCE public.id_mant_recibo_det_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.id_mant_recibo_det_seq;
       public          postgres    false    5            �            1259    28597    id_mant_recibo_seq    SEQUENCE     {   CREATE SEQUENCE public.id_mant_recibo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.id_mant_recibo_seq;
       public          postgres    false    5            �            1259    28598    id_mascota_seq    SEQUENCE     w   CREATE SEQUENCE public.id_mascota_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.id_mascota_seq;
       public          postgres    false    5            �            1259    28599    id_persona_seq    SEQUENCE     w   CREATE SEQUENCE public.id_persona_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.id_persona_seq;
       public          postgres    false    5            �            1259    28600    id_predio_mdu_seq    SEQUENCE     z   CREATE SEQUENCE public.id_predio_mdu_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.id_predio_mdu_seq;
       public          postgres    false    5            �            1259    28601    id_predio_seq    SEQUENCE     v   CREATE SEQUENCE public.id_predio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.id_predio_seq;
       public          postgres    false    5            �            1259    28602    id_propietario_seq    SEQUENCE     {   CREATE SEQUENCE public.id_propietario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.id_propietario_seq;
       public          postgres    false    5            �            1259    28603    id_proveedor_seq    SEQUENCE     y   CREATE SEQUENCE public.id_proveedor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.id_proveedor_seq;
       public          postgres    false    5            �            1259    28604    id_residente_seq    SEQUENCE     y   CREATE SEQUENCE public.id_residente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.id_residente_seq;
       public          postgres    false    5            �            1259    28605    id_servicio_individual_seq    SEQUENCE     �   CREATE SEQUENCE public.id_servicio_individual_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.id_servicio_individual_seq;
       public          postgres    false    5            �            1259    28606    id_solicitud_seq    SEQUENCE     y   CREATE SEQUENCE public.id_solicitud_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.id_solicitud_seq;
       public          postgres    false    5            �            1259    28607 
   infraccion    TABLE     �   CREATE TABLE public.infraccion (
    id_infraccion integer NOT NULL,
    codigo character varying(4) NOT NULL,
    descripcion character varying(200) NOT NULL,
    importe numeric(6,2),
    fecha_registro date NOT NULL,
    fecha_autorizacion date
);
    DROP TABLE public.infraccion;
       public         heap    postgres    false    5            �            1259    28610 	   inquilino    TABLE     �   CREATE TABLE public.inquilino (
    id_inquilino integer DEFAULT nextval('public.id_inquilino_seq'::regclass) NOT NULL,
    id_persona integer,
    id_casa integer,
    pago_responsable boolean
);
    DROP TABLE public.inquilino;
       public         heap    postgres    false    236    5            �            1259    28614    inventario_predio    TABLE     �   CREATE TABLE public.inventario_predio (
    id_inventario_predio integer DEFAULT nextval('public.id_inventario_predio_seq'::regclass) NOT NULL,
    id_personal integer,
    id_predio integer,
    fecha_inicio date,
    fecha_fin date
);
 %   DROP TABLE public.inventario_predio;
       public         heap    postgres    false    237    5            �           0    0    TABLE inventario_predio    COMMENT     o   COMMENT ON TABLE public.inventario_predio IS 'comprende le proceso de levantanmiento de las casas-habitacion';
          public          postgres    false    251            �            1259    28618    mant_recibo    TABLE     �  CREATE TABLE public.mant_recibo (
    id_mant_recibo integer DEFAULT nextval('public.id_mant_recibo_seq'::regclass) NOT NULL,
    id_casa integer,
    n_recibo character varying(8) NOT NULL,
    periodo character varying(8) NOT NULL,
    fecha_emision date NOT NULL,
    fecha_vencimiento date NOT NULL,
    importe numeric NOT NULL,
    ajuste numeric(6,2),
    observacion character varying(100),
    id_recibo_estado smallint
);
    DROP TABLE public.mant_recibo;
       public         heap    postgres    false    239    5            �           0    0     COLUMN mant_recibo.fecha_emision    COMMENT     �   COMMENT ON COLUMN public.mant_recibo.fecha_emision IS 'crear una tablita para manejar estados
1 pendiente
2 cancelado
3 anulado
4 .... ';
          public          postgres    false    252            �            1259    28624    mant_recibo_det    TABLE     �   CREATE TABLE public.mant_recibo_det (
    id_mant_recibo_det integer DEFAULT nextval('public.id_mant_recibo_det_seq'::regclass) NOT NULL,
    id_mant_recibo integer,
    id_gasto integer,
    importe_predio numeric(6,2),
    importe_casa numeric(6,2)
);
 #   DROP TABLE public.mant_recibo_det;
       public         heap    postgres    false    238    5            �            1259    28628    mascota    TABLE       CREATE TABLE public.mascota (
    id_mascota integer DEFAULT nextval('public.id_mascota_seq'::regclass) NOT NULL,
    id_tipo_mascota integer,
    id_casa integer,
    id_tam_mascota smallint,
    id_raza_mascota smallint,
    nombre character varying(30),
    fecha_nacimiento date
);
    DROP TABLE public.mascota;
       public         heap    postgres    false    240    5            �            1259    28632    mdu    TABLE     j   CREATE TABLE public.mdu (
    id_mdu smallint NOT NULL,
    descripcion character varying(30) NOT NULL
);
    DROP TABLE public.mdu;
       public         heap    postgres    false    5            �           0    0 	   TABLE mdu    COMMENT     �   COMMENT ON TABLE public.mdu IS 'mdu: unidad de viviendas múltiples

1 edificio
2 torre
3 bloque

1 1 2 a
2 1 2 b
3 1 2 c
4 2 3 i
5 2 2 3 ii
6 2 3 iii
';
          public          postgres    false    255                        1259    28635    mora    TABLE     �   CREATE TABLE public.mora (
    id_mora integer NOT NULL,
    id_mant_recibo integer,
    dias_vencidos numeric NOT NULL,
    importe numeric NOT NULL
);
    DROP TABLE public.mora;
       public         heap    postgres    false    5                       1259    28640    persona    TABLE     �  CREATE TABLE public.persona (
    id_persona integer DEFAULT nextval('public.id_persona_seq'::regclass) NOT NULL,
    apellido_paterno character varying(60) NOT NULL,
    apellido_materno character varying(60) NOT NULL,
    nombres character varying(60) NOT NULL,
    fecha_nacimiento date,
    id_tipo_documento integer,
    ndocumento character varying(15),
    direccion character varying(150),
    idubigeo character varying(6)
);
    DROP TABLE public.persona;
       public         heap    postgres    false    241    5                       1259    28644    personal    TABLE     �   CREATE TABLE public.personal (
    id_personal integer NOT NULL,
    id_persona integer,
    id_tipo_solicitante smallint,
    fecha_contrato date,
    fecha_cese date
);
    DROP TABLE public.personal;
       public         heap    postgres    false    5            �           0    0    TABLE personal    COMMENT     �   COMMENT ON TABLE public.personal IS 'se refiere a los recursos humanos que laboran para condosa
ejm: encargado de contratos, administrador, personal de limpieza, seguridad, jardinero, etc';
          public          postgres    false    258                       1259    28647    predio    TABLE     b  CREATE TABLE public.predio (
    id_predio integer DEFAULT nextval('public.id_predio_seq'::regclass) NOT NULL,
    id_tipo_predio integer,
    descripcion character varying(80),
    ruc character varying(20),
    telefono character varying(12),
    correo character varying(80),
    direccion character varying(100),
    idubigeo character varying(6)
);
    DROP TABLE public.predio;
       public         heap    postgres    false    243    5            �           0    0    TABLE predio    COMMENT     V   COMMENT ON TABLE public.predio IS '1 las gaviotas
2 las golondrinas
3 los pelicanos';
          public          postgres    false    259                       1259    28651    predio_area_comun    TABLE     �   CREATE TABLE public.predio_area_comun (
    id_predio integer NOT NULL,
    id_area_comun integer NOT NULL,
    codigo character varying(6),
    area numeric NOT NULL
);
 %   DROP TABLE public.predio_area_comun;
       public         heap    postgres    false    5            �           0    0    TABLE predio_area_comun    COMMENT     A   COMMENT ON TABLE public.predio_area_comun IS '1 4
2 1
2 2
2 3
';
          public          postgres    false    260            �           0    0    COLUMN predio_area_comun.codigo    COMMENT     �   COMMENT ON COLUMN public.predio_area_comun.codigo IS 'es el identificador que registra en los planos de arquitectura del predio';
          public          postgres    false    260            �           0    0    COLUMN predio_area_comun.area    COMMENT     �   COMMENT ON COLUMN public.predio_area_comun.area IS 'el tamaño en metros cuadrados que ocupa el area comun en un predio especifico';
          public          postgres    false    260                       1259    28656 
   predio_mdu    TABLE       CREATE TABLE public.predio_mdu (
    id_predio_mdu integer DEFAULT nextval('public.id_predio_mdu_seq'::regclass) NOT NULL,
    id_predio integer,
    id_mdu smallint,
    descripcion character varying(4),
    direccion character(10),
    numero character(10)
);
    DROP TABLE public.predio_mdu;
       public         heap    postgres    false    242    5            �           0    0    TABLE predio_mdu    COMMENT     _   COMMENT ON TABLE public.predio_mdu IS '1 1 2 a
2 1 2 b
3 1 2 c
4 2 3 i
5 2 2 3 ii
6 2 3 iii
';
          public          postgres    false    261                       1259    28660    propietario    TABLE     �   CREATE TABLE public.propietario (
    id_propietario integer DEFAULT nextval('public.id_propietario_seq'::regclass) NOT NULL,
    id_persona integer,
    id_casa integer,
    pago_responsable boolean
);
    DROP TABLE public.propietario;
       public         heap    postgres    false    244    5            �           0    0 #   COLUMN propietario.pago_responsable    COMMENT     �   COMMENT ON COLUMN public.propietario.pago_responsable IS 'indicador para controlar quien es responsable de esa casa para realizar los pagos por mantenimiento';
          public          postgres    false    262                       1259    28664 	   proveedor    TABLE     P  CREATE TABLE public.proveedor (
    id_proveedor bigint DEFAULT nextval('public.id_proveedor_seq'::regclass) NOT NULL,
    id_tipo_persona integer,
    id_persona integer,
    ruc character varying(20) NOT NULL,
    descripcion character varying(100) NOT NULL,
    direccion character varying(100),
    idubigeo character varying(6)
);
    DROP TABLE public.proveedor;
       public         heap    postgres    false    245    5                       1259    28668    raza_mascota    TABLE     s   CREATE TABLE public.raza_mascota (
    id_raza_mascota smallint NOT NULL,
    descripcion character varying(15)
);
     DROP TABLE public.raza_mascota;
       public         heap    postgres    false    5            �           0    0    TABLE raza_mascota    COMMENT     H   COMMENT ON TABLE public.raza_mascota IS '1 doberman
2 bulldog
3 comun';
          public          postgres    false    264            	           1259    28671    recaudacion    TABLE     M  CREATE TABLE public.recaudacion (
    id_transaccion integer NOT NULL,
    id_cuenta integer,
    id_mant_recibo integer,
    n_operacion numeric,
    fecha_operacion date,
    moneda smallint,
    importe double precision,
    id_recaudacion_estado smallint,
    id_cuenta_predio smallint,
    observacion character varying(100)
);
    DROP TABLE public.recaudacion;
       public         heap    postgres    false    5            
           1259    28676    recaudacion_estado    TABLE     �   CREATE TABLE public.recaudacion_estado (
    id_recaudacion_estado smallint NOT NULL,
    descripcion character varying(15) NOT NULL
);
 &   DROP TABLE public.recaudacion_estado;
       public         heap    postgres    false    5            �           0    0    TABLE recaudacion_estado    COMMENT     R   COMMENT ON TABLE public.recaudacion_estado IS '1 validado
2 rechazado
3 anulado';
          public          postgres    false    266                       1259    28679    recibo_estado    TABLE     ~   CREATE TABLE public.recibo_estado (
    id_recibo_estado smallint NOT NULL,
    descripcion character varying(15) NOT NULL
);
 !   DROP TABLE public.recibo_estado;
       public         heap    postgres    false    5            �           0    0    TABLE recibo_estado    COMMENT     [   COMMENT ON TABLE public.recibo_estado IS '1 pendiente
2 cancelado
3 anulado
4 incompleto';
          public          postgres    false    267                       1259    28682 	   residente    TABLE     �   CREATE TABLE public.residente (
    id_residente integer DEFAULT nextval('public.id_residente_seq'::regclass) NOT NULL,
    id_persona integer NOT NULL,
    id_casa integer
);
    DROP TABLE public.residente;
       public         heap    postgres    false    246    5                       1259    28686    rol    TABLE     w   CREATE TABLE public.rol (
    id_tipo_solicitante smallint NOT NULL,
    descripcion character varying(60) NOT NULL
);
    DROP TABLE public.rol;
       public         heap    postgres    false    5            �           0    0 	   TABLE rol    COMMENT     w   COMMENT ON TABLE public.rol IS '1 pdte junta propietarios
2 representante legal
3 encargado contrato
4 administrador';
          public          postgres    false    269                       1259    28689    servicio    TABLE     j   CREATE TABLE public.servicio (
    id_servicio integer NOT NULL,
    descripcion character varying(50)
);
    DROP TABLE public.servicio;
       public         heap    postgres    false    5            �           0    0    TABLE servicio    COMMENT     �   COMMENT ON TABLE public.servicio IS '1 servicio de administracion
2 servicio limpieza
3 servicio seguridad
4 servicio jardineria


catalogo de servicios que brinda a sus cliente la compañia condosa';
          public          postgres    false    270                       1259    28692    servicio_individual    TABLE     *  CREATE TABLE public.servicio_individual (
    id_servicio_individual integer DEFAULT nextval('public.id_servicio_individual_seq'::regclass) NOT NULL,
    id_gasto integer,
    id_casa integer,
    periodo character varying(8),
    cantidad numeric,
    consumo numeric(6,2),
    importe numeric
);
 '   DROP TABLE public.servicio_individual;
       public         heap    postgres    false    247    5            �           0    0    TABLE servicio_individual    COMMENT     9   COMMENT ON TABLE public.servicio_individual IS '1 agua';
          public          postgres    false    271                       1259    28698    solicitante    TABLE     �   CREATE TABLE public.solicitante (
    id_solicitante integer NOT NULL,
    id_persona integer,
    id_tipo_solicitante smallint,
    telefono integer,
    correo character varying(80)
);
    DROP TABLE public.solicitante;
       public         heap    postgres    false    5                       1259    28701 	   solicitud    TABLE     d  CREATE TABLE public.solicitud (
    id_solicitud bigint DEFAULT nextval('public.id_solicitud_seq'::regclass) NOT NULL,
    id_predio integer,
    id_solicitante integer,
    id_servicio integer,
    area_predio numeric,
    num_casas integer,
    cant_acomunes integer,
    area_acomunes integer,
    cant_vigilantes integer,
    cant_plimpieza integer
);
    DROP TABLE public.solicitud;
       public         heap    postgres    false    248    5                       1259    28707    solicitud_cotizacion    TABLE     �   CREATE TABLE public.solicitud_cotizacion (
    id_solicitud integer NOT NULL,
    id_personal integer,
    fecha_cotizacion date,
    importe numeric(6,2)
);
 (   DROP TABLE public.solicitud_cotizacion;
       public         heap    postgres    false    5                       1259    28710    tamanio_mascota    TABLE     u   CREATE TABLE public.tamanio_mascota (
    id_tam_mascota smallint NOT NULL,
    descripcion character varying(15)
);
 #   DROP TABLE public.tamanio_mascota;
       public         heap    postgres    false    5            �           0    0    TABLE tamanio_mascota    COMMENT     L   COMMENT ON TABLE public.tamanio_mascota IS '1 grande
2 mediano
3 pequeño';
          public          postgres    false    275                       1259    28713    tipo_autorizacion    TABLE     �   CREATE TABLE public.tipo_autorizacion (
    id_tipo_autorizacion smallint NOT NULL,
    descripcion character varying(30) NOT NULL
);
 %   DROP TABLE public.tipo_autorizacion;
       public         heap    postgres    false    5            �           0    0    TABLE tipo_autorizacion    COMMENT     �   COMMENT ON TABLE public.tipo_autorizacion IS '1 recaudaciones
2 alquiler de areas comunes

se refiere al tipo de autorizacion para uso de cuenta bancaria del predio';
          public          postgres    false    276                       1259    28716    tipo_documento    TABLE     �   CREATE TABLE public.tipo_documento (
    id_tipo_documento smallint NOT NULL,
    descripcion character varying(20) NOT NULL
);
 "   DROP TABLE public.tipo_documento;
       public         heap    postgres    false    5            �           0    0    TABLE tipo_documento    COMMENT     G   COMMENT ON TABLE public.tipo_documento IS '1 dni
2 carne extranjeria';
          public          postgres    false    277                       1259    28719 
   tipo_gasto    TABLE     �   CREATE TABLE public.tipo_gasto (
    id_tipo_gasto integer NOT NULL,
    id_clase_gasto smallint,
    descripcion character varying,
    precio numeric
);
    DROP TABLE public.tipo_gasto;
       public         heap    postgres    false    5            �           0    0    TABLE tipo_gasto    COMMENT     �   COMMENT ON TABLE public.tipo_gasto IS '1 gasto laboral, administracion y contabilidad
2 gasto diversos
3 consumo individual
4 fondo contingencia
5 reintegro gastos bancarios
6 sanciones por infracciones';
          public          postgres    false    278                       1259    28724    tipo_mascota    TABLE     n   CREATE TABLE public.tipo_mascota (
    id_tipo_mascota integer NOT NULL,
    descripcion character varying
);
     DROP TABLE public.tipo_mascota;
       public         heap    postgres    false    5            �           0    0    TABLE tipo_mascota    COMMENT     B   COMMENT ON TABLE public.tipo_mascota IS '1 perro
2 gato
3 loro
';
          public          postgres    false    279                       1259    28729    tipo_moneda    TABLE     �   CREATE TABLE public.tipo_moneda (
    id_tipo_moneda smallint NOT NULL,
    descripcion character varying(10) NOT NULL,
    etiqueta character varying(4)
);
    DROP TABLE public.tipo_moneda;
       public         heap    postgres    false    5            �           0    0    TABLE tipo_moneda    COMMENT     <   COMMENT ON TABLE public.tipo_moneda IS '1 soles
2 dolares';
          public          postgres    false    280                       1259    28732    tipo_persona    TABLE     q   CREATE TABLE public.tipo_persona (
    id_tipo_persona integer NOT NULL,
    caracteristica character varying
);
     DROP TABLE public.tipo_persona;
       public         heap    postgres    false    5            �           0    0    TABLE tipo_persona    COMMENT     @   COMMENT ON TABLE public.tipo_persona IS '1 natural
2 juridica';
          public          postgres    false    281                       1259    28737    tipo_predio    TABLE     m   CREATE TABLE public.tipo_predio (
    id_tipo_predio integer NOT NULL,
    nomre_predio character varying
);
    DROP TABLE public.tipo_predio;
       public         heap    postgres    false    5            �           0    0    TABLE tipo_predio    COMMENT     N   COMMENT ON TABLE public.tipo_predio IS '1 condominio
2 residencial
3 quinta';
          public          postgres    false    282                       1259    28742    ubigeo    TABLE     ,  CREATE TABLE public.ubigeo (
    idubigeo character varying(6) NOT NULL,
    departamento character varying(60),
    provincia character varying(60),
    distrito character varying(60),
    superficie numeric(10,4),
    altitud numeric(10,4),
    latitud numeric(10,4),
    longitud numeric(10,4)
);
    DROP TABLE public.ubigeo;
       public         heap    postgres    false    5            �          0    28527 
   area_comun 
   TABLE DATA           @   COPY public.area_comun (id_area_comun, descripcion) FROM stdin;
    public          postgres    false    214   ��      �          0    28530    banco 
   TABLE DATA           6   COPY public.banco (id_banco, descripcion) FROM stdin;
    public          postgres    false    215   �      �          0    28536    casa 
   TABLE DATA           o   COPY public.casa (id_casa, id_predio, id_estado, id_predio_mdu, numero, piso, area, participacion) FROM stdin;
    public          postgres    false    217   6�      �          0    28542    casa_deposito 
   TABLE DATA           X   COPY public.casa_deposito (id_casa, id_deposito, fecha_registro, id_estado) FROM stdin;
    public          postgres    false    218   2�      �          0    28545    casa_estacionamiento 
   TABLE DATA           f   COPY public.casa_estacionamiento (id_estacionamiento, id_casa, fecha_registro, id_estado) FROM stdin;
    public          postgres    false    219   O�      �          0    28548    casa_estado 
   TABLE DATA           =   COPY public.casa_estado (id_estado, descripcion) FROM stdin;
    public          postgres    false    220   l�      �          0    28552    casa_infraccion 
   TABLE DATA           z   COPY public.casa_infraccion (id_casa_infraccion, id_infraccion, id_gasto, periodo, fecha_infraccion, importe) FROM stdin;
    public          postgres    false    222   ��      �          0    28556    clase_gasto 
   TABLE DATA           B   COPY public.clase_gasto (id_clase_gasto, descripcion) FROM stdin;
    public          postgres    false    223   ̋      �          0    28560    contrato 
   TABLE DATA           �   COPY public.contrato (id_contrato, id_solicitud, id_personal, id_solicitante, fecha_contrato, fecha_firma_solicitante, fecha_firma_personal, fecha_registro, minuta) FROM stdin;
    public          postgres    false    225   �      �          0    28565    cuenta 
   TABLE DATA           Z   COPY public.cuenta (id_cuenta, id_persona, id_banco, id_tipo_moneda, ncuenta) FROM stdin;
    public          postgres    false    227   /�      �          0    28570    cuenta_predio 
   TABLE DATA           �   COPY public.cuenta_predio (id_cuenta_predio, id_predio, id_estado, id_tipo_autorizacion, id_banco, id_tipo_moneda, ncuenta, ntarjeta, fecha_apertura, fecha_autorizacion, fecha_cierre, correo_autorizado) FROM stdin;
    public          postgres    false    229   ^�      �          0    28575    deposito 
   TABLE DATA           S   COPY public.deposito (id_deposito, id_casa, numero, descripcion, area) FROM stdin;
    public          postgres    false    231   �      �          0    28582    estacionamiento 
   TABLE DATA           a   COPY public.estacionamiento (id_estacionamiento, id_casa, numero, descripcion, area) FROM stdin;
    public          postgres    false    233   h�      �          0    28588    estado 
   TABLE DATA           8   COPY public.estado (id_estado, descripcion) FROM stdin;
    public          postgres    false    234   ԍ      �          0    28591    gasto 
   TABLE DATA           E   COPY public.gasto (id_gasto, id_tipo_gasto, descripcion) FROM stdin;
    public          postgres    false    235    �      �          0    28607 
   infraccion 
   TABLE DATA           u   COPY public.infraccion (id_infraccion, codigo, descripcion, importe, fecha_registro, fecha_autorizacion) FROM stdin;
    public          postgres    false    249   ��      �          0    28610 	   inquilino 
   TABLE DATA           X   COPY public.inquilino (id_inquilino, id_persona, id_casa, pago_responsable) FROM stdin;
    public          postgres    false    250   ��      �          0    28614    inventario_predio 
   TABLE DATA           r   COPY public.inventario_predio (id_inventario_predio, id_personal, id_predio, fecha_inicio, fecha_fin) FROM stdin;
    public          postgres    false    251   ƒ      �          0    28618    mant_recibo 
   TABLE DATA           �   COPY public.mant_recibo (id_mant_recibo, id_casa, n_recibo, periodo, fecha_emision, fecha_vencimiento, importe, ajuste, observacion, id_recibo_estado) FROM stdin;
    public          postgres    false    252   �      �          0    28624    mant_recibo_det 
   TABLE DATA           u   COPY public.mant_recibo_det (id_mant_recibo_det, id_mant_recibo, id_gasto, importe_predio, importe_casa) FROM stdin;
    public          postgres    false    253   =�      �          0    28628    mascota 
   TABLE DATA           �   COPY public.mascota (id_mascota, id_tipo_mascota, id_casa, id_tam_mascota, id_raza_mascota, nombre, fecha_nacimiento) FROM stdin;
    public          postgres    false    254   Z�      �          0    28632    mdu 
   TABLE DATA           2   COPY public.mdu (id_mdu, descripcion) FROM stdin;
    public          postgres    false    255   ӓ      �          0    28635    mora 
   TABLE DATA           O   COPY public.mora (id_mora, id_mant_recibo, dias_vencidos, importe) FROM stdin;
    public          postgres    false    256   �      �          0    28640    persona 
   TABLE DATA           �   COPY public.persona (id_persona, apellido_paterno, apellido_materno, nombres, fecha_nacimiento, id_tipo_documento, ndocumento, direccion, idubigeo) FROM stdin;
    public          postgres    false    257   )�      �          0    28644    personal 
   TABLE DATA           l   COPY public.personal (id_personal, id_persona, id_tipo_solicitante, fecha_contrato, fecha_cese) FROM stdin;
    public          postgres    false    258   Ĕ      �          0    28647    predio 
   TABLE DATA           t   COPY public.predio (id_predio, id_tipo_predio, descripcion, ruc, telefono, correo, direccion, idubigeo) FROM stdin;
    public          postgres    false    259   ��      �          0    28651    predio_area_comun 
   TABLE DATA           S   COPY public.predio_area_comun (id_predio, id_area_comun, codigo, area) FROM stdin;
    public          postgres    false    260   ��      �          0    28656 
   predio_mdu 
   TABLE DATA           f   COPY public.predio_mdu (id_predio_mdu, id_predio, id_mdu, descripcion, direccion, numero) FROM stdin;
    public          postgres    false    261   �      �          0    28660    propietario 
   TABLE DATA           \   COPY public.propietario (id_propietario, id_persona, id_casa, pago_responsable) FROM stdin;
    public          postgres    false    262   1�      �          0    28664 	   proveedor 
   TABLE DATA           u   COPY public.proveedor (id_proveedor, id_tipo_persona, id_persona, ruc, descripcion, direccion, idubigeo) FROM stdin;
    public          postgres    false    263   N�      �          0    28668    raza_mascota 
   TABLE DATA           D   COPY public.raza_mascota (id_raza_mascota, descripcion) FROM stdin;
    public          postgres    false    264   k�      �          0    28671    recaudacion 
   TABLE DATA           �   COPY public.recaudacion (id_transaccion, id_cuenta, id_mant_recibo, n_operacion, fecha_operacion, moneda, importe, id_recaudacion_estado, id_cuenta_predio, observacion) FROM stdin;
    public          postgres    false    265   ��      �          0    28676    recaudacion_estado 
   TABLE DATA           P   COPY public.recaudacion_estado (id_recaudacion_estado, descripcion) FROM stdin;
    public          postgres    false    266   �      �          0    28679    recibo_estado 
   TABLE DATA           F   COPY public.recibo_estado (id_recibo_estado, descripcion) FROM stdin;
    public          postgres    false    267   D�      �          0    28682 	   residente 
   TABLE DATA           F   COPY public.residente (id_residente, id_persona, id_casa) FROM stdin;
    public          postgres    false    268   ��      �          0    28686    rol 
   TABLE DATA           ?   COPY public.rol (id_tipo_solicitante, descripcion) FROM stdin;
    public          postgres    false    269   ��      �          0    28689    servicio 
   TABLE DATA           <   COPY public.servicio (id_servicio, descripcion) FROM stdin;
    public          postgres    false    270   7�      �          0    28692    servicio_individual 
   TABLE DATA           }   COPY public.servicio_individual (id_servicio_individual, id_gasto, id_casa, periodo, cantidad, consumo, importe) FROM stdin;
    public          postgres    false    271   y�      �          0    28698    solicitante 
   TABLE DATA           h   COPY public.solicitante (id_solicitante, id_persona, id_tipo_solicitante, telefono, correo) FROM stdin;
    public          postgres    false    272   ��      �          0    28701 	   solicitud 
   TABLE DATA           �   COPY public.solicitud (id_solicitud, id_predio, id_solicitante, id_servicio, area_predio, num_casas, cant_acomunes, area_acomunes, cant_vigilantes, cant_plimpieza) FROM stdin;
    public          postgres    false    273   ֚      �          0    28707    solicitud_cotizacion 
   TABLE DATA           d   COPY public.solicitud_cotizacion (id_solicitud, id_personal, fecha_cotizacion, importe) FROM stdin;
    public          postgres    false    274   �      �          0    28710    tamanio_mascota 
   TABLE DATA           F   COPY public.tamanio_mascota (id_tam_mascota, descripcion) FROM stdin;
    public          postgres    false    275   <�      �          0    28713    tipo_autorizacion 
   TABLE DATA           N   COPY public.tipo_autorizacion (id_tipo_autorizacion, descripcion) FROM stdin;
    public          postgres    false    276   l�      �          0    28716    tipo_documento 
   TABLE DATA           H   COPY public.tipo_documento (id_tipo_documento, descripcion) FROM stdin;
    public          postgres    false    277   ��      �          0    28719 
   tipo_gasto 
   TABLE DATA           X   COPY public.tipo_gasto (id_tipo_gasto, id_clase_gasto, descripcion, precio) FROM stdin;
    public          postgres    false    278   �      �          0    28724    tipo_mascota 
   TABLE DATA           D   COPY public.tipo_mascota (id_tipo_mascota, descripcion) FROM stdin;
    public          postgres    false    279   ��      �          0    28729    tipo_moneda 
   TABLE DATA           L   COPY public.tipo_moneda (id_tipo_moneda, descripcion, etiqueta) FROM stdin;
    public          postgres    false    280   ��      �          0    28732    tipo_persona 
   TABLE DATA           G   COPY public.tipo_persona (id_tipo_persona, caracteristica) FROM stdin;
    public          postgres    false    281   ޜ      �          0    28737    tipo_predio 
   TABLE DATA           C   COPY public.tipo_predio (id_tipo_predio, nomre_predio) FROM stdin;
    public          postgres    false    282   �      �          0    28742    ubigeo 
   TABLE DATA           u   COPY public.ubigeo (idubigeo, departamento, provincia, distrito, superficie, altitud, latitud, longitud) FROM stdin;
    public          postgres    false    283   Q�      �           0    0    id_casa_infraccion_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.id_casa_infraccion_seq', 1, false);
          public          postgres    false    221            �           0    0    id_casa_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.id_casa_seq', 21, true);
          public          postgres    false    216            �           0    0    id_contrato_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.id_contrato_seq', 9, true);
          public          postgres    false    224            �           0    0    id_cuenta_predio_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.id_cuenta_predio_seq', 2, true);
          public          postgres    false    228            �           0    0    id_cuenta_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.id_cuenta_seq', 1, true);
          public          postgres    false    226            �           0    0    id_deposito_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.id_deposito_seq', 9, true);
          public          postgres    false    230            �           0    0    id_estacionamiento_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.id_estacionamiento_seq', 1, false);
          public          postgres    false    232            �           0    0    id_inquilino_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.id_inquilino_seq', 1, false);
          public          postgres    false    236            �           0    0    id_inventario_predio_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.id_inventario_predio_seq', 1, false);
          public          postgres    false    237            �           0    0    id_mant_recibo_det_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.id_mant_recibo_det_seq', 1, false);
          public          postgres    false    238                        0    0    id_mant_recibo_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.id_mant_recibo_seq', 1, false);
          public          postgres    false    239                       0    0    id_mascota_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.id_mascota_seq', 6, true);
          public          postgres    false    240                       0    0    id_persona_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.id_persona_seq', 7, true);
          public          postgres    false    241                       0    0    id_predio_mdu_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.id_predio_mdu_seq', 6, true);
          public          postgres    false    242                       0    0    id_predio_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.id_predio_seq', 12, true);
          public          postgres    false    243                       0    0    id_propietario_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.id_propietario_seq', 1, false);
          public          postgres    false    244                       0    0    id_proveedor_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.id_proveedor_seq', 1, false);
          public          postgres    false    245                       0    0    id_residente_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.id_residente_seq', 1, false);
          public          postgres    false    246                       0    0    id_servicio_individual_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.id_servicio_individual_seq', 1, false);
          public          postgres    false    247            	           0    0    id_solicitud_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.id_solicitud_seq', 2, true);
          public          postgres    false    248            Q           2606    28746    area_comun pk_area_comun 
   CONSTRAINT     a   ALTER TABLE ONLY public.area_comun
    ADD CONSTRAINT pk_area_comun PRIMARY KEY (id_area_comun);
 B   ALTER TABLE ONLY public.area_comun DROP CONSTRAINT pk_area_comun;
       public            postgres    false    214            S           2606    28748    banco pk_banco 
   CONSTRAINT     R   ALTER TABLE ONLY public.banco
    ADD CONSTRAINT pk_banco PRIMARY KEY (id_banco);
 8   ALTER TABLE ONLY public.banco DROP CONSTRAINT pk_banco;
       public            postgres    false    215            U           2606    28750    casa pk_casa 
   CONSTRAINT     O   ALTER TABLE ONLY public.casa
    ADD CONSTRAINT pk_casa PRIMARY KEY (id_casa);
 6   ALTER TABLE ONLY public.casa DROP CONSTRAINT pk_casa;
       public            postgres    false    217            W           2606    28752    casa_deposito pk_casa_deposito 
   CONSTRAINT     ~   ALTER TABLE ONLY public.casa_deposito
    ADD CONSTRAINT pk_casa_deposito PRIMARY KEY (id_deposito, id_casa, fecha_registro);
 H   ALTER TABLE ONLY public.casa_deposito DROP CONSTRAINT pk_casa_deposito;
       public            postgres    false    218    218    218            Y           2606    28754 ,   casa_estacionamiento pk_casa_estacionamiento 
   CONSTRAINT     �   ALTER TABLE ONLY public.casa_estacionamiento
    ADD CONSTRAINT pk_casa_estacionamiento PRIMARY KEY (id_estacionamiento, id_casa, fecha_registro);
 V   ALTER TABLE ONLY public.casa_estacionamiento DROP CONSTRAINT pk_casa_estacionamiento;
       public            postgres    false    219    219    219            [           2606    28756    casa_estado pk_casa_estado 
   CONSTRAINT     _   ALTER TABLE ONLY public.casa_estado
    ADD CONSTRAINT pk_casa_estado PRIMARY KEY (id_estado);
 D   ALTER TABLE ONLY public.casa_estado DROP CONSTRAINT pk_casa_estado;
       public            postgres    false    220            ]           2606    28758 "   casa_infraccion pk_casa_infraccion 
   CONSTRAINT     p   ALTER TABLE ONLY public.casa_infraccion
    ADD CONSTRAINT pk_casa_infraccion PRIMARY KEY (id_casa_infraccion);
 L   ALTER TABLE ONLY public.casa_infraccion DROP CONSTRAINT pk_casa_infraccion;
       public            postgres    false    222            _           2606    28760    clase_gasto pk_clase_gasto 
   CONSTRAINT     d   ALTER TABLE ONLY public.clase_gasto
    ADD CONSTRAINT pk_clase_gasto PRIMARY KEY (id_clase_gasto);
 D   ALTER TABLE ONLY public.clase_gasto DROP CONSTRAINT pk_clase_gasto;
       public            postgres    false    223            a           2606    28762    contrato pk_contrato 
   CONSTRAINT     [   ALTER TABLE ONLY public.contrato
    ADD CONSTRAINT pk_contrato PRIMARY KEY (id_contrato);
 >   ALTER TABLE ONLY public.contrato DROP CONSTRAINT pk_contrato;
       public            postgres    false    225            c           2606    28764    cuenta pk_cuenta 
   CONSTRAINT     U   ALTER TABLE ONLY public.cuenta
    ADD CONSTRAINT pk_cuenta PRIMARY KEY (id_cuenta);
 :   ALTER TABLE ONLY public.cuenta DROP CONSTRAINT pk_cuenta;
       public            postgres    false    227            e           2606    28766    cuenta_predio pk_cuenta_predio 
   CONSTRAINT     j   ALTER TABLE ONLY public.cuenta_predio
    ADD CONSTRAINT pk_cuenta_predio PRIMARY KEY (id_cuenta_predio);
 H   ALTER TABLE ONLY public.cuenta_predio DROP CONSTRAINT pk_cuenta_predio;
       public            postgres    false    229            g           2606    28768    deposito pk_deposito 
   CONSTRAINT     [   ALTER TABLE ONLY public.deposito
    ADD CONSTRAINT pk_deposito PRIMARY KEY (id_deposito);
 >   ALTER TABLE ONLY public.deposito DROP CONSTRAINT pk_deposito;
       public            postgres    false    231            i           2606    28770 "   estacionamiento pk_estacionamiento 
   CONSTRAINT     p   ALTER TABLE ONLY public.estacionamiento
    ADD CONSTRAINT pk_estacionamiento PRIMARY KEY (id_estacionamiento);
 L   ALTER TABLE ONLY public.estacionamiento DROP CONSTRAINT pk_estacionamiento;
       public            postgres    false    233            k           2606    28772    estado pk_estado 
   CONSTRAINT     U   ALTER TABLE ONLY public.estado
    ADD CONSTRAINT pk_estado PRIMARY KEY (id_estado);
 :   ALTER TABLE ONLY public.estado DROP CONSTRAINT pk_estado;
       public            postgres    false    234            m           2606    28774    gasto pk_gasto 
   CONSTRAINT     R   ALTER TABLE ONLY public.gasto
    ADD CONSTRAINT pk_gasto PRIMARY KEY (id_gasto);
 8   ALTER TABLE ONLY public.gasto DROP CONSTRAINT pk_gasto;
       public            postgres    false    235            o           2606    28776    infraccion pk_infraccion 
   CONSTRAINT     a   ALTER TABLE ONLY public.infraccion
    ADD CONSTRAINT pk_infraccion PRIMARY KEY (id_infraccion);
 B   ALTER TABLE ONLY public.infraccion DROP CONSTRAINT pk_infraccion;
       public            postgres    false    249            q           2606    28778    inquilino pk_inquilino 
   CONSTRAINT     ^   ALTER TABLE ONLY public.inquilino
    ADD CONSTRAINT pk_inquilino PRIMARY KEY (id_inquilino);
 @   ALTER TABLE ONLY public.inquilino DROP CONSTRAINT pk_inquilino;
       public            postgres    false    250            s           2606    28780 &   inventario_predio pk_inventario_predio 
   CONSTRAINT     v   ALTER TABLE ONLY public.inventario_predio
    ADD CONSTRAINT pk_inventario_predio PRIMARY KEY (id_inventario_predio);
 P   ALTER TABLE ONLY public.inventario_predio DROP CONSTRAINT pk_inventario_predio;
       public            postgres    false    251            u           2606    28782    mant_recibo pk_mant_recibo 
   CONSTRAINT     d   ALTER TABLE ONLY public.mant_recibo
    ADD CONSTRAINT pk_mant_recibo PRIMARY KEY (id_mant_recibo);
 D   ALTER TABLE ONLY public.mant_recibo DROP CONSTRAINT pk_mant_recibo;
       public            postgres    false    252            w           2606    28784 "   mant_recibo_det pk_mant_recibo_det 
   CONSTRAINT     p   ALTER TABLE ONLY public.mant_recibo_det
    ADD CONSTRAINT pk_mant_recibo_det PRIMARY KEY (id_mant_recibo_det);
 L   ALTER TABLE ONLY public.mant_recibo_det DROP CONSTRAINT pk_mant_recibo_det;
       public            postgres    false    253            y           2606    28786    mascota pk_mascota 
   CONSTRAINT     X   ALTER TABLE ONLY public.mascota
    ADD CONSTRAINT pk_mascota PRIMARY KEY (id_mascota);
 <   ALTER TABLE ONLY public.mascota DROP CONSTRAINT pk_mascota;
       public            postgres    false    254            {           2606    28788 
   mdu pk_mdu 
   CONSTRAINT     L   ALTER TABLE ONLY public.mdu
    ADD CONSTRAINT pk_mdu PRIMARY KEY (id_mdu);
 4   ALTER TABLE ONLY public.mdu DROP CONSTRAINT pk_mdu;
       public            postgres    false    255            }           2606    28790    mora pk_mora 
   CONSTRAINT     O   ALTER TABLE ONLY public.mora
    ADD CONSTRAINT pk_mora PRIMARY KEY (id_mora);
 6   ALTER TABLE ONLY public.mora DROP CONSTRAINT pk_mora;
       public            postgres    false    256                       2606    28792    persona pk_persona 
   CONSTRAINT     X   ALTER TABLE ONLY public.persona
    ADD CONSTRAINT pk_persona PRIMARY KEY (id_persona);
 <   ALTER TABLE ONLY public.persona DROP CONSTRAINT pk_persona;
       public            postgres    false    257            �           2606    28794    personal pk_personal 
   CONSTRAINT     [   ALTER TABLE ONLY public.personal
    ADD CONSTRAINT pk_personal PRIMARY KEY (id_personal);
 >   ALTER TABLE ONLY public.personal DROP CONSTRAINT pk_personal;
       public            postgres    false    258            �           2606    28796    predio pk_predio 
   CONSTRAINT     U   ALTER TABLE ONLY public.predio
    ADD CONSTRAINT pk_predio PRIMARY KEY (id_predio);
 :   ALTER TABLE ONLY public.predio DROP CONSTRAINT pk_predio;
       public            postgres    false    259            �           2606    28798 &   predio_area_comun pk_predio_area_comun 
   CONSTRAINT     z   ALTER TABLE ONLY public.predio_area_comun
    ADD CONSTRAINT pk_predio_area_comun PRIMARY KEY (id_predio, id_area_comun);
 P   ALTER TABLE ONLY public.predio_area_comun DROP CONSTRAINT pk_predio_area_comun;
       public            postgres    false    260    260            �           2606    28800    predio_mdu pk_predio_mdu 
   CONSTRAINT     a   ALTER TABLE ONLY public.predio_mdu
    ADD CONSTRAINT pk_predio_mdu PRIMARY KEY (id_predio_mdu);
 B   ALTER TABLE ONLY public.predio_mdu DROP CONSTRAINT pk_predio_mdu;
       public            postgres    false    261            �           2606    28802    propietario pk_propietario 
   CONSTRAINT     d   ALTER TABLE ONLY public.propietario
    ADD CONSTRAINT pk_propietario PRIMARY KEY (id_propietario);
 D   ALTER TABLE ONLY public.propietario DROP CONSTRAINT pk_propietario;
       public            postgres    false    262            �           2606    28804    proveedor pk_proveedor 
   CONSTRAINT     ^   ALTER TABLE ONLY public.proveedor
    ADD CONSTRAINT pk_proveedor PRIMARY KEY (id_proveedor);
 @   ALTER TABLE ONLY public.proveedor DROP CONSTRAINT pk_proveedor;
       public            postgres    false    263            �           2606    28806    raza_mascota pk_raza_mascota 
   CONSTRAINT     g   ALTER TABLE ONLY public.raza_mascota
    ADD CONSTRAINT pk_raza_mascota PRIMARY KEY (id_raza_mascota);
 F   ALTER TABLE ONLY public.raza_mascota DROP CONSTRAINT pk_raza_mascota;
       public            postgres    false    264            �           2606    28808    recaudacion pk_recaudacion 
   CONSTRAINT     d   ALTER TABLE ONLY public.recaudacion
    ADD CONSTRAINT pk_recaudacion PRIMARY KEY (id_transaccion);
 D   ALTER TABLE ONLY public.recaudacion DROP CONSTRAINT pk_recaudacion;
       public            postgres    false    265            �           2606    28810 (   recaudacion_estado pk_recaudacion_estado 
   CONSTRAINT     y   ALTER TABLE ONLY public.recaudacion_estado
    ADD CONSTRAINT pk_recaudacion_estado PRIMARY KEY (id_recaudacion_estado);
 R   ALTER TABLE ONLY public.recaudacion_estado DROP CONSTRAINT pk_recaudacion_estado;
       public            postgres    false    266            �           2606    28812    recibo_estado pk_recibo_estado 
   CONSTRAINT     j   ALTER TABLE ONLY public.recibo_estado
    ADD CONSTRAINT pk_recibo_estado PRIMARY KEY (id_recibo_estado);
 H   ALTER TABLE ONLY public.recibo_estado DROP CONSTRAINT pk_recibo_estado;
       public            postgres    false    267            �           2606    28814    residente pk_residente 
   CONSTRAINT     ^   ALTER TABLE ONLY public.residente
    ADD CONSTRAINT pk_residente PRIMARY KEY (id_residente);
 @   ALTER TABLE ONLY public.residente DROP CONSTRAINT pk_residente;
       public            postgres    false    268            �           2606    28816 
   rol pk_rol 
   CONSTRAINT     Y   ALTER TABLE ONLY public.rol
    ADD CONSTRAINT pk_rol PRIMARY KEY (id_tipo_solicitante);
 4   ALTER TABLE ONLY public.rol DROP CONSTRAINT pk_rol;
       public            postgres    false    269            �           2606    28818    servicio pk_servicio 
   CONSTRAINT     [   ALTER TABLE ONLY public.servicio
    ADD CONSTRAINT pk_servicio PRIMARY KEY (id_servicio);
 >   ALTER TABLE ONLY public.servicio DROP CONSTRAINT pk_servicio;
       public            postgres    false    270            �           2606    28820 *   servicio_individual pk_servicio_individual 
   CONSTRAINT     |   ALTER TABLE ONLY public.servicio_individual
    ADD CONSTRAINT pk_servicio_individual PRIMARY KEY (id_servicio_individual);
 T   ALTER TABLE ONLY public.servicio_individual DROP CONSTRAINT pk_servicio_individual;
       public            postgres    false    271            �           2606    28822    solicitante pk_solicitante 
   CONSTRAINT     d   ALTER TABLE ONLY public.solicitante
    ADD CONSTRAINT pk_solicitante PRIMARY KEY (id_solicitante);
 D   ALTER TABLE ONLY public.solicitante DROP CONSTRAINT pk_solicitante;
       public            postgres    false    272            �           2606    28824    solicitud pk_solicitud 
   CONSTRAINT     ^   ALTER TABLE ONLY public.solicitud
    ADD CONSTRAINT pk_solicitud PRIMARY KEY (id_solicitud);
 @   ALTER TABLE ONLY public.solicitud DROP CONSTRAINT pk_solicitud;
       public            postgres    false    273            �           2606    28826 ,   solicitud_cotizacion pk_solicitud_cotizacion 
   CONSTRAINT     t   ALTER TABLE ONLY public.solicitud_cotizacion
    ADD CONSTRAINT pk_solicitud_cotizacion PRIMARY KEY (id_solicitud);
 V   ALTER TABLE ONLY public.solicitud_cotizacion DROP CONSTRAINT pk_solicitud_cotizacion;
       public            postgres    false    274            �           2606    28828 "   tamanio_mascota pk_tamanio_mascota 
   CONSTRAINT     l   ALTER TABLE ONLY public.tamanio_mascota
    ADD CONSTRAINT pk_tamanio_mascota PRIMARY KEY (id_tam_mascota);
 L   ALTER TABLE ONLY public.tamanio_mascota DROP CONSTRAINT pk_tamanio_mascota;
       public            postgres    false    275            �           2606    28830 &   tipo_autorizacion pk_tipo_autorizacion 
   CONSTRAINT     v   ALTER TABLE ONLY public.tipo_autorizacion
    ADD CONSTRAINT pk_tipo_autorizacion PRIMARY KEY (id_tipo_autorizacion);
 P   ALTER TABLE ONLY public.tipo_autorizacion DROP CONSTRAINT pk_tipo_autorizacion;
       public            postgres    false    276            �           2606    28832     tipo_documento pk_tipo_documento 
   CONSTRAINT     m   ALTER TABLE ONLY public.tipo_documento
    ADD CONSTRAINT pk_tipo_documento PRIMARY KEY (id_tipo_documento);
 J   ALTER TABLE ONLY public.tipo_documento DROP CONSTRAINT pk_tipo_documento;
       public            postgres    false    277            �           2606    28834    tipo_gasto pk_tipo_gasto 
   CONSTRAINT     a   ALTER TABLE ONLY public.tipo_gasto
    ADD CONSTRAINT pk_tipo_gasto PRIMARY KEY (id_tipo_gasto);
 B   ALTER TABLE ONLY public.tipo_gasto DROP CONSTRAINT pk_tipo_gasto;
       public            postgres    false    278            �           2606    28836    tipo_mascota pk_tipo_mascota 
   CONSTRAINT     g   ALTER TABLE ONLY public.tipo_mascota
    ADD CONSTRAINT pk_tipo_mascota PRIMARY KEY (id_tipo_mascota);
 F   ALTER TABLE ONLY public.tipo_mascota DROP CONSTRAINT pk_tipo_mascota;
       public            postgres    false    279            �           2606    28838    tipo_moneda pk_tipo_moneda 
   CONSTRAINT     d   ALTER TABLE ONLY public.tipo_moneda
    ADD CONSTRAINT pk_tipo_moneda PRIMARY KEY (id_tipo_moneda);
 D   ALTER TABLE ONLY public.tipo_moneda DROP CONSTRAINT pk_tipo_moneda;
       public            postgres    false    280            �           2606    28840    tipo_persona pk_tipo_persona 
   CONSTRAINT     g   ALTER TABLE ONLY public.tipo_persona
    ADD CONSTRAINT pk_tipo_persona PRIMARY KEY (id_tipo_persona);
 F   ALTER TABLE ONLY public.tipo_persona DROP CONSTRAINT pk_tipo_persona;
       public            postgres    false    281            �           2606    28842    tipo_predio pk_tipo_predio 
   CONSTRAINT     d   ALTER TABLE ONLY public.tipo_predio
    ADD CONSTRAINT pk_tipo_predio PRIMARY KEY (id_tipo_predio);
 D   ALTER TABLE ONLY public.tipo_predio DROP CONSTRAINT pk_tipo_predio;
       public            postgres    false    282            �           2606    28844    ubigeo pk_ubigeo 
   CONSTRAINT     T   ALTER TABLE ONLY public.ubigeo
    ADD CONSTRAINT pk_ubigeo PRIMARY KEY (idubigeo);
 :   ALTER TABLE ONLY public.ubigeo DROP CONSTRAINT pk_ubigeo;
       public            postgres    false    283            �           2606    28845 (   casa_deposito fk_casa_dep_reference_casa    FK CONSTRAINT     �   ALTER TABLE ONLY public.casa_deposito
    ADD CONSTRAINT fk_casa_dep_reference_casa FOREIGN KEY (id_casa) REFERENCES public.casa(id_casa) ON UPDATE RESTRICT ON DELETE RESTRICT;
 R   ALTER TABLE ONLY public.casa_deposito DROP CONSTRAINT fk_casa_dep_reference_casa;
       public          postgres    false    217    3413    218            �           2606    28850 ,   casa_deposito fk_casa_dep_reference_deposito    FK CONSTRAINT     �   ALTER TABLE ONLY public.casa_deposito
    ADD CONSTRAINT fk_casa_dep_reference_deposito FOREIGN KEY (id_deposito) REFERENCES public.deposito(id_deposito) ON UPDATE RESTRICT ON DELETE RESTRICT;
 V   ALTER TABLE ONLY public.casa_deposito DROP CONSTRAINT fk_casa_dep_reference_deposito;
       public          postgres    false    3431    218    231            �           2606    28855 *   casa_deposito fk_casa_dep_reference_estado    FK CONSTRAINT     �   ALTER TABLE ONLY public.casa_deposito
    ADD CONSTRAINT fk_casa_dep_reference_estado FOREIGN KEY (id_estado) REFERENCES public.estado(id_estado) ON UPDATE RESTRICT ON DELETE RESTRICT;
 T   ALTER TABLE ONLY public.casa_deposito DROP CONSTRAINT fk_casa_dep_reference_estado;
       public          postgres    false    3435    218    234            �           2606    28860 /   casa_estacionamiento fk_casa_est_reference_casa    FK CONSTRAINT     �   ALTER TABLE ONLY public.casa_estacionamiento
    ADD CONSTRAINT fk_casa_est_reference_casa FOREIGN KEY (id_casa) REFERENCES public.casa(id_casa) ON UPDATE RESTRICT ON DELETE RESTRICT;
 Y   ALTER TABLE ONLY public.casa_estacionamiento DROP CONSTRAINT fk_casa_est_reference_casa;
       public          postgres    false    3413    217    219            �           2606    28865 3   casa_estacionamiento fk_casa_est_reference_estacion    FK CONSTRAINT     �   ALTER TABLE ONLY public.casa_estacionamiento
    ADD CONSTRAINT fk_casa_est_reference_estacion FOREIGN KEY (id_estacionamiento) REFERENCES public.estacionamiento(id_estacionamiento) ON UPDATE RESTRICT ON DELETE RESTRICT;
 ]   ALTER TABLE ONLY public.casa_estacionamiento DROP CONSTRAINT fk_casa_est_reference_estacion;
       public          postgres    false    3433    219    233            �           2606    28870 1   casa_estacionamiento fk_casa_est_reference_estado    FK CONSTRAINT     �   ALTER TABLE ONLY public.casa_estacionamiento
    ADD CONSTRAINT fk_casa_est_reference_estado FOREIGN KEY (id_estado) REFERENCES public.estado(id_estado) ON UPDATE RESTRICT ON DELETE RESTRICT;
 [   ALTER TABLE ONLY public.casa_estacionamiento DROP CONSTRAINT fk_casa_est_reference_estado;
       public          postgres    false    3435    219    234            �           2606    28875 *   casa_infraccion fk_casa_inf_reference_casa    FK CONSTRAINT     �   ALTER TABLE ONLY public.casa_infraccion
    ADD CONSTRAINT fk_casa_inf_reference_casa FOREIGN KEY (id_casa_infraccion) REFERENCES public.casa(id_casa) ON UPDATE RESTRICT ON DELETE RESTRICT;
 T   ALTER TABLE ONLY public.casa_infraccion DROP CONSTRAINT fk_casa_inf_reference_casa;
       public          postgres    false    3413    217    222            �           2606    28880 +   casa_infraccion fk_casa_inf_reference_gasto    FK CONSTRAINT     �   ALTER TABLE ONLY public.casa_infraccion
    ADD CONSTRAINT fk_casa_inf_reference_gasto FOREIGN KEY (id_gasto) REFERENCES public.gasto(id_gasto) ON UPDATE RESTRICT ON DELETE RESTRICT;
 U   ALTER TABLE ONLY public.casa_infraccion DROP CONSTRAINT fk_casa_inf_reference_gasto;
       public          postgres    false    222    235    3437            �           2606    28885 .   casa_infraccion fk_casa_inf_reference_infracci    FK CONSTRAINT     �   ALTER TABLE ONLY public.casa_infraccion
    ADD CONSTRAINT fk_casa_inf_reference_infracci FOREIGN KEY (id_infraccion) REFERENCES public.infraccion(id_infraccion) ON UPDATE RESTRICT ON DELETE RESTRICT;
 X   ALTER TABLE ONLY public.casa_infraccion DROP CONSTRAINT fk_casa_inf_reference_infracci;
       public          postgres    false    3439    249    222            �           2606    28890    casa fk_casa_reference_casa_est    FK CONSTRAINT     �   ALTER TABLE ONLY public.casa
    ADD CONSTRAINT fk_casa_reference_casa_est FOREIGN KEY (id_estado) REFERENCES public.casa_estado(id_estado) ON UPDATE RESTRICT ON DELETE RESTRICT;
 I   ALTER TABLE ONLY public.casa DROP CONSTRAINT fk_casa_reference_casa_est;
       public          postgres    false    220    3419    217            �           2606    28895    casa fk_casa_reference_predio    FK CONSTRAINT     �   ALTER TABLE ONLY public.casa
    ADD CONSTRAINT fk_casa_reference_predio FOREIGN KEY (id_predio) REFERENCES public.predio(id_predio) ON UPDATE RESTRICT ON DELETE RESTRICT;
 G   ALTER TABLE ONLY public.casa DROP CONSTRAINT fk_casa_reference_predio;
       public          postgres    false    259    3459    217            �           2606    28900    casa fk_casa_reference_predio_m    FK CONSTRAINT     �   ALTER TABLE ONLY public.casa
    ADD CONSTRAINT fk_casa_reference_predio_m FOREIGN KEY (id_predio_mdu) REFERENCES public.predio_mdu(id_predio_mdu) ON UPDATE RESTRICT ON DELETE RESTRICT;
 I   ALTER TABLE ONLY public.casa DROP CONSTRAINT fk_casa_reference_predio_m;
       public          postgres    false    217    261    3463            �           2606    28905 '   contrato fk_contrato_reference_personal    FK CONSTRAINT     �   ALTER TABLE ONLY public.contrato
    ADD CONSTRAINT fk_contrato_reference_personal FOREIGN KEY (id_personal) REFERENCES public.personal(id_personal) ON UPDATE RESTRICT ON DELETE RESTRICT;
 Q   ALTER TABLE ONLY public.contrato DROP CONSTRAINT fk_contrato_reference_personal;
       public          postgres    false    258    225    3457            �           2606    28910 '   contrato fk_contrato_reference_solicita    FK CONSTRAINT     �   ALTER TABLE ONLY public.contrato
    ADD CONSTRAINT fk_contrato_reference_solicita FOREIGN KEY (id_solicitante) REFERENCES public.solicitante(id_solicitante) ON UPDATE RESTRICT ON DELETE RESTRICT;
 Q   ALTER TABLE ONLY public.contrato DROP CONSTRAINT fk_contrato_reference_solicita;
       public          postgres    false    272    3485    225            �           2606    28915 '   contrato fk_contrato_reference_solicitu    FK CONSTRAINT     �   ALTER TABLE ONLY public.contrato
    ADD CONSTRAINT fk_contrato_reference_solicitu FOREIGN KEY (id_solicitud) REFERENCES public.solicitud_cotizacion(id_solicitud) ON UPDATE RESTRICT ON DELETE RESTRICT;
 Q   ALTER TABLE ONLY public.contrato DROP CONSTRAINT fk_contrato_reference_solicitu;
       public          postgres    false    3489    225    274            �           2606    28920 )   cuenta_predio fk_cuenta_p_reference_banco    FK CONSTRAINT     �   ALTER TABLE ONLY public.cuenta_predio
    ADD CONSTRAINT fk_cuenta_p_reference_banco FOREIGN KEY (id_banco) REFERENCES public.banco(id_banco) ON UPDATE RESTRICT ON DELETE RESTRICT;
 S   ALTER TABLE ONLY public.cuenta_predio DROP CONSTRAINT fk_cuenta_p_reference_banco;
       public          postgres    false    215    3411    229            �           2606    28925 *   cuenta_predio fk_cuenta_p_reference_estado    FK CONSTRAINT     �   ALTER TABLE ONLY public.cuenta_predio
    ADD CONSTRAINT fk_cuenta_p_reference_estado FOREIGN KEY (id_estado) REFERENCES public.estado(id_estado) ON UPDATE RESTRICT ON DELETE RESTRICT;
 T   ALTER TABLE ONLY public.cuenta_predio DROP CONSTRAINT fk_cuenta_p_reference_estado;
       public          postgres    false    234    229    3435            �           2606    28930 *   cuenta_predio fk_cuenta_p_reference_predio    FK CONSTRAINT     �   ALTER TABLE ONLY public.cuenta_predio
    ADD CONSTRAINT fk_cuenta_p_reference_predio FOREIGN KEY (id_predio) REFERENCES public.predio(id_predio) ON UPDATE RESTRICT ON DELETE RESTRICT;
 T   ALTER TABLE ONLY public.cuenta_predio DROP CONSTRAINT fk_cuenta_p_reference_predio;
       public          postgres    false    259    3459    229            �           2606    28935 ,   cuenta_predio fk_cuenta_p_reference_tipo_aut    FK CONSTRAINT     �   ALTER TABLE ONLY public.cuenta_predio
    ADD CONSTRAINT fk_cuenta_p_reference_tipo_aut FOREIGN KEY (id_tipo_autorizacion) REFERENCES public.tipo_autorizacion(id_tipo_autorizacion) ON UPDATE RESTRICT ON DELETE RESTRICT;
 V   ALTER TABLE ONLY public.cuenta_predio DROP CONSTRAINT fk_cuenta_p_reference_tipo_aut;
       public          postgres    false    3493    229    276            �           2606    28940 ,   cuenta_predio fk_cuenta_p_reference_tipo_mon    FK CONSTRAINT     �   ALTER TABLE ONLY public.cuenta_predio
    ADD CONSTRAINT fk_cuenta_p_reference_tipo_mon FOREIGN KEY (id_tipo_moneda) REFERENCES public.tipo_moneda(id_tipo_moneda) ON UPDATE RESTRICT ON DELETE RESTRICT;
 V   ALTER TABLE ONLY public.cuenta_predio DROP CONSTRAINT fk_cuenta_p_reference_tipo_mon;
       public          postgres    false    3501    280    229            �           2606    28945     cuenta fk_cuenta_reference_banco    FK CONSTRAINT     �   ALTER TABLE ONLY public.cuenta
    ADD CONSTRAINT fk_cuenta_reference_banco FOREIGN KEY (id_banco) REFERENCES public.banco(id_banco) ON UPDATE RESTRICT ON DELETE RESTRICT;
 J   ALTER TABLE ONLY public.cuenta DROP CONSTRAINT fk_cuenta_reference_banco;
       public          postgres    false    227    3411    215            �           2606    28950 "   cuenta fk_cuenta_reference_persona    FK CONSTRAINT     �   ALTER TABLE ONLY public.cuenta
    ADD CONSTRAINT fk_cuenta_reference_persona FOREIGN KEY (id_persona) REFERENCES public.persona(id_persona) ON UPDATE RESTRICT ON DELETE RESTRICT;
 L   ALTER TABLE ONLY public.cuenta DROP CONSTRAINT fk_cuenta_reference_persona;
       public          postgres    false    257    227    3455            �           2606    28955 #   cuenta fk_cuenta_reference_tipo_mon    FK CONSTRAINT     �   ALTER TABLE ONLY public.cuenta
    ADD CONSTRAINT fk_cuenta_reference_tipo_mon FOREIGN KEY (id_tipo_moneda) REFERENCES public.tipo_moneda(id_tipo_moneda) ON UPDATE RESTRICT ON DELETE RESTRICT;
 M   ALTER TABLE ONLY public.cuenta DROP CONSTRAINT fk_cuenta_reference_tipo_mon;
       public          postgres    false    280    227    3501            �           2606    28960 #   deposito fk_deposito_reference_casa    FK CONSTRAINT     �   ALTER TABLE ONLY public.deposito
    ADD CONSTRAINT fk_deposito_reference_casa FOREIGN KEY (id_casa) REFERENCES public.casa(id_casa) ON UPDATE RESTRICT ON DELETE RESTRICT;
 M   ALTER TABLE ONLY public.deposito DROP CONSTRAINT fk_deposito_reference_casa;
       public          postgres    false    231    217    3413            �           2606    28965 *   estacionamiento fk_estacion_reference_casa    FK CONSTRAINT     �   ALTER TABLE ONLY public.estacionamiento
    ADD CONSTRAINT fk_estacion_reference_casa FOREIGN KEY (id_casa) REFERENCES public.casa(id_casa) ON UPDATE RESTRICT ON DELETE RESTRICT;
 T   ALTER TABLE ONLY public.estacionamiento DROP CONSTRAINT fk_estacion_reference_casa;
       public          postgres    false    3413    233    217            �           2606    28970 !   gasto fk_gasto_reference_tipo_gas    FK CONSTRAINT     �   ALTER TABLE ONLY public.gasto
    ADD CONSTRAINT fk_gasto_reference_tipo_gas FOREIGN KEY (id_tipo_gasto) REFERENCES public.tipo_gasto(id_tipo_gasto) ON UPDATE RESTRICT ON DELETE RESTRICT;
 K   ALTER TABLE ONLY public.gasto DROP CONSTRAINT fk_gasto_reference_tipo_gas;
       public          postgres    false    235    278    3497            �           2606    28975 $   inquilino fk_inquilin_reference_casa    FK CONSTRAINT     �   ALTER TABLE ONLY public.inquilino
    ADD CONSTRAINT fk_inquilin_reference_casa FOREIGN KEY (id_casa) REFERENCES public.casa(id_casa) ON UPDATE RESTRICT ON DELETE RESTRICT;
 N   ALTER TABLE ONLY public.inquilino DROP CONSTRAINT fk_inquilin_reference_casa;
       public          postgres    false    3413    250    217            �           2606    28980 '   inquilino fk_inquilin_reference_persona    FK CONSTRAINT     �   ALTER TABLE ONLY public.inquilino
    ADD CONSTRAINT fk_inquilin_reference_persona FOREIGN KEY (id_persona) REFERENCES public.persona(id_persona) ON UPDATE RESTRICT ON DELETE RESTRICT;
 Q   ALTER TABLE ONLY public.inquilino DROP CONSTRAINT fk_inquilin_reference_persona;
       public          postgres    false    3455    257    250            �           2606    28985 0   inventario_predio fk_inventar_reference_personal    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventario_predio
    ADD CONSTRAINT fk_inventar_reference_personal FOREIGN KEY (id_personal) REFERENCES public.personal(id_personal) ON UPDATE RESTRICT ON DELETE RESTRICT;
 Z   ALTER TABLE ONLY public.inventario_predio DROP CONSTRAINT fk_inventar_reference_personal;
       public          postgres    false    251    258    3457            �           2606    28990 .   inventario_predio fk_inventar_reference_predio    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventario_predio
    ADD CONSTRAINT fk_inventar_reference_predio FOREIGN KEY (id_predio) REFERENCES public.predio(id_predio) ON UPDATE RESTRICT ON DELETE RESTRICT;
 X   ALTER TABLE ONLY public.inventario_predio DROP CONSTRAINT fk_inventar_reference_predio;
       public          postgres    false    251    259    3459            �           2606    28995 &   mant_recibo fk_mant_rec_reference_casa    FK CONSTRAINT     �   ALTER TABLE ONLY public.mant_recibo
    ADD CONSTRAINT fk_mant_rec_reference_casa FOREIGN KEY (id_casa) REFERENCES public.casa(id_casa) ON UPDATE RESTRICT ON DELETE RESTRICT;
 P   ALTER TABLE ONLY public.mant_recibo DROP CONSTRAINT fk_mant_rec_reference_casa;
       public          postgres    false    252    217    3413            �           2606    29000 +   mant_recibo_det fk_mant_rec_reference_gasto    FK CONSTRAINT     �   ALTER TABLE ONLY public.mant_recibo_det
    ADD CONSTRAINT fk_mant_rec_reference_gasto FOREIGN KEY (id_gasto) REFERENCES public.gasto(id_gasto) ON UPDATE RESTRICT ON DELETE RESTRICT;
 U   ALTER TABLE ONLY public.mant_recibo_det DROP CONSTRAINT fk_mant_rec_reference_gasto;
       public          postgres    false    235    253    3437            �           2606    29005 .   mant_recibo_det fk_mant_rec_reference_mant_rec    FK CONSTRAINT     �   ALTER TABLE ONLY public.mant_recibo_det
    ADD CONSTRAINT fk_mant_rec_reference_mant_rec FOREIGN KEY (id_mant_recibo) REFERENCES public.mant_recibo(id_mant_recibo) ON UPDATE RESTRICT ON DELETE RESTRICT;
 X   ALTER TABLE ONLY public.mant_recibo_det DROP CONSTRAINT fk_mant_rec_reference_mant_rec;
       public          postgres    false    252    3445    253            �           2606    29010 *   mant_recibo fk_mant_rec_reference_recibo_e    FK CONSTRAINT     �   ALTER TABLE ONLY public.mant_recibo
    ADD CONSTRAINT fk_mant_rec_reference_recibo_e FOREIGN KEY (id_recibo_estado) REFERENCES public.recibo_estado(id_recibo_estado) ON UPDATE RESTRICT ON DELETE RESTRICT;
 T   ALTER TABLE ONLY public.mant_recibo DROP CONSTRAINT fk_mant_rec_reference_recibo_e;
       public          postgres    false    252    267    3475            �           2606    29015 !   mascota fk_mascota_reference_casa    FK CONSTRAINT     �   ALTER TABLE ONLY public.mascota
    ADD CONSTRAINT fk_mascota_reference_casa FOREIGN KEY (id_casa) REFERENCES public.casa(id_casa) ON UPDATE RESTRICT ON DELETE RESTRICT;
 K   ALTER TABLE ONLY public.mascota DROP CONSTRAINT fk_mascota_reference_casa;
       public          postgres    false    3413    254    217            �           2606    29020 %   mascota fk_mascota_reference_raza_mas    FK CONSTRAINT     �   ALTER TABLE ONLY public.mascota
    ADD CONSTRAINT fk_mascota_reference_raza_mas FOREIGN KEY (id_raza_mascota) REFERENCES public.raza_mascota(id_raza_mascota) ON UPDATE RESTRICT ON DELETE RESTRICT;
 O   ALTER TABLE ONLY public.mascota DROP CONSTRAINT fk_mascota_reference_raza_mas;
       public          postgres    false    264    254    3469            �           2606    29025 %   mascota fk_mascota_reference_tamanio_    FK CONSTRAINT     �   ALTER TABLE ONLY public.mascota
    ADD CONSTRAINT fk_mascota_reference_tamanio_ FOREIGN KEY (id_tam_mascota) REFERENCES public.tamanio_mascota(id_tam_mascota) ON UPDATE RESTRICT ON DELETE RESTRICT;
 O   ALTER TABLE ONLY public.mascota DROP CONSTRAINT fk_mascota_reference_tamanio_;
       public          postgres    false    254    3491    275            �           2606    29030 %   mascota fk_mascota_reference_tipo_mas    FK CONSTRAINT     �   ALTER TABLE ONLY public.mascota
    ADD CONSTRAINT fk_mascota_reference_tipo_mas FOREIGN KEY (id_tipo_mascota) REFERENCES public.tipo_mascota(id_tipo_mascota) ON UPDATE RESTRICT ON DELETE RESTRICT;
 O   ALTER TABLE ONLY public.mascota DROP CONSTRAINT fk_mascota_reference_tipo_mas;
       public          postgres    false    3499    279    254            �           2606    29035    mora fk_mora_reference_mant_rec    FK CONSTRAINT     �   ALTER TABLE ONLY public.mora
    ADD CONSTRAINT fk_mora_reference_mant_rec FOREIGN KEY (id_mant_recibo) REFERENCES public.mant_recibo(id_mant_recibo) ON UPDATE RESTRICT ON DELETE RESTRICT;
 I   ALTER TABLE ONLY public.mora DROP CONSTRAINT fk_mora_reference_mant_rec;
       public          postgres    false    252    3445    256            �           2606    29040 %   persona fk_persona_reference_tipo_doc    FK CONSTRAINT     �   ALTER TABLE ONLY public.persona
    ADD CONSTRAINT fk_persona_reference_tipo_doc FOREIGN KEY (id_tipo_documento) REFERENCES public.tipo_documento(id_tipo_documento) ON UPDATE RESTRICT ON DELETE RESTRICT;
 O   ALTER TABLE ONLY public.persona DROP CONSTRAINT fk_persona_reference_tipo_doc;
       public          postgres    false    277    257    3495            �           2606    29045 #   persona fk_persona_reference_ubigeo    FK CONSTRAINT     �   ALTER TABLE ONLY public.persona
    ADD CONSTRAINT fk_persona_reference_ubigeo FOREIGN KEY (idubigeo) REFERENCES public.ubigeo(idubigeo) ON UPDATE RESTRICT ON DELETE RESTRICT;
 M   ALTER TABLE ONLY public.persona DROP CONSTRAINT fk_persona_reference_ubigeo;
       public          postgres    false    257    283    3507            �           2606    29050 &   personal fk_personal_reference_persona    FK CONSTRAINT     �   ALTER TABLE ONLY public.personal
    ADD CONSTRAINT fk_personal_reference_persona FOREIGN KEY (id_persona) REFERENCES public.persona(id_persona) ON UPDATE RESTRICT ON DELETE RESTRICT;
 P   ALTER TABLE ONLY public.personal DROP CONSTRAINT fk_personal_reference_persona;
       public          postgres    false    258    257    3455            �           2606    29055 "   personal fk_personal_reference_rol    FK CONSTRAINT     �   ALTER TABLE ONLY public.personal
    ADD CONSTRAINT fk_personal_reference_rol FOREIGN KEY (id_tipo_solicitante) REFERENCES public.rol(id_tipo_solicitante) ON UPDATE RESTRICT ON DELETE RESTRICT;
 L   ALTER TABLE ONLY public.personal DROP CONSTRAINT fk_personal_reference_rol;
       public          postgres    false    3479    258    269            �           2606    29060 0   predio_area_comun fk_predio_a_reference_area_com    FK CONSTRAINT     �   ALTER TABLE ONLY public.predio_area_comun
    ADD CONSTRAINT fk_predio_a_reference_area_com FOREIGN KEY (id_area_comun) REFERENCES public.area_comun(id_area_comun) ON UPDATE RESTRICT ON DELETE RESTRICT;
 Z   ALTER TABLE ONLY public.predio_area_comun DROP CONSTRAINT fk_predio_a_reference_area_com;
       public          postgres    false    3409    260    214            �           2606    29065 .   predio_area_comun fk_predio_a_reference_predio    FK CONSTRAINT     �   ALTER TABLE ONLY public.predio_area_comun
    ADD CONSTRAINT fk_predio_a_reference_predio FOREIGN KEY (id_predio) REFERENCES public.predio(id_predio) ON UPDATE RESTRICT ON DELETE RESTRICT;
 X   ALTER TABLE ONLY public.predio_area_comun DROP CONSTRAINT fk_predio_a_reference_predio;
       public          postgres    false    3459    259    260            �           2606    29070 $   predio_mdu fk_predio_m_reference_mdu    FK CONSTRAINT     �   ALTER TABLE ONLY public.predio_mdu
    ADD CONSTRAINT fk_predio_m_reference_mdu FOREIGN KEY (id_mdu) REFERENCES public.mdu(id_mdu) ON UPDATE RESTRICT ON DELETE RESTRICT;
 N   ALTER TABLE ONLY public.predio_mdu DROP CONSTRAINT fk_predio_m_reference_mdu;
       public          postgres    false    255    261    3451            �           2606    29075 '   predio_mdu fk_predio_m_reference_predio    FK CONSTRAINT     �   ALTER TABLE ONLY public.predio_mdu
    ADD CONSTRAINT fk_predio_m_reference_predio FOREIGN KEY (id_predio) REFERENCES public.predio(id_predio) ON UPDATE RESTRICT ON DELETE RESTRICT;
 Q   ALTER TABLE ONLY public.predio_mdu DROP CONSTRAINT fk_predio_m_reference_predio;
       public          postgres    false    259    261    3459            �           2606    29080 #   predio fk_predio_reference_tipo_pre    FK CONSTRAINT     �   ALTER TABLE ONLY public.predio
    ADD CONSTRAINT fk_predio_reference_tipo_pre FOREIGN KEY (id_tipo_predio) REFERENCES public.tipo_predio(id_tipo_predio) ON UPDATE RESTRICT ON DELETE RESTRICT;
 M   ALTER TABLE ONLY public.predio DROP CONSTRAINT fk_predio_reference_tipo_pre;
       public          postgres    false    282    3505    259            �           2606    29085 !   predio fk_predio_reference_ubigeo    FK CONSTRAINT     �   ALTER TABLE ONLY public.predio
    ADD CONSTRAINT fk_predio_reference_ubigeo FOREIGN KEY (idubigeo) REFERENCES public.ubigeo(idubigeo) ON UPDATE RESTRICT ON DELETE RESTRICT;
 K   ALTER TABLE ONLY public.predio DROP CONSTRAINT fk_predio_reference_ubigeo;
       public          postgres    false    3507    259    283            �           2606    29090 &   propietario fk_propieta_reference_casa    FK CONSTRAINT     �   ALTER TABLE ONLY public.propietario
    ADD CONSTRAINT fk_propieta_reference_casa FOREIGN KEY (id_casa) REFERENCES public.casa(id_casa) ON UPDATE RESTRICT ON DELETE RESTRICT;
 P   ALTER TABLE ONLY public.propietario DROP CONSTRAINT fk_propieta_reference_casa;
       public          postgres    false    217    262    3413            �           2606    29095 )   propietario fk_propieta_reference_persona    FK CONSTRAINT     �   ALTER TABLE ONLY public.propietario
    ADD CONSTRAINT fk_propieta_reference_persona FOREIGN KEY (id_persona) REFERENCES public.persona(id_persona) ON UPDATE RESTRICT ON DELETE RESTRICT;
 S   ALTER TABLE ONLY public.propietario DROP CONSTRAINT fk_propieta_reference_persona;
       public          postgres    false    262    257    3455            �           2606    29100 '   proveedor fk_proveedo_reference_persona    FK CONSTRAINT     �   ALTER TABLE ONLY public.proveedor
    ADD CONSTRAINT fk_proveedo_reference_persona FOREIGN KEY (id_persona) REFERENCES public.persona(id_persona) ON UPDATE RESTRICT ON DELETE RESTRICT;
 Q   ALTER TABLE ONLY public.proveedor DROP CONSTRAINT fk_proveedo_reference_persona;
       public          postgres    false    263    257    3455            �           2606    29105 (   proveedor fk_proveedo_reference_tipo_per    FK CONSTRAINT     �   ALTER TABLE ONLY public.proveedor
    ADD CONSTRAINT fk_proveedo_reference_tipo_per FOREIGN KEY (id_tipo_persona) REFERENCES public.tipo_persona(id_tipo_persona) ON UPDATE RESTRICT ON DELETE RESTRICT;
 R   ALTER TABLE ONLY public.proveedor DROP CONSTRAINT fk_proveedo_reference_tipo_per;
       public          postgres    false    281    263    3503            �           2606    29110 &   proveedor fk_proveedo_reference_ubigeo    FK CONSTRAINT     �   ALTER TABLE ONLY public.proveedor
    ADD CONSTRAINT fk_proveedo_reference_ubigeo FOREIGN KEY (idubigeo) REFERENCES public.ubigeo(idubigeo) ON UPDATE RESTRICT ON DELETE RESTRICT;
 P   ALTER TABLE ONLY public.proveedor DROP CONSTRAINT fk_proveedo_reference_ubigeo;
       public          postgres    false    3507    283    263            �           2606    29115 (   recaudacion fk_recaudac_reference_cuenta    FK CONSTRAINT     �   ALTER TABLE ONLY public.recaudacion
    ADD CONSTRAINT fk_recaudac_reference_cuenta FOREIGN KEY (id_cuenta) REFERENCES public.cuenta(id_cuenta) ON UPDATE RESTRICT ON DELETE RESTRICT;
 R   ALTER TABLE ONLY public.recaudacion DROP CONSTRAINT fk_recaudac_reference_cuenta;
       public          postgres    false    3427    265    227            �           2606    29120 *   recaudacion fk_recaudac_reference_cuenta_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.recaudacion
    ADD CONSTRAINT fk_recaudac_reference_cuenta_p FOREIGN KEY (id_cuenta_predio) REFERENCES public.cuenta_predio(id_cuenta_predio) ON UPDATE RESTRICT ON DELETE RESTRICT;
 T   ALTER TABLE ONLY public.recaudacion DROP CONSTRAINT fk_recaudac_reference_cuenta_p;
       public          postgres    false    3429    229    265            �           2606    29125 *   recaudacion fk_recaudac_reference_mant_rec    FK CONSTRAINT     �   ALTER TABLE ONLY public.recaudacion
    ADD CONSTRAINT fk_recaudac_reference_mant_rec FOREIGN KEY (id_mant_recibo) REFERENCES public.mant_recibo(id_mant_recibo) ON UPDATE RESTRICT ON DELETE RESTRICT;
 T   ALTER TABLE ONLY public.recaudacion DROP CONSTRAINT fk_recaudac_reference_mant_rec;
       public          postgres    false    265    252    3445            �           2606    29130 *   recaudacion fk_recaudac_reference_recaudac    FK CONSTRAINT     �   ALTER TABLE ONLY public.recaudacion
    ADD CONSTRAINT fk_recaudac_reference_recaudac FOREIGN KEY (id_recaudacion_estado) REFERENCES public.recaudacion_estado(id_recaudacion_estado) ON UPDATE RESTRICT ON DELETE RESTRICT;
 T   ALTER TABLE ONLY public.recaudacion DROP CONSTRAINT fk_recaudac_reference_recaudac;
       public          postgres    false    3473    266    265            �           2606    29135 $   residente fk_resident_reference_casa    FK CONSTRAINT     �   ALTER TABLE ONLY public.residente
    ADD CONSTRAINT fk_resident_reference_casa FOREIGN KEY (id_casa) REFERENCES public.casa(id_casa) ON UPDATE RESTRICT ON DELETE RESTRICT;
 N   ALTER TABLE ONLY public.residente DROP CONSTRAINT fk_resident_reference_casa;
       public          postgres    false    217    268    3413            �           2606    29140 '   residente fk_resident_reference_persona    FK CONSTRAINT     �   ALTER TABLE ONLY public.residente
    ADD CONSTRAINT fk_resident_reference_persona FOREIGN KEY (id_persona) REFERENCES public.persona(id_persona) ON UPDATE RESTRICT ON DELETE RESTRICT;
 Q   ALTER TABLE ONLY public.residente DROP CONSTRAINT fk_resident_reference_persona;
       public          postgres    false    257    268    3455            �           2606    29145 .   servicio_individual fk_servicio_reference_casa    FK CONSTRAINT     �   ALTER TABLE ONLY public.servicio_individual
    ADD CONSTRAINT fk_servicio_reference_casa FOREIGN KEY (id_casa) REFERENCES public.casa(id_casa) ON UPDATE RESTRICT ON DELETE RESTRICT;
 X   ALTER TABLE ONLY public.servicio_individual DROP CONSTRAINT fk_servicio_reference_casa;
       public          postgres    false    271    3413    217            �           2606    29150 /   servicio_individual fk_servicio_reference_gasto    FK CONSTRAINT     �   ALTER TABLE ONLY public.servicio_individual
    ADD CONSTRAINT fk_servicio_reference_gasto FOREIGN KEY (id_gasto) REFERENCES public.gasto(id_gasto) ON UPDATE RESTRICT ON DELETE RESTRICT;
 Y   ALTER TABLE ONLY public.servicio_individual DROP CONSTRAINT fk_servicio_reference_gasto;
       public          postgres    false    271    3437    235            �           2606    29155 )   solicitante fk_solicita_reference_persona    FK CONSTRAINT     �   ALTER TABLE ONLY public.solicitante
    ADD CONSTRAINT fk_solicita_reference_persona FOREIGN KEY (id_persona) REFERENCES public.persona(id_persona) ON UPDATE RESTRICT ON DELETE RESTRICT;
 S   ALTER TABLE ONLY public.solicitante DROP CONSTRAINT fk_solicita_reference_persona;
       public          postgres    false    257    3455    272            �           2606    29160 %   solicitante fk_solicita_reference_rol    FK CONSTRAINT     �   ALTER TABLE ONLY public.solicitante
    ADD CONSTRAINT fk_solicita_reference_rol FOREIGN KEY (id_tipo_solicitante) REFERENCES public.rol(id_tipo_solicitante) ON UPDATE RESTRICT ON DELETE RESTRICT;
 O   ALTER TABLE ONLY public.solicitante DROP CONSTRAINT fk_solicita_reference_rol;
       public          postgres    false    269    272    3479            �           2606    29165 3   solicitud_cotizacion fk_solicitu_reference_personal    FK CONSTRAINT     �   ALTER TABLE ONLY public.solicitud_cotizacion
    ADD CONSTRAINT fk_solicitu_reference_personal FOREIGN KEY (id_personal) REFERENCES public.personal(id_personal) ON UPDATE RESTRICT ON DELETE RESTRICT;
 ]   ALTER TABLE ONLY public.solicitud_cotizacion DROP CONSTRAINT fk_solicitu_reference_personal;
       public          postgres    false    3457    258    274            �           2606    29170 &   solicitud fk_solicitu_reference_predio    FK CONSTRAINT     �   ALTER TABLE ONLY public.solicitud
    ADD CONSTRAINT fk_solicitu_reference_predio FOREIGN KEY (id_predio) REFERENCES public.predio(id_predio) ON UPDATE RESTRICT ON DELETE RESTRICT;
 P   ALTER TABLE ONLY public.solicitud DROP CONSTRAINT fk_solicitu_reference_predio;
       public          postgres    false    273    259    3459            �           2606    29175 (   solicitud fk_solicitu_reference_servicio    FK CONSTRAINT     �   ALTER TABLE ONLY public.solicitud
    ADD CONSTRAINT fk_solicitu_reference_servicio FOREIGN KEY (id_servicio) REFERENCES public.servicio(id_servicio) ON UPDATE RESTRICT ON DELETE RESTRICT;
 R   ALTER TABLE ONLY public.solicitud DROP CONSTRAINT fk_solicitu_reference_servicio;
       public          postgres    false    3481    270    273            �           2606    29180 (   solicitud fk_solicitu_reference_solicita    FK CONSTRAINT     �   ALTER TABLE ONLY public.solicitud
    ADD CONSTRAINT fk_solicitu_reference_solicita FOREIGN KEY (id_solicitante) REFERENCES public.solicitante(id_solicitante) ON UPDATE RESTRICT ON DELETE RESTRICT;
 R   ALTER TABLE ONLY public.solicitud DROP CONSTRAINT fk_solicitu_reference_solicita;
       public          postgres    false    273    3485    272            �           2606    29185 3   solicitud_cotizacion fk_solicitu_reference_solicitu    FK CONSTRAINT     �   ALTER TABLE ONLY public.solicitud_cotizacion
    ADD CONSTRAINT fk_solicitu_reference_solicitu FOREIGN KEY (id_solicitud) REFERENCES public.solicitud(id_solicitud) ON UPDATE RESTRICT ON DELETE RESTRICT;
 ]   ALTER TABLE ONLY public.solicitud_cotizacion DROP CONSTRAINT fk_solicitu_reference_solicitu;
       public          postgres    false    273    274    3487            �           2606    29190 )   tipo_gasto fk_tipo_gas_reference_clase_ga    FK CONSTRAINT     �   ALTER TABLE ONLY public.tipo_gasto
    ADD CONSTRAINT fk_tipo_gas_reference_clase_ga FOREIGN KEY (id_clase_gasto) REFERENCES public.clase_gasto(id_clase_gasto) ON UPDATE RESTRICT ON DELETE RESTRICT;
 S   ALTER TABLE ONLY public.tipo_gasto DROP CONSTRAINT fk_tipo_gas_reference_clase_ga;
       public          postgres    false    3423    278    223            �   G   x�34000�,H,*,MU��+I-���2
qf�����E2�"Ɯ9�U�
)�
e�9��`1�V�=... ���      �   B   x�3���+I-JJ���2�tr�2�tr
s�2�N�/�L˘r:%�%�+d&gd�%g$r��qqq �      �   �   x�U�ۍ�0D���؀M/��>t%��pf�a��i�2��5�o]�vT�I�[?��#^���/��j�p���W�8�gt��������p&�
�%����ȟ���C_����[��M�
�و�h���̧3Bn���dE���tX�;~���z�!��]P5�xĘ�e�q�)hϐ�*��a�^��j��ܕ*�����ݒ�ນ�ԋ��3�'�ƴ�kwx�a�������H(      �      x������ � �      �      x������ � �      �   3   x�3��HL�,ILI�2���W��9s
K3s@lNǤļ��<'F��� ��      �      x������ � �      �   6   x�3�N-*�L��/Vp��-�K-�2�t��+.��W��K�,�L)M������ q/�      �      x������ � �      �      x�3�4C#csKscc3s�=... :�>      �   t   x�3�4�C#csKsccKNSsss 022�4�J���i���Y���X�������Z쐓X��X��_�X�����e1���3Sd�ِ�SX���Z�ax� N-�      �   v   x�Mα1���"%Y�>c�M�����U�8� ��������>+{��"�j4�8j]�ތ0����6���/+�����,2a��LhI��[F��rʫ��s0y      �   \   x�e̱�0��{
&@��D0 [�D�"I����tݓN�f�W�6z}�ݿ��Ia%�:&l5`r4�S@s̐[��Z >�A�����1       �      x�3�tL.�,��2���K�0c���� ^��      �   �  x��T�N�@=g�b?�B؆�!)j譗��	��;fmG���C�'����N\7jo^��7o��L4�FӜ<�9��qV����x�b'�k�s�e&ţ���x�W��썯]�6'��j
���wͫ�w8RnNquO z.��Zv7v\�C�����!p�TJn�ƅ�*[PQR [:�Ń�ӿ_��%��9��^UL���(~Ѹ�����j�ܤz �UM h罆k.<U,&���pJ�y�K*ŇT�+�}`4lr �r �Si8���y9&:9��B�9*0��y�(��jřh���>����R�@��b��J${<C��BϚ�3�hh����]b�����#{�j�V��O��Г�޾��+I���Pp<�zP����/>�Xq��Z�=�weh���	*VsJ�����+mӘ`4���6���H�~�Ҵ5�Ͼ�oZ6H_Z�&>�@�O��|����cı�y{�Bk#M�!�j@#m��<�#bY�K0���o��n��R
K���A��X��k͹k��
e⳽�Xh��h����{��2�ll~�I��	��NQ~��[�T���Cc>-��e��`g.��{0�5g��䯈��7��J3n��ze��L�Nۜ�fK��rYk2���%��/Z�I�$�U�ͷ#c�o7e�      �   �  x�m�MR�0���)�B&q��	;�`���<�J��g��n�8E.6�x2LM�qɒ���[^�͕�c�#g�Sz#��(i��S�l�=�:�Ac��x�s�\?�z�N>��(m�����<ޛf�,/櫋�o��l����λ��HRf� �;	Y�j�04�\�i�$*�9j����[ؿ'����n��!�?�_5NV3'�@��(�����n4tZ镒�����T��l���x�AYBR$GA�Kֈ�+G�Z�9�Cz��������ܨWmm_�D�w�:po�:�״[�V+�����g�V�[����"�p���:�=r������,[+����_��%�c�h��
{,K���*��n�9r�;��V���sy��$��S�+�m�N;��jB��O��x`�bs�ʨ�م�9���5=4Q[Az�n�g�е�.���	W�E W�(%��;��w���Ș�� t�����U�l]�#lw� g\g���7�`1�      �      x������ � �      �      x������ � �      �   J   x�3�4�ru600�420260S�f�P�9�ih`�gj�i�g`������T�ZT������Z�i����� J��      �      x������ � �      �   i   x�=˽
�0�YzI�i�t�T�d1d1��8y�S�[���W`�_e�āT1��=���Ӄ8G�N��UZ���2q&aL~�=�bW9�7�?=�]��}B�|h/      �   )   x�3�tM�L�L���2��/*J�2�t��/,M����� �e	      �      x������ � �      �   �   x�M��
�0E盯�T���:���<̃�2ԯ�Ţ����h��{���d���[��
Uj������E	3�2��ax򄳷��4a���z���Z����[~�%��Y<��c
^^"M3��M�Z�N��(1M      �   +   x�3�4A#c]3]K�D��P���ˈ�����qqq 3�	�      �   �  x��TKn�0]S��Cß��� P$�Q�]u3�	��D���Eo�d�]��X���F�Z	 ��f���=a�x��	m��������J
`��|���c�cX���S����������\p�N�E.u�\��.��O�C��
����v��THR+�ιdw��`���//!3�c߻�AșQfƘ�ڵ��'>���B��_*]����0��|��m�z:"/��43�b���c� ��r��Xךյ�J�#A*J���ʲ��c��9�/�p���B��k���l��Ίtn-�^�>ű�" �jc�R��X���m_�v}�G�=r%j=�~�{Y�E������,bȉP��
I���Xj�x+�0�4c�,#O�`O��������%��cN�	+�a�(�)w�,�2��ʛ�����w�?�����rƞS��;�>�mi����Y�����'�.1Ek$de�b5�/h��Q�ϯW�����8���1�v�v㶘���;0 |E=1l��:M�ʛ�� T��#f�172GC<W~BO�F��Y����:4n��8JV7[8��x������Y���������<�>P�#ne�U�ɛn3p7�/���\�z�@ЦU�	vuv��!e+�G�pE�Y�Oor�����$،5�	S��*�O#X�,A�����	'w�|L��Ь�� [|_E�m\��      �      x�34�44000�445�47����� %�0      �   5   x�3�4�4�t��".#0�	�3�< ۘ��3��`\3(Ə���� �c�      �      x������ � �      �      x������ � �      �   8   x�3�t*�I�O�2�H,.�/Rp�I�M��2���,�*�2��L�M-����� e��      �   H   x�3�4C##c]3]NNC=S�xpf�B~RqjQYbrf~^j1�D=B�%P�����V�1z\\\ X�c      �   )   x�3�K��LIL��2�JM�H���9�Js@�=... �
�      �   8   x�3�H�K�L�+I�2�tN�KN�IL��2�t�+�L8=��srRK�b���� �$�      �      x������ � �      �   ~   x�E�;1��9�!�EDMca+2��+;�pz�m93Oo�
u��U;��wt��Cz��<�����C?���ݴ;v�S��,*1���
{�b�M�q�C�l.��.��M~�I�]�; ��F4f      �   2   x�3�N-*�L��WHIUpL����,.)J
�)8��䤖�s��qqq JuR      �      x������ � �      �   0   x�3�4A#cS3sKδĤ�̪��|����������\�=... ���      �   "   x�3�4C#SNcN#N i�i����� C�"      �   $   x�3�4�4202�50�54�4440�35������ B�u      �       x�3�H-,M���2�t/J�KI����� X`      �   4   x�3�JMN,MIL���K-�2�t�),��I-Rp,JM,Vp��-I��qqq jO�      �   '   x�3�t���2�tN,�KUp�()J��J-�L����� �t�      �   �   x�=�K
AD�ݧ�	�� �(����l����H���nܾ�G��wB��8�.=�ɪb$a��^�b��&p�Տ�@�&��ڍ�(��'�̑�'���2q�EJ7rD��ݶƽ�6�^�p�G;��ޘV��/Y7�      �      x�3�H-*��2�tO,������ 7��      �   !   x�3���I-��2�t��I,�U�b���� e0�      �   "   x�3��s	r��2��
�t�tv����� Q��      �   1   x�3�t��K�������2�J-�LI�K�L��2�,��+I����� \      �      x���͒�8�.�>���Y����*uuUK%�����fcTd%�D�#2tojwa��wы���[������P��p2��Ǡ��߿=���,���o������ǠҿKw�w��w؋w��w��w�w��_��~3o�ߠ.ݠ/�`.�`/��.��/�.�/�0^�A]�Iu�'ե�T�zR]�Iu�'ե�T�zR]�Iu�'���4eߝ_�y;m�ߢ.ߢ/�b.�b/��.��/�.�bK���8�w��;��;��;��;��;��;��;��;�;\鱇is��,��P���0��p�����/ݡ.���ԧ>�ˋ���v:l���s�}�s�{�w���p��x����-�r�˽�.���ػ���n7�ńP��[��R�t�|�g�������?ۧvO���9<�s|���ɟ�ӽ���5�t��'{m�#��)�����|/�<p����u�����w���.�]w��we�������t�G������������������;��>U�����/�Z�"���~�G�ԏ��ݷ,��O�������.��/�n.�n/��.��/�.�/�>>�{�9^MW�����t}�&�=7���|�M�{nr�s����������;nR����{z\}G��:�����0l�ߣ����������|{v:��ۿ�'5O�j���=��������_ǧ~UO�UQ&^-���YB^4��~�~7~�~w~�~~�O�^D����a{u����3�"��m��n3�s[�_/i�|:��"�?}��x��pGZ�N�eZU��'~�O�l��Y��|:�{5]��'~�O�l���>��{�g������S?���i�ӊ ��_����'�O����?�kx�����S��'�J=�W�ɾRO�U�:�O�������h���y�&�=7���~�M�{n��sS������4~�M�;z�������*b�?�6O�l����aN����."�S����'/b�/��a���oP�nЗn0�n�Oސ}���z/n���t�<�`���9ژX�?�gZ��hn�����_�k/ �kQ40�Ѐ�~�vG.��Ft#�F�"�Z�$��c����gj�<*:Yq���8�{���!�[�hЂ�-�R��$�w�c����c4n@+�[��a�O�JU���]�vz0w}���ĥm�v��w�ȕ�^�ӴKZ? �����FZ}%�¯����|� Mh���6�0�J�6>O�4v���@�H�#_	�{=}��v�DRƕz*��[F�#[8��ʹ�z1���n:s%���($t�ŀ(����ݼ_�ۻ���i���1r�F+N����~�����j�k5w�O�6z������K�]C,'��6#j��{��g�`���Ij70*����H��pz�zsɂ��$�o_�m��F{
�����_��Cn������D�@���	hU|~��$H��n"��T*TU��~s�mEB�Zw��X�0��Ւ�@P��Y;4��y#*J�{�n�����8�ǹ�᩺U�ZR�	5w;"�km?~x �Ғ����z;R?P��=�}��Em��/0գ���<PSy--�n�Uo��f�R�:N<��c	[�[��]�S��yN`N7��g��md�'VqLt�*
P��p�q�3]�ߜ��'����2#�ʠF~��4�o&���Y=�'[cPY���|��r�q}����F������ÜT+� :���
�=�)���ۜPƊ�Z�_,�Ȼ��~��F���b�s0ÊF����Ӽm�,���%�{3�M���$�t���"Q�	���<��ę�&Z�qh/�Y���GH�[zܡ=�;QA���"�}0�������l=Z5xd�iG�5u7�_l����r�5>^b�Y����w_��\�1���D���$"5~�:&�4(H{N~ū��t]�M@�F�c�D��MLx9����zY���:2X!�*L"�S��Te>@�af�^Y~�n'fz;Ha�'��4�u�x��D�J�����O)'�AL��O�f�Mi2	P5ҭ! ��x��ʯ��� 2A¬wrB�Z�U"��eH���<3�54"E���TM�M]�����wk�q���}�`hO5�i�;4!P0ɇ_�9��rp��i.��*��͆�l+TS1���y�:)��ٜn�]+����Fͯ,��|$�db� �+F�1�Ki��a!4�lS�FJC"�����'����}L_�:5P���Vc�l�H��m{\�q5	琻�%��<B+����!)����:Ӫq+�|p��k	����ы�Z�$��[�c�@	qy8F�m�S�L�&M�$�M�S����b2vr+)]W��۷Fø��x�a&ٳU�
� /�/�%-��Á�G9Bf�Q�sA��{_��������$,6֬�̈i�W�!n6!4H5���;S���
-���f�9	@5"���.�� {���~�qi�j��tvֱ,�����䷪�7 �h��6���܂�iyb@���:a�1��K6 E���vM8{I��:��Gϯ#���ĐN�V!��"��PUL�7��"����I�CL���lz�'	6m=i1���K��!aM�j�>r*3�H��k"�������a۟D �t�|����H��"���?	M��MO"!���z)���p:,$��~��A��LP��ͅS���Q7��NG	1���4�ӧ�"A�h����	�b.�Ds/郭4M(I�y!��<x@�u'�.a��(z@L�$�/�z�$�'�EA�-�-V=M�������ħ�D�DTg�k���$���G5b�	;Vu\g,7�c���V��Hv/~	+ߟ�z`S�F�����۪�L=}��W��?3��p��CU]g�lk�)�c+<������B@M�!apd�I�xS'��������5VV���pD�d(<6��π��C�H���t6�rC�y�+cH5V��X��ы����|��A7�a������+���ii��B)���fh����ߧrPm�9�$=�$�'�S���?z����yF��f���4?�����m�l���z{�l��!a�x�F�t��ޟ6Y,E��xq`��j7�n�����;�S�#�s�=�|Y�����V��t6Z��o�ܷ2`N�V��:۬��'c+ᢈ0���Q����|��ł\@�H��;j�*S)i�[�d�p��U��$	�a�}O__e��X`�@���jE�ي��N�9�
 �ژ���n uu݃�?5� O3N���s�����p���6_m�$�I"���7��n\��F��SG�������������-���e����<k��h�20�P�!��;�-$�l�i��U*/���ua^L{�%�ȎH���ivx�"�{��]6�&���Eu��{�$ED�J0��Z6��٣l 	��0��R<\i���"UzH�$��?QM�IPH`!A8�1��ԧ�3Y8�&3.ʮ]t���.|�������G�ݠ��z��'����ٴ���kø�lG.^ϟN�Q��Q�}�o^_dw5E�0b~�镎(���x�^ځ�{9����)	��Tc�ͽ��E���# �C��4Ku^N��t$�U�֣�òL�Ȃ��xO��N�'�BD-����?NItb ~� KUz&SY/��kZ+t�P*D�Y���� �'�J7ُ����h��{�/�r�-�7˙+
���y�`�yn����Z���7{1 
�'���y�Y��+?�z�S��S���(�hB�e謆ʯu���8�86c�Д0��OY��MG5疎p�gcp�0��6�Y�U�ލ��5U!��n�o�z�U�~�Xg��Q����L�E{O��T`��.ւa�5���&���o�~^��G�Z7ߍPi�h�ʞ������2�S ��尐5���I��я�h�iN�k�3p/PkG��?��yl���.TMt͡��/O��T�4_��g*�Q�bS�$�Շw�c��7��s�Ӧy��2�"�(��o�;�|�p���L����Y��`�Gx��X`l��hՖ ć���o0�2�h��Vru��C=*���߄���?}���M��{rs=�b	L����:�փu�ڴ��h�    ��B6�qm��Nu�4N�yhhYW�U���EOX��k�;�.m+����Bd��g���fW�/pB�I����'RNjۏ�I)+ym"QXW%��1e��{s�SEưw�*�t!@��o�[�0���,s��ɍ����+ɍP�t`�cd$q���]���m�J�Z�*�KP^Rg
�0�ƻ_�?��#�$�����x�}@��]�-t��7-D=2�m�g��`��7#�Dg<��^��o��<����;�_� R��E�0y"�j%M����,��Bk�(a4a�T����\����Ǆ�t� )�ltN�R�
����qT����h\���A�-���ݴ+N�\�|
#mzf �뮣Ҽ��������^�4٩'@;���֡1JZ�M��w�D��D5QB���P1=ԽpL����a��e;��Z���Ey�?���,B9����3ՂJ�v:L��Y@��/�A|Lv�4Ľ%7s1�Ђ�w/ѴB%MqI��L� +Qρ�Ic܏���e:\���������C�Ҿu��-�X�4Zf���|���7�9Mū���5i`�B@N3�B���V9գ�x��Jt��NY@+�g��@ߤPZg�UOzd>�w!�-Ď�1��>?M�h�nJ�>Q�l��?5�F��*jJy�b9頛��0-�zhW"ZB��؝�R�4`9�?+E�lY(\[�l��N0 ;��q=:��6ʤ�(�:�\����-�D\
Vs��c�s�@��"t�j��>U5W�uA�F�ԇ�o^�p����ƣ�xG���  j���P��
�B� 2�6�Y��֔㥑�p�Β<}$Q�ʡ�O3B��F����i�=���O�~�Tl����f��5�6Rڋw�g*7��b۟�E�,�3��^��_/������8xV�L���M����!1[��\����R����������}�Ʃ
�S6D�yN��ڹ�
o�V#$4�B��z��\q�9��zJ��?�:R��Y�g�g6��������Z2� �g65F����Cs��_��{G���)�d8Z=�-ďPǤ�O��{KXAPPz�@2�v�w�Mz�V�rd5k6A7#�
��q?m�1�m�]`u ������$�h���cb�������2��DAx��i`�'��æ�<�(n�ͪ����2ףBd�W�3Q��YST�~礛<��{���v ����9���!�Zv
�Ĝtn䨎�@g
�Ԏgz���{�ݱw@�~\�$�o���`�J�@�����a{�"9��������3R�Ί)���J:o2j�*��EE+pa3�ׯ����&�Q*`�a)�slV�z�L��~��m��kB��y%,�*4�D�彝�ىPJ�����������z�H ~ c�ϧ���
��:5M��<>J�WK���&/�*�},�%V���V��B"pd����EIC���,��r�˧�^yu�Y���z�hIJ��� =l��E����[�T	��1�����n�N4{y�pl˕&��x67�#Jt�JĆ�ʌH�O�Ѝ\��C	T����o� ���yIm�rǼ9�%���Qb��û���<��Z��qb��ķ��J9'�' դ&�QT���Z�_ӌ=��	*ډ�9�m�)I�}����c#;�Th�������´H�;hC7-m���a���M
���i،��u��^���t�;=�T^���$"�3��/�vj����D&�C�2e!;��>�HV������tɷ��,aG}
�Yh�& L�Hah��BF��{�=H.�5�nl+�MY��uO2�'����E9~�܆k��LYώ6H�I:p1jV�I�6l[�eʊv��*�0#�I��GMw_R�.��fGo��Ʉ  �&R/��(��m���ª�^T�'�-���ʔ�h�C���U� �M�A�G��5O6�JXa�ɩ��ZLY�۵s�(.�p��a��t�:t��3u*�j6�4�G�Ł�î��B$n'	���1ȯ�������Q+R"HD�Ip�M|���"Z9�ʂ��i�.��oI���iL����⎔��v���GW�R��1�m�H*o%�������.Y�e�$[�t�%����.��,NԊDNR��v��K�������Ы����D��_�Ä�b�g��ͪ�o��20$�[��Q@<eWm��,�J=d��?�֕�W���g�P���tU�Ucۦ����d+G�_�Ժ��Ю�Pl�a�������p���a�;��,�@�BSHŮ�CL�Q��-�$D�QW"��&��,�F�#��e���b���f~Z�_�W���4~���*�B���]eV$���C~@X;LH���eʲ�����MY�B��k�)�*��¥�9�\!��1B<I/`@ LG�s��ǻy�|����ô_�q���Q��Z��$��O��'�J���H`9��)�$�#�)/ePk�!G9�V��nJ� 1�>�<�d�b��.R�o�qN�}WC�h4��d�-}�)�ݹ��Њ -K�WP-�)��E���:51k�l����`�5���Vl�$rl�9�9����`�@`ɤ��ʩ�5r?N�-*�g��`J��ا&䰾�"RRE �Ǳdԩ�pw�����U:�z?eOY��^�QF��DZ�aI�^�6�m=��*���ƀlϰ���bE�1�w��v�Z�G VE�s�&�PF�gW,<Uz�LXH�F
z�Iг�$['����W)o�kl���$���/@,�n�<8�_A��9�V(�������\�c���k!l.^г�1�u�5�M�P�F������C�ZT1R����`P\O��ʫ�4�<'ٳ{v=AZҌ;�SX�V�\Eo&�eD+����քҶ�4�-�9�u��u�ɞ���d�Q��!���~EӉ��P�ݲ>���IX��Ȕ5�Re��L� �D���Cb����Y��7�t0�ô��hP���)��1��P�!�z5����ͦ*O��E��K$�A����7� �3l���z���<�#���z21؈�r���ĕ��bE�CC�r�q�l��Y$l�#+F|���Z�� ��)�[�C�1ʂ�>o�󡃡V|���a��-�`M2՝�9�x!5Rn���$ӳ]��X�m�(Z<��a�_)�$M�V(���5�ߴ�R2\��B�)���3O��	�-D$!��Ș������f�(��u^O����i�i��z+ה�Rq�㤣�U�z��a�t�$% �/��T���C[��w0Ȭ�R�`��C�o�@���ql�:i�H�إ@$�I�!��:���"� �Jv�h�tmN�ϩ��u��A�A�E�R���i��$�yi��5\�t�$�1 �9k���N3[,Ш�K����3R@<����A4H	�[��|1=ܶ#۳����u#�أQu{8,WImH����O9ݝP�(�KU"l1L���l��)V�ֱy�Rt�	l�Y�[�?�P[ p>��k`0�@�~"��r������:kf_m1J�ɥ�ئ[K�)uy��7Z��[1&�9�m1@�� %��IU����i�(j���rjK�U��D��HC�=J���ӔHW�u[����e��~$�!�X��[D�m�B�C�"&@Fz8j�TA��$�hc�$�T��n��]S�mI��UwK~k ��j��\L�����hҲ2Xo�~;'z@`'�+�׳ ��t�#��*��eAx+��f�0�!U��Y_|?#���R��JG9c��aKv�sm~Hj����n���a�gIv�D�C�r�./���b��7>wY5��2�Df=`(�Z7�n��5��	&����Q�����9�߃  ���)�@N���s��J(�2�1�Z��/�2�.������Pā�h����ˡ�kڼ�܏��yzh�ܤ�
C��E�q!�:�S�^� ��NlI ��DJ��rPX��(���<��@�b@���W?���Es���-��g
a��3� ���4�RK�����%�`s��\W�߳��~�o�M���F|}RrG�j3������i����a��=���\3b    ��������kHי+7����(���x�4_��i v�!)T�D:��j)B$��({-�m�M�ۢXl�12��k��l���!��-���&=#M����D+�) A�Ǯm����
�L�:힅 ��t�P���ԉ���e�Ň����X���jo��۠���� 턗������D��Ic��e�w�N�㴉Q|C?��M�]جHP�\X���37@N1��Ԏ��E�E/�/v��@�f��r���!#�����'	�&��lHw�%o�h���Y���"�r7�aԨ)��U^2V��ج�:�c*)R�I5$5HkD�N-�>N�vt�L@Tdm�v��m�Z�ͽds@8�͓�uN��J+Bm��1��TI���7�����F���T�����B:d�X�"����E�项��	o(�hHG����E���ql�om�s,���Q�@�[#^��a�������Dq�am�Q��7E��h���:ab�hV���+%��f�%o�.(h�VN�3��/G��lKq�� ��/_������u�AV��l��%� �ch���Ru������9¿��.���qi��:�t3�|�Ш��};p�3�$��
�E�N[9ч�;3-e�,�%O�l"�,*����G�j(-3 ��x�	�����u30{7o�lc��x��I�т�z��r��7B8��eԭ���&�q�����_��X-�Pf9����e�N�\c(��cP<rҽ���`��L�+iWF��?�N�����L`�x2(�f'�-(�W�r�=[�������i�1��M7T�xk�q렪����v��r4�GҦ�~�Hjb-4�X;�k��;i� ��C=Z������\'-ht=*��7V��gXUsҎ��t?���'Jj���x���ڶB!"4=(�Q�A�����Yc����%�Βj�@�}O�����`ŗQ�4\�v~-pP�d+#r��, c����7U����oC>:a9����e������k%�F���%�{I/�Ql«�>܁dxI��N5���]���_�! ~��g��<FB
	�������H.�@�����h%���0����y 06��d,��!f���� �&�� �5��Ym�ֵF��M$)����y}��c��ᙲ���D���k>�+��KE���z��܎PG��A��@���}�����~$��$�V��>��@�b7?����� �G1�ZA*��SfS�K28�ڪEڜīszd�< �k��`��B[����UJ��}����wJP��4Q�c��ע0 W���c"����#�&oIt}p#wDg<�&q�d*	b�/��McoFyص#`����
�uQJ%��aFa�/:�G�!U�ɇ�v[�MB:/���;�V��)=J�B��$�8r �r���QD���T�o"�m���j-�Jt�q�s(*�~� ��؟pB�.M�E���[C/(�ўr��0V��Z��
#���t+,"*{�ҷ����[e���4��('�cƁ�!pշ�	u3'a�0ě-��oak��y�w+�mY�֙㊯�U��l&�em����6���*BU��h���k�9?LI�:�Og�`�,8��V�~W���Ed��\8e�����B���E���WD�KN蕏��}+�rŝت~(�2+H�D��uũ�h��JD���t[��K�U�i{����W?S6����y�:��)�!W܋�������u�z�yK�I¨~�g���S�/ރЬ��b�hI~^P^�9 
�>���^y��?I>�"�VZ�'']�jI�^%�C+�k��թ�T�V���Y�%�.Z{������?�-����� '	�!���1 ��qV���w�K{��c� O����Ϻ��.�����(��yY\��L	Hj�-{4�h#�9VQB�X`�FE���9,�D�"w2Z<����k���2�+��|ɺ�
�
�R+�˱�|(�%�[�kGn���{>��Y�1u'M�f��vJ)�#����4�[�q/���3F`����*I=eCH���j�-Є_��M�$hX��;��ܝ�����G9&�^煈�Д���Q��W;Z�Kvx��\
	@sNW����M�-JLi�i�FȬ��t?Pp�1r&�N-�+�`��ƛe�E�9�1vCi5��:�:�� Y����Bq+BQ��I�wp��!f��fD�t@n\�%)�"K��&��R�I �ٚ|���Rv��Z�8��(���i�z��D��B<�qrI�֚��ԙ��g�a��Vg���(Ww궶����Bg�+���&���p�4+e�v�m��l2�����,?��􉬪 �_E`E�1�r�A�!sȃ�t�Ȃ/ۖ�����6��~��Q�~��N9�{-��2������+T6r��tg�1�[�������~�m�׏N-�@�A4fx }����b pgcD#kA^"��~�R���������7���v�|F�Q�/�Z�Q�F�~� �ڟ]������j��7�r�6G��g�$9���js�K�|����?��2RW[�GI��TqD�4�IX:�����@�7�������
�H���J��_	/G�H	���myA�j'1͙�Б3�A<u���^�$v�����-�z�z�`���-�\Q���T�'��r#�T��$��{1�i"+�iJ���i���,kP���$j$�N����3y=�����T3�?lZ�ɷ�<�ri2����		k穃ՀxD͞^"% l���r�f3s��(��*tX�w�ws+�?klFضBG�iS��.���}�A����%������b�v�^-�5wөZk
�x�~�v�p�|�4�rT,�F�X��<�==�Z`&�^���+:t5%��k�M����ɟ��[G��u�CĤ���C��I��]Ľ;V^{��Hb�f���Xc�3m�Q�H�$WC:i��+�ٜ�z� K���5Zַ�u�m��(:����(q"g,~=*�VxaWJT쌐ˮ#|�VV�8��;#�Z�K���������)��C�}&�5��7������tp�?�[�_(�ʹK�zF��5�wo�<LWt�#��J���Q���i۠�q���2)B�o�d�a������`�\zp����b>G�N��+��>>�{����ykj!nA�lN�K�	 ��5��W��(��u�e�2 �4�ɔ�D{4�!mɗ��u�06���D�o��W��g�q�3
qAy�B+L}O;\/��~��~�ba�K��Ѹ2���;��)������!���;��B��r��?�'��y�����X�� �C�a��!@�1�u��wIש��)�I��'pR����B�ꑚ��"�\�B�+���6�Oem'c����>��k%6=MtS�&[ �˛ƈ�%�_.��Eb��-��-c$��Ԝ����"4�TM���ŬL���A{�gP�L�����y�
y�m�n����>.�&#z���D��.Il�\.;�%%/��c$�p��e�f�rg/@���x$Z��n�s��ǫґ�3,W2Vf��ӫ�?u�34Cp���(����R�)�в� {��A��$gH
��n�c�%�TA/zkݝR+���fn%�J��e�9U�ڮz��2:�����S�<�J��{/��O��c*��0�]��r�S]K�쳣���B���A�8�Jk|����Ϗ�}
���;��	�EF>�f{_W�W�
b��T��gG���)̸����o[̨��u���>�	��HZ��%���{�D�q������6<�m3���\��zO{�C�.�^�h�|�������͗�P���� 
7Pj֋fG���������%�٦؈hQylM$�)��/�r��+�2R(��?O���@�~w�֪��?�ʏ�4�ixo�������y�RY5���}��1Q�}��	�a#/p��d�!ĴqDݬ�H��
��y��@+�<�S��|_s!2��q�wPJM�a|�����R8�����z	C[�Y�� �    �m�Y(��Nk�oZʇ�4��8�o?e[6 �&V��Ji�����l���%��H�g�����eXb�/�O������/�3^��s�\��aɖH?���?v�%y�N),�H-i�ђ$5���O��q�y=�s�tT��X7��*-n���XH�"Һ&ķZ�I/޷!�خ7}R3A��HK4�ӑ�#gio��WƑ�\�rO{����	4o8��v�@�T��h;���~���S�'��UHozHښ�����v�H͹�iY�P���C!,.�+���=?���}+�i�T�AY��x)e���`��⫑Q�g�{�B"T{�
�-�g��N����uݒ �Ci� ꁀYf����J5�	���)G�b�bO�S�=Jd��l�V�[���'9��#J��h=�nt@h�ͅW	:֣�1�*!OKI�ý)x�1l���Iy�e�gG�$*d�(8��=O��<�� ������E��Q%��h��
Kԝis:`	�bi�S6!�-�t�ؕ��3�@C���3b�)�x2�ëys���g���569E�F�?`�$�����Q��
?,�ۜ� �lm�J40�a�d|����`���f���t;}��q,��*�sEGv۲�J.���$�i�&ד5������1�T�
�qz��\G�h���T% !AB\7�p}����~��m�2�Y�mf^��+�F��9�uّO���&�j��Fg��z\��v��"����� ��:��۲���;�r"��[l�� ��~{���Ĳ��^�dC�+y9�؇ӆ$�UH�@$ *~�Y3�c+�dA�ܳ��V��z��s�l+��Jq�Xz� ��wH���w	��"͔�����9�A�ۻ9a�Q@0W��x~"��A�I`�C�x��eK�������ZZ�W���a^����q�-�oPY���Z3�(/hw�U1����*�0�6y{�
��(^��^t�D�=�a�Bډ00b#&�_���՟�[Qz�]jg��6��~C�U��5|�r�^��5�O�A�^9X�q_
8�G�����+�T�
�s��dRy'Z�bO������3G��Б��S>-dQ$D �&�������th{���H>�z:�B�M?eC���	y&xL�>⧉<h別lH]�(R0Ob��9���A��)E�_�D��!�5EL�K˺ ��>�@K���X��]���UR���Q��Gu�w�ǲ�$͂�X$�����X����ۤ}d�� �ElڋE�� ��/!��$��D�h��yWݢ�xw�l��nO�v�,� ��!�V �����e�����������5�SzWV ���]]9&5j=�Z|D���٤8�zZ�>�7{�i?mj����[P�������Z�<���ָ �)^����"X��C� �E<Kt�����/��� &@rɄ|?v�����m��⽓�r\��w�j9����R�*��Է,�+��c�Ѐ!N��J�Zm"�c����f��ϐ,Zk)��6P�1۩1y{�V¤�kg{��'+��ix���_s�i���%iFܶ-T��U+����SbsK�O��3�k�?'�RW��rS/77�&	ݭdc���o�"�l�f���;r��/g�)���]�e��ٛ�n���q��#�D�5�\�G��q >ִ���Z#W\v_��y:0В������6��j�h�v�H2!J��Q��cl�T��L��YE� vRL�󱩬W+_ӮF���3:�h2��b�W�%����xK_2�Gnb�n�kGݥ9s�MR�����ޠ�F�V�+Ֆ���y{�hs-;�n3���#N�fWb���t�����9���a���%���u������W��;} /�u+x��(�W��Y2�]=�t��~�e��Kl	�+��ӏ�����n��b.,�&G�����b�8��,[�t��,�	ҫ*�{��^�@�(�>��f`���pJ,�z�g@F���-hҔ�rN�@���+48�Y�篱���*_7��ZL&5�S��)o�XK�����¬���~��ՙB\���X����v���n[���ۜ{+��V�Q;���������٥�jq��B'����R���BYY�*(�2Y�65G� ��U�0�����j�����x�$�n!s{�T���~�PP�6�%�f|wG�~�N����,ݣ�rjǎ�����W�SmF�P#7���˦YY�x�Q�yy=P�Z����W�I�~�G�C���ԑ�Ox�v{�M� �����5�U)u
�pA�m�W��r亿n���l�`��;��E9��=���@ڎ���ZU,y*y������v�����@��%�R`-��OB�?�>��o���P��r�#=�Z��X�&W{j'C�k���Ίv�h���#mB��/�x���L��b��L6e�7��"��5Rˀ����[%��֊�|-W�V�����?Pb�t�H�>[c��S ��"ՠ#6�h�X�JZݻyj�-u�� G,�$�b�e¹g	jc��c�ɵ^�)����$rʓ���D�ji�eN�q��۲+�,AH�.�M��9Q@i�ݲ�� �E_�D���)D�C�B��.D���mz." ��y?R��?���0P�MM�ĐX�,��:��6^y�ь5�c�L�`�x|�����pw�}^�qb�|۩)�ȗ��CJ(ف�!�L$�=�b�x�-�J�~���2�{����(��ms4CA������������T�w����ub+b	i�U���a�߶�wt�3�:|�eJ>튪���KX�&����f��Ӗ� �p�Ս������0�U�!�����j�r5�j����p�(�k�j֦X�;J�Ǽ�5y��Q����X;�����	*i�ɭ�F5����J�rĊ�qT���!%�K����� M�U�C-@WƓj-�	%� 5rFe� �s]���v���\`���r�Ơfؿ%��t��i��sôhF�w��7Z~:�r^�_$������[��X<ݵ�C=��k�Q�-�j�|>�Z󓬘��r࿟�7�m+H^Ew�8pw�1�p��6W��O��D�h�7�<���9��>j�x>�xbXrm*ԕ�$����F^2�$�k�i,�:�����C
;jv��A�Wg�5�5C�aZ�=oՋ�M�� ŝ�d������3 ��qr�$�h���jY4�srU�j+�c�[��2둷Ε��E��o8N���=���Y�nc��k��z����[�=>�����f8ɥGz��$á.�����i`��T�E���0���<1��*��\M�0�yp����a]B�\6&��|����|� 4b���s�0����n&gI+%�h��b������u���e@��Q�w�B]f�I:�d׀ �X�#�8�&�l�&ӵ�k�)‹1�o��w:p	9�*^�H+WA("O�����*���D��qO��7y2xq�8���!r�a��6�y*R��Vj�Lz>ȁk�������3�G1mBs�����i	�6-�d� z �$���-�<  Ԉ�8I�����#��V�-���TN�����'����l�/f��F���1h��i�� ��Z��sllz�[N{	!  �d�*�zC��ͷ�Ìrl�Ili�9W}̋d�}��~S�L��+� �����&۟�p�d��NH�0�ż��g�jehb��8V�i}k��r���'� y����ZS��J��嶺_�ç��?A
� wmF e�F�6���(��P�� tlK%cq�V���P-8�� ���&�n5LP�p9"5Y"�����?�Z�hao9,��Z̚��c��6fI����Ա����.�_�q"]P�0#�Emּ�͛���"�\�Yg��Ki,��ڿI{Hjh&��	��~C��V��N��^B��n#ږ�<慵MJ��d�ol	Fj��7C)�#B�>�a5�F�Դ=���i���R�6�J;�k��RR�J����3,�2�%��F�V�V�"Ӿ�c�v�	�6%M� y�}��?��BC��-ǯ�*k�hBSUD^�4Y  9��    �כ<��-*a|�_�%�d�$!�N��UI���f��0n�Vs3J�-U��[HVTl�L3��?H�3��(�ot�l��ﳵ<�lS2�����ӱ�5 �������iA�T;���v7�dB_yKi��Wy)T9*޸^No?�M�פ� ^��'v#�{KrAR"�0��;+����vñ7�厘r+��t���^HU��=/�����	��~6��c�Q�~*s ȃ�QZ��Q�y����a]��~O��A�M'ց�t'`�Ib�t�e�pG��̉-�:���]Ȗ=9*6޾�y�Q�4�l�}`S
u?=�ܟyf����"�DC��ND�ˑ�\���4�u��+��8o�'N�{�B�
mq���c]��E���<	����y}����[�n�0�p,z�1�[�1�ͺ��H)�P�"-!Inl��=f}����M��m�3�����lݛ���$��0��q�Qܱ�QS��eg��İV(t�l�c��um��Bi��6����D�}+�rr��'���+tM"w]��9]r9*<c�\VK<��u�˻�bM�Npg��
y_/��x��fmu�cN�������\��lh��Dcg�Q��kƜ�k�����?�L}�x��&���) !�Z�"��b��YW�G�$��R��sr��z�[ws=ND��ӃgU+}~�l�ǚ� r�ZTI�������
��D�m2f��9z& ,6�J�݂�GD�\ge���%��Ky�J�B����J�g�I��{=�d22��
\�=�j���Jzd8�� ��5fw�
�kd-ya��&�)�P@+|���Q�!��-1��]+9O���Dr?�2�ߣe��9�Ӽ�@L�b���n�m��1��W��������89*��Y#B��ً�|��2Ntkl+D���[�=��;�HR�U�N4j�4�UfnA���DD߬��Œ���Ft��2P7_���g�?u[�3,K3��klјcvg�c�m˰�9�>"w���	c�rw-�t�Tg%�Ax��^"��5]��G��.5�|�� /M�-Zq�i��h~������5,p�s!)��k^�~��䀠ZBA�c>®'#%q=,���a��t:B�e�e0E���y������TW�%�s\@_�t �%�Q6�2R��J���z��G��{��D<�!t��,�{�}�x:���uV�80�y�S���c����j��x<�Z � A�'� sj��X��Yn�:�����c�Ȟ�r}�#�"�1J|� &d�ͩ�7��:%?*(nf��e�9���{G�d�Y?̛�)K+y�e�`�X���9%�*	DĖ.�!nb��;�����ʍG�|�5;�g.�_�		�8H�DAvv�)�#冦�Z!����DТ��|5]��6�k����K�+�%Tc��[�=�~�Q�VIq�B�r�Ħ,q�S�#�fI������k֣D�_���������'q �p����]}����K�W��Z�܁������Ȕ�@�w����q�yΊo���6E+� .���3�����g�"_J�Ml�4�x�~�<L��z�H�����l�?�%_��pMK� C��V��3n���2mNI���lr}� �)A��g��#�Y_�̃:Z�i~=U�l����w�e��a��9�y2��f��L�gs��q�^�JQܶTp6�Q�e��c�ذj`�_��{S�HB�G+����%�C����~�P��عG@}�v�g�ϱ�9%�S�!ͮ�0�sv�GOzy�[�R��0�#yt�����ɤ�/�$w�\vc8sU1C�F��ŋ�o�OkA������cPFnb�_x������_4kr����_ۀ�^@b����Ú���c+x�l-y�!�3��c��b5�K�B��fّ)�g �:v&S����� ���6�2�#Q��6֒�����J�]�oÚ��y�ω�������G�B����X�%����Z�j�(��Jm�sj���0�3�@����D�h:@XS���_�&��]�ҩ?C�j��(��&Vo�/��'!��`��2�;hM8Ҭ���"��}�Q��F^����Ӄ�yDvm�� 9�T��D�SC�1]%�^�_{�n���7�j�v�#$ǰ6�OzAu
!��k������(�#Nh���ԟh�F�҆���z�fi��#��\�i6���BN��>�*�
"� ib�!d�Vx�n����#�K��]�N�W���r:��i�M�$R�ҵL�Iu"�(!K��C����jk�M���.�� /�-h�������uŌ �)��F������j�g:V˱�'��K�m8n#�9� �Tz�x	}H�\�se"�]��K��������1Hbv���~n/p{�d��á��]WX���h�&ȭǾu֫n�� ��E���D@�@b	c��5|?���n)�ͯ9��7.[�f��ǧ.��3�m�6Ny] ޝ�"�wS�)+���s/N^35���SZ���t�G,|��D����Yu:E�M����sװ՚�X"z\�y�<FY6�NCb���LUF�+��H����t�L��ǡ���$[��:>0�J��&����9�+\�>�4�*�Ѭ�ir3��W��yk�����9}{�⹲���Z�!�q�����T[~nj5Q�M�1�$+��	L,($����WD)��ԟ4�<u�(:�fà�L������B@�s����nG�:BZ�Ԓe5#j� d4r��~D��(V9����� �8slv�5�O2M���?�����a 1-�c���w3�cP��$��<3��bSE-���͉�LA	I�Y~j0J������Es�C�;&��.Y�I�(=T9"��f A�����+�d�a�M�5b*�ґ�='}0�{���,F�:�S�s���a���?z���J��vޓg9�jU N|6j<�uSf7��=s�e��p绚=#ה2�!� A�x�4�}�j��\��x��_��/����r�<���##��[ �FE7�4і3�'ٝ`�ޤ0;�i�Nןȱ�o��bI��,����HI��c��P���逭�BnBL����Q�V�Θ��ŻZJ� 	�������P�F�QV�	]j� B�����J���L~�r�� I�\���5f�M�h�3s�������w���Ot�:�\ө�FLe/��Z��[�Ѳr���к�{�6�P����R�ݼ��w=I�t�2�+#d]�Es��sV�	����gκ���<���Dp�K�uz�aB�DS/H���}��i�\�9��q��M�i���X3�$���,gx9)(f�t 4��i�Y`b��h}����"�l�YdhaĚ{��߄�D�Q1���ℎ{�,�e�
��4��� ��a%L�p���K+�����j���E���P�IW(6��7�F0� ��sr�.�+b˿瀓'����A�%}7� ʮKK��11��G�W����S��
K�`�4F�ኲ�_/;J>V���H�I�֢{!�@=*l���wY�m2�������]y7%	k�e$��Դ�������η˗ӗ��I�Ap��S8�ؑ�e�c�[Z��4����鰯��$�~R-��h,�"���D��?�$t��V &�^7E,/ c*���e�oD$"i���Ѳ�U+x��ZVnjB^H&ċϩ��:�H,�j��\S�^N�~�b�|�&�:�����rV�c+�x1^Iˉ����l>~���[�#�m�hZ��J�d7�Z�u�ZD 1�r�����3�P9�K�}�sUj����zA�&��V ��UBA�R+����b�i�XW^�&Ġ?��}(�+턘�G8��:�v���$��,���W0�T����:�ߛ�I���v�
���ΰw>cv�����A4;�IKLj�	��4�ڕ*[y_n&��&�w{�uO�\A�'�0S�ҷ;i��vi��G���r�zN�(󍀛���r�T�n���\��&�:�oQ*D�t�����3�t�f�!lN�ۍ�I���]�=�k�Z�@��Q"6��a2�^(�N[2�����YD�e�Z���ٗś�ݷt�5�Nx    j�X"�-�/[<�>^�(!5���J'�-�u	���M�>?L��̧_i��>�J���m���*o� ��*�OTߟ>�O��s4������G �*�����C87N<���o'�e�&�����5��@�f�:��[�d��	�w�vVE�&Jd���c��H.�l�*n_V�B١�
�mcT�0u���e�K�I�Y2�6����ڗ�
�kq4J��J�W.3�%�����;Q��pV��B0*4qiRb/F%�&��G����,Hӈ�͙+��N��5�Jn��+�,�~}7��}A?�?���m�����lQ6�)��@�:1shG�[�3<[D`ٺ1���?OG�"���j��6��n8I,��&!�3rXZ"P�4�z����ϋȦ�N��"��f��Խ�
	�8��=3^�k����^���O�m��n��[P[��m���ɘ ��3`/�1�]Y�J%��������}�'}	c�'��n+!s��qg��9��m�/�a��G���U�Qr���Z?�5ކ,b�W0*�wu���K|�006Y7�\G=uM�KY��Q!��7�'j͵J�<�=58�\�^~i�X$��T��壉\у��M�:�}��\�U�HU^춉*�o�Ր��������Qd+����TF�]E�eԟN{�綌��� 8��,��	���Y^���f盼�Ӵ>��A�djv�ܒCK���]1�w�� ��wp���E�[��n�eh���XgA���
�ͫ?[y�ܫ�����
�X6��N`�5N6C�Z3Jq3��S^�_Jt���$Ip�Qwٵ87�~�#��@E����.G� PH��2K]�����J�" ,w�J��quG�\�̣%��;Af:�d�����ɭ�Jys �[��[)J�cQ{챟K��Z�9P�D]D�JI3�}`���ڐ���S�`b������ƾ�a�c?��+Z'�u1~��uS�I�T;�GVȊ������%�3C��4$�{���@�~�)�5�d�AU1�5�����-������E�ݦ���R,��F|us�Re N���N��G'�N�00�;~3�V�[<�y�O߼R(r����\J-kn�뿖zd��ިٞ���zw�x����@Y�SX�~&�I+���u�e��Dw�a�X���_B��/�W�_\���(;�Tf�1P��$�l�69�C��4�D���6Y�x��՜��,�p(��pP|#G:��j��>}q3;�K2WM�t�`!�m҈4�Κ$�;ǆ�By�}��0�*3�f�#hr�O�f����oK*�c�!��(�����Q3{~M}짒� O%�>(�c0r-�E��Mg��9%>�+�M���}fHt����V���V����fu� ���d!�t���O�ݼ�Oa�c�����BÛ���'�� G�I��xۑ�f#�>�s�8�j�y�UG6���f�ܭ]��D*#{��sA��Ą��J�����ccmq�78�'���a�߶B���9w�@9��f��7-������;#B�ƺ<:7�ut���M��u���#�P1���A�3m�KtO����;��Q,0�A���eS�Hj�$�TO+��G����T����a;�[3"e�%�+v�T�@����f���ϳ1NN��]����'r��q����*sE����u���Z�5����m�M�@@���@!wK�����H�Y���F������%�@�e�!p])���	��l�]�@%���>k���c�\̭���}*A-�[�0j�\�F9%����fw�D5~`���ڒc������}�����܏�ÿ����j�lrp�m�O�p6I��p�jh��f+]=b	���#,��e���t�����w�X��5���ޟ��%	��*�����c����bV�������&�+��x�z�	_�[����D]+�e=0�x�N����]"QT
,�o���@\c�(F=mD��ݧ��(thf�K���Z(�*�"�����0f�z��FI�Z�ӛ)�P��:�yiT�r��@�w�rg���SUgxZ���y�8�����5t_`=��)�b�t��5(J4�4`�� O9O4!BFYm��3���󞲣ւ�U���q�zgY�̺h]�!a�R%�i�S��L��ld��S��gY����c+�4�%Y��S:!A��s;���J��R��X�(ͺS@ݞh�UD���g��L)����J��|��#�X��e�)�o (N��[���=��?��wK+��@����.��ŗSR�9o��܂|s͈���_�ʦc�T�#�b"&���~=}�r� �>����FQ� hLbx�.��v������X�!u�0e2�i�Z���CV�*�ޞũ���y�)�PM��R\N
+�@�Z(�U&	�c��((+�4����&ɰ��H�q�}|��^p2O�b��>L��ms�A�m�,��OY_%���b��4��10*e�p���D����tJ�h&�U� b>t����o R�]�c1N`�a�2Hd����gu�r����CW��Xq�qJ�E�@<�y�ߧu��|	���>�I�0F�9�QN`��{%�3B���A���(�' �`.��4�1
�T\C;�e�.��B���9�2=Pj��~{���9J�D	��qu[����#/0DF���9�[�%�I�8�"P*J����'��)��A���t���?d,XP�wӥ_�q�U�#c��,�j����U������:�0;F�����4ߟZf#wa"ʝ��Yc�r�Ԭ�����O��y��vF���er���ˤ0u�#���q��쬫���ߗ��;�K:�Fc�a�)�J`��;��fdt�z��5���d:�����%Mj1=/��?�]a�L>5��c�Ϩ��򜹢xY�LB�؂62�~H�U�󼙷��3W`�T2� ����9p�`� <$�	��n:����D-_�ɮq����{��h@c�b��*69�T������������o�3	j��܊�Z��4���.=���4XI��Q���M��pVф�2�5�흾U���'7�W��P쿂�.�5��F k�^�#�����4W��q�&�U|��{�z�"��&�����y{8<����Ek�&1욘�l�k�|�ց������_���r�P��B��!�����0�m�2L���v�'bp�m�nь�@-Pt�G�߉2M�Jd�笩!i�՛���/���D�"�,=~T��=^��>]O���2���Nx������N�eD+a�o7�LMv�������_hQC+ʦx�C�-���1Ld뚖G�Hg�K��M��u=�q�B0V�Bħ�j!�&;jd;?,����<�t��g�)�&�i�&H))V���Flk0��W�~yȶ �4�F0��D��X����vb F�TZ�I=������\2'Tz���F�����%�6oc�����м���V�f��@��Qp��W����t�t���t��v5O#7"�gD� ����3z�
,���tł��5	J��Ño���M�Ep&���FX�� ؒD.�Ԉ���zD�k3��5��_���Z�S
�t)i�3��^x�)��H���܌(9��r3v�R�a+�ǏE�D=���n��,^�$��9�B�<{�k	���iK�1B�8� �d�N���#�8x�����K��D��� R�TW 0����:"�-�-�e� 9��5���(T�q������;�����D�w
=��a���5�Z��I�3���
�%����s���D��I,�0�>%���iJ��66f�7��4���;��?N��D�h���Y#y�26�cQ�c5�4<�g�e5!�aR-�E	B�/�6�Z�H�~!4!D�`�Q�ฑk=�����b�[�Ȳ�jkL6ج���n�P�6��)� ��s��tl�F��Ģy]�u�����=���#�"%i�h�?j���o�_AʠR|K/��I"���r)�K�1@�k%�$�Vp�}�Z�Û��d�K_�~�R���ғL�H���5ٚ)��SZ��~|D�d    ��	�W���=��4��lTz��I�}B����R�Ԁ�"����-Gd�HL�����<��X6� �Ca�ƈb������'�8�+Mx�7�:w|$�nn�C�����`�Ԓq͖O9�_-�"8Uo�&��zfx���;t=
� Ԕ�	�Ɛ�5m_�`�^H��0ق�7r���hx78+9��>�����:��U�1
�=͏���L�F��񢿢�uP=)���$C[<)@d�Q��f<79�@/�nH����D����0��&g��$�ݶ�[ �U/����Z�Q+e#H@؍�]����p��Cy�O���  V@P�dA��$��փV�j�A��^�L�Ga��P94�B���%��}��B��I�jm6|A�����k*�f[S���=�:mn�z��-�%tnAF���iN�.�� �VN�q�Yu�Z��'���D�N��6$L`\s�6"����ĩ/حU@����)�����58����	��+a��c76Y�V�o�,:��jWBQ+ u�}�|�l����dCHׁ�a\�i��o����xOK����!�ǖ���]W�*�d:�ٛ`w�ϕG#N6R��),n:\/Woa�r�b���/⓼l��+N�ɼ�"�_��42f��W4��D� [i9Z��lT�
Q�~����8�lJ<؍O"Q�ʣ�L����9�zv0/�Q4S�l5���7��
�Lxh�*;�|ա��ys��Y���S�5m��k]ż�q� ������;t|'����c���l/��(Ad��W����r}����xĒʏSƽH�k�w�.%,��Q-�����}���!��L�mx��(f.�Բ�p/fJ�=ټFNVNlk7��*9~ɳpi�"9Q���v��#d� �0;tO��Bނ���с�����N�V���T�6�����j~��^�j�G���D�0�Lц����%9n�ܵ�S�x��_XR��eR�+R����)6�d)z���Ӵɷ�ҋ�8᝷|���_fu�0
�j��* ��H�P�]s�WӞr
q��W���o^Q������Q�#z��]�ɻ�:y�&��(3�i��'j�����?CP�0�����]��-+4��p��A�`X�)7|��^&l���n�'�����*+�j�~!�̈́6�f���rB��53';��	�7^�v\c��8Z*�Ђ�V��؏�4!�XgP#6�O�x���}ٲ�k!�+���m�k�YôYj��ڰBEvxN��k5���;P��ޚT�	�挋_�Đ�d�������t��;�!Nu�66����(9���}�����?|���z���$���14���=n����v���д-B�a:�-{���*|�]iBӰ*be�����(G���@V;���* ݧ���V���?ME����*�X㨜�rR�:2zY$��p� &��"���sǞ��m�~���*��z���D���ȻDq��	#m:���kQ�Q�(!��P��K�����_�2� ��Y�E����8�qj��Ȫ�4�����JC��Z����Cu�Zw���ƅ�I����l��G�S	��?U��x�z7Si)���*O 䇦@U��a�8���
DJ�QGKdΟ����~/h���s��Ns�/��:\y�t+�(#]u���lJ��NS��9���g�6�����z�Ns-'75�3��z�d���ߜ���	���Y0��~8������n�~8�߱��p	.�\;��	m�L��3l��"(T�$�	���a���d<ۉ�o�A��7���2v��j�ީ�w�
��~I�J�ݠ�ß¼'Exf��sF��Ԏ�3(]�t�X�P� �����{�1F��������_E�O<�-��U�M�)v^���Z������S��g�Q�������)P:7��u�BMw ��\�4�nu�n\v��;?�aƷ��</�u�1��͕%���J=f���Ν�p�+�z�⃼2��Tk���a_�R�Dy&����Z�4��LV̐3#n��?H׸)
@Q|?O�Õ'6��	��3�;S��0����<���W5��Ph[p�Q*��s?��G
x+�J/�$�/�q�!�J��`L�g�ǹ�B�?a�9���nS�����*ɵV^V�Aa����Ŋg� ��B��6U��^#[� �d�
т#~h{ަJ>�b�u��peh������c!�ި� ]�&Z#��ǧ�|?,{!j�]s*p�����M)��r3tŜX�k ���e���|řj�*��#���ީ����'m�2����yO?G��a��9��`>g�u�C��N�C�j\!�� ��8 ��E����k?�>JX���7�'�s�٫�~nb��gK^�Q�1C	���Eg��T�����mOew�1V!\�j�S����>��b���µe���<��J����ER�����,�����a�y���� *b���?��s�!���PYk(�{�o�{��Z+Y�l�/�����aK��~u�R�I5W`�{�kZ/!w��J��Iag^�~�WEP(��dB-�RQ���/zv�#��Nx�LnO�i�n�I�-*�:ƙ�ɔ�랾 �ˍ�,.�vK�
��R����<��&��#o�Z�⟠�^>�k���[�5��g���}��o�(�� ���6�Q��#�:�Α;n�ct|�������Ӓ ��:dǳ:����kG�tv+~y�6� �1�jv�	)WP��C EDY����5�����#/��ag�ƳFP��V7#�ȫ��t�0O{�R��k�i�h���K-����t���Q^Xm���3��:{Ľ�Un@+6�h�k-	̞zn�m>��(CG������|��*���ϑ��۹(��y�Dկ����������f` ��ͫ��"*�@Orz팲�Hb,~��V4�cMX'#F��@�qG�0`�&�Qc�`$u�bYd%���T�A��`�����˥UַA!�h,
�ۅ$_}gT����6�y������0�U�<���+���h�-կ2܅(�Y���O�a֠�{_G�t���eUj�~A�Hh�V��,�ƫ�eUi���ć�� X����z����Z��^~�1i��h�!�BQ	#��$��͛�q7�.�x��u�v�N^>h�\3.�Ęs��~�w�t����ߗ�!��!�^��(�la��gS�׃�^	�l ���	/�{��:������ ��J{����Ϯj��ď�d���Պy5jb��s��U]�1D̪�DO��w#��=�TDh��9uKVY�.
R5t26��"tw�^�>N˕'?;���1�6J)T�����#� 0Z�%9|K6\���>l�z���Ư86��������U@�/Ӝ%������l����?���j6��$�2'�x�M�����l���Au�l�l�{�'_���W�Bs�9�o$wŶH9�.��i���GhMI��שnہ�n{h���D%;�x�
�e�@�����1%M�IpT{���&�N��W3`�;B��̳���ԭ�Y���:�}��E�_y�/�7P'`#��O�M���ZU�{P�l��|�U)h-��H���bkz��[��b4����^����$��欻1�Ҳ�ꍅK��������8�l�-����]�u2{l`Ƶ��ϔW7�'J�z����$$_����8��6|վ�U��T[����]h����˲o��OS]f2���E]�0Q}-n6�ASUb����.m��$�Sk`�s�Z���)yQ��"g�ξV:��K;=�:}.cڮ*
K'�eg����m�	�=�ZM�S	-��:X�ns��vԧ���o��PGyW��z�k�[Y��~��Ev�6�"��3:�~�
��_&Jw��J�[T0��B*��o�I�(b��$`l�ԐHlW�=�2��F�(�Ґ�5K+inG��/R^��n4�?-���ᒸX��%D8rc�ǒ�Iif��@�#��ˈ[�MBT$��vK���J�#��]DN|C���~��r��R�Rδ/+5Q�$<L@��A�����N[�( �ҝ2�P�'�"x(F�l�4��`��jv�H :�@    $&̬�\T�V��v�V*��u��0��y���LA�-Y) H��#S+�q�\�.��"B ��̇���F����y�qݧ�b����ڤ:�$������"3$�����n�g�4p�0��Y�H���a֦��Q 8~S�q5��H�A��M+�� �����Wj'd�1�e���$	��[�m�JE�������nޝg�k�2�z���j�;���f�:VƼ]ea��S2��8����(h��h:`U�m��kW�!�uz*1̚����t$]/0CV�&-y�D���1m��\$����B�W��|�W�*DQ{&Xΐ�{k!���^���,\n�`R<"��5@��Z�$�:��V�"�Q8o�$�|l.������=���{�����; �#fڵ��|a�w�?�d���a�p��n׿�������TJ��҂z�M�#�	�?S�?'��J[��׌�����-��y�6�_)��^��׋K��c�ؼa�]M�R=�: �bI\@���GI7�ճ��W纳ۘ�ݰ{�06�����ݷ��sN)�S�0�z���S��!i��Y�B���ھ�>R=(J|�x��B�ޢ��iw��+���g�oU/�cI�����3��c?"�2C��]�-(��pW2����2�2�boѠ��m?!%on0~o�����?�����o����z��BiB��7����\�f���f��O�S�F!���o��	x�*U��35 �W%E[zt�N��ۙJG���H�)cBk3"����r��}�3��"g��N��m@' ��������_��3tt/c֊nH���tQ�(:Ӡ+�-U�nW#�3��n����2�����0sc�Ⱦ#0.x�����*����4�Q���>�"7
G�֡��0�@��3p�����0��zu�Ģ��?E�A>����ݡa��F��\E<6����������y���Ⱥ )�csAa	S�{�֝���� �宨��� b�J,a�-AA�9l��-%T�\zɂ����7�Î�+��'�m�I�zH#03�^�,n�L��ިFJ��/�5�z���Mu7}Y2�'�*����t��åb���f\=R��H�"��.@�F��u��L �Q*ʗȯ;�ۛW���P������
y�S�8ń����tz�m\�S���el�LK���� !DF��+
�1ʦ��e"(������!�"��'ɬ\:�&�vH�k_d�¶��D<T�Hz�0I�X�Lڱ��J�����X��L�Ac���$�Aɣ�7E�䭫����b
�L��=�~��cF�A��tL����OGn�~'!�(�,M�"��y���j �:��E�� �Q�z/ޕ�ɮn����t�D��&��L�}^��>�<{�?��v�u	
�(S�+��1)��I�ɽo�R݃����&��j6���!;�h���|/�ٺ��*��e�������ֶRݔ�{��P�Y�e�QqY�e�T�e�}ux�W%�!����h�M�-x������v{F��yNa���O�����݇\:R �sf�A9�j'���]B-j�Wօ1���!���-�����g���eU�L�����Q8M>E2a��Gf�Tu��nh�&n,2�2�{����n��s��R�J �$-�N���ll�b)򩬢+���[����;�����ϧén�֢�z��1����Y��?Q`�{��
�����j�Gcl+��x3ݯZ��M�NME*o4vQ�e;���k���m����^�bHc5Q���ѯ��5�i����e���Ƕ������W*�ʯ7���Isl���i�H	�#�$�lAwl%ۊ�2���)��X'g����kac[b���2w��-ٯ���^�pb����O)?�"Z����@��AN���O����R�$�F%r3]�ߏ5�,�2l��B�a���=��5�2���Bc{iϡ�"�h�LBt2$�Y�F?�2ʫ{�%��$��������߷]qkF6+�I"J�H�݉\��U��E�~������%A
����<�N�~�
I�/Eo�>y�Ъ[�%����D=�=)R��UC�u̒e23�\bQ�65l��0��`#OR��+se����ƱG�Y;�\�˞+3n�\�� �G�,1.�ʶ���M%��`PqƫRt�\�`C�u��	���J�ՓΡy�+�k�w��uw@Z�\I�G_�9hs5�r'T��9lj8�[*��`���r�ڶ>�y�D���Uף㷿W��wE>�P����?2¾����À_�����B��=Q�٭d̵�k��Y,����vny(���I� ������]�A�/��`fE�+����2���[�\��7Vi6�1��	�z1��xɛY�?�`� 	�;X+0����T��,�6f c>�'�y��/��BK���q�~�.�٘����Bs������WWǦ}�̠hX������2��S��M��FtY����<w��<A�[]�>l�b���N�~Eɲd����d��mz�E�i�r����8����W [������6�"2�|�
��Ϳ
�d��\���\Å_ ێ��6t"�Q���	�͈SՄe�%Wsw�]����I�a���� t�I�Ö����o��U�FX WL��,��d.w���kp�4!h6�TLϗ��Lժo�;gS��\dO�vhB{&?@}�i�gí	��+����} Q��@�}�^QPg!,r�h�|[q����Bt�캛~E;rщ�VѪ ���r���N�"���n�
�;1O����PI&1�E�>9q���EE6@>޼�'�!�l&��k��i�f�`�����IY��(����#���F����I�%�=eE'Ȑ��Ѵ��g��}#�At�MN,�����ڎ�ӁRu�k@ĝ��xr?H@s�yW��F�j��YϷ� z�����J��E���L�W�E���[�Ϗ�=���F^�eX�'�3xd�X.w���AB3�JoP�!d�ý�I��U��獆�F��(�ۤg��ɛZ�+Z�{���qN�U�e�r��KY�:�iە��@HOI�g�S�х?�א�����������|:�ok�Ia�?�d� U+�z:�й��;��E�����6D�\�{Y7��Wp���/[�>+�t�e�������]{�� 걲ҶU�]3e��5��A�j�72�&�L�+Ė�D@x�멃^1�t�A-�?�v5 �A92Ud�?�B9(jx&ߟՍ�xX��%3�px�2MѮ�w�(2h�WU8��p!9�P�Y�r�0��^�#J��@D�� �V\!���x��� �IJ�z#ߜ1qP�3����c����<
��$de��������s6\�������ұ,gwHDRD��V���ْ?.h�������� ��D��51J�024� �|v�<R�ln!�D&�#�%��"���u�"
��-�8���(%H�ԃ 	+�词""G��6�*��Zk�,w!�Q}`�	���?QZc$_����y�GLě)��d	}i���(Lb[>W�0�����yF^|,��y���9} ���c�G'���`���e��¿VN��1���v��U�kؠbEX�VB<m]HPt�ٍG�g��ơ���[�W���X����2ۊj2\�Y��Zl��B�e[�k#��x ף nHj]����@������X��xl�2�0�ey�p�J��CimJj��^�W�Xn-R�v��gbaR�����4���IVi�I���K�p�6~w���|�m��!@�W�WW�����iԋZ�Am#��r��q�J@ʋ���V,pC:�Zn~-C�Ǵ�x偕Qҕp�SA�����~gke,x��iiO���ey���΋r�ǆ5�p�/�rkn�X(L��i�z���ꜷk�W�rR?�:^K~5��Ũ�J��	�4�C�}<�O$��@�C姽B��i�B>=��0
��.�n��|�4S}E�tڐ� (Q�F��/��S�T�ԑ�z�X��3��B!�^8�����V �Q����h������������*{��c/�F���T:�V�6���H	ऋ��jLOsM��    �d�}�rT�y�m�Y�+�nz�'� $�m��@ў�d����I8�q�L��Tk�����԰���m���X wg��:�c��ƨ7R�pLjq���՚f�~%b��F'�9�cM���<�ʌ�ߵ����Ey��~uBf�RT�n�h��U$�����%��G�"V�}=+� ]�(��Ț�^V��C�u�OFʕ{�fz�jE�+�h�`���̳��|�OB����!}���T_��}�tn4�,G�d:���r�[�F��΍���ߺ��by���]F��raY#j�l6xU^�X

`�Y�0���Ky}^�v��ݲ��GH�W(��������3	CV�I)�k�]"�������t���b�C��^�ogZ����A�JྎW�慞0�����H�	+��Y���s�R�co��əH��C���4�TE��ޕ[�	��T��T�z��"��S�:8~�$���f�t�fjjx���@"�\�f���e|8mhW�-��K4
�}4�})�x��7F�d�:�,��}��&^��h� �{�$?���=9��uzߏ�Tx/���j���dr�X�ʴm JJ�QQ��>.�3M�r"6]�Kyo�{&���=��g�<j���:��r,ޣdS����4e�b��0�LW�Rts��r�G��^?Y�QϤu7�����V-;�DY(����q�ƍWd0U�p�؉�o����&�\rʝ΋�<E/�/�_�c(K���?*4+Z�W4��T��������64�ܢ��f�E�1�8aP�J��v�K^R֢�{�p��Q� (y���BE�f��op��+Z�x��1�{�_��ջ�T��`EEΏӱSs�L�W�0����b_s��>�@;
U��!'t�$M��"�9T�ڟ���LsӪ$�l�
��8�7;A���Rn��j6c��Y6������x���["M<�/��U�Ƅ�?*4��IVE����!/�^V�-t���LIx��`d��_���ĳ�ka��YZ�@Y+�.j��כS���-��Gr����b����+��a����%F;L��6�f�
�o�:21nj���U�^E�NJR&����l L)�L�P�RJ,=Q�I #���x�N~�>�,)
���T{�'M�"U����m�#h�*gAe�:=�킄(�Q*u7�G�����$fn,�^�ws���i�%M���p̒����;%�Zv �čE!�"��O��';1�>��� ��ی���4y��LI�.)���`�Цf{j
���� U��2Mk���P��O��H�"{�
��(	rd���J�W+������
DnԵ��YlX� ��FD�W�&��S��%�؜�kC�?.�:L��^�u�/2v�&sx�O��֘X�����OV߹�tv��g]<	Qlzgcc�gT��,؛���
F�#�SS�U}a��o��;�h�yc�V����m��g�г�Yɢ�8��g9z�#R����|*֜6zV�,�ϫ�~T��Y�;C��d`M*��C��� )Haz��ec`Gz^�ɪQ0Yzm���ה�-�%U/j����i{���`Jw�`�i�!�9�A1����>UyV�
�������A����jmW;�7rR���8�K������îV����e���~Խv�L
�l�)ڋb�6`�T��S��30��e� ��Q&%�.[������_rg�����`�{�F(*��[q�S�����b;��j.�ژ+��X�9,_XE��I�P�F�s�	�����E��n���&V!�"d^�b �Ơv��d��Ȳa?SJ�YA�gv�\Ty��N��3 ��U�}��Wm=�a���/Ks��l�9U""`�;�n��s!�Iѻ�N&��5����;���xH���xmo��
����
����vGG�
r�kM��Ӄ�Nª�7�a~��J��p�u-��jd�1��G*�nA+��*;�@��o�f�/���b��Ȁi��z*�a�>/�r�zJ�`aD7��W�H���E
���j/�y�������i �>A$R=���p6)W2v��X]^|���ߦ�z!��2n��(QfN~w6;0|W��|��<���3�FfP�Z|Ws��4�����6ѩ�[����Ut�n�����Gj]YP�;��'lD���Q�����ٔ}�������We�c��@?,�eBx{�|D��, F^��Ӧ�G/]�����͏����<4,%��S�c�����Q�TM/!"�Q<�>k�B�a�I�;��0��v�f�aT��s6�x\<�wfP�i��vO��˩���u�Ô�Jo���OҲ?�p���f���J��,��k��E	4(wܴ�����.�f���eO���Y�&J!p�ƹA�g=i�ˆ�T�Z���aq+��Z�CD?��9��f���o`�o��F�c�{����}�T� �]V^�� ���x�L鸴f��������UЈ0�����o�)z�5p6�u����Yw�v���
�6 �^ �r��>�F�z:- gWIxM��&���	�y��w���!QMh��\�������DH�s5��L�:͛y��#N����D=��3�E$�uBkFT��BXT�<�;�����II �d��v=�l@������#�V��Kg��nfv��M��{��i9>��"*�8�2b1]�ݮV? �ż��=mZ�1 +%g�&$�7]ф��ހ�������3VB��3E|�L\�!��VZ']��K��}��
�l9�qK�ޢ�|]��Q����ށ����+�P�<��P�]Շ�oO`D�Y�Vq�t���o3�A�j��W;�^���	���<������AF�//�o��7-��M�Pu�!Lƣ
�ʽ�m�yM�TV�����	���[�D���/���5�W7^M9ʫ%ه���r9Λ~�x�Q���NV�K�欯�VkF+�����Q&,J��%�8��`8D�V����SQ9�*�O F�5�e��Ȏ����E l+��ċ<�J����r�y;��o�zG2�G
T��9g���C83W\�G�j>��>M_O5mKk3�W�J<'�9�:�i~8դy�����	&�Ϩ������~>�`�������3R+����,���g��L��W���ɬZ{�9�i���G���<��Wg�7�����C�#��Y��z>㡯�ô�罅�W
�u5��dwE�>�*@�����j=v��؋E}�?�Ux�t;�eC7���fۯ(YU�������ڙ|{�ږ��i���D��W�ӟ�R���h22X�G97���]S��c�c��-���e���?���9��3y�s[v��3$�F*�鶞��㴧����mX�H�4e8�������&�gR���X�j�|;m(������r2��sW���V+B�3x��k ޕG��Qg�����ɳuX+�AQ�#A�/�|�g���a�pS����(	��sB���~C�\�1�]h�`��UCgì{4q���^�{�͊��)���*8��Lj�FF\�7�Pk&�O�sכ]u�o��'�.��1�~Wּ\���L2{����a�q9�K���dL�ڻ� �"<���
q�AN��/Da�:�}Gv�醊���&��3��G�a��ڕ��
�>�w�@F�Sy�F�rP��&e�`n���u�aTg���+4~?����/}�Q�=��
��s�s����(797l�p�0;��)@v-+��h��uW���Ψk6�Y�R�d���ð�\6dAϸ�vaW��}i�����l]Q͖7�-�Qx)�7/M��W�e�k�ܠ����b�����������3��*uI��!�O����5��[�7x05��8�\���a��9,������������
@nAg�"[�@����D��/
����Q���z0�2�~	�u����o7]���t �pk�Sn�e�}���&��l�v��Qw�d�f�&��: ح����ȩa|���e/�-L�R[!:�����T$?/G���]{�������L�M���Aδ�i`5X1Dd��,%#z��z0C�����'���=G�9�W+s�2�   5�@D�I�S��q����e��d^2{��Ʒu����;�!Лiw�Y�a��!��F��a�JwZ���UU�0�Ɯ|
��o��>��H�t����7�غ��	t& �KQH<������s���.���<�5�;%S�͵v�f@e.�r]��o��K������4x��V�ԙb�k��xA9w'nF�.Hu�|�zy�������q;�-j�~�x5�����B]S���V�hI%5�QI�M�~?uUqͨ���w�f�Qpv�����=�g~ �Q�}�1���P�!c�6}�_�`<
,�I8��⣁P�"w�f�P�p[��6���an�rd�M�Hp�4������[5��N�����٠2����w����O4�QS�yf����B���a����|os�����c/
Tq廟׺9]���_��Gʬ��7]>����ө`neƳ�Ka�p�x����A��7,���#Xv�z,�y��Q�-��naL�4��$hj2�l�����_�?k��     