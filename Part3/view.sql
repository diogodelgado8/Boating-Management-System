DROP VIEW IF EXISTS trip_info;

CREATE VIEW trip_info(
            country_iso_origin, country_name_origin,
            country_iso_dest, country_name_dest,
            loc_name_origin,
            loc_name_dest,
            cni_boat,
            country_iso_boat, country_name_boat,
            trip_start_date)
AS
SELECT c_from.iso_code AS country_iso_origin, c_from.name AS country_name_origin,
       c_to.iso_code AS country_iso_dest, c_to.name AS country_name_dest,
       l_from.name AS loc_name_origin,
       l_to.name AS loc_name_dest,
       b.cni AS cni_boat,
       c_boat.iso_code AS country_iso_boat, b.country AS country_name_boat,
       t.takeoff
FROM trip t
    JOIN location l_from ON l_from.latitude = t.from_latitude AND l_from.longitude = t.from_longitude
    JOIN country c_from ON c_from.name = l_from.country_name
    JOIN location l_to ON l_to.latitude = t.to_latitude AND l_to.longitude = t.to_longitude
    JOIN country c_to ON c_to.name = l_to.country_name
    JOIN boat b ON t.cni = b.cni
    JOIN country c_boat ON b.country = c_boat.name;
