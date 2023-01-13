-- A. The name of all boats that are used in some trip.

SELECT DISTINCT boat_name
FROM boat
WHERE cni IN (
    SELECT DISTINCT cni
    FROM trip
    );

-- B. The name of all boats that are not used in any trip.

SELECT boat_name
FROM boat
WHERE cni NOT IN (
    SELECT DISTINCT cni
    FROM trip
    );

-- C. The name of all boats registered in 'PRT' (ISO code) for which at least one responsible for a
--    reservation has a surname that ends with 'Santos'.

SELECT DISTINCT b.boat_name, s.first_name AS sailor_first_name, s.surname AS sailor_surname
FROM boat b
    JOIN country c ON b.country_name = c.name
    JOIN reservation r ON b.cni = r.cni AND r.country_name = b.country_name
    JOIN sailor s ON r.responsible_email = s.email
WHERE c.iso_code = 'PRT' AND s.surname LIKE '%Santos';

-- D. The full name of all skippers without any certificate corresponding to the class of the trip’s boat.

SELECT DISTINCT s.first_name, s.surname
FROM sailor s
    JOIN trip t ON s.email = t.skipper_email
    JOIN boat b ON t.cni = b.cni
    JOIN boat_class bc ON bc.name = b.has_class
WHERE has_class NOT IN(
    SELECT sc.for_class
    FROM sailing_certificate sc
    WHERE sc.email = t.skipper_email
    );



