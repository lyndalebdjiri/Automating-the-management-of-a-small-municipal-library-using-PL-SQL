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
  a_nombreEmpruntsEnCour IN NUMBER,
  fk_Bibliotheque_id  IN NUMBER
)
AS

BEGIN
 INSERT INTO  Adherent(nom,Prenom,dateNaissance,email,adresse,dateInscription,nombreEmpruntsEnCour,fk_Bibliotheque_id) VALUES (a_nom,a_Prenom,a_dateNaissance,a_email,a_adresse,a_dateInscription,a_nombreEmpruntsEnCour,fk_Bibliotheque_id);
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
    Adherent
WHERE
    Adherent.adherent_id = adherent_numero and Adherent.nom = name  and  Adherent.prenom = Prenom ;

dbms_output.put_line('l''adherent a ete bien supprimer');
end;
/

--ajouterDocument()
CREATE OR REPLACE  PROCEDURE ajouterDocument (
  a_titre IN VARCHAR2,
  a_prix IN VARCHAR2 ,
  a_type_document IN VARCHAR2 ,
  fk_Bibliotheque_id  IN NUMBER
)
AS
BEGIN

 INSERT INTO  Document(titre,prix ,type_document,fk_Bibliotheque_id) VALUES (a_titre,a_prix,a_type_document,fk_Bibliotheque_id);
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
 Document
 WHERE

 document_id = numero_du_document and titre = titre_du_document and type_du_document = type_document;
 dbms_output.put_line('le document a ete supprimer!!!!!!');
END;
/
