import os
import xml.etree.ElementTree as ET
import pandas as pd
from tabulate import tabulate  # Importamos la función tabulate

def parse_xml(xml_file, output_txt):
    """ Función para parsear un archivo XML CFDI y extraer datos específicos de conceptos """
    tree = ET.parse(xml_file)
    root = tree.getroot()

    namespaces = {
        'cfdi': 'http://www.sat.gob.mx/cfd/4',
        'tfd': 'http://www.sat.gob.mx/TimbreFiscalDigital'
    }

    # Extraemos los datos de los conceptos
    conceptos = root.find('cfdi:Conceptos', namespaces)
    conceptos_data = []

    for concepto in conceptos.findall('cfdi:Concepto', namespaces):
        concepto_data = {
            'ClaveProdServ': concepto.get('ClaveProdServ'),
            'NoIdentificacion': concepto.get('NoIdentificacion'),
            'Cantidad': concepto.get('Cantidad'),
            'ClaveUnidad': concepto.get('ClaveUnidad'),
            'Unidad': concepto.get('Unidad'),
            'Descripcion': concepto.get('Descripcion'),
            'ValorUnitario': concepto.get('ValorUnitario'),
            'Importe': concepto.get('Importe')
        }
        conceptos_data.append(concepto_data)

    # Guardamos los datos de conceptos en el archivo de texto con codificación UTF-8
    with open(output_txt, 'a', encoding='utf-8') as f:
        f.write(f"Archivo: {xml_file}\n")
        f.write(tabulate(conceptos_data, headers='keys', tablefmt='psql'))
        f.write("\n\n")

    print(f"Datos de conceptos guardados en: {output_txt}")

    # Extraemos los datos generales del XML
    data = {
        'Uuid': root.find('.//tfd:TimbreFiscalDigital', namespaces).get('UUID'),
        'RfcEmisor': root.find('.//cfdi:Emisor', namespaces).get('Rfc'),
        'NombreEmisor': root.find('.//cfdi:Emisor', namespaces).get('Nombre'),
        'RfcReceptor': root.find('.//cfdi:Receptor', namespaces).get('Rfc'),
        'NombreReceptor': root.find('.//cfdi:Receptor', namespaces).get('Nombre'),
        'RfcPac': root.find('.//tfd:TimbreFiscalDigital', namespaces).get('RfcProvCertif'),
        'FechaEmision': root.get('Fecha'),
        'FechaCertificacionSat': root.find('.//tfd:TimbreFiscalDigital', namespaces).get('FechaTimbrado'),
        'Monto': root.get('Total'),
        'EfectoComprobante': root.get('TipoDeComprobante'),
        'Estatus': 'Vigente'  # Asumiendo que 'Estatus' puede ser fijo o se obtiene de otro lugar
    }

    return data

def process_folder(folder_path):
    """ Función para procesar todos los archivos XML en una carpeta """
    # Archivo único para guardar los datos de conceptos
    output_txt = os.path.join(folder_path, 'resultados.txt')

    # Lista para almacenar los datos generales de todos los XML
    all_data = []

    # Iteramos sobre todos los archivos en la carpeta
    for filename in os.listdir(folder_path):
        if filename.endswith('.xml'):
            xml_file = os.path.join(folder_path, filename)
            print(f"Procesando archivo: {xml_file}")

            # Parseamos el XML y obtenemos los datos específicos
            xml_data = parse_xml(xml_file, output_txt)
            all_data.append(xml_data)

    # Creamos un DataFrame de Pandas con los datos generales obtenidos
    df = pd.DataFrame(all_data)

    # Exportamos el DataFrame a un archivo Excel
    output_file = os.path.join(folder_path, 'output.xlsx')
    df.to_excel(output_file, index=False)

    print(f"Archivo Excel exportado correctamente: {output_file}")

if __name__ == "__main__":
    # Ruta a la carpeta que contiene los archivos XML
    folder_path = r'C:\Users\BEELINK-MINI\Downloads\CFDI_1B70C711-FEDD-4816-9085-12D4C1571F31_18_06_2024'

    # Procesamos la carpeta y exportamos los datos a archivos de texto y Excel
    process_folder(folder_path)
