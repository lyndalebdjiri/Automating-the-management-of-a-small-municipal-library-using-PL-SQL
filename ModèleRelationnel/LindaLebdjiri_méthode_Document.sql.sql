--listDocumnet()
--empruntable()
set serveroutput on

--listDocumnet()
CREATE OR REPLACE Procedure listDocument
AS
 nom_document Document.titre%type;
 l_type_document Document.type_document%type;
 l_type_Volume Volume.type_volume%type;
 j_date_parution Journal.date_parution%type;
 type_doc Document.type_document%type;

 CURSOR c1 is
    SELECT d.type_document,d.titre,v.type_volume
    FROM Document d
    inner join Volume v on (v.fk_Document_id=d.document_id);

CURSOR c2 is
 SELECT  d.type_document,d.titre,j.date_parution
 From Document d
 inner join Journal j on (j.fk_Document_id=d.document_id);

BEGIN
type_doc:=&aa;
IF(type_doc ='All' or type_doc='all' )THEN
OPEN c1;
OPEN c2;
LOOP
FETCH c1
into l_type_document,nom_document,l_type_Volume;
EXIT WHEN c1%notfound;
dbms_output.put_line(nom_document||'---'||l_type_Volume) ;
END LOOP;
 CLOSE c1;
LOOP
FETCH c2 into l_type_document,nom_document, j_date_parution;
EXIT WHEN c2%notfound;
 dbms_output.put_line(nom_document||'---'||j_date_parution||'--journal') ;
 END LOOP;
  CLOSE c2;
ELSIF (type_doc ='Volume' or type_doc ='volume' )THEN
OPEN c1;
LOOP
FETCH c1
  into l_type_document,nom_document,l_type_Volume;
 EXIT WHEN c1%notfound;
 dbms_output.put_line(nom_document||'---'||l_type_Volume) ;
 END LOOP;
 CLOSE c1;
 ELSE
 OPEN c2;
 LOOP
 FETCH c2 into l_type_document,nom_document, j_date_parution;
 EXIT WHEN c2%notfound;
  dbms_output.put_line(nom_document||'---'||j_date_parution) ;
  END LOOP;
  CLOSE c2;
 END IF;
END;
/


--empruntable()
CREATE OR REPLACE Procedure empruntable AS

nom_livre Document.titre%type;
disponibilite Livre.disponible%type;
nLivre Document.titre%type;
CURSOR c1 is
select d.titre,L.disponible
FROM Document d
inner join Volume v on (v.fk_Document_id=d.document_id and type_volume ='Livre' )
inner join Livre L on (L.fk_volume_id=v.volume_id);

BEGIN
nLivre:=&aa;
OPEN c1;
LOOP
FETCH c1 into nom_livre,disponibilite;
EXIT WHEN c1%notfound;
if( nLivre = nom_livre )then
dbms_output.put_line('ce livre est: '||disponibilite) ;
EXIT;
END IF;
END LOOP;
  CLOSE c1;
 END;
/
