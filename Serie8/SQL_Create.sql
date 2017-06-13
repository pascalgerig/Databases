/*
Alec Schürmann
16-115-701
Pascal Gerig
16-104-721
*/
CREATE TABLE Haustier(
hid SERIAL PRIMARY KEY,
name VARCHAR(30) NOT NULL,
gebtag INTEGER NOT NULL,
gebmonat INTEGER NOT NULL,
gebjahr INTEGER NOT NULL,
CHECK(gebtag >= 1 AND gebtag <= 31),
CHECK(gebmonat >= 1 AND gebmonat <= 12),
);

CREATE TABLE Person(
pid SERIAL PRIMARY KEY,
name VARCHAR(30) NOT NULL,
wohnort VARCHAR(30) NOT NULL
);

CREATE TABLE Halter(
pid INTEGER PRIMARY KEY REFERENCES Person ON DELETE CASCADE,
typ VARCHAR(30) NOT NULL,
hid INTEGER REFERENCES haustier ON DELETE CASCADE NOT NULL
);

CREATE TABLE Aufpasser(
pid INTEGER PRIMARY KEY REFERENCES Person ON DELETE CASCADE,
stundenlohn INTEGER
);

CREATE TABLE Hund(
hid INTEGER PRIMARY KEY REFERENCES haustier ON DELETE CASCADE,
rasse VARCHAR(30) NOT NULL
);

CREATE TABLE Katze(
hid INTEGER PRIMARY KEY REFERENCES haustier ON DELETE CASCADE,
dominanz INTEGER,
fellfarbe VARCHAR(30) NOT NULL,
CHECK((dominanz >= 0 AND dominanz <= 100) OR dominanz IS NULL)
);

CREATE TABLE Futter(
hersteller VARCHAR(30),
name VARCHAR(30),
PRIMARY KEY(hersteller, name)
);

CREATE TABLE Lieblingsplatz(
lid SERIAL PRIMARY KEY
);

CREATE TABLE Kamin(
lid INTEGER PRIMARY KEY REFERENCES lieblingsplatz ON DELETE CASCADE,
material VARCHAR(30) NOT NULL
);

CREATE TABLE Karton(
lid INTEGER PRIMARY KEY REFERENCES lieblingsplatz ON DELETE CASCADE
);

CREATE TABLE Laptop(
lid INTEGER PRIMARY KEY REFERENCES lieblingsplatz ON DELETE CASCADE,
hersteller VARCHAR(30) NOT NULL,
kennzeichnung VARCHAR(30)
);

CREATE TABLE "hat-bei"(
hid INTEGER REFERENCES haustier ON DELETE CASCADE,
pid INTEGER REFERENCES person ON DELETE CASCADE,
lid INTEGER REFERENCES lieblingsplatz ON DELETE CASCADE NOT NULL,
PRIMARY KEY(hid, pid)
);

CREATE TABLE mag(
hid INTEGER REFERENCES haustier ON DELETE CASCADE,
hersteller VARCHAR(30),
name VARCHAR(30),
FOREIGN KEY(hersteller, name) REFERENCES futter ON DELETE CASCADE,
PRIMARY KEY(hid, hersteller, name)
);

-- ADDs other direction of reference between animal and owner
ALTER TABLE Haustier
  ADD FOREIGN KEY (pid)
  REFERENCES halter (pid)
    ON DELETE CASCADE
	NOT NULL
;
-- CHECK makes sure that every animal has at least one favourite place
ALTER TABLE haustier
	ADD CHECK (
		SELECT COUNT(*) FROM haustier GROUP BY hid
		=
		SELECT COUNT(*) FROM "hat-bei" GROUP BY hid
	);

-- CHECK makes sure that every animal likes at least one food
ALTER TABLE haustier
	ADD CHECK (
		SELECT COUNT(*) FROM haustier GROUP BY hid
		=
		SELECT COUNT(*) FROM mag GROUP BY hid
	);

--animal has to be dog XOR cat	
ALTER TABLE haustier
	ADD CHECK (
		SELECT COUNT(*) FROM haustier
		=
		SELECT COUNT(*) FROM hund + SELECT COUNT(*) FROM katze
	);

--favourite place has to be chimney, carton or notebook
ALTER TABLE lieblingsplatz
	ADD CHECK (
		SELECT COUNT(*) FROM lieblingsplatz
		=
		SELECT COUNT(*) FROM karton + SELECT COUNT(*) FROM laptop + SELECT COUNT(*) FROM kamin
	);
