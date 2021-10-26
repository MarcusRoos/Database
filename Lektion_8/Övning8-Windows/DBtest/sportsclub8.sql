--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.1
-- Dumped by pg_dump version 9.5.1

-- Started on 2016-04-14 15:13:21

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 9 (class 2615 OID 16554)
-- Name: sportsclub8; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA sportsclub8;


SET search_path = sportsclub8, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 16555)
-- Name: administratör; Type: TABLE; Schema: sportsclub8; Owner: -
--

CREATE TABLE "administratör" (
    id integer NOT NULL,
    arvode integer DEFAULT 0 NOT NULL
);


--
-- TOC entry 184 (class 1259 OID 16559)
-- Name: avgift; Type: TABLE; Schema: sportsclub8; Owner: -
--

CREATE TABLE avgift (
    id integer NOT NULL,
    avgift integer NOT NULL,
    "år" character(4) NOT NULL
);


--
-- TOC entry 185 (class 1259 OID 16562)
-- Name: avgift_id_seq; Type: SEQUENCE; Schema: sportsclub8; Owner: -
--

CREATE SEQUENCE avgift_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2222 (class 0 OID 0)
-- Dependencies: 185
-- Name: avgift_id_seq; Type: SEQUENCE OWNED BY; Schema: sportsclub8; Owner: -
--

ALTER SEQUENCE avgift_id_seq OWNED BY avgift.id;


--
-- TOC entry 186 (class 1259 OID 16564)
-- Name: inloggning; Type: TABLE; Schema: sportsclub8; Owner: -
--

CREATE TABLE inloggning (
    id integer NOT NULL,
    ip text NOT NULL,
    tidpunkt timestamp without time zone NOT NULL,
    lyckad boolean NOT NULL,
    personid integer
);


--
-- TOC entry 187 (class 1259 OID 16570)
-- Name: inloggning_id_seq; Type: SEQUENCE; Schema: sportsclub8; Owner: -
--

CREATE SEQUENCE inloggning_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2223 (class 0 OID 0)
-- Dependencies: 187
-- Name: inloggning_id_seq; Type: SEQUENCE OWNED BY; Schema: sportsclub8; Owner: -
--

ALTER SEQUENCE inloggning_id_seq OWNED BY inloggning.id;


--
-- TOC entry 188 (class 1259 OID 16572)
-- Name: ledare; Type: TABLE; Schema: sportsclub8; Owner: -
--

CREATE TABLE ledare (
    id integer NOT NULL,
    utbildning text
);


--
-- TOC entry 189 (class 1259 OID 16578)
-- Name: medlem; Type: TABLE; Schema: sportsclub8; Owner: -
--

CREATE TABLE medlem (
    id integer NOT NULL,
    medlemsnr integer NOT NULL,
    datum_medlem date NOT NULL
);


--
-- TOC entry 190 (class 1259 OID 16581)
-- Name: medlem_medlemsnr_seq; Type: SEQUENCE; Schema: sportsclub8; Owner: -
--

CREATE SEQUENCE medlem_medlemsnr_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2224 (class 0 OID 0)
-- Dependencies: 190
-- Name: medlem_medlemsnr_seq; Type: SEQUENCE OWNED BY; Schema: sportsclub8; Owner: -
--

ALTER SEQUENCE medlem_medlemsnr_seq OWNED BY medlem.medlemsnr;


--
-- TOC entry 191 (class 1259 OID 16583)
-- Name: medlemsavgift; Type: TABLE; Schema: sportsclub8; Owner: -
--

CREATE TABLE medlemsavgift (
    medlemsid integer NOT NULL,
    avgiftsid integer NOT NULL,
    betald boolean
);


--
-- TOC entry 192 (class 1259 OID 16586)
-- Name: medlemssektion; Type: TABLE; Schema: sportsclub8; Owner: -
--

CREATE TABLE medlemssektion (
    medlemsid integer NOT NULL,
    sektionsid integer NOT NULL
);


--
-- TOC entry 193 (class 1259 OID 16589)
-- Name: nyhet; Type: TABLE; Schema: sportsclub8; Owner: -
--

CREATE TABLE nyhet (
    id integer NOT NULL,
    rubrik text NOT NULL,
    "innehåll" text NOT NULL,
    datum_skapad timestamp without time zone DEFAULT now(),
    "datum_från" timestamp without time zone DEFAULT '-infinity'::timestamp without time zone,
    datum_till timestamp without time zone DEFAULT 'infinity'::timestamp without time zone,
    ledareid integer,
    sektionsid integer
);


--
-- TOC entry 194 (class 1259 OID 16598)
-- Name: nyhet_id_seq; Type: SEQUENCE; Schema: sportsclub8; Owner: -
--

CREATE SEQUENCE nyhet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2225 (class 0 OID 0)
-- Dependencies: 194
-- Name: nyhet_id_seq; Type: SEQUENCE OWNED BY; Schema: sportsclub8; Owner: -
--

ALTER SEQUENCE nyhet_id_seq OWNED BY nyhet.id;


--
-- TOC entry 195 (class 1259 OID 16600)
-- Name: person; Type: TABLE; Schema: sportsclub8; Owner: -
--

CREATE TABLE person (
    id integer NOT NULL,
    "förnamn" text NOT NULL,
    efternamn text NOT NULL,
    gatuadress text NOT NULL,
    postnr character(5) NOT NULL,
    epost text NOT NULL,
    "lösenord" character(32) NOT NULL
);


--
-- TOC entry 196 (class 1259 OID 16606)
-- Name: person_id_seq; Type: SEQUENCE; Schema: sportsclub8; Owner: -
--

CREATE SEQUENCE person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2226 (class 0 OID 0)
-- Dependencies: 196
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: sportsclub8; Owner: -
--

ALTER SEQUENCE person_id_seq OWNED BY person.id;


--
-- TOC entry 197 (class 1259 OID 16608)
-- Name: postort; Type: TABLE; Schema: sportsclub8; Owner: -
--

CREATE TABLE postort (
    postnr character(5) NOT NULL,
    postort text NOT NULL
);


--
-- TOC entry 198 (class 1259 OID 16614)
-- Name: sektion; Type: TABLE; Schema: sportsclub8; Owner: -
--

CREATE TABLE sektion (
    id integer NOT NULL,
    namn text NOT NULL,
    beskrivning text NOT NULL,
    datum_bildat date NOT NULL,
    ledareid integer
);


--
-- TOC entry 199 (class 1259 OID 16620)
-- Name: sektion_id_seq; Type: SEQUENCE; Schema: sportsclub8; Owner: -
--

CREATE SEQUENCE sektion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2227 (class 0 OID 0)
-- Dependencies: 199
-- Name: sektion_id_seq; Type: SEQUENCE OWNED BY; Schema: sportsclub8; Owner: -
--

ALTER SEQUENCE sektion_id_seq OWNED BY sektion.id;


--
-- TOC entry 2040 (class 2604 OID 16622)
-- Name: id; Type: DEFAULT; Schema: sportsclub8; Owner: -
--

ALTER TABLE ONLY avgift ALTER COLUMN id SET DEFAULT nextval('avgift_id_seq'::regclass);


--
-- TOC entry 2041 (class 2604 OID 16623)
-- Name: id; Type: DEFAULT; Schema: sportsclub8; Owner: -
--

ALTER TABLE ONLY inloggning ALTER COLUMN id SET DEFAULT nextval('inloggning_id_seq'::regclass);


--
-- TOC entry 2042 (class 2604 OID 16624)
-- Name: medlemsnr; Type: DEFAULT; Schema: sportsclub8; Owner: -
--

ALTER TABLE ONLY medlem ALTER COLUMN medlemsnr SET DEFAULT nextval('medlem_medlemsnr_seq'::regclass);


--
-- TOC entry 2046 (class 2604 OID 16625)
-- Name: id; Type: DEFAULT; Schema: sportsclub8; Owner: -
--

ALTER TABLE ONLY nyhet ALTER COLUMN id SET DEFAULT nextval('nyhet_id_seq'::regclass);


--
-- TOC entry 2047 (class 2604 OID 16626)
-- Name: id; Type: DEFAULT; Schema: sportsclub8; Owner: -
--

ALTER TABLE ONLY person ALTER COLUMN id SET DEFAULT nextval('person_id_seq'::regclass);


--
-- TOC entry 2048 (class 2604 OID 16627)
-- Name: id; Type: DEFAULT; Schema: sportsclub8; Owner: -
--

ALTER TABLE ONLY sektion ALTER COLUMN id SET DEFAULT nextval('sektion_id_seq'::regclass);


--
-- TOC entry 2201 (class 0 OID 16555)
-- Dependencies: 183
-- Data for Name: administratör; Type: TABLE DATA; Schema: sportsclub8; Owner: -
--

INSERT INTO "administratör" VALUES (1, 500);
INSERT INTO "administratör" VALUES (12, 1000);


--
-- TOC entry 2202 (class 0 OID 16559)
-- Dependencies: 184
-- Data for Name: avgift; Type: TABLE DATA; Schema: sportsclub8; Owner: -
--

INSERT INTO avgift VALUES (1, 900, '2008');
INSERT INTO avgift VALUES (2, 900, '2009');
INSERT INTO avgift VALUES (3, 900, '2010');
INSERT INTO avgift VALUES (4, 1000, '2011');
INSERT INTO avgift VALUES (5, 1100, '2012');
INSERT INTO avgift VALUES (6, 1100, '2013');
INSERT INTO avgift VALUES (7, 1050, '2014');


--
-- TOC entry 2228 (class 0 OID 0)
-- Dependencies: 185
-- Name: avgift_id_seq; Type: SEQUENCE SET; Schema: sportsclub8; Owner: -
--

SELECT pg_catalog.setval('avgift_id_seq', 7, true);


--
-- TOC entry 2204 (class 0 OID 16564)
-- Dependencies: 186
-- Data for Name: inloggning; Type: TABLE DATA; Schema: sportsclub8; Owner: -
--

INSERT INTO inloggning VALUES (1, '192.168.10.100', '2014-10-19 10:23:54', true, 1);
INSERT INTO inloggning VALUES (2, '85.77.154.36', '2014-10-19 11:11:26', true, 12);
INSERT INTO inloggning VALUES (3, '85.77.154.36', '2014-10-19 12:53:57', true, 12);
INSERT INTO inloggning VALUES (4, '192.168.10.100', '2014-10-20 08:15:09', false, 1);
INSERT INTO inloggning VALUES (5, '192.168.10.100', '2014-10-20 08:15:31', false, 1);
INSERT INTO inloggning VALUES (6, '192.168.10.100', '2014-10-20 08:16:11', true, 1);
INSERT INTO inloggning VALUES (7, '73.123.55.209', '2010-01-01 13:57:41', true, 2);
INSERT INTO inloggning VALUES (8, '73.123.55.209', '2014-11-23 23:21:19', true, 2);
INSERT INTO inloggning VALUES (9, '67.76.103.11', '2014-11-25 10:43:22', true, 2);
INSERT INTO inloggning VALUES (10, '83.83.203.103', '2012-12-02 09:00:17', true, 4);
INSERT INTO inloggning VALUES (11, '83.83.203.103', '2012-12-03 09:00:47', true, 4);
INSERT INTO inloggning VALUES (12, '83.83.203.103', '2012-12-04 09:00:36', true, 4);
INSERT INTO inloggning VALUES (13, '83.83.203.103', '2012-12-05 09:02:11', false, 4);
INSERT INTO inloggning VALUES (14, '83.83.203.103', '2012-12-05 09:02:30', true, 4);
INSERT INTO inloggning VALUES (15, '121.99.232.56', '2012-03-02 19:12:31', false, 5);
INSERT INTO inloggning VALUES (16, '126.199.32.156', '2013-11-01 15:55:55', false, 6);
INSERT INTO inloggning VALUES (17, '66.216.96.206', '2014-09-26 07:03:46', true, 7);
INSERT INTO inloggning VALUES (18, '66.216.96.206', '2014-09-30 08:53:06', true, 7);
INSERT INTO inloggning VALUES (19, '88.33.66.111', '2014-10-30 09:53:06', true, 7);
INSERT INTO inloggning VALUES (20, '88.33.66.111', '2014-10-30 10:45:19', true, 8);
INSERT INTO inloggning VALUES (21, '88.33.66.111', '2014-11-01 20:09:44', false, 8);
INSERT INTO inloggning VALUES (22, '88.33.66.111', '2014-11-01 20:10:10', true, 8);
INSERT INTO inloggning VALUES (23, '144.145.146.147', '2013-12-31 23:59:59', true, 10);
INSERT INTO inloggning VALUES (24, '35.199.35.199', '2013-04-22 22:51:22', true, 11);
INSERT INTO inloggning VALUES (25, '35.199.35.199', '2013-04-23 11:36:50', false, 11);
INSERT INTO inloggning VALUES (26, '85.77.154.77', '2014-11-24 11:50:02', true, 12);


--
-- TOC entry 2229 (class 0 OID 0)
-- Dependencies: 187
-- Name: inloggning_id_seq; Type: SEQUENCE SET; Schema: sportsclub8; Owner: -
--

SELECT pg_catalog.setval('inloggning_id_seq', 26, true);


--
-- TOC entry 2206 (class 0 OID 16572)
-- Dependencies: 188
-- Data for Name: ledare; Type: TABLE DATA; Schema: sportsclub8; Owner: -
--

INSERT INTO ledare VALUES (12, 'fotbollsdomare 2013, ungdomsledare 2014');
INSERT INTO ledare VALUES (5, 'ungdomsledare 2012, gymnastikgruppledare 2013');
INSERT INTO ledare VALUES (10, 'fystränare 2010');


--
-- TOC entry 2207 (class 0 OID 16578)
-- Dependencies: 189
-- Data for Name: medlem; Type: TABLE DATA; Schema: sportsclub8; Owner: -
--

INSERT INTO medlem VALUES (2, 1, '2010-01-01');
INSERT INTO medlem VALUES (3, 2, '2014-03-23');
INSERT INTO medlem VALUES (4, 3, '2012-12-02');
INSERT INTO medlem VALUES (5, 4, '2012-12-02');
INSERT INTO medlem VALUES (6, 5, '2013-10-30');
INSERT INTO medlem VALUES (7, 6, '2014-02-19');
INSERT INTO medlem VALUES (8, 7, '2014-09-19');
INSERT INTO medlem VALUES (9, 8, '2010-08-08');
INSERT INTO medlem VALUES (10, 9, '2010-04-21');
INSERT INTO medlem VALUES (11, 10, '2013-04-21');
INSERT INTO medlem VALUES (12, 11, '2014-01-10');


--
-- TOC entry 2230 (class 0 OID 0)
-- Dependencies: 190
-- Name: medlem_medlemsnr_seq; Type: SEQUENCE SET; Schema: sportsclub8; Owner: -
--

SELECT pg_catalog.setval('medlem_medlemsnr_seq', 11, true);


--
-- TOC entry 2209 (class 0 OID 16583)
-- Dependencies: 191
-- Data for Name: medlemsavgift; Type: TABLE DATA; Schema: sportsclub8; Owner: -
--

INSERT INTO medlemsavgift VALUES (2, 3, true);
INSERT INTO medlemsavgift VALUES (9, 3, true);
INSERT INTO medlemsavgift VALUES (10, 3, true);
INSERT INTO medlemsavgift VALUES (2, 4, true);
INSERT INTO medlemsavgift VALUES (2, 5, true);
INSERT INTO medlemsavgift VALUES (4, 5, true);
INSERT INTO medlemsavgift VALUES (5, 5, true);
INSERT INTO medlemsavgift VALUES (2, 6, true);
INSERT INTO medlemsavgift VALUES (4, 6, true);
INSERT INTO medlemsavgift VALUES (5, 6, true);
INSERT INTO medlemsavgift VALUES (6, 6, true);
INSERT INTO medlemsavgift VALUES (9, 6, true);
INSERT INTO medlemsavgift VALUES (10, 6, true);
INSERT INTO medlemsavgift VALUES (11, 6, true);
INSERT INTO medlemsavgift VALUES (10, 4, true);
INSERT INTO medlemsavgift VALUES (9, 4, true);
INSERT INTO medlemsavgift VALUES (10, 5, true);
INSERT INTO medlemsavgift VALUES (9, 5, true);
INSERT INTO medlemsavgift VALUES (3, 7, true);
INSERT INTO medlemsavgift VALUES (4, 7, true);
INSERT INTO medlemsavgift VALUES (5, 7, true);
INSERT INTO medlemsavgift VALUES (6, 7, true);
INSERT INTO medlemsavgift VALUES (7, 7, true);
INSERT INTO medlemsavgift VALUES (8, 7, true);
INSERT INTO medlemsavgift VALUES (10, 7, true);
INSERT INTO medlemsavgift VALUES (11, 7, true);
INSERT INTO medlemsavgift VALUES (12, 7, true);


--
-- TOC entry 2210 (class 0 OID 16586)
-- Dependencies: 192
-- Data for Name: medlemssektion; Type: TABLE DATA; Schema: sportsclub8; Owner: -
--

INSERT INTO medlemssektion VALUES (5, 1);
INSERT INTO medlemssektion VALUES (4, 1);
INSERT INTO medlemssektion VALUES (11, 1);
INSERT INTO medlemssektion VALUES (3, 1);
INSERT INTO medlemssektion VALUES (7, 1);
INSERT INTO medlemssektion VALUES (8, 1);
INSERT INTO medlemssektion VALUES (10, 2);
INSERT INTO medlemssektion VALUES (2, 2);
INSERT INTO medlemssektion VALUES (3, 2);
INSERT INTO medlemssektion VALUES (4, 2);
INSERT INTO medlemssektion VALUES (5, 2);
INSERT INTO medlemssektion VALUES (6, 2);
INSERT INTO medlemssektion VALUES (7, 2);
INSERT INTO medlemssektion VALUES (8, 2);
INSERT INTO medlemssektion VALUES (9, 2);
INSERT INTO medlemssektion VALUES (12, 3);
INSERT INTO medlemssektion VALUES (7, 3);
INSERT INTO medlemssektion VALUES (8, 3);
INSERT INTO medlemssektion VALUES (3, 3);


--
-- TOC entry 2211 (class 0 OID 16589)
-- Dependencies: 193
-- Data for Name: nyhet; Type: TABLE DATA; Schema: sportsclub8; Owner: -
--

INSERT INTO nyhet VALUES (1, 'Välkommen till fotbollssektionen!', 'Äntligen har fotbollssektionen bildats och vi hälsar dig hjärtligt välkommen till oss. Redan imorgon börjar träningen enligt utskickat schema.', '2012-01-01 09:00:00', '-infinity', 'infinity', 5, 1);
INSERT INTO nyhet VALUES (2, 'Välkommen till Innebandysektionen!', 'Vi är föreningens första sektion och jag hälsar alla medlemmar välkommen till oss. Tänk på att närvara vid nästa veckas upptaktsträning som startar på måndag kl 18.', '2010-04-01 09:00:00', '-infinity', 'infinity', 10, 2);
INSERT INTO nyhet VALUES (3, 'Innebandycup', 'Nästa vecka hålls vår årliga innebandycup. Vi söker fortfarande efter frivilliga som kan stå i serveringen. Hör av dig till ledaren om du kan ställa upp.', '2012-09-21 13:41:00', '-infinity', 'infinity', 10, 2);
INSERT INTO nyhet VALUES (4, 'Vinnare i lotteri', 'Nästa vecka Nästa vecka kommer vi att presentera vinnare av lotteriet som pågår just nu. Har du ännu inte köpt någon lott så har du fortfarande några få dagar på dig.', '2014-11-25 21:03:00', '-infinity', 'infinity', 10, 2);
INSERT INTO nyhet VALUES (5, 'Vinnare i lotteri', 'Första priset i lotteriet går till lotten med nummer 2123. Har du denna lott kontakta din ledare för att hämta ut priset. Grattis!', '2014-12-01 08:36:00', '2014-12-02 07:00:00', 'infinity', 10, 2);
INSERT INTO nyhet VALUES (6, 'Gott nytt 2013', 'Fotbollssektionen hälsar gott nytt år till alla medlemmar!', '2012-12-27 15:49:00', '2012-12-31 23:59:00', '2013-01-30 23:59:00', 5, 1);


--
-- TOC entry 2231 (class 0 OID 0)
-- Dependencies: 194
-- Name: nyhet_id_seq; Type: SEQUENCE SET; Schema: sportsclub8; Owner: -
--

SELECT pg_catalog.setval('nyhet_id_seq', 6, true);


--
-- TOC entry 2213 (class 0 OID 16600)
-- Dependencies: 195
-- Data for Name: person; Type: TABLE DATA; Schema: sportsclub8; Owner: -
--

INSERT INTO person VALUES (1, 'Robert', 'Jonsson', 'Lagmansvägen 37', '83432', 'robert.jonsson@miun.se', '684c851af59965b680086b7b4896ff98');
INSERT INTO person VALUES (2, 'Kalle', 'Andersson', 'Storgatan 5a', '41871', 'kalle@andersson.se', 'c16e24898200c27d89cd30e9abd51984');
INSERT INTO person VALUES (3, 'Sara', 'Larsson', 'Vintervägen 112', '83140', 'larsson.s@gmail.com', '5bd537fc3789b5482e4936968f0fde95');
INSERT INTO person VALUES (4, 'Fredrik', 'Håkansson', 'Bakutgatan 14d', '83141', 'freddan80@gmail.com', '403d6f5bb79d364702d95f5f6df52f3d');
INSERT INTO person VALUES (5, 'Melinda', 'Jonsson', 'Lagmansvägen 37', '83432', 'mellis@jonsson.net', '19b63690a34f20c95317571ff354868f');
INSERT INTO person VALUES (6, 'Anna', 'Holmström', 'Treviksgatan 43', '80627', 'holmsara@hotmail.com', '5bd537fc3789b5482e4936968f0fde95');
INSERT INTO person VALUES (7, 'Örjan', 'Larsson', 'Svedjegatan 201', '11577', 'orjan@larsson.se', '054e23bdf3410a3103a79a3c368ccbd6');
INSERT INTO person VALUES (8, 'Gertrud', 'Fredriksson', 'Prästgatan 15b', '83140', 'gerfre@live.se', '8598eece636f53052b0d6cc2cc2409da');
INSERT INTO person VALUES (9, 'Hanna', 'Olsson', 'Prästgatan 15c', '83140', 'hannaolsson@hotmail.com', '05ffef54c1a79867f2538bd83ab7c424');
INSERT INTO person VALUES (10, 'Bertil', 'Eriksson', 'Havsvägen 22', '79331', 'erikssonb@gmail.com', '79b81d98465b1ea3a638c666d5aec394');
INSERT INTO person VALUES (11, 'Torbjörn', 'Karlsson', 'Fågelvägen 6', '11577', 'tobbeb@gmail.com', 'c3e6fb6fb2b655457597f063bd9392e8');
INSERT INTO person VALUES (12, 'Johan', 'Timren', 'Statsgatan 22', '83141', 'johan.timren@miun.se', '7fedcb034ecf9df4be8c1ea13362053b');
INSERT INTO person VALUES (13, 'Donald', 'Duck', 'Quacker road 13', '13131', 'd.duck@quacksville.net', 'c16e24898200c27d89cd30e9abd51984');


--
-- TOC entry 2232 (class 0 OID 0)
-- Dependencies: 196
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: sportsclub8; Owner: -
--

SELECT pg_catalog.setval('person_id_seq', 12, true);


--
-- TOC entry 2215 (class 0 OID 16608)
-- Dependencies: 197
-- Data for Name: postort; Type: TABLE DATA; Schema: sportsclub8; Owner: -
--

INSERT INTO postort VALUES ('11577', 'Stockholm');
INSERT INTO postort VALUES ('21365', 'Malmö');
INSERT INTO postort VALUES ('37292', 'Kallinge');
INSERT INTO postort VALUES ('41871', 'Göteborg');
INSERT INTO postort VALUES ('62192', 'Visby');
INSERT INTO postort VALUES ('79331', 'Leksand');
INSERT INTO postort VALUES ('80627', 'Gävle');
INSERT INTO postort VALUES ('83136', 'Östersund');
INSERT INTO postort VALUES ('83140', 'Östersund');
INSERT INTO postort VALUES ('83141', 'Östersund');
INSERT INTO postort VALUES ('83145', 'Östersund');
INSERT INTO postort VALUES ('83172', 'Östersund');
INSERT INTO postort VALUES ('83183', 'Östersund');
INSERT INTO postort VALUES ('83191', 'Östersund');
INSERT INTO postort VALUES ('83432', 'Brunflo');
INSERT INTO postort VALUES ('89597', 'Skorped');
INSERT INTO postort VALUES ('13131', 'Quacksville');


--
-- TOC entry 2216 (class 0 OID 16614)
-- Dependencies: 198
-- Data for Name: sektion; Type: TABLE DATA; Schema: sportsclub8; Owner: -
--

INSERT INTO sektion VALUES (1, 'Fotboll', 'Vi är ett gäng fotbollsälskare som samlas varje vecka för att spela denna fantastiska sport på Tiundaskolan.', '2012-01-01', 5);
INSERT INTO sektion VALUES (2, 'Innebandy', 'Vi erbjuder verksamhet för pojkar och flickor från årskurs 1 och uppåt. Tanken är att innebandy ska vara roligt och alla ska få vara med!', '2010-04-01', 10);
INSERT INTO sektion VALUES (3, 'Ishockey', 'I början av 2014 bildades ishockeysektionen. Premiärmatchen gick av stapeln nyårsdagen samma år på hemmaplan mot spelare från innebandysektionen. ', '2014-01-01', 12);


--
-- TOC entry 2233 (class 0 OID 0)
-- Dependencies: 199
-- Name: sektion_id_seq; Type: SEQUENCE SET; Schema: sportsclub8; Owner: -
--

SELECT pg_catalog.setval('sektion_id_seq', 3, true);


-- Completed on 2016-04-14 15:13:21

--
-- PostgreSQL database dump complete
--

