CREATE TABLE departement (
    departement_code VARCHAR(50) NOT NULL,
    departement_nom VARCHAR(100) NOT NULL,
    region_nom VARCHAR(100) NOT NULL,
    CONSTRAINT departement_pk PRIMARY KEY(departement_code,region_nom)
)

CREATE TABLE commune(
    commune_nom VARCHAR(50) NOT NULL,
    com_departement_code VARCHAR(50) NOT NULL,
    CONSTRAINT commune_pk PRIMARY KEY(commune_nom,com_departement_code)
)

CREATE TABLE etablissement(
    etablissement_code_uai VARCHAR(50),
    etablissement_nom VARCHAR(100),
    etablissement_statut VARCHAR(100),
    CONSTRAINT etablissement_pk PRIMARY KEY(etablissement_code_uai)
)

