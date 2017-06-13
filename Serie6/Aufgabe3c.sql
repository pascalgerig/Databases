--Alec Schürmann 16-115-701
--Pascal Gerig 16-104-721

-- Excercise c)
SELECT DISTINCT Vorlesungen.ECTS, Vorlesungen.Titel
FROM Vorlesungen, Angestellte, HaeltBetreut
WHERE Angestellte.Name = 'Zauder' 
AND Angestellte.Typ = 'Professor'
AND Angestellte.PersonalNr = HaeltBetreut.PersonalNr 
AND HaeltBetreut.VorlesungsNr = Vorlesungen.VorlesungsNr;