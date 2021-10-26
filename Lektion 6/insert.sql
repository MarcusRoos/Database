INSERT INTO postort VALUES('98764','Torpet');
INSERT INTO postort VALUES('12365','Kommunen');
INSERT INTO postort VALUES('45672','Skeden');

INSERT INTO person VALUES(DEFAULT, 'Johan','Skaft','Enväg','98764','enmail@mail.mail','lösenord');
INSERT INTO person VALUES(DEFAULT, 'Caren','Moop','Vägen','12365','enmail1@mail.mail','lösenord1');
INSERT INTO person VALUES(DEFAULT, 'Petra','Eriksson','Drottninggatan','98764','enmail2@mail.mail','lösenord2');

INSERT INTO inloggning VALUES(DEFAULT,'192.168.1.123',CURRENT_TIMESTAMP,'True');
INSERT INTO inloggning VALUES(DEFAULT,'196.167.52.145',CURRENT_TIMESTAMP,'True');
INSERT INTO inloggning VALUES(DEFAULT,'192.168.5.41',CURRENT_TIMESTAMP,'False');

INSERT INTO administratör VALUES(DEFAULT,'192365');
INSERT INTO administratör VALUES(DEFAULT,'976432');
INSERT INTO administratör VALUES(DEFAULT,'654987');

INSERT INTO medlem VALUES('1',DEFAULT,CURRENT_DATE);
INSERT INTO medlem VALUES('3',DEFAULT,CURRENT_DATE);
INSERT INTO medlem VALUES('2',DEFAULT,CURRENT_DATE);

INSERT INTO ledare VALUES('1','Utbildning321');
INSERT INTO ledare VALUES('2','EnFränUtbildning');
INSERT INTO ledare VALUES('3','Snickare och Skorstensreperatör');

INSERT INTO nyhet VALUES(DEFAULT,'Rubrik123','Innehållet3213');
INSERT INTO nyhet VALUES(DEFAULT,'Rubrik123','Innehållet3213','2020-04-29 20:35:33.524146','2020-05-21','2020-07-25');
INSERT INTO nyhet VALUES(DEFAULT,'Rubrik654','Innehåll654',DEFAULT,'2020-05-21','2020-07-25');

INSERT INTO avgift VALUES(DEFAULT,'32165','2002');
INSERT INTO avgift VALUES(DEFAULT,'32165','2004');
INSERT INTO avgift VALUES(DEFAULT,'64431','2007');

INSERT INTO medlemsavgift VALUES('1','1','True');
INSERT INTO medlemsavgift VALUES('3','3','True');
INSERT INTO medlemsavgift VALUES('4','4','False');

INSERT INTO sektion VALUES(DEFAULT,'Fotbollsektion','Här spelar vi fotboll','2013-02-24');
INSERT INTO sektion VALUES(DEFAULT,'Ishockey','Här spelar vi ishockey','2011-07-21');
INSERT INTO sektion VALUES(DEFAULT,'Handboll','Här spelar vi handboll','2019-03-11');

INSERT INTO medlemssektion VALUES('1','1');
INSERT INTO medlemssektion VALUES('3','2');
INSERT INTO medlemssektion VALUES('3','1');