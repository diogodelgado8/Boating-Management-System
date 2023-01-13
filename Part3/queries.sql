--1. Which country has more boats registered than any other?
SELECT country
FROM boat
GROUP BY country
HAVING COUNT(*) >= ALL(
        SELECT COUNT(*)
        FROM boat
        GROUP BY country
        );

--2. List all the sailors that have at least two certificates.
SELECT s.firstname, s.surname, s.email
FROM sailor s
    JOIN sailing_certificate sc ON s.email = sc.sailor
GROUP BY s.email
HAVING COUNT(*)>=2;

--3. Who are the sailors that have sailed to every location in 'Portugal'?
SELECT a.sailor
FROM authorised a
    JOIN trip t
        ON a.start_date = t.reservation_start_date AND a.end_date = t.reservation_end_date
               AND a.boat_country = t.boat_country AND a.cni = t.cni
WHERE NOT EXISTS(
    SELECT DISTINCT (latitude, longitude)
    FROM location
    WHERE country_name='Portugal'
    EXCEPT
    (SELECT (t.from_latitude, t.from_longitude)
    FROM authorised a2
        JOIN trip t
            ON a.start_date = t.reservation_start_date AND a.end_date = t.reservation_end_date
                   AND a.boat_country = t.boat_country AND a.cni = t.cni
    WHERE a.sailor = a2.sailor
    UNION
    SELECT (t.to_latitude, t.to_longitude)
    FROM authorised a3
        JOIN trip t
            ON a.start_date = t.reservation_start_date AND a.end_date = t.reservation_end_date
                   AND a.boat_country = t.boat_country AND a.cni = t.cni
    WHERE a.sailor = a3.sailor)
    );

--4.  List the sailors with the most skipped trips.
SELECT skipper, COUNT(*)
FROM trip
GROUP BY skipper
HAVING COUNT(*) >= ALL(
    SELECT COUNT(*)
    FROM trip
    GROUP BY skipper
    );

--5. List the sailors with the longest duration of trips (sum of trip durations) for the same
--   single reservation; display also the sum of the trips duration.
SELECT a.sailor, SUM(t.arrival-t.takeoff+1) AS sum_trips_duration
FROM authorised a
    JOIN trip t
        ON a.start_date = t.reservation_start_date AND a.end_date = t.reservation_end_date
               AND a.boat_country = t.boat_country AND a.cni = t.cni
GROUP BY (a.start_date, a.end_date, a.boat_country, a.cni, a.sailor)
HAVING SUM(t.arrival-t.takeoff+1) >= ALL(
    SELECT SUM(t.arrival-t.takeoff+1)
    FROM authorised a2
        JOIN trip t
            ON a2.start_date = t.reservation_start_date AND a2.end_date = t.reservation_end_date
                   AND a2.boat_country = t.boat_country AND a2.cni = t.cni
    GROUP BY (a2.start_date, a2.end_date, a2.boat_country, a2.cni, a2.sailor)
    );
