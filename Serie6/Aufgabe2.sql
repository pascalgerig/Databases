--Alec Schürmann 16-115-701
--Pascal Gerig 16-104-721

--CREATE and INSERT INTO Table 'Angestellte'
CREATE TABLE Angestellte 
(PersonalNr INTEGER, Name VARCHAR(30), Vorname VARCHAR(30),
Telefon VARCHAR(15), "akad Grad" VARCHAR(50), Typ VARCHAR(30));

INSERT INTO Angestellte
VALUES (123, 'Zauder', 'Peer', '0123-1235', 'Prof. Dr.', 'Professor');

INSERT INTO Angestellte
VALUES (121, 'Prau', 'Hans', '0123-1125', 'Prof. Dr. hc.mult. Dr. ing. habil.', 'Professor');

INSERT INTO Angestellte
VALUES (171, 'Main', 'Willi', '0121-1123', 'Dipl.-Inf.', 'Assistent');

INSERT INTO Angestellte
VALUES (176, 'Meier', 'Hans', '0123-1124', 'Dipl.-Math.', 'Assistent');

INSERT INTO Angestellte
VALUES (178, 'Meier', 'Georg', '0123-83646', 'M.sc.', 'Assistent');

INSERT INTO Angestellte
VALUES (179, 'Meier', 'Karl', '0123-32546', 'M.sc.', 'SHK');

--CREATE and INSERT INTO Table 'Vorlesungen'
CREATE TABLE Vorlesungen
(VorlesungsNr INTEGER, Titel VARCHAR(30), ECTS INTEGER,
Semester CHAR(4));

INSERT INTO Vorlesungen 
VALUES (121, 'Programmieren', 4, 'hs10');

INSERT INTO Vorlesungen 
VALUES (124, 'Datenbanken', 5, 'fs10');

INSERT INTO Vorlesungen 
VALUES (128, 'Datenbanken', 5, 'fs11');

INSERT INTO Vorlesungen 
VALUES (123, 'Programmieren', 4, 'hs11');

INSERT INTO Vorlesungen 
VALUES (127, 'Programmieren', 4, 'hs12');

INSERT INTO Vorlesungen 
VALUES (129, 'Datenbanken', 5, 'fs12');

INSERT INTO Vorlesungen 
VALUES (135, 'Automatentheorie', 5, 'fs14');

--CREATE and INSERT INTO Table 'HaeltBetreut'
CREATE TABLE HaeltBetreut
(VorlesungsNr INTEGER, PersonalNr INTEGER);

INSERT INTO HaeltBetreut VALUES (121, 121);
INSERT INTO HaeltBetreut VALUES (124, 123);
INSERT INTO HaeltBetreut VALUES (128, 121);
INSERT INTO HaeltBetreut VALUES (123, 123);
INSERT INTO HaeltBetreut VALUES (127, 123);
INSERT INTO HaeltBetreut VALUES (129, 121);
INSERT INTO HaeltBetreut VALUES (135, 121);
INSERT INTO HaeltBetreut VALUES (121, 171);
INSERT INTO HaeltBetreut VALUES (121, 176);
INSERT INTO HaeltBetreut VALUES (127, 178);
INSERT INTO HaeltBetreut VALUES (129, 176);
INSERT INTO HaeltBetreut VALUES (135, 171);