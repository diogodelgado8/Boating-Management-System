DROP TABLE IF EXISTS valid_for;
DROP TABLE IF EXISTS authorised;
DROP TABLE IF EXISTS trip;
DROP TABLE IF EXISTS reservation;
DROP TABLE IF EXISTS boat;
DROP TABLE IF EXISTS sailing_certificate;
DROP TABLE IF EXISTS date_interval;
DROP TABLE IF EXISTS boat_class;
DROP TABLE IF EXISTS junior;
DROP TABLE IF EXISTS senior;
DROP TABLE IF EXISTS sailor;
DROP TABLE IF EXISTS location;
DROP TABLE IF EXISTS country;


CREATE TABLE country(
    name VARCHAR(70),
    iso_code VARCHAR(30) NOT NULL,
	flag VARCHAR(2083) NOT NULL,
	PRIMARY KEY (name),
	CONSTRAINT IC_5 UNIQUE(iso_code)
);

CREATE TABLE location(
	name VARCHAR(80) NOT NULL,
	latitude NUMERIC(8,6),
	longitude NUMERIC(9,6),
	exists_in_country VARCHAR(70) NOT NULL,
	PRIMARY KEY(latitude,longitude),
	FOREIGN KEY (exists_in_country) REFERENCES country(name)

    -- IC-2: Any two locations must be at least
    --       one nautical mile apart
);

CREATE TABLE sailor(
    surname VARCHAR(80) NOT NULL,
	first_name VARCHAR(80) NOT NULL,
	email VARCHAR(254),
	PRIMARY KEY (email)
	-- Every sailor must exist either in the table 'senior' or in the table 'junior'
	-- No sailor can exist at the same time in the both the table 'senior' or in the table 'junior'
);

CREATE TABLE senior(
	email VARCHAR(254),
	PRIMARY KEY (email),
	FOREIGN KEY (email) REFERENCES sailor(email)
);

CREATE TABLE junior(
	email VARCHAR(254),
	PRIMARY KEY (email),
	FOREIGN KEY (email) REFERENCES sailor(email)
);

CREATE TABLE boat_class(
	name VARCHAR(3),
	max_length_ft NUMERIC(4,2) NOT NULL,
	PRIMARY KEY (name)
);

CREATE TABLE date_interval(
	start_date TIMESTAMP,
	end_date TIMESTAMP,
	PRIMARY KEY (start_date,end_date)
);

CREATE TABLE sailing_certificate(
    email VARCHAR(254),
	issue_date DATE,
	expiry_date DATE NOT NULL,
	for_class VARCHAR(3) NOT NULL,
	PRIMARY KEY(issue_date,email),
	FOREIGN KEY (email) REFERENCES sailor(email),
	FOREIGN KEY (for_class) REFERENCES boat_class(name)
	-- Every sailing_certificate must exist in the table 'valid_for'
);

CREATE TABLE boat(
	boat_name VARCHAR(80) NOT NULL,
	cni VARCHAR(30),
	length_ft NUMERIC(4,2) NOT NULL,
	has_class VARCHAR(3) NOT NULL,
	country_name VARCHAR(70),
	year SMALLINT NOT NULL,
	PRIMARY KEY (cni,country_name),
	FOREIGN KEY (country_name) REFERENCES country(name),
	FOREIGN KEY (has_class) REFERENCES boat_class(name)

    -- IC-1: Every 'country_name' must exist in table
    --       location in the column 'exists_in_country'
);

CREATE TABLE reservation(
	cni VARCHAR(30),
	start_date TIMESTAMP,
	end_date TIMESTAMP,
	country_name VARCHAR(70),
	responsible_email VARCHAR(254) NOT NULL,
	PRIMARY KEY (country_name,cni,start_date,end_date),
	FOREIGN KEY (cni,country_name)
		REFERENCES boat(cni,country_name),
	FOREIGN KEY (start_date,end_date)
		REFERENCES date_interval(start_date,end_date),
	FOREIGN KEY (responsible_email)
	    REFERENCES senior(email)

    -- Every reservation must exist in the table 'authorised'
    -- IC-6: The 'responsible_email' must exist in the table
    --       'authorized' with the same attributes cni,
    --       start_date, end_date, country_name
    --       (meaning the corresponding reservation)


);

CREATE TABLE trip(
	country_name VARCHAR(70),
	take_off TIMESTAMP,
	cni VARCHAR(30),
	start_date TIMESTAMP,
	end_date TIMESTAMP,
	arrival TIMESTAMP NOT NULL,
	insurance VARCHAR(30) NOT NULL,
	from_lat NUMERIC(8,6) NOT NULL,
	from_long NUMERIC(9,6) NOT NULL,
	to_lat NUMERIC(8,6) NOT NULL,
	to_long NUMERIC(9,6) NOT NULL,
	skipper_email VARCHAR(254) NOT NULL,
	PRIMARY KEY(cni,start_date,end_date,take_off,country_name),
	FOREIGN KEY (cni,country_name,start_date,end_date)
	    REFERENCES reservation(cni,country_name,start_date,end_date),
	FOREIGN KEY (from_lat,from_long)
	    REFERENCES location(latitude,longitude),
	FOREIGN KEY (to_lat, to_long)
	    REFERENCES location(latitude,longitude),
	FOREIGN KEY (skipper_email) REFERENCES sailor(email),
	CONSTRAINT IC_4 CHECK (take_off >= start_date)

    -- IC-3: The 'skipper_email' must exist in the 'authorised'
    --       table with the same attributes cni, start_date, end_date,
    --       country_name (meaning the corresponding reservation)
);

CREATE TABLE authorised(
	email VARCHAR(254),
	country_name VARCHAR(70),
	cni VARCHAR(30),
	start_date TIMESTAMP,
	end_date TIMESTAMP,
	PRIMARY KEY(email,country_name,cni,start_date,end_date),
	FOREIGN KEY (email) REFERENCES sailor(email),
	FOREIGN KEY (country_name,cni,start_date,end_date)
		REFERENCES reservation(country_name,cni,start_date,end_date)
);

CREATE TABLE valid_for(
	issue_date DATE,
	email VARCHAR(254),
	country_name VARCHAR(70),
	PRIMARY KEY (issue_date,email,country_name),
	FOREIGN KEY (issue_date,email) REFERENCES sailing_certificate(issue_date,email),
	FOREIGN KEY	(country_name) REFERENCES country(name)
);


