--Alec Schürmann 16-115-701
--Pascal Gerig 16-104-721

-- Exercise a)
SELECT DISTINCT Filiale.Filialleiter 
FROM Filiale 
JOIN Artikel ON Artikel.fid = Filiale.fid
JOIN Lieferant ON Lieferant.LId = Artikel.LId
WHERE Lieferant.name = 'Druckwerk Trallala';  

-- Exercise b)
SELECT Kunde.*
FROM Kunde
JOIN Kauft ON Kunde.KId = Kauft.KId
JOIN Artikel ON Kauft.AID = Artikel.AID
JOIN Lieferant ON Artikel.LID = Lieferant.LID
WHERE Lieferant.land != 'Schweiz';

-- Exercise c)
SELECT DISTINCT Kunde.*
FROM Kunde
JOIN Kauft ON Kunde.KID = Kauft.KID
JOIN Artikel ON Kauft.AID = Artikel.AID
JOIN Artikeltyp ON Artikel.TypID = Artikeltyp.TypID
JOIN BietetAn ON BietetAn.TypID = Artikeltyp.TypID
JOIN Lieferant ON Lieferant.LID = BietetAn.LID
WHERE Lieferant.Land = 'Schweiz';

-- Exercise d)
SELECT DISTINCT Artikeltyp.Bezeichnung
FROM Artikeltyp
JOIN Artikel ON Artikel.TypID = Artikeltyp.TypID
WHERE Artikel.FID IS NULL;

-- Exercise e)
SELECT Kunde.*, SUM(Artikeltyp.Preis)
FROM Kunde
JOIN Kauft ON Kunde.KID = Kauft.KID
JOIN Artikel ON Kauft.AID = Artikel.AID
JOIN Artikeltyp ON Artikel.TypID = Artikeltyp.TypID
GROUP BY Kunde.KID
ORDER BY Kunde.KID ASC;

-- Exercise f)
SELECT DISTINCT ON (bietetan.typid) lieferant.*
FROM Lieferant
JOIN BietetAn ON Lieferant.LID = BietetAn.LID
JOIN Artikeltyp ON BietetAn.TypID = Artikeltyp.TypID
WHERE ArtikelTyp.TypID IN
	(SELECT artikel.typid
	FROM Artikel
	WHERE artikel.fid IS NOT NULL
	GROUP BY artikel.typid
	HAVING COUNT(artikel.typid) <400
	)
ORDER BY BietetAn.typid, Bietetan.Angebotspreis ASC;