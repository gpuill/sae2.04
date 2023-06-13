

Insert into parcoursup2._session
select DISTINCT session_annee from parcoursup2.import_data;

INSERT INTO parcoursup2._academie
SELECT DISTINCT academie_nom from parcoursup2.import_data; 

INSERT INTO parcoursup2._mention_bac
(
  libelle_mention
)
VALUES
(
  'sans info'
);
INSERT INTO parcoursup2._mention_bac
(
  libelle_mention
)
VALUES
(
  'sans mention'
);
INSERT INTO parcoursup2._mention_bac
(
  libelle_mention
)
VALUES
(
  'assez bien'
);
INSERT INTO parcoursup2._mention_bac
(
  libelle_mention
)
VALUES
(
  'bien'
);
INSERT INTO parcoursup2._mention_bac
(
  libelle_mention
)
VALUES
(
  'très bien'
);
INSERT INTO parcoursup2._mention_bac
(
  libelle_mention
)
VALUES
(
  'très bien fel'
);

INSERT INTO parcoursup2._type_bac
(
  type_bac
)
VALUES
(
  'general'
);
INSERT INTO parcoursup2._type_bac
(
  type_bac
)
VALUES
(
  'technologique'
);
INSERT INTO parcoursup2._type_bac
(
  type_bac
)
VALUES
(
  'pro'
);
INSERT INTO parcoursup2._type_bac
(
  type_bac
)
VALUES
(
  'autre'
);



INSERT INTO parcoursup2._region
SELECT DISTINCT region_nom from parcoursup2.import_data;

INSERT INTO parcoursup2._departement
SELECT DISTINCT departement_code,departement_nom,region_nom from parcoursup2.import_data;

INSERT INTO parcoursup2._commune
SELECT DISTINCT commune_nom,departement_code from parcoursup2.import_data;

INSERT INTO parcoursup2._etablissement
SELECT DISTINCT etablissement_code_uai,etablissement_nom,etablissement_statut from parcoursup2.import_data;

INSERT INTO parcoursup2._filiere (filiere_libelle,filiere_libelle_tres_abrege,filiere_libelle_abrege,filiere_libelle_detaille_bis)
SELECT DISTINCT filiere_libelle,filiere_libelle_tres_abrege,filiere_libelle_abrege,filiere_libelle_detaille_bis from parcoursup2.import_data;

INSERT INTO parcoursup2._formation
SELECT DISTINCT filiere_libelle_detaille,coordonnees_gps,list_com,cod_aff_form,tri,concours_communs_banques_epreuves,url_formation,_filiere.filiere_id,etablissement_code_uai,commune_nom,departement_code,academie_nom from parcoursup2.import_data
NATURAL JOIN parcoursup2._filiere;


INSERT INTO parcoursup2._regroupement
SELECT DISTINCT regroupement_1 from parcoursup2.import_data
WHERE regroupement_1 != ''
UNION 
SELECT DISTINCT regroupement_2 from parcoursup2.import_data
where regroupement_2!=''
UNION
SELECT DISTINCT regroupement_3 from parcoursup2.import_data
where regroupement_3!='';

 
-- aadmissions generalites
INSERT INTO parcoursup2._admissions_generalites(cod_aff_form,session_annee,selectivite,capacite,effectif_total_candidats,effectif_total_candidates)
SELECT cod_aff_form,session_annee,selectivite,capacite,effectif_total_candidats,effectif_total_candidates FROM parcoursup2.import_data;
 
 
--type general
INSERT INTO parcoursup2._admissions_selon_type_neo_bac
SELECT DISTINCT cod_aff_form,session_annee,'general'as type_bac,effectif_admis_neo_bac_type_general as effectif_candidat_neo_bac_classes FROM parcoursup2.import_data;
 
 
-- type pro
INSERT INTO parcoursup2._admissions_selon_type_neo_bac
SELECT DISTINCT cod_aff_form,session_annee,'pro'as type_bac,effectif_admis_neo_bac_type_pro as effectif_candidat_neo_bac_classes FROM parcoursup2.import_data;
 
 
-- type techno  
INSERT INTO parcoursup2._admissions_selon_type_neo_bac
SELECT DISTINCT cod_aff_form,session_annee,'technologique'as type_bac,effectif_admis_neo_bac_type_techno as effectif_candidat_neo_bac_classes FROM parcoursup2.import_data;
 
 
-- type autre
INSERT INTO parcoursup2._admissions_selon_type_neo_bac
SELECT DISTINCT cod_aff_form,session_annee,'autre'as type_bac,effectif_admis_neo_bac_type_autres as effectif_candidat_neo_bac_classes FROM parcoursup2.import_data;
 
 
 
 
--Effectif admis selon la mention x6
 
-- sans info
INSERT INTO parcoursup2._effectif_selon_mention
SELECT cod_aff_form,session_annee,'sans info' as libelle_mention,effectif_admis_neo_bac_selon_mention_type_mention_sans_info FROM parcoursup2.import_data;
 
-- sans mention  
 
INSERT INTO parcoursup2._effectif_selon_mention
SELECT cod_aff_form,session_annee,'sans mention' as libelle_mention,effectif_admis_neo_bac_selon_mention_type_mention_sans_mention FROM parcoursup2.import_data;
 
-- assez bien
 
INSERT INTO parcoursup2._effectif_selon_mention
SELECT cod_aff_form,session_annee,'assez bien' as libelle_mention,effectif_admis_neo_bac_selon_mention_type_mention_assez_bien FROM parcoursup2.import_data;
 
-- bien
 
INSERT INTO parcoursup2._effectif_selon_mention
SELECT cod_aff_form,session_annee,'bien' as libelle_mention,effectif_admis_neo_bac_selon_mention_type_mention_bien FROM parcoursup2.import_data;
 
-- très bien
 
INSERT INTO parcoursup2._effectif_selon_mention
SELECT cod_aff_form,session_annee,'très bien' as libelle_mention,effectif_admis_neo_bac_selon_mention_type_mention_tres_bien FROM parcoursup2.import_data;
 
--très bien + felicitation
 
INSERT INTO parcoursup2._effectif_selon_mention
SELECT cod_aff_form,session_annee,'très bien fel' as libelle_mention,effectif_admis_neo_bac_selon_mention_type_mention_tres_bien_fel FROM parcoursup2.import_data;
 
 
 
 
 
--Groupe 1
 
INSERT INTO parcoursup2._rang_dernier_appele_selon_regroupement
SELECT cod_aff_form,session_annee,regroupement_1 as libelle_regroupement,rang_dernier_appele_groupe1 as rang_dernier_appele FROM parcoursup2.import_data WHERE regroupement_1 is not null;
 
--Groupe 2
 
INSERT INTO parcoursup2._rang_dernier_appele_selon_regroupement
SELECT cod_aff_form,session_annee,regroupement_2 as libelle_regroupement,rang_dernier_appele_groupe2 as rang_dernier_appele FROM parcoursup2.import_data WHERE regroupement_2 is not null;
 
--Groupe 3
INSERT INTO parcoursup2._rang_dernier_appele_selon_regroupement
SELECT cod_aff_form,session_annee,regroupement_3 as libelle_regroupement,rang_dernier_appele_groupe3 as rang_dernier_appele FROM parcoursup2.import_data WHERE regroupement_3 is not null;


