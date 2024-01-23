--emprunterLivre()
--rendreLivre()


--emprunterLivre()
CREATE OR REPLACE Procedure emprunterLivre(
  id_adherent in Adherent.adherent_id%type,
  nLivre in Document.titre%type,
  date_emprunt in DATE,
  date_retour in DATE
)
AS
nom_livre Document.titre%type;
disponibilite  Livre.disponible%type;
id_livre Livre.livre_id%type;
CURSOR c1 is
select d.titre,L.disponible,L.livre_id
FROM Document d
inner join Volume v on (v.fk_Document_id=d.document_id and type_volume ='Livre')
inner join Livre L on (L.fk_volume_id=v.volume_id);

BEGIN
OPEN c1;
LOOP
FETCH c1 into nom_livre,disponibilite,id_livre;
EXIT WHEN c1%notfound;
if( nLivre = nom_livre and disponibilite='disponible' )then

 INSERT INTO Emprunte(adherent_id,livre_id,date_emprunt, date_retour,fk_adherent,fk_livre) VALUES (id_adherent,id_livre,date_emprunt, date_retour,id_adherent,id_livre);
 dbms_output.put_line('vous avez emprunter ce livre');
END IF;
END LOOP;
  CLOSE c1;
 END;
/

--rendreLivre()
CREATE OR REPLACE Procedure rendreLivre
as
input Document.titre%type;
nom_livre Document.titre%type;
disponibilite Livre.disponible%type;
CURSOR c1 is
select d.titre,L.disponible
FROM Document d
inner join Volume v on (v.fk_Document_id=d.document_id and type_volume ='Livre' )
inner join Livre L on (L.fk_volume_id=v.volume_id);
BEGIN
OPEN c1;
input :=&titre_du_livre_rendu;
LOOP
FETCH c1 into nom_livre,disponibilite;
EXIT WHEN c1%notfound;
if (disponibilite='non disponible')THEN
 disponibilite:='disponible';
  dbms_output.put_line(nom_livre|| '-->'||' ce livre est de nouveau disponible!!!!');
  exit;
 end if;
 end loop;
 end;
 /


CREATE OR REPLACE TRIGGER nombre_de_livre
    BEFORE INSERT OR UPDATE OF nombreEmpruntsEnCour
    ON Adherent
    FOR EACH ROW
    BEGIN
    IF : new.nombreEmpruntsEnCour>3 then
    raise_application_error(-20000
               , 'you cannot borrow another book');
     end if;
    end;
    /
