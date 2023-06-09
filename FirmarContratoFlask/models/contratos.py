from utils.db import db

class Tipo_Predio(db.Model):
    __tablename__ = 'tipo_predio'
    id_tipo_predio = db.Column(db.Integer(), primary_key = True)
    nombre_predio = db.Column(db.String())
    
    def __init__ (self, id_tipo_predio, nombre_predio):
        self.id_tipo_predio = id_tipo_predio
        self.nombre_predio = nombre_predio

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
    
    def __init__(self, id_ubigeo, departamento, provincia, distrito, superficie, altitud, latitud, longitud):
        self.id_ubigeo = id_ubigeo
        self.departamento = departamento
        self.provincia = provincia
        self.distrito = distrito
        self.superficie = superficie
        self.altitud = altitud
        self.latitud = latitud
        self.longitud = longitud
    
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
    
    def __init__(self, id_predio, id_tipo_predio, descripcion, ruc, telefono, correo, direccion, idubigeo):
        self.id_predio = id_predio
        self.id_tipo_predio = id_tipo_predio
        self.descripcion = descripcion
        self.ruc = ruc
        self.telefono = telefono
        self.correo = correo
        self.direccion = direccion
        self.idubigeo = idubigeo

class Servicio(db.Model):
    __tablename__ = 'servicio'
    id_servicio = db.Column(db.Integer(), primary_key = True)
    descripcion = db.Column(db.String(50))
    
    def __init__(self, id_servicio, descripcion):
        self.id_servicio = id_servicio
        self.descripcion = descripcion

class Solicitud_Cotizacion(db.Model):
    __tablename__ = 'solicitud_cotizacion'
    id_solicitud = db.Column(db.Integer(), primary_key = True)
    id_personal = db.Column(db.Integer())
    fecha_cotizacion = db.Column(db.Date())
    importe = db.Column(db.Float(6,2))
    
    def __init__(self, id_solicitud, id_personal, fecha_cotizacion, importe):
        self.id_solicitud = id_solicitud
        self.id_personal = id_personal
        self.fecha_cotizacion = fecha_cotizacion
        self.importe = importe

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
    
    def __init__(self, id_solicitud, id_predio, id_solicitante, id_servicio, area_predio, num_casas, cant_acomunes, area_acomunes, cant_vigilantes, cant_plimpieza):
        self.id_solicitud = id_solicitud
        self.id_predio = id_predio
        self.id_solicitante = id_solicitante
        self.id_servicio = id_servicio
        self.area_predio = area_predio
        self.num_casas = num_casas
        self.cant_acomunes = cant_acomunes
        self.area_acomunes = area_acomunes
        self.cant_vigilantes = cant_vigilantes
        self.cant_plimpieza = cant_plimpieza

class Rol(db.Model):
    __tablename__ = 'rol'
    id_tipo_solicitante = db.Column(db.Integer(), primary_key = True)
    descripcion = db.Column(db.String(60))
    
    def __init__(self, id_tipo_solicitante, descripcion):
        self.id_tipo_solicitante = id_tipo_solicitante
        self.descripcion = descripcion
    
class Tipo_Documento(db.Model):
    __tablename__ = 'tipo_documento'
    id_tipo_documento = db.Column(db.Integer(), primary_key = True)
    descripcion = db.Column(db.String(20))
    
    def __init__(self, id_tipo_documento, descripcion):
        self.id_tipo_documento = id_tipo_documento
        self.descripcion = descripcion    
    
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
    
    def __init__(self, id_persona, apellido_paterno, apellido_materno, nombres, fecha_nacimiento, id_tipo_documento, ndocumento, direccion, idubigeo):
        self.id_persona = id_persona
        self.apellido_paterno = apellido_paterno
        self.apellido_materno = apellido_materno
        self.nombres = nombres
        self.fecha_nacimiento = fecha_nacimiento
        self.id_tipo_documento = id_tipo_documento
        self.ndocumento = ndocumento
        self.direccion = direccion
        self.idubigeo = idubigeo

class Personal(db.Model):
    __tablename__ = 'personal'
    id_personal = db.Column(db.Integer(), primary_key = True)
    id_persona = db.Column(db.Integer())
    id_tipo_solicitante = db.Column(db.Integer())
    fecha_contrato = db.Column(db.Date())
    fecha_cese = db.Column(db.Date())
    
    def __init__(self, id_personal, id_persona, id_tipo_solicitante, fecha_contrato, fecha_cese):
        self.id_personal = id_personal
        self.id_persona = id_persona
        self.id_tipo_solicitante = id_tipo_solicitante
        self.fecha_contrato = fecha_contrato
        self.fecha_cese = fecha_cese 
    
class Solicitante(db.Model):
    __tablename__ = 'solicitante'
    id_solicitante = db.Column(db.Integer(), primary_key = True)
    id_persona = db.Column(db.Integer())
    id_tipo_solicitante = db.Column(db.Integer())
    telefono = db.Column(db.Integer())
    correo = db.Column(db.String(80))
    
    def __init__(self, id_solicitante, id_persona, id_tipo_solicitante, telefono, correo):
        self.id_solicitante = id_solicitante
        self.id_persona = id_persona
        self.id_tipo_solicitante = id_tipo_solicitante
        self.telefono = telefono
        self.correo = correo
        
class Contrato(db.Model):
    __tablename__ = 'contrato'
    id_contrato = db.Column(db.Integer(), primary_key=True)
    id_solicitud = db.Column(db.Integer())
    id_personal = db.Column(db.Integer())
    id_solicitante = db.Column(db.Integer())
    fecha_contrato = db.Column(db.Date())
    fecha_firma_solicitante = db.Column(db.Date())
    fecha_firma_personal = db.Column(db.Date())
    fecha_registro = db.Column(db.Date())
    minuta = db.Column(db.String(100))

    def __init__(self, id_solicitud, id_personal, id_solicitante, fecha_contrato, fecha_firma_solicitante, fecha_firma_personal, fecha_registro, minuta):
        self.id_solicitud = id_solicitud
        self.id_personal = id_personal
        self.id_solicitante = id_solicitante
        self.fecha_contrato = fecha_contrato
        self.fecha_firma_solicitante = fecha_firma_solicitante
        self.fecha_firma_personal = fecha_firma_personal
        self.fecha_registro = fecha_registro
        self.minuta = minuta