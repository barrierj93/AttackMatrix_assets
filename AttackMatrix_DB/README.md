# MITRE ATT&CK Matrix Database

Este repositorio contiene los archivos necesarios para crear y poblar una base de datos en PostgreSQL que modela la **MITRE ATT&CK Matrix**. Incluye los scripts SQL para la creación del esquema, las tablas, y la importación de datos desde archivos CSV.

## Estructura del Repositorio

- **`Mitre_AttackMatrix.sql`**: Script SQL para crear la base de datos `mitre`, el esquema `attack_matrix` y todas las tablas relacionadas.
- **`csv_IMPORT.sql`**: Script SQL para cargar los datos desde los archivos CSV en las tablas.
- **`csv_files/`**: Carpeta que contiene los archivos CSV con los datos de la matriz ATT&CK.

## Requisitos Previos

1. **PostgreSQL**: Asegúrate de tener PostgreSQL instalado en tu sistema.
2. **Permisos de acceso**: El usuario de PostgreSQL debe tener permisos para crear bases de datos y esquemas, y acceso al directorio donde se encuentran los archivos CSV.

## Instrucciones de Uso

### 1. Crear la Base de Datos y Tablas

1. Clona este repositorio:
   ```bash
   git clone https://github.com/barrierj93/AttackMatrix_assets.git
   cd AttackMatrix_assets
   ```

2. Accede a tu instancia de pgAdmin para ejecutar los scripts


### 2. Cargar los Datos

1. Asegúrate de que los archivos CSV se encuentren en la ruta especificada dentro del script `csv_IMPORT.sql`. Por defecto, los archivos están en la carpeta `csv_files/` del repositorio.

2. Ejecuta el script para cargar los datos en las tablas:
   ```sql
   \i csv_IMPORT.sql
   ```

### 3. Verificar los Datos

Una vez completada la carga, puedes ejecutar consultas para verificar que los datos se han importado correctamente. Por ejemplo:
   ```sql
   SELECT * FROM attack_matrix.techniques LIMIT 10;
   ```

## Contenido de los Archivos CSV

- `MitreAttack_assets.csv`: Contiene información sobre los activos.
- `MitreAttack_campaigns.csv`: Detalles de campañas.
- `MitreAttack_data_sources.csv`: Fuentes de datos relacionadas.
- `MitreAttack_software.csv`: Información sobre software y herramientas.
- `MitreAttack_threat_groups.csv`: Grupos de amenazas y descripciones.
- `MitreAttack_mitigations.csv`: Estrategias de mitigación.
- `MitreAttack_TACTICS.csv`: Tácticas de ataque.
- `MitreAttack_techniques.csv`: Detalles sobre técnicas de ataque.
- `MitreAttack_mitigations_techniques.csv`: Relación entre mitigaciones y técnicas.


## Estructura de la Base de Datos

El esquema `attack_matrix` contiene las siguientes tablas:

1. `categories`: Categorías de técnicas y activos.
2. `tactics`: Tácticas disponibles en la matriz.
3. `mitigations`: Estrategias de mitigación.
4. `techniques`: Técnicas de ataque.
5. `mitigations_techniques`: Relación entre mitigaciones y técnicas.
6. `threat_groups`: Grupos de amenazas.
7. `assets`: Información sobre activos.
8. `campaigns`: Detalles de campañas.
9. `data_sources`: Fuentes de datos.
10. `software`: Software relacionado.

## Licencia

Este proyecto está disponible bajo la Licencia MIT.
