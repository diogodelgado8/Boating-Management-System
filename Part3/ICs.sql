--(IC-1) Every Sailor is either Senior or Junior.
CREATE OR REPLACE FUNCTION	check_mandatory_sailor_insert()
    RETURNS TRIGGER AS
$$
BEGIN
IF NEW.email NOT IN	(SELECT email FROM senior
                    UNION
                    SELECT email FROM junior)	THEN
    RAISE EXCEPTION	'IC-1: A sailor must be either senior or junior.';
END IF;
RETURN NEW;
END;
$$	LANGUAGE plpgsql;

CREATE CONSTRAINT TRIGGER tg_check_mandatory_sailor
AFTER INSERT OR UPDATE ON	sailor	DEFERRABLE
FOR EACH ROW EXECUTE PROCEDURE	check_mandatory_sailor_insert();


CREATE OR REPLACE FUNCTION	check_mandatory_junior()
    RETURNS TRIGGER AS
$$
BEGIN
IF OLD.email IN	(SELECT email FROM sailor)	THEN
    RAISE EXCEPTION	'IC-1: Need to also delete from sailor.';
END IF;
RETURN NEW;
END;
$$	LANGUAGE plpgsql;

CREATE CONSTRAINT TRIGGER tg_check_mandatory_junior
AFTER DELETE ON	junior DEFERRABLE
FOR EACH ROW EXECUTE PROCEDURE check_mandatory_junior();


CREATE OR REPLACE FUNCTION check_mandatory_senior()
    RETURNS TRIGGER AS
$$
BEGIN
IF OLD.email IN	(SELECT email FROM sailor)	THEN
    RAISE EXCEPTION	'IC-1: Need to also delete from sailor.';
END IF;
RETURN NEW;
END;
$$	LANGUAGE plpgsql;

CREATE CONSTRAINT TRIGGER tg_check_mandatory_senior
AFTER DELETE ON	senior DEFERRABLE
FOR EACH ROW EXECUTE PROCEDURE	check_mandatory_senior();


CREATE OR REPLACE FUNCTION check_disjoint_senior()
    RETURNS TRIGGER AS
$$
BEGIN
IF NEW.email IN	(SELECT email FROM junior)	THEN
    RAISE EXCEPTION	'IC-1: A sailor must not be senior and junior simultaneously.';
END IF;
RETURN NEW;
END;
$$	LANGUAGE plpgsql;

CREATE CONSTRAINT TRIGGER tg_check_disjoint_senior
AFTER INSERT ON	senior DEFERRABLE
FOR EACH ROW EXECUTE PROCEDURE	check_disjoint_senior();


CREATE OR REPLACE FUNCTION check_disjoint_junior()
    RETURNS TRIGGER AS
$$
BEGIN
IF NEW.email IN	(SELECT email FROM senior)	THEN
    RAISE EXCEPTION	'IC-1: A sailor must not be senior and junior simultaneously.';
END IF;
RETURN NEW;
END;
$$	LANGUAGE plpgsql;

CREATE CONSTRAINT TRIGGER tg_check_disjoint_junior
AFTER INSERT ON junior DEFERRABLE
FOR EACH ROW EXECUTE PROCEDURE	check_disjoint_junior();


--(IC-2) The take-off and arrival dates of Trips for the same reservation must not overlap
--       (i.e., one Trip cannot take off before the arrival of another).
CREATE OR REPLACE FUNCTION	check_dates_trip_insert()
    RETURNS TRIGGER AS
$$
BEGIN
IF EXISTS (SELECT *
           FROM trip
           WHERE reservation_start_date = NEW.reservation_start_date
                AND reservation_end_date = NEW.reservation_end_date
                AND boat_country = NEW.boat_country
                AND cni = NEW.cni
                AND NEW.takeoff < arrival
                AND NEW.arrival > takeoff
          )
    THEN RAISE EXCEPTION 'IC-2: The take-off and arrival dates of Trips for the same reservation must not overlap.';
END IF;
RETURN NEW;
END
$$	LANGUAGE plpgsql;

CREATE TRIGGER tg_check_dates_trip
BEFORE UPDATE OR INSERT ON trip
FOR EACH ROW EXECUTE PROCEDURE	check_dates_trip_insert();