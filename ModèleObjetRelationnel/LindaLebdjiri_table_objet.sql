--------------------------------------------------------------------------------------------------declaration des types des objets------------------------------------------------------------------------------------------------------------------
--type1:
CREATE OR REPLACE TYPE Bibliotheque_type AS OBJECT
(bibliotheque_num NUMBER,
  nomBibliotheque VARCHAR(255),
 adresseBibliotheque VARCHAR(255),
 numero_telephone VARCHAR2(255),
 email  VARCHAR2(255),
 MEMBER PROCEDURE  ajouterAdherent (SELF IN OUT NOCOPY Bibliotheque_type ),
 MEMBER PROCEDURE  enleverAdherent (SELF IN OUT NOCOPY Bibliotheque_type ),
 MEMBER PROCEDURE  ajouterDocument (SELF IN OUT NOCOPY Bibliotheque_type ),
 MEMBER PROCEDURE  enleverDocument (SELF IN OUT NOCOPY Bibliotheque_type )
)NOT FINAL;
/

--type2:
CREATE OR REPLACE TYPE Adherent_type AS OBJECT
(adherent_num NUMBER,
  nom VARCHAR(255),
 Prenom VARCHAR(255),
 dateNaissance Date,
 email VARCHAR(255),
 adresse VARCHAR(255),
 dateInscription Date,
 nombreEmpruntsEnCour NUMBER,
 refBib REF Bibliotheque_type,
 MEMBER PROCEDURE emprunterLivre(SELF IN OUT NOCOPY Adherent_type ),
 MEMBER PROCEDURE rendreLivre(SELF IN OUT NOCOPY Adherent_type),
 MEMBER PROCEDURE renouvellerPret(SELF IN OUT NOCOPY  Adherent_type)
)NOT FINAL;
/

--type3:
CREATE OR REPLACE TYPE Document_type AS OBJECT
(document_num NUMBER,
 titre VARCHAR(255),
 prix FLOAT,
 type_document  VARCHAR2(255),
 refBib REF Bibliotheque_type,
 MEMBER PROCEDURE listDocument (SELF IN OUT NOCOPY  Document_type)
)NOT FINAL;
/

--type4:
CREATE OR REPLACE TYPE Volume_type UNDER Document_type
( volume_num NUMBER,
  auteur VARCHAR(255),
  nbrPage NUMBER,
  type_volume VARCHAR2(255),
  refdocument REF Document_type
)NOT FINAL;
/

--type5:
CREATE OR REPLACE TYPE Journal_type UNDER Document_type
( journal_num NUMBER,
  date_parution Date,
  refdocument REF Document_type
);
/

--type6:
CREATE OR REPLACE TYPE BD_type UNDER Volume_type
( bd_num NUMBER,
  dessinateur VARCHAR(255),
  refvolume REF Volume_type
);
/

--type7:
CREATE OR REPLACE TYPE Dictionnaire_type UNDER Volume_type
( dictionnaire_num NUMBER,
  refvolume REF Volume_type
);
/

--type8:
CREATE OR REPLACE TYPE Livre_type UNDER Volume_type
( livre_num NUMBER,
  disponible VARCHAR(255),
  refadherent REF Adherent_type,
  refvolume REF Volume_type,
  MEMBER PROCEDURE  empruntable (SELF IN OUT NOCOPY  Livre_type)
);
/

--type9:
CREATE OR REPLACE TYPE Emprunte_type AS OBJECT
( emprunte_num NUMBER,
  livre_id NUMBER,
  date_emprunt Date,
  date_retour Date,
  depasseDelai VARCHAR(255),
  refadherent REF Adherent_type,
  refLivre REF Livre_type,
 MEMBER PROCEDURE  afficherEmprunte(SELF IN OUT NOCOPY  Emprunte_type)
);
/


-------------------------------------------------------------------- creation des table----------------------------------------------------------------------------------------------
--table1:
CREATE TABLE  Bibliotheque2 OF Bibliotheque_type
(CONSTRAINT p_bibliotheque PRIMARY KEY(bibliotheque_num)
);
/


--table2:
CREATE TABLE Adherent2 OF Adherent_type
( CONSTRAINT p_adherent PRIMARY KEY(adherent_num),
  CONSTRAINT na_refBib CHECK (refBib IS NOT NULL),
  CONSTRAINT fk_refBib refBib REFERENCES Bibliotheque2 on delete cascade
);
/


--table3:
CREATE TABLE Document2 OF Document_type
( CONSTRAINT p_document PRIMARY KEY(document_num),
  CONSTRAINT nd_refBib CHECK (refBib IS NOT NULL),
  CONSTRAINT fk_refBib refBib REFERENCES Bibliotheque2 on delete cascade
);
/


--table4:
CREATE TABLE Volume2 of Volume_type
(CONSTRAINT p_volume PRIMARY KEY(volume_num),
  CONSTRAINT nv_refdocument  CHECK (refdocument  IS NOT NULL),
  CONSTRAINT fk_refdocument  refdocument  REFERENCES Document2 on delete cascade
);
/


--table5:
CREATE TABLE Journal2  of Journal_type
( CONSTRAINT p_Journal  PRIMARY KEY(journal_num),
  CONSTRAINT nj_refdocument  CHECK (refdocument  IS NOT NULL),
  CONSTRAINT fk_refdocument  refdocument  REFERENCES Document2 on delete cascade
);
/


--table6:
CREATE TABLE BD2  of BD_type
( CONSTRAINT p_bd PRIMARY KEY(bd_num),
  CONSTRAINT nb_refvolume CHECK (refvolume  IS NOT NULL),
  CONSTRAINT fk_refvolume  refvolume  REFERENCES Volume2 on delete cascade
);
/

--table7:
CREATE TABLE Dictionnaire2 of Dictionnaire_type
( CONSTRAINT p_dictionnaire PRIMARY KEY(dictionnaire_num),
 CONSTRAINT nd_refvolume CHECK (refvolume  IS NOT NULL),
 CONSTRAINT fk_refvolume  refvolume  REFERENCES Volume2 on delete cascade
);
/

--table8:
CREATE TABLE Livre2 of Livre_type
( CONSTRAINT p_livre PRIMARY KEY(livre_num),
  CONSTRAINT nl_refadherent CHECK (refadherent IS NOT NULL),
  CONSTRAINT fk_refadherent refadherent REFERENCES Adherent2 on delete cascade,
  CONSTRAINT nl_refvolume CHECK (refvolume  IS NOT NULL),
  CONSTRAINT fk_refvolume  refvolume  REFERENCES Volume2 on delete cascade
);
/

--table9
CREATE TABLE Emprunte2 OF Emprunte_type
( CONSTRAINT p_emprunte PRIMARY KEY(emprunte_num),
  CONSTRAINT ne_refadherent CHECK (refadherent IS NOT NULL),
  CONSTRAINT fk_refadherent refadherent REFERENCES Adherent2 on delete cascade,
  CONSTRAINT nn_refLivre CHECK (refLivre IS NOT NULL),
  CONSTRAINT fk_refLivre refLivre REFERENCES Livre2 on delete cascade
);
/
