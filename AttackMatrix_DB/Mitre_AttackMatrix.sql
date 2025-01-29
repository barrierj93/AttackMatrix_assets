
-- crear la base de datos 
    /* 
        DROP DATABASE IF EXISTS mitre;
        CREATE DATABASE mitre; 
    */

-- crear el schema en la bbdd 'mitre':
    /*
        CREATE SCHEMA IF NOT EXISTS attack_matrix;
    */


-- Crear la tabla categories
CREATE TABLE attack_matrix.categories (
    category_id int PRIMARY KEY,
    category_name VARCHAR(10)
);

INSERT INTO attack_matrix.categories VALUES
    (1, 'Enterprise'),
    (2, 'Mobile'),
    (3, 'ICS')
;


-- Crear la tabla tactics
CREATE TYPE tactic_enum AS ENUM ('Reconnaissance', 'Resource Development', 'Initial Access', 'Execution', 'Persistence', 'Privilege Escalation', 'Defense Evasion', 'Credential Access', 'Discovery', 'Lateral Movement', 'Collection', 'Command and Control', 'Exfiltration', 'Impact', 'Network Effects', 'Remote Service Effects', 'Evasion', 'Inhibit Response Function', 'Impair Process Control');

CREATE TABLE attack_matrix.tactics (
	tactic_id VARCHAR(6) PRIMARY KEY,
	tactic_category int,
    tactic_name tactic_enum,
    tactic_description TEXT,
    foreign key(tactic_category) references attack_matrix.categories(category_id)
);



-- Crear la tabla mitigations
CREATE TYPE mitigation_enum AS ENUM ('Active Directory Configuration', 'Antivirus/Antimalware', 'Application Developer Guidance', 'Application Isolation and Sandboxing', 'Audit', 'Behavior Prevention on Endpoint', 'Boot Integrity', 'Code Signing', 'Credential Access Protection', 'Data Backup', 'Data Loss Prevention', 'Disable or Remove Feature or Program', 'Do Not Mitigate', 'Encrypt Sensitive Information', 'Environment Variable Permissions', 'Execution Prevention', 'Exploit Protection', 'Impair Process Control', 'Filter Network Traffic', 'Limit Access to Resource Over Network', 'Limit Hardware Installation', 'Limit Software Installation', 'Multi-factor Authentication', 'Network Intrusion Prevention', 'Network Segmentation', 'Operating System Configuration', 'Password Policies', 'Pre-compromise', 'Privileged Account Management', 'Privileged Process Integrity', 'Remote Data Storage', 'Restrict File and Directory Permissions', 'Restrict Library Loading', 'Restrict Registry Permissions', 'Restrict Web-Based Content', 'Software Configuration', 'SSL/TLS Inspection', 'Threat Intelligence Program', 'Update Software', 'User Account Control', 'User Account Management', 'User Training', 'Vulnerability Scanning', 'Attestation', 'Deploy Compromised Device Detection Method', 'Encrypt Network Traffic', 'Enterprise Policy', 'Interconnection Filtering', 'Lock Bootloader', 'Security Updates', 'System Partition Integrity', 'Use Recent OS Version', 'User Guidance', 'Access Management', 'Account Use Policies', 'Authorization Enforcement', 'Communication Authenticity', 'Human User Authentication', 'Mechanical Protection Layers', 'Minimize Wireless Signal Propagation', 'Mitigation Limited or Not Effective', 'Network Allowlists', 'Operational Information Confidentiality', 'Out-of-Band Communications Channel', 'Redundancy of Service', 'Safety Instrumented Systems', 'Software Process and Device Authentication','Static Network Configuration', 'Supply Chain Management', 'Validate Program Inputs', 'Watchdog Timers');

CREATE TABLE attack_matrix.mitigations (
    mitigation_id VARCHAR(6) PRIMARY KEY,
    mitigation_name mitigation_enum,
    mitigation_description TEXT
);


-- Crear la tabla techniques
CREATE TABLE attack_matrix.techniques (
    technique_id VARCHAR(7) PRIMARY KEY,
    mitre_code VARCHAR(8),
    technique_category int,
    technique_name VARCHAR(150),
    technique_description TEXT,
    tactic_code VARCHAR(6),
    foreign key(technique_category) references attack_matrix.categories(category_id),
    foreign key(tactic_code) references attack_matrix.tactics(tactic_id)
);



-- Crear la tabla mitigations_techniques
CREATE TABLE attack_matrix.mitigations_techniques (
    mitigation_code VARCHAR(6) REFERENCES attack_matrix.mitigations(mitigation_id) ON DELETE CASCADE,
    tech_code VARCHAR(8) REFERENCES attack_matrix.techniques(mitre_code),
    mitigation_implementing TEXT,
    PRIMARY KEY (mitigation_code, tech_code)
);



-- Crear la tabla threat_groups
CREATE TABLE attack_matrix.threat_groups (
    threat_id VARCHAR(6) PRIMARY KEY,
    threat_name VARCHAR(100),
    associated_groups TEXT,
    threat_description TEXT
);



-- Crear la tabla assets
CREATE TABLE attack_matrix.assets (
    asset_id VARCHAR(6) PRIMARY KEY,
    asset_name VARCHAR(150),
    asset_domain int,
    asset_description TEXT,
    foreign key(asset_domain) references attack_matrix.categories(category_id)
);



-- Crear la tabla campaigns
CREATE TABLE attack_matrix.campaigns (
    campaign_id VARCHAR(6) PRIMARY KEY,
    campaign_name VARCHAR(150),
    campaign_description TEXT
);



-- Crear la tabla data_sources
CREATE TABLE attack_matrix.data_sources (
    ds_id VARCHAR(6) PRIMARY KEY,
    ds_code VARCHAR(6),
    ds_name VARCHAR(150),
    ds_domain int,
    ds_description TEXT,
    foreign key(ds_domain) references attack_matrix.categories(category_id)
);



-- Crear la tabla software
CREATE TABLE attack_matrix.software (
    software_id VARCHAR(6) PRIMARY KEY,
    software_name VARCHAR(150),
    associated_software TEXT,
    software_description TEXT
);