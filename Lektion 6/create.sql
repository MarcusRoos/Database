CREATE SCHEMA sportsclub;
SET search_path = sportsclub, public, pg_catalog;

CREATE TABLE postort (
  postnr  CHAR(5),
  postort  VARCHAR(20) NOT NULL,
CONSTRAINT postort_pk PRIMARY KEY(postnr));

CREATE TABLE person (
  id  SERIAL,
  "förnamn"  VARCHAR(20) NOT NULL,
  efternamn  VARCHAR(30) NOT NULL,
  adress  VARCHAR(30) NOT NULL,
  postnr  CHAR(5),
  epost VARCHAR(50) NOT NULL, 
  password CHAR(32) UNIQUE,
CONSTRAINT person_pk PRIMARY KEY(id),
CONSTRAINT person_un UNIQUE(epost),
CONSTRAINT person_fk FOREIGN KEY(postnr) REFERENCES postort(postnr));

CREATE TABLE inloggning (
  id  SERIAL,
  ip  VARCHAR(20) NOT NULL,
  tidpunkt TIMESTAMP NOT NULL,
  successful  BOOLEAN NOT NULL,
CONSTRAINT inloggning_pk PRIMARY KEY(id),
CONSTRAINT inloggning_fk FOREIGN KEY (id) REFERENCES person(id) ON UPDATE CASCADE ON DELETE CASCADE);

CREATE TABLE administratör(
  id  SERIAL,
  arvode INT NOT NULL DEFAULT '0',
CONSTRAINT administratör_pk PRIMARY KEY(id),
CONSTRAINT administratör_fk FOREIGN KEY (id) REFERENCES person(id) ON UPDATE CASCADE ON DELETE CASCADE);

CREATE TABLE medlem (
  id  INT,
  medlemsnr SERIAL NOT NULL,
 datum_medlem DATE NOT NULL,
CONSTRAINT medlem_pk PRIMARY KEY(id),
CONSTRAINT medlem_fk FOREIGN KEY (id) REFERENCES person(id) ON UPDATE CASCADE ON DELETE CASCADE);

CREATE TABLE ledare (
  id  INT,
  utbildning VARCHAR(60),
CONSTRAINT ledare_pk PRIMARY KEY(id),
CONSTRAINT ledare_fk FOREIGN KEY (id) REFERENCES person(id) ON UPDATE CASCADE ON DELETE CASCADE);

CREATE TABLE nyhet (
  id  SERIAL,
	rubrik VARCHAR(50),
	innehåll VARCHAR(50),
	datum_skapad TIMESTAMP default CURRENT_TIMESTAMP,
	datum_från TIMESTAMP default '-infinity',
	datum_till TIMESTAMP default 'infinity',
CONSTRAINT nyhet_pk PRIMARY KEY(id));

CREATE TABLE avgift (
  id  SERIAL,
	avgift INT,
	år CHAR(4),
CONSTRAINT avgift_pk PRIMARY KEY(id),
CONSTRAINT avgift_un UNIQUE(år),
CONSTRAINT avgift_fk FOREIGN KEY(id) REFERENCES person(id));

CREATE TABLE medlemsavgift(
  medlemsid  INT,
  avgiftsid INT,
  betald BOOLEAN,
CONSTRAINT medlemsavgift_pk PRIMARY KEY(medlemsid, avgiftsid),
CONSTRAINT medlemsavgift_fk1 FOREIGN KEY(medlemsid) REFERENCES medlem(id),
CONSTRAINT medlemsavgift_fk2 FOREIGN KEY(avgiftsid) REFERENCES avgift(id));

CREATE TABLE sektion(
  id SERIAL,
  namn VARCHAR (50) NOT NULL,
  beskrivning VARCHAR(50) NOT NULL,
  datum_bildat DATE NOT NULL,
CONSTRAINT sektion_pk PRIMARY KEY(id));

CREATE TABLE medlemssektion(
  medlemsid INT,
  sektionsid INT,
CONSTRAINT medlemssektion_pk PRIMARY KEY(medlemsid, sektionsid));

SET search_path = public, sportsclub, pg_catalog;