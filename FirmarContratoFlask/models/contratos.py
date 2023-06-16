from utils.db import db

class Tipo_Predio(db.Model):
    __tablename__ = 'tipo_predio'
    id_tipo_predio = db.Column(db.Integer(), primary_key = True)
    nomre_predio = db.Column(db.String())      

class Ubigeo(db.Model):
    __tablename__ = 'ubigeo'
    idubigeo = db.Column(db.String(6), primary_key = True)
    departamento = db.Column(db.String(60))
    provincia = db.Column(db.String(60))
    distrito = db.Column(db.String(60))
    superficie = db.Column(db.Float(10,4))
    altitud = db.Column(db.Float(10,4))
    latitud = db.Column(db.Float(10,4))
    longitud = db.Column(db.Float(10,4))

class Predio_Area_Comun(db.Model):
    __tablename__ = 'predio_area_comun'
    id_predio = db.Column(db.Integer(), primary_key = True)
    id_area_comun = db.Column(db.Integer(), primary_key = True)
    codigo = db.Column(db.String(6))
    area = db.Column(db.Float())
    
class Area_Comun(db.Model):
    __tablename__ = 'area_comun'
    id_area_comun = db.Column(db.Integer(), primary_key = True)
    descripcion = db.Column(db.String(50)) 
    
class Predio(db.Model):
    __tablename__ = 'predio' 
    id_predio = db.Column(db.Integer(), primary_key = True)
    id_tipo_predio = db.Column(db.Integer())
    descripcion = db.Column(db.String(80))
    ruc = db.Column(db.String(20))
    telefono = db.Column(db.String(12))
    correo = db.Column(db.String(80))
    direccion = db.Column(db.String(100))
    idubigeo = db.Column(db.String(6))
    
class Servicio(db.Model):
    __tablename__ = 'servicio'
    id_servicio = db.Column(db.Integer(), primary_key = True)
    descripcion = db.Column(db.String(50))

class Solicitud(db.Model):
    __tablename__ = 'solicitud'
    id_solicitud = db.Column(db.Integer(), primary_key = True)
    id_predio = db.Column(db.Integer())
    id_solicitante =  db.Column(db.Integer())
    id_servicio = db.Column(db.Integer())
    area_predio = db.Column(db.Float())
    num_casas = db.Column(db.Integer())
    cant_acomunes = db.Column(db.Integer())
    area_acomunes = db.Column(db.Integer())
    cant_vigilantes = db.Column(db.Integer())
    cant_plimpieza = db.Column(db.Integer())
    fecha_solicitud = db.Column(db.Date())
    
class Solicitud_Cotizacion(db.Model):
    __tablename__ = 'solicitud_cotizacion'
    id_solicitud_cotizacion = db.Column(db.Integer(), primary_key = True)
    id_solicitud = db.Column(db.Integer())
    fecha_cotizacion = db.Column(db.Date())
    id_personal = db.Column(db.Integer())
    importe = db.Column(db.Float(6,2))

class Tipo_Documento(db.Model):
    __tablename__ = 'tipo_documento'
    id_tipo_documento = db.Column(db.Integer(), primary_key = True)
    descripcion = db.Column(db.String(20))
    
class Persona(db.Model):
    __tablename__ = 'persona'
    id_persona = db.Column(db.Integer(), primary_key = True)
    apellido_paterno = db.Column(db.String(60))
    apellido_materno = db.Column(db.String(60))
    nombres = db.Column(db.String(60))
    fecha_nacimiento = db.Column(db.Date())
    id_tipo_documento = db.Column(db.Integer())
    ndocumento = db.Column(db.String(15))
    direccion = db.Column(db.String(150))
    idubigeo = db.Column(db.String(6))

class Rol(db.Model):
    __tablename__ = 'rol'
    id_rol = db.Column(db.Integer(), primary_key = True)
    descripcion = db.Column(db.String(60))
    
class Personal(db.Model):
    __tablename__ = 'personal'
    id_personal = db.Column(db.Integer(), primary_key = True)
    id_persona = db.Column(db.Integer())
    id_rol = db.Column(db.Integer())
    fecha_contrato = db.Column(db.Date())
    fecha_cese = db.Column(db.Date())
    
class Solicitante(db.Model):
    __tablename__ = 'solicitante'
    id_solicitante = db.Column(db.Integer(), primary_key = True)
    id_persona = db.Column(db.Integer())
    id_rol = db.Column(db.Integer())
    telefono = db.Column(db.Integer())
    correo = db.Column(db.String(80))
        
class Contrato(db.Model):
    __tablename__ = 'contrato'
    id_contrato = db.Column(db.Integer(), primary_key=True)
    id_personal = db.Column(db.Integer())
    id_solicitante = db.Column(db.Integer())
    id_solicitud_cotizacion = db.Column(db.Integer())
    fecha_contrato = db.Column(db.Date())
    fecha_firma_solicitante = db.Column(db.Date())
    fecha_firma_personal = db.Column(db.Date())
    fecha_registro = db.Column(db.Date())
    minuta = db.Column(db.String(100))

    def __init__(self, id_personal, id_solicitante, id_solicitud_cotizacion, fecha_contrato, fecha_firma_solicitante, fecha_firma_personal, fecha_registro, minuta):
        self.id_personal = id_personal
        self.id_solicitante = id_solicitante
        self.id_solicitud_cotizacion = id_solicitud_cotizacion
        self.fecha_contrato = fecha_contrato
        self.fecha_firma_solicitante = fecha_firma_solicitante
        self.fecha_firma_personal = fecha_firma_personal
        self.fecha_registro = fecha_registro
        self.minuta = minuta