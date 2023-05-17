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
