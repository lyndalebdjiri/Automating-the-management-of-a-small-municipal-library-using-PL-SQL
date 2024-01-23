set serveroutput on
--procedure1:
CREATE OR REPLACE  PROCEDURE AddNewtoBibliotheque(
  nomBibliotheque in VARCHAR2,
  adresseBibliotheque in VARCHAR2,
  numero_telephone in VARCHAR2,
  email  in VARCHAR2
)
 AS
 BEGIN
  INSERT INTO  Bibliotheque(nomBibliotheque,adresseBibliotheque,numero_telephone,email) VALUES (nomBibliotheque,adresseBibliotheque,numero_telephone,email);
  end;
  /
begin
AddNewtoBibliotheque('Bibliotheque Municipale Hamou Boutlélis','Rue Dourgham Adda, Alger 31000','0678543256','Hamou Boutlélis@gmail.com');
  dbms_output.put_line('la table Bibliotheque est remplie!!!');
end;
/

--procedure2:
CREATE OR REPLACE  PROCEDURE AddNewtoAdherent(
  nom in VARCHAR2,
  Prenom in VARCHAR2,
  dateNaissance in  DATE,
  email in VARCHAR2,
  adresse in VARCHAR2,
  dateInscription in  DATE,
  nombreEmpruntsEnCour in  NUMBER,
  fk_Bibliotheque_id in NUMBER
)
AS
BEGIN
  INSERT INTO  Adherent(nom,Prenom,dateNaissance,email,adresse,dateInscription,nombreEmpruntsEnCour,fk_Bibliotheque_id) VALUES(nom,Prenom,dateNaissance,email,adresse,dateInscription,nombreEmpruntsEnCour,fk_Bibliotheque_id);
END;
/
begin
 AddNewtoAdherent('Tahar','Rahim','06-MAY-1981','Tahar.Rahim@gmail.com','Boulevard Lahcène Mimouni','05-MAY-2022',1,1);
 AddNewtoAdherent('Lyes', 'Salem','9-oct-1988','Lyes.Salem88@gamail.com','Rue Abane Ramdane','3-JAN-2022',2,1);
 AddNewtoAdherent('Fatima','Makhloufi','12-JAN-1990','Fatima.Makhloufi90@gmail.com','Avenue Cheïkh Khaldi Abdelkader','5-Sep-2021',0,1);
 AddNewtoAdherent ('Mustafa','Hamdi','29-Sep-1999','Mustafa.Hamdi26@gmail.com','Bin Ziyyad Ahmad Street','5-FEB-2022',2,1);
 AddNewtoAdherent ('Omar','Harrachi','10-FEB-2002','Omar.Harrachi@gmail.com','Rue Benalia Keddour','4-March-2022',3,1);
 dbms_output.put_line('la table Adherent est remplie!!!');
end;
/


--procedure3:
 CREATE OR REPLACE  PROCEDURE AddNewtoDocument(
   titre in VARCHAR2,
   prix in FLOAT,
   type_document  in VARCHAR2,
   fk_Bibliotheque_id in NUMBER
 )
AS
BEGIN
 INSERT INTO  Document(titre,prix,type_document,fk_Bibliotheque_id ) VALUES (titre,prix,type_document,fk_Bibliotheque_id);
END;
/
begin
AddNewtoDocument('Les Fleurs du mal',1200.00,'Volume',1);
AddNewtoDocument('Les Aventures de Tintin, Le secret de la Licorne',1010.00,'Volume',1);
AddNewtoDocument('Le Petit Robert de la langue française',4500.00,'Volume',1);
AddNewtoDocument('Cambridge English.',5570.00,'Volume',1);
AddNewtoDocument('Persepolis',1200.00,'Volume',1);
AddNewtoDocument('Joséphine',1455.00,'Volume',1);
AddNewtoDocument('Liberte',25.00,'journal',1);
AddNewtoDocument('El Watan',15.00,'journal',1);
AddNewtoDocument('Les Raisins de la colère',3200.00,'Volume',1);
AddNewtoDocument('À la recherche du temps perdu',2200.00,'Volume',1);
AddNewtoDocument('Voyage au bout de la nuit.',3000.00,'Volume',1);
AddNewtoDocument('La Nation Arabe',33.00,'journal',1);
dbms_output.put_line('la table Document est remplie!!!');
end;
/

--procedure4:
CREATE OR REPLACE  PROCEDURE AddNewtoJournal(
  date_parution in Date,
  fk_Document_id  in NUMBER
)
 AS
 BEGIN
  INSERT INTO  Journal (date_parution,fk_Document_id) VALUES (date_parution,fk_Document_id);


 END;
 /
 BEGIN
 AddNewtoJournal('1-may-2022',7);
 AddNewtoJournal('1-may-2022',8);
 AddNewtoJournal('1-may-2022',12);
 dbms_output.put_line('la table journal est remplie!!!');
 end;
 /


 --procedure5:
  CREATE OR REPLACE  PROCEDURE AddNewtoVolume(
    volume_id NUMBER,
    auteur in VARCHAR2,
    nbrPage in NUMBER,
    type_volume in VARCHAR2,
    fk_Document_id  NUMBER
  )
  AS
  BEGIN
   INSERT INTO  Volume(volume_id ,auteur,nbrPage,type_volume,fk_Document_id) VALUES(volume_id ,auteur,nbrPage,type_volume,fk_Document_id);
  END;
  /
  begin
  AddNewtoVolume(1,'Guillaume Musso',345,'Livre',1);
  AddNewtoVolume(2,'Michel Bussi',50,'BD',2);
  AddNewtoVolume(3,'Alain Rey',2880,'Dictionnaire',3);
  AddNewtoVolume(4,'J.K. Rowling',89,'BD',4);
  AddNewtoVolume(5,'Valérie Perrin',3000,'Dictionnaire',5);
  AddNewtoVolume(6,'Olivier Norek',66,'BD',6);
  AddNewtoVolume(7,'Albert Camus',345,'Livre',9);
  AddNewtoVolume(8,'Leïla Slimani',567,'Livre',10);
  AddNewtoVolume(9,'Sylvain Tesson',789,'Livre',11);
  dbms_output.put_line('la table Volume est remplie!!!');
  end;
  /

--procedure6:
 CREATE OR REPLACE  PROCEDURE AddNewtoLivre(
    livre_id in NUMBER,
   disponible in VARCHAR2,
   fk_adherent_id in NUMBER,
   fk_volume_id in NUMBER
 )
 AS
 BEGIN
 INSERT INTO  Livre(  livre_id ,disponible,fk_adherent_id,fk_volume_id) VALUES(  livre_id ,disponible,fk_adherent_id,fk_volume_id);
END ;
/
BEGIN
AddNewtoLivre(1,'disponible',1,7);
AddNewtoLivre(2,'disponible',2,1);
AddNewtoLivre(3,'non disponible',4,1);
AddNewtoLivre(4,'disponible',5,7);
AddNewtoLivre(5,'non disponible',2,8);
AddNewtoLivre(6,'non disponible',4,8);
AddNewtoLivre(7,'disponible',5,9);
AddNewtoLivre(8,'disponible',5,1);
dbms_output.put_line('la table Livre est remplie!!!');
end;
/

--procedure8:
 CREATE OR REPLACE  PROCEDURE AddNewtoEmprunte(
   adherent_id in NUMBER,
   livre_id in NUMBER,
   date_emprunt in Date,
   date_retour in DATE,
   fk_adherent in NUMBER,
   fk_livre in NUMBER
 )
 AS
 BEGIN
 INSERT INTO  Emprunte (adherent_id,livre_id,date_emprunt,date_retour,fk_adherent,fk_livre) VALUES (adherent_id,livre_id,date_emprunt,date_retour,fk_adherent,fk_livre);

END ;
/
BEGIN
 AddNewtoEmprunte(1,7,null,null,1,7);
 AddNewtoEmprunte(2,1,'7-april-2022','22-april-2022',2,1);
 AddNewtoEmprunte(4,1,'9-april-2021','25-april-2021',4,1);
 AddNewtoEmprunte(5,7,'8-may-2021','23-june-2021',5,7);
 AddNewtoEmprunte(2,8,'8-april-2022','23-april-2022',2,8);
 AddNewtoEmprunte(4,8,'11-september-2022','26-october-2022',4,8);
 AddNewtoEmprunte(5,8,null,null,5,8);
 AddNewtoEmprunte(5,1,null,null,5,1);
  dbms_output.put_line('la table Emprunte est remplie!!!');
end;
/




--procedure10:
 CREATE OR REPLACE  PROCEDURE AddNewtoDictionnaire(
   fk_volume in NUMBER
 )
 AS
 BEGIN
  INSERT INTO  Dictionnaire(fk_volume_id) VALUES (fk_volume);
  dbms_output.put_line('la table Dictionnaire est remplie!!!');
END;
/
begin
 AddNewtoDictionnaire(5);
 AddNewtoDictionnaire(3);
 dbms_output.put_line('la table Dictionnaire est remplie!!!');
end;
/

--procedure11:
 CREATE OR REPLACE  PROCEDURE AddNewtoBD(
   dessinateur in VARCHAR2,
   fk_volume_id in NUMBER
 )
 AS
 BEGIN
  INSERT INTO  BD(dessinateur,fk_volume_id) VALUES (dessinateur,fk_volume_id);
 END;
 /
 BEGIN
 AddNewtoBD('Hergé',2);
 AddNewtoBD('Manu Larcenet',4);
 AddNewtoBD('Fred',6);
 dbms_output.put_line('la table BD est remplie!!!');
 end;
 /
