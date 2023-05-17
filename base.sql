
drop schema if exists distribill cascade;
create schema distribill;
set schema 'distribill';


# Attributs = GOOD
CREATE TABLE session(
  session_annee                     INTEGER     NOT NULL,
  CONSTRAINT session_pk PRIMARY KEY(session_annee)            
);


# Attributs = GOOD
CREATE TABLE region (
  region_nom                        VARCHAR     NOT NULL,
  CONSTRAINT region_pk PRIMARY KEY(region_nom)
);

# Attributs = GOOD
CREATE TABLE departement (
  departement_code                  VARCHAR     NOT NULL,
  departement_nom                   VARCHAR     NOT NULL,
  region_nom                        VARCHAR     NOT NULL,
  CONSTRAINT departement_pk PRIMARY KEY(departement_code,region_nom)
);

# Attributs = GOOD
CREATE TABLE commune(
  commune_nom                       VARCHAR     NOT NULL,
  departement_code                  VARCHAR     NOT NULL,
  CONSTRAINT commune_pk PRIMARY KEY(commune_nom,departement_code)
);


# Attributs = GOOD
CREATE TABLE etablissement(
  etablissement_code_uai            VARCHAR     NOT NULL,
  etablissement_nom                 VARCHAR     NOT NULL,
  etablissement_statut              VARCHAR     NOT NULL,
  CONSTRAINT etablissement_pk PRIMARY KEY(etablissement_code_uai)
);

#Double check pas sur qu'il y est tout les attributs 
CREATE TABLE formation (
  cod_aff_form                      VARCHAR     NOT NULL,
  filiere_libelle_detaille          VARCHAR     NOT NULL,
  coordonnees_gps                   VARCHAR     NOT NULL,
  list_com                          VARCHAR     NOT NULL,
  concours_communs_banque_epreuve   VARCHAR     NOT NULL,
  url_formation                     VARCHAR     NOT NULL,
  tri                               VARCHAR     NOT NULL,
  commune_nom                       VARCHAR     NOT NULL,
  com_departement_code              VARCHAR     NOT NULL,
  filiere_id                        INTEGER     NOT NULL,
  academie_nom                      VARCHAR     NOT NULL,
  etablissement_code_uai            VARCHAR     NOT NULL,
  CONSTRAINT formation_pk PRIMARY KEY(cod_aff_form)
);

# Attributs = GOOD
CREATE TABLE filiere (
  filiere_id                        INTEGER     NOT NULL,
  filiere_libelle                   VARCHAR     NOT NULL,
  filiere_libelle_tres_abrege       VARCHAR     NOT NULL,
  filiere_libelle_detaille          VARCHAR     NOT NULL, 
  filiere_libelle_abrege            VARCHAR     NOT NULL,
  filiere_libelle_detaille_bis      VARCHAR     NOT NULL,
  filiere_libelle_tres_detaille     VARCHAR     NOT NULL, 
  CONSTRAINT filiere_pk PRIMARY KEY(filiere_id)
);

# Attributs = GOOD
CREATE TABLE academie(
  academie_nom                      VARCHAR     NOT NULL,
  CONSTRAINT academie_pk PRIMARY KEY(academie_nom)
);


# Attributs = GOOD
CREATE TABLE rang_dernier_appele_selon_regroupement(
  cod_aff_form                      VARCHAR     NOT NULL,
  session_annee                     INTEGER     NOT NULL,
  libelle_regroupement              VARCHAR     NOT NULL,
  rang_dernier_appele_groupe1       INTEGER,
  rang_dernier_appele_groupe2       INTEGER,
  rang_dernier_appele_groupe3       INTEGER,
  CONSTRAINT rang_dernier_appele_selon_regroupement_pk PRIMARY KEY(cod_aff_form,session_annee,libelle_regroupement)
);

# Attributs = GOOD
CREATE TABLE regroupement(
  libelle_regroupement              VARCHAR     NOT NULL,
  regroupement_1                    INTEGER,
  regroupement_2                    INTEGER,
  regroupement_3                    INTEGER,
  CONSTRAINT regroupement_pk PRIMARY KEY(libelle_regroupement)
);

CREATE TABLE admissions_generalistes(
  cod_aff_form                      VARCHAR     NOT NULL,
  session_annee                     INTEGER,
  selectivite                       VARCHAR     NOT NULL,
  capacite                          INTEGER,
  effectif_total_candidats          INTEGER,
  effectif_total_candidates         INTEGER,
  CONSTRAINT regroupement_pk PRIMARY KEY(cod_aff_form,session_annee)
);

CREATE TABLE admissions_selon_type_neo_bac(
  cod_aff_form                      INTEGER,
  type_bac                          VARCHAR,
  session_annee                     INTEGER,
  effectif_candidat_neo_bac_classes INTEGER,
  CONSTRAINT admissions_selon_type_neo_bac_pk PRIMARY KEY(cod_aff_form,session_annee,type_bac)
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

ALTER TABLE departement 
ADD CONSTRAINT departement_fk_region 
FOREIGN KEY(region_nom) 
references region(region_nom);
