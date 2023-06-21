from flask import Blueprint,render_template, request, redirect, url_for, flash, session

from models.contratos import Tipo_Predio
from models.contratos import Ubigeo
from models.contratos import Predio
from models.contratos import Servicio
from models.contratos import Solicitud_Cotizacion
from models.contratos import Solicitud
from models.contratos import Rol
from models.contratos import Tipo_Documento
from models.contratos import Persona
from models.contratos import Personal
from models.contratos import Solicitante
from models.contratos import Contrato

from Google.Carpetas import crear_carpeta

from utils.db import db

contratos = Blueprint("contratos", __name__)


contratos.secret_key = 'clave_secreta'


@contratos.route('/')
def index():
    return render_template('index.html')


@contratos.route('/usuario', methods=['POST'])
def usuario():
    if request.method == 'POST':
        tipo_usuario = request.form['tipo_usuario']
        codigo = request.form['codigo']
    
        if tipo_usuario == 'solicitante':
            
            return redirect(url_for('contratos.pagina_solicitante', codigo=codigo))
        
        elif tipo_usuario == 'contratista':
            
            return redirect(url_for('contratos.pagina_contratista', codigo=codigo))
        
        else:
            return redirect(url_for('index'))   
 

@contratos.route('/solicitante/<codigo>')
def pagina_solicitante(codigo):

    return render_template(
        'solicitante_templates/pagina_solicitante.html', 
        codigo = codigo)
    
  
@contratos.route('/contratista/<codigo>')
def pagina_contratista(codigo):
    return render_template(
        'contratista_templates/pagina_contratista.html', 
        codigo = codigo)  


@contratos.route('/cotizaciones_solicitante/<codigo>', methods=['POST'])
def cotizaciones_solicitante(codigo):
    if request.method == 'POST':
        id_solicitante = int(codigo)
        solicitudes = Solicitud.query.filter_by(Solicitud.id_solicitante == id_solicitante).all()
        cotizaciones = []
        for solicitud in solicitudes:
            cotizacion = Solicitud_Cotizacion.query.filter_by(Solicitud_Cotizacion.id_solicitud == solicitud.id_solicitud).all()
            if cotizacion :
                contrato = Contrato.query.filter_by(Contrato.id_solicitud == solicitud.id_solicitud).all()
                if not contrato:
                    cotizaciones.append(cotizacion)   
        return render_template(
            'solicitante_templates/cotizaciones_solicitante.html', 
            codigo = id_solicitante,
            cotizaciones = cotizaciones)


@contratos.route('/contratos_solicitante/<codigo>', methods=['POST'])
def contratos_solicitante(codigo):
    if request.method == 'POST':
        id_solicitante = int(codigo)
        contratos = Contrato.query.filter_by(Contrato.id_solicitante == id_solicitante).all()
        return render_template(
            'solicitante_templates/contratos_solicitante.html', 
            codigo = id_solicitante,
            contratos = contratos)    

  
@contratos.route('/contratos_contratista/<codigo>', methods=['POST'])
def contratos_contratista(codigo):
    if request.method == 'POST':
        id_personal = int(codigo)
        contratos = Contrato.query.filter_by(
            Contrato.id_personal == id_personal,
            Contrato.fecha_firma_solicitante != None,
        ).all()
        print("CONTRATOS: ",contratos) 
        return render_template(
            'contratista_templates/contratos_contratista.html', 
            codigo = id_personal,
            contratos = contratos)    

 
@contratos.route('/crear_contrato/<id_solicitud>/<codigo>/<id_personal>', methods=['POST'])
def crear_contrato(id_solicitud,codigo,id_personal):
    
    from datetime import datetime
    if request.method == 'POST':
        id_solicitante = int(codigo)
        
        nombre_carpeta = "contrato-"+str(id_solicitud)+"-"+str(id_personal)+"-"+str(id_solicitante)
        
        crear_carpeta(nombre_carpeta)
        
        contrato = Contrato(id_solicitud,
                            id_personal,
                            id_solicitante,
                            datetime.now().date(), 
                            None,
                            None,
                            None,
                            None)
        db.session.add(contrato)
        db.session.commit()
        
        return redirect(url_for('contratos.pagina_solicitante', codigo=id_solicitante))    

@contratos.route('/firmar_contrato_solicitante/<codigo>', methods=['POST'])
def firmar_contrato_solicitante(codigo): 
    id_personal = codigo
    return redirect(url_for('contratos.pagina_solicitante', codigo=id_personal)) 

@contratos.route('/firmar_contrato_contratista/<codigo>', methods=['POST'])
def firmar_contrato_contratista(codigo): 
    id_personal = codigo
    return redirect(url_for('contratos.pagina_contratista', codigo=id_personal)) 

@contratos.route('/descargar_contrato_solicitante/<codigo>', methods=['POST'])
def descargar_contrato_solicitante(codigo): 
    id_personal = codigo
    return redirect(url_for('contratos.pagina_solicitante', codigo=id_personal))   

@contratos.route('/descargar_contrato_contratista/<codigo>', methods=['POST'])
def descargar_contrato_contratista(codigo): 
    id_personal = codigo
    return redirect(url_for('contratos.pagina_contratista', codigo=id_personal))   