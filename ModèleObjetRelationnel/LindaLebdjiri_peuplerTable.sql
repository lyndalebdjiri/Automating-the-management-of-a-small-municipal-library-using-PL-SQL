set serveroutput on

--procedure1:
CREATE OR REPLACE  PROCEDURE AddNewtoBibliotheque2 AS
 BEGIN
  INSERT INTO  Bibliotheque2(bibliotheque_num,nomBibliotheque,adresseBibliotheque) VALUES (1,'Bibliotheque Municipale Hamou Boutlélis','Rue Dourgham Adda, Oran 31000');
  dbms_output.put_line('la table Bibliotheque2 est remplie!!!');
END AddNewtoBibliotheque2 ;
/


--procedure2:
CREATE OR REPLACE  PROCEDURE AddNewtoAdherent2 AS
 REFBib REF Bibliotheque_type;
 BEGIN
 select REF(i) into REFBib
 from Bibliotheque2  i
 where bibliotheque_num=1;

 INSERT INTO  Adherent2(adherent_num,nom,Prenom,dateNaissance,email,adresse,dateInscription,nombreEmpruntsEnCour,refBib) VALUES  (1,'Tahar','Rahim','06-MAY-1981','Tahar.Rahim@gmail.com','Boulevard Lahcène Mimouni','05-MAY-2022',1,REFBib);
 INSERT INTO  Adherent2(adherent_num,nom,Prenom,dateNaissance,email,adresse,dateInscription,nombreEmpruntsEnCour,refBib) VALUES (2,'Lyes', 'Salem','9-oct-1988','Lyes.Salem88@gamail.com','Rue Abane Ramdane','3-JAN-2022',2,REFBib);
 INSERT INTO  Adherent2(adherent_num,nom,Prenom,dateNaissance,email,adresse,dateInscription,nombreEmpruntsEnCour,refBib) VALUES (3,'Fatima','Makhloufi','12-JAN-1990','Fatima.Makhloufi90@gmail.com','Avenue Cheïkh Khaldi Abdelkader','5-Sep-2021',0,REFBib);
 INSERT INTO  Adherent2(adherent_num,nom,Prenom,dateNaissance,email,adresse,dateInscription,nombreEmpruntsEnCour,refBib) VALUES (4,'Mustafa','Hamdi','29-Sep-1999','Mustafa.Hamdi26@gmail.com','Bin Ziyyad Ahmad Street','5-FEB-2022',2,REFBib);
 INSERT INTO  Adherent2(adherent_num,nom,Prenom,dateNaissance,email,adresse,dateInscription,nombreEmpruntsEnCour,refBib) VALUES (5,'Omar','Harrachi','10-FEB-2002','Omar.Harrachi@gmail.com','Rue Benalia Keddour','4-March-2022',3,REFBib);
 dbms_output.put_line('la table Adherent est remplie!!!');
END AddNewtoAdherent2 ;
/

--procedure3:
CREATE OR REPLACE  PROCEDURE AddNewtoDocument2 AS
REFBib REF Bibliotheque_type;
BEGIN
select REF(i) into REFBib
from Bibliotheque2  i
where bibliotheque_num=1;

INSERT INTO  Document2(document_num,titre,prix,type_document, refBib ) VALUES (1,'Les Fleurs du mal',1200.00,'Volume', REFBib);
INSERT INTO  Document2(document_num,titre,prix,type_document, refBib ) VALUES (2,'Les Aventures de Tintin, Le secret de la Licorne',1010.00,'Volume',REFBib );
INSERT INTO  Document2(document_num,titre,prix,type_document, refBib ) VALUES (3,'Le Petit Robert de la langue française',4500.00,'Volume',REFBib );
INSERT INTO  Document2(document_num,titre,prix,type_document, refBib ) VALUES (4,'Cambridge English.',5570.00,'Volume',REFBib );
INSERT INTO  Document2(document_num,titre,prix,type_document, refBib ) VALUES (5,'Persepolis',1200.00,'Volume',REFBib );
INSERT INTO  Document2(document_num,titre,prix,type_document, refBib ) VALUES (6,'Joséphine',1455.00,'Volume', REFBib);
INSERT INTO  Document2(document_num,titre,prix,type_document, refBib ) VALUES (7,'Liberte',25.00,'journal', REFBib);
INSERT INTO  Document2(document_num,titre,prix,type_document, refBib ) VALUES (8,'El Watan',15.00,'journal',REFBib );
INSERT INTO  Document2(document_num,titre,prix,type_document, refBib ) VALUES (9,'Les Raisins de la colère',3200.00,'Volume', REFBib);
INSERT INTO  Document2(document_num,titre,prix,type_document, refBib ) VALUES (10,'À la recherche du temps perdu',2200.00,'Volume',REFBib );
INSERT INTO  Document2(document_num,titre,prix,type_document, refBib ) VALUES (11,'Voyage au bout de la nuit.',3000.0,'Volume', REFBib);
INSERT INTO  Document2(document_num,titre,prix,type_document, refBib ) VALUES (12,'La Nation Arabe',33.00,'journal', REFBib);

dbms_output.put_line('la table Document est remplie!!!');
END AddNewtoDocument2;
/


--procedure4:
 CREATE OR REPLACE  PROCEDURE AddNewtoVolume2 as
 ref_document REF Document_type;
 BEGIN

     select REF(i) into ref_document
     from Document2 i
     where document_num=1;
     INSERT INTO  Volume2(volume_num,auteur,nbrPage,type_volume,refdocument) VALUES (1,'Guillaume Musso',345,'Livre',ref_document);

     select REF(i) into ref_document
     from Document2 i
     where document_num=2;
     INSERT INTO  Volume2(volume_num,auteur,nbrPage,type_volume,refdocument) VALUES (2,'Michel Bussi',50,'BD',ref_document);

     select REF(i) into ref_document
     from Document2 i
     where document_num=3;
     INSERT INTO  Volume2(volume_num,auteur,nbrPage,type_volume,refdocument) VALUES (3,'Alain Rey',2880,'Dictionnaire', ref_document);

     select REF(i) into ref_document
     from Document2 i
     where document_num=4;
     INSERT INTO  Volume2(volume_num,auteur,nbrPage,type_volume,refdocument) VALUES (4,'J.K. Rowling',89,'BD',ref_document);

     select REF(i) into ref_document
     from Document2 i
     where document_num=5;
     INSERT INTO  Volume2(volume_num,auteur,nbrPage,type_volume,refdocument) VALUES (5,'Valérie Perrin',3000,'Dictionnaire',ref_document);

     select REF(i) into ref_document
     from Document2 i
     where document_num=6;
     INSERT INTO  Volume2(volume_num,auteur,nbrPage,type_volume,refdocument) VALUES (6,'Olivier Norek',66,'BD',ref_document);

     select REF(i) into ref_document
     from Document2 i
     where document_num=7;
     INSERT INTO  Volume2(volume_num,auteur,nbrPage,type_volume,refdocument) VALUES (7,'Albert Camus',345,'Livre',ref_document);
     select REF(i) into ref_document
     from Document2 i
     where document_num=8;
     INSERT INTO  Volume2(volume_num,auteur,nbrPage,type_volume,refdocument) VALUES (8,'Leïla Slimani',567,'Livre',ref_document);

     select REF(i) into ref_document
     from Document2 i
     where document_num=8;
     INSERT INTO  Volume2(volume_num,auteur,nbrPage,type_volume,refdocument) VALUES (9,'Sylvain Tesson',789,'Livre',ref_document);
dbms_output.put_line('la table Volume est remplie!!!');
END AddNewtoVolume2;
/

--procedure6:
 CREATE OR REPLACE  PROCEDURE AddNewtoJournal2
 AS
    fk_Document_id REF Document_type;
 BEGIN
 select REF(i) into fk_Document_id
 from Document2 i
 where document_num=7;
 INSERT INTO  Journal2(journal_num,date_parution,refdocument) VALUES (1,'1-may-2022',fk_Document_id);

 select REF(i) into fk_Document_id
 from Document2 i
 where document_num=8;
 INSERT INTO  Journal2(journal_num,date_parution,refdocument) VALUES (2,'1-may-2022',fk_Document_id);

 select REF(i) into fk_Document_id
 from Document2 i
 where document_num=12;
 INSERT INTO  Journal2(journal_num,date_parution,refdocument) VALUES (3,'1-may-2022',fk_Document_id);


 END AddNewtoJournal2;
 /


--procedure7:
 CREATE OR REPLACE  PROCEDURE AddNewtoLivre2 AS
 ref_adherent REF Adherent_type;
 ref_volume REF Volume_type;
 BEGIN
 select REF(i) into  ref_adherent
 from Adherent2  i
 where adherent_num=1;

  select REF(i) into ref_volume
  from Volume2  i
  where volume_num=7;
  INSERT INTO  Livre2(livre_num,disponible,refadherent,  refvolume ) VALUES (1,'disponible',ref_adherent,ref_volume);

  select REF(i) into  ref_adherent
  from Adherent2  i
  where adherent_num=2;

  select REF(i) into ref_volume
  from Volume2  i
  where volume_num=1;
  INSERT INTO  Livre2(livre_num,disponible,refadherent,  refvolume ) VALUES (2,'disponible',ref_adherent,ref_volume);

  select REF(i) into  ref_adherent
  from Adherent2  i
  where adherent_num=4;

  select REF(i) into ref_volume
  from Volume2  i
  where volume_num=1;
  INSERT INTO  Livre2(livre_num,disponible,refadherent,  refvolume ) VALUES (3,'non disponible',ref_adherent,ref_volume);

  select REF(i) into  ref_adherent
  from Adherent2  i
  where adherent_num=5;

  select REF(i) into ref_volume
  from Volume2  i
  where volume_num=7;
  INSERT INTO  Livre2(livre_num,disponible,refadherent,  refvolume ) VALUES (4,'disponible',ref_adherent,ref_volume);

  select REF(i) into  ref_adherent
  from Adherent2  i
  where adherent_num=2;

  select REF(i) into ref_volume
  from Volume2  i
  where volume_num=8;
  INSERT INTO  Livre2(livre_num,disponible,refadherent,  refvolume ) VALUES (5,'non disponible',ref_adherent,ref_volume);

  select REF(i) into  ref_adherent
  from Adherent2  i
  where adherent_num=4;

  select REF(i) into ref_volume
  from Volume2  i
  where volume_num=8;
  INSERT INTO  Livre2(livre_num,disponible,refadherent,  refvolume ) VALUES (6,'non disponible',ref_adherent,ref_volume);


  select REF(i) into  ref_adherent
  from Adherent2  i
  where adherent_num=5;

  select REF(i) into ref_volume
  from Volume2  i
  where volume_num=9;
  INSERT INTO  Livre2(livre_num,disponible,refadherent,  refvolume ) VALUES (7,'disponible',ref_adherent,ref_volume);

  select REF(i) into  ref_adherent
  from Adherent2  i
  where adherent_num=5;

  select REF(i) into ref_volume
  from Volume2  i
  where volume_num=1;
  INSERT INTO  Livre2(livre_num,disponible,refadherent,  refvolume ) VALUES (8,'disponible',ref_adherent,ref_volume);

  dbms_output.put_line('la table Livre est remplie!!!');
END AddNewtoLivre2 ;
/


--procedure8:
 CREATE OR REPLACE  PROCEDURE AddNewtoBD2 AS
 ref_volume REF Volume_type;
 BEGIN
 select REF(i) into  ref_volume
 from Volume2  i
 where volume_num=2;
  INSERT INTO  BD2(bd_num,dessinateur,refvolume) VALUES (1,'Hergé',ref_volume);

  select REF(i) into  ref_volume
  from Volume2  i
  where volume_num=4;
  INSERT INTO  BD2(bd_num,dessinateur,refvolume) VALUES (2,'Manu Larcenet',ref_volume);

  select REF(i) into ref_volume
  from Volume2  i
  where volume_num=6;
  INSERT INTO  BD2(bd_num,dessinateur,refvolume) VALUES (3,'Fred',ref_volume);
    dbms_output.put_line('la table BD est remplie!!!');
 END AddNewtoBD2;
 /

 --procedure9:
  CREATE OR REPLACE  PROCEDURE AddNewtoDictionnaire2 AS
   ref_volume REF Volume_type;
  BEGIN
  select REF(i) into ref_volume
  from Volume2  i
  where volume_num=5;
  INSERT INTO  Dictionnaire2(dictionnaire_num,refvolume) VALUES (1, ref_volume);

   select REF(i) into ref_volume
   from Volume2  i
   where volume_num=3;
   INSERT INTO  Dictionnaire2(dictionnaire_num,refvolume) VALUES (2,ref_volume);
 END AddNewtoDictionnaire2;
 /

--procedure10:
 CREATE OR REPLACE  PROCEDURE AddNewtoEmprunte2 AS
 ref_adherent REF Adherent_type;
 ref_Livre REF Livre_type;
 BEGIN
  select REF(i) into ref_adherent
  from Adherent2  i
  where adherent_num=1;

  select REF(i) into ref_livre
  from Livre2  i
  where livre_num=7;
  INSERT INTO  Emprunte2(emprunte_num ,livre_id,date_emprunt,date_retour,depasseDelai,refadherent, refLivre) VALUES (1,7,null,null,'non', ref_adherent,ref_Livre);

  select REF(i) into ref_adherent
  from Adherent2  i
  where adherent_num=2;

  select REF(i) into ref_livre
  from Livre2  i
  where livre_num=1;
  INSERT INTO  Emprunte2(emprunte_num ,livre_id,date_emprunt,date_retour,depasseDelai,refadherent, refLivre)  VALUES (2,1,'7-april-2022','22-april-2022','oui', ref_adherent,ref_Livre);

  select REF(i) into ref_adherent
  from Adherent2  i
  where adherent_num=4;

  select REF(i) into ref_livre
  from Livre2  i
  where livre_num=1;
  INSERT INTO  Emprunte2(emprunte_num ,livre_id,date_emprunt,date_retour,depasseDelai,refadherent, refLivre) VALUES (4,1,'9-april-2021','25-april-2021','oui',  ref_adherent,ref_Livre);

  select REF(i) into  ref_adherent
  from Adherent2  i
  where adherent_num=5;

  select REF(i) into ref_livre
  from Livre2  i
  where livre_num=7;
    INSERT INTO  Emprunte2(emprunte_num ,livre_id,date_emprunt,date_retour,depasseDelai,refadherent, refLivre)  VALUES (5,7,'8-may-2021','23-june-2021','oui', ref_adherent,ref_Livre);

  select REF(i) into  ref_adherent
  from Adherent2  i
  where adherent_num=2;

  select REF(i) into ref_livre
  from Livre2  i
  where livre_num=8;
    INSERT INTO  Emprunte2(emprunte_num ,livre_id,date_emprunt,date_retour,depasseDelai,refadherent, refLivre)  VALUES (2,8,null,null,'non', ref_adherent,ref_Livre);

  select REF(i) into  ref_adherent
  from Adherent2  i
  where adherent_num=4;

  select REF(i) into ref_livre
  from Livre2  i
  where livre_num=8;
    INSERT INTO  Emprunte2(emprunte_num ,livre_id,date_emprunt,date_retour,depasseDelai,refadherent, refLivre)  VALUES (4,8,'11-september-2022','26-october-2022','non', ref_adherent,ref_Livre);

  select REF(i) into  ref_adherent
  from Adherent2  i
  where adherent_num=5;

  select REF(i) into ref_livre
  from Livre2  i
  where livre_num=8;
    INSERT INTO  Emprunte2(emprunte_num ,livre_id,date_emprunt,date_retour,depasseDelai,refadherent, refLivre)  VALUES (5,8,null,null,'non', ref_adherent,ref_Livre);

  select REF(i) into  ref_adherent
  from Adherent2  i
  where adherent_num=5;

  select REF(i) into ref_livre
  from Livre2  i
  where livre_num=1;
    INSERT INTO  Emprunte2(emprunte_num ,livre_id,date_emprunt,date_retour,depasseDelai,refadherent, refLivre)  VALUES (5,1,null,null,'non', ref_adherent,ref_Livre);

END;
/
