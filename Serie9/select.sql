/*
Alec Schürmann
16-115-701

Pascal Gerig
16-104-721
*/

-- a)
SELECT hersteller.name FROM hersteller
JOIN verkauft USING (h_pkey)
JOIN futter USING (f_pkey)
WHERE futter.name = 'Stroh'
;

-- b) Es gibt Haustiere ohne besitzer falls die Tabelle mindestens 1 Eintrag hat.
SELECT * FROM haustiere
WHERE p_pkey IS NULL
;

-- c) Ja sofern diese Abfrage mindestens einen Eintrag liefert 
SELECT * FROM haustiere
WHERE ha_pkey IN (
	SELECT ha_pkey
	FROM mag
	GROUP BY ha_pkey
	HAVING MAX(grad) = MIN(grad))
;

-- d)
SELECT array_agg(haustiere.name), futter.name, mag.grad FROM haustiere
JOIN mag USING (ha_pkey)
JOIN futter USING (f_pkey)
GROUP BY mag.grad, futter.f_pkey;




