/*
Alec Schürmann
16-115-701

Pascal Gerig
16-104-721
*/
CREATE VIEW LieblingsFutter AS(
WITH tmp AS (
	SELECT mag.f_pkey AS futter, AVG(mag.grad) AS durchschnitt, haustiere.art, RANK() OVER(
	PARTITION BY haustiere.art
	ORDER BY AVG(mag.grad) DESC
	NULLS LAST) AS rang
	FROM mag
	JOIN haustiere ON mag.ha_pkey = haustiere.ha_pkey
	GROUP BY mag.f_pkey, haustiere.art)
	


--Lieblingsfutter pro Tierart
SELECT futter.name, tmp.art AS tierart, hersteller.name AS hersteller, verkauft.preis
FROM tmp
JOIN futter ON futter.f_pkey = tmp.futter
FULL OUTER JOIN verkauft ON verkauft.f_pkey = tmp.futter
FULL OUTER JOIN hersteller ON hersteller.h_pkey = verkauft.h_pkey	
WHERE 
tmp.rang = 1
AND
(
verkauft.preis <= ALL(
	SELECT verkauft.preis
	FROM tmp
	JOIN futter ON futter.f_pkey = tmp.futter
	FULL OUTER JOIN verkauft ON verkauft.f_pkey = tmp.futter
	FULL OUTER JOIN hersteller ON hersteller.h_pkey = verkauft.h_pkey
	WHERE tmp.rang = 1)
OR
verkauft.preis IS NULL
)
AND
tmp.durchschnitt IS NOT NULL)
;