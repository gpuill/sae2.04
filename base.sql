CREATE TABLE departement (
    departement_code VARCHAR NOT NULL,
    departement_nom VARCHAR NOT NULL,
    region_nom VARCHAR NOT NULL,
    CONSTRAINT departement_pk PRIMARY KEY(departement_code,region_nom)
);

CREATE TABLE commune(
    commune_nom VARCHAR NOT NULL,
    com_departement_code VARCHAR NOT NULL,
    CONSTRAINT commune_pk PRIMARY KEY(commune_nom,com_departement_code)
);

CREATE TABLE etablissement(
    etablissement_code_uai VARCHAR NOT NULL,
    etablissement_nom VARCHAR NOT NULL,
    etablissement_statut VARCHAR NOT NULL,
    CONSTRAINT etablissement_pk PRIMARY KEY(etablissement_code_uai)
);

CREATE TABLE regroupement(
    libelle_regroupement VARCHAR NOT NULL,
    CONSTRAINT regroupement_pk PRIMARY KEY(libelle_regroupement)
);

CREATE TABLE session(
    session_annee INT NOT NULL,
    CONSTRAINT session_pk PRIMARY KEY(session_annee)
);

CREATE TABLE mention_bac(
    libelle_mention VARCHAR NOT NULL,
    CONSTRAINT mention_bac_pk PRIMARY KEY(libelle_mention)
);

CREATE TABLE type_bac(
    type_bac VARCHAR NOT NULL,
    CONSTRAINT type_bac_pk PRIMARY KEY(type_bac)
);

CREATE TABLE effectif_selon_mention(
    libelle_mention VARCHAR NOT NULL,
    cod_aff_form VARCHAR NOT NULL,
    session_annee INTEGER NOT NULL,
    effectif_admis_neo_bac_selon_mention_type_mention_sans_info INTEGER NOT NULL,
    effectif_admis_neo_bac_selon_mention_type_mention_sans_mention INTEGER NOT NULL,
    effectif_admis_neo_bac_selon_mention_type_mention_assez_bien INTEGER NOT NULL,
    effectif_admis_neo_bac_selon_mention_type_mention_bien INTEGER NOT NULL,
    effectif_admis_neo_bac_selon_mention_type_mention_tres_bien INTEGER NOT NULL,
    effectif_admis_neo_bac_selon_mention_type_mention_tres_bien_fel INTEGER NOT NULL,
    CONSTRAINT effectif_selon_mention_pk PRIMARY KEY(libelle_mention,cod_aff_form,session_annee)
);