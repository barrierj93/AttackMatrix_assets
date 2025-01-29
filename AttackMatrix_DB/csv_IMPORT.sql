-- Primero, asegúrate de que estás usando el esquema correcto
SET search_path TO attack_matrix;


-- Comando para importar el CSV
COPY tactics(tactic_id, tactic_category, tactic_name, tactic_description)
FROM 'C:\path\to\MitreAttack_TACTICS.csv' -- Ajusta la ruta al archivo
DELIMITER ';' 
CSV HEADER;


-- Cargar datos en la tabla mitigations
COPY attack_matrix.mitigations(mitigation_id, mitigation_name, mitigation_description)
FROM 'C:\path\to\MitreAttack_mitigations.csv'
DELIMITER ';'
CSV HEADER;


-- Cargar datos en la tabla techniques
COPY attack_matrix.techniques(technique_id, mitre_code, technique_category, technique_name, technique_description, tactic_code)
FROM 'C:\path\to\MitreAttack_techniques.csv'
DELIMITER ';'
CSV HEADER;

-- Cargar datos en la tabla mitigations_techniques
COPY attack_matrix.mitigations_techniques(mitigation_code, tech_code, mitigation_implementing)
FROM 'C:\path\to\MitreAttack_mitigations_techniques.csv'
DELIMITER ';'
CSV HEADER;

-- Cargar datos en la tabla threat_groups
COPY attack_matrix.threat_groups(threat_id, threat_name, associated_groups, threat_description)
FROM 'C:\path\to\MitreAttack_threat_groups.csv'
DELIMITER ';'
CSV HEADER;

-- Cargar datos en la tabla assets
COPY attack_matrix.assets(asset_id, asset_name, asset_domain, asset_description)
FROM 'C:\path\to\MitreAttack_assets.csv'
DELIMITER ';'
CSV HEADER;

-- Cargar datos en la tabla campaigns
COPY attack_matrix.campaigns(campaign_id, campaign_name, campaign_description)
FROM 'C:\path\to\MitreAttack_campaigns.csv'
DELIMITER ';'
CSV HEADER;

-- Cargar datos en la tabla data_sources
COPY attack_matrix.data_sources(ds_id, ds_code, ds_name, ds_domain, ds_description)
FROM 'C:\path\to\MitreAttack_data_sources.csv'
DELIMITER ';'
CSV HEADER;

-- Cargar datos en la tabla software
COPY attack_matrix.software(software_id, software_name, associated_software, software_description)
FROM 'C:\path\to\MitreAttack_software.csv'
DELIMITER ';'
CSV HEADER;
