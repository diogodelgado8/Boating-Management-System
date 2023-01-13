--1. The start date (i.e., per year, per month independently of year, and per exact date).
SELECT  extract(DAY FROM  trip_start_date) AS trip_start_day,
        extract(MONTH FROM  trip_start_date) AS trip_start_month,
        extract(YEAR FROM  trip_start_date) AS trip_start_year,
        COUNT(*)
FROM trip_info
GROUP BY GROUPING SETS ((trip_start_year, trip_start_month, trip_start_day), (trip_start_month), (trip_start_year))
ORDER BY extract(DAY FROM  trip_start_date) ,
        extract(MONTH FROM  trip_start_date),
        extract(YEAR FROM  trip_start_date) ;

--2. The location of origin (i.e., per location within countries, per country, and in total).
SELECT country_name_origin,loc_name_origin, COUNT(*)
FROM trip_info
GROUP BY ROLLUP (country_name_origin,loc_name_origin)
ORDER BY country_name_origin;

