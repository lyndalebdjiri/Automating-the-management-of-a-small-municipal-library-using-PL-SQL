--ajouterAdherent()
--enleverAdherent()
--ajouterDocument()
--enleverDocument()

set serveroutput on

--ajouterAdherent()
CREATE OR REPLACE  PROCEDURE ajouterAdherent (
  a_nom IN VARCHAR2,
  a_Prenom IN VARCHAR2 ,
  a_dateNaissance IN DATE ,
  a_email IN VARCHAR2,
  a_adresse IN VARCHAR2 ,
  a_dateInscription IN DATE,
  a_nombreEmpruntsEnCour IN NUMBER
)
AS
REFBib REF Bibliotheque_type;
BEGIN
select REF(i) into REFBib
from Bibliotheque2  i
where bibliotheque_num=1;
 INSERT INTO  Adherent2(nom,Prenom,dateNaissance,email,adresse,dateInscription,nombreEmpruntsEnCour,refBib) VALUES (a_nom,a_Prenom,a_dateNaissance,a_email,a_adresse,a_dateInscription,a_nombreEmpruntsEnCour,REFBib);
 dbms_output.put_line('l''adehrent a ete bien enregistrer.');
END;
/

--enleverAdherent()
CREATE OR REPLACE  PROCEDURE enleverAdherent(
  adherent_numero in numeric,
  name in VARCHAR2,
  Prenom in VARCHAR2
)
AS
BEGIN
DELETE
FROM
    Adherent2
WHERE
    Adherent.adherent_num = adherent_numero and Adherent.nom = name  and  Adherent.P+++renom = Prenom ;

dbms_output.put_line('l''adherent a ete bien supprimer');
end;
/

--ajouterDocument()
CREATE OR REPLACE  PROCEDURE ajouterDocument (
  a_titre IN VARCHAR2,
  a_prix IN VARCHAR2 ,
  a_type_document IN VARCHAR2
)
AS
REF_Bib REF Bibliotheque_type;
BEGIN
select REF(i) into REF_Bib
from Bibliotheque2  i
 INSERT INTO  Document2(titre,prix ,type_document,refBib) VALUES (a_titre,a_prix,a_type_document,REF_Bib);
 dbms_output.put_line('le document a ete bien ajoutee');

END ajouterDocument ;
/



--enleverDocument()
CREATE OR REPLACE  PROCEDURE enleverDocument (
  numero_du_document IN NUMBER ,
  titre_du_document IN VARCHAR2,
  type_du_document IN VARCHAR2
)
AS
BEGIN

 DELETE
 FROM
 Document2
 WHERE

 document_num = numero_du_document and titre = titre_du_document and type_du_document = type_document;
 dbms_output.put_line('le document a ete supprimer!!!!!!');
END;
/
