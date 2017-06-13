--Alec Schürmann 16-115-701
--Pascal Gerig 16-104-721

-- Excercise a)
SELECT DISTINCT Angestellte.Name, Angestellte.Vorname 
FROM Angestellte, Vorlesungen, HaeltBetreut 
WHERE Angestellte.Typ = 'Assistent'
AND Angestellte.PersonalNr = HaeltBetreut.PersonalNr 
AND HaeltBetreut.VorlesungsNr = Vorlesungen.VorlesungsNr
AND Vorlesungen.Titel = 'Programmieren';

