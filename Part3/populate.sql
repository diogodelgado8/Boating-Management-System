INSERT INTO country(name,iso_code,flag)
    VALUES
        ('Portugal', 'PRT', 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Flag_of_Portugal.svg'),
        ('Brazil', 'BRA', 'https://upload.wikimedia.org/wikipedia/en/thumb/0/05/Flag_of_Brazil.svg/10'),
        ('Spain', 'ESP', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/Bandera_de_Espa%C'),
        ('Chad', 'TCD', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Flag_of_Chad.svg/1'),
        ('France', 'FRA', 'https://upload.wikimedia.org/wikipedia/commons/b/bc/Flag_of_France_%281794');


INSERT INTO boat_class(name, max_length)
    VALUES
        ('A', 16),
        ('1', 26),
        ('2', 40),
        ('3', 65);


INSERT INTO boat(name, cni, length, boat_class, country, year)
    VALUES
        ('Salazar', 'QWER0930A617', 53.15, '3', 'Portugal', 1974),
        ('Blimunda', 'ACBF8428F392', 12, 'A', 'Brazil', 1914),
        ('Baltazar', 'TYUI6230G273', 20, '1', 'Chad', 1900),
        ('Cesario Barata Verde', 'TGBN6234B811', 35, '2', 'Portugal', 1943),
        ('Fernando Contente Pessoa', 'EGAB7654C977', 18, '1', 'Portugal', 1995),
        ('Luis Delgado Camoes', 'VASC0354A637', 10, 'A', 'Chad', 2000);


INSERT INTO date_interval(start_date, end_date)
    VALUES
        ('08-JAN-2023', '08-JAN-2023'),
        ('08-JAN-2023', '08-FEB-2023'),
        ('15-JAN-2023', '30-JAN-2023'),
        ('01-MAR-2023', '31-MAR-2023'),
        ('01-APR-2023', '30-APR-2023'),
        ('01-MAY-2023', '31-MAY-2023'),
        ('01-JUN-2023', '30-JUN-2023'),
        ('01-JUL-2023', '31-JUL-2023'),
        ('01-AUG-2023', '31-AUG-2023'),
        ('01-SEP-2023', '30-SEP-2023'),
        ('01-OCT-2023', '31-OCT-2023'),
        ('01-NOV-2023', '30-NOV-2023'),
        ('01-DEC-2023', '31-DEC-2023');
;


START TRANSACTION;
SET CONSTRAINTS ALL DEFERRED;
    INSERT INTO sailor(surname, firstname, email)
        VALUES
            ('Santos Ribeiro', 'Anacleto', 'anacletosantos@gmail.com'),
            ('Santos', 'Ambrosio', 'ambrosiosantos@hotmail.com'),
            ('Delgado', 'Diogo', 'diogo@gmail.com'),
            ('Lima', 'Mariana', 'mlima@gmail.com'),
            ('Fernandes', 'Madalena', 'lostmaddie@gmail.com');

    INSERT INTO senior
        VALUES
            ('anacletosantos@gmail.com'),
            ('ambrosiosantos@hotmail.com'),
            ('lostmaddie@gmail.com');

    INSERT INTO junior
        VALUES
            ('diogo@gmail.com'),
            ('mlima@gmail.com');
COMMIT;


INSERT INTO reservation(cni, start_date, end_date, country, responsible)
    VALUES
        ('QWER0930A617','08-JAN-2023', '08-JAN-2023', 'Portugal', 'anacletosantos@gmail.com'),
        ('TGBN6234B811','08-JAN-2023', '08-JAN-2023', 'Portugal', 'lostmaddie@gmail.com'),
        ('TGBN6234B811','15-JAN-2023', '30-JAN-2023', 'Portugal', 'ambrosiosantos@hotmail.com'),
        ('ACBF8428F392','15-JAN-2023', '30-JAN-2023', 'Brazil', 'ambrosiosantos@hotmail.com'),
        ('VASC0354A637','08-JAN-2023', '08-FEB-2023', 'Chad', 'anacletosantos@gmail.com');


INSERT INTO authorised(sailor, boat_country, cni, start_date, end_date)
    VALUES
        ('anacletosantos@gmail.com', 'Portugal', 'QWER0930A617', '08-JAN-2023', '08-JAN-2023'),
        ('diogo@gmail.com', 'Portugal', 'QWER0930A617', '08-JAN-2023', '08-JAN-2023'),

        ('lostmaddie@gmail.com','Portugal','TGBN6234B811', '08-JAN-2023', '08-JAN-2023'),
        ('mlima@gmail.com','Portugal','TGBN6234B811', '08-JAN-2023', '08-JAN-2023'),

        ('lostmaddie@gmail.com','Portugal','TGBN6234B811', '15-JAN-2023', '30-JAN-2023'),
        ('ambrosiosantos@hotmail.com','Portugal','TGBN6234B811', '15-JAN-2023', '30-JAN-2023'),

        ('ambrosiosantos@hotmail.com','Brazil','ACBF8428F392','15-JAN-2023', '30-JAN-2023'),
        ('mlima@gmail.com','Brazil','ACBF8428F392','15-JAN-2023', '30-JAN-2023'),

        ('anacletosantos@gmail.com','Chad','VASC0354A637','08-JAN-2023', '08-FEB-2023'),
        ('mlima@gmail.com','Chad','VASC0354A637','08-JAN-2023', '08-FEB-2023'),
        ('ambrosiosantos@hotmail.com','Chad','VASC0354A637','08-JAN-2023', '08-FEB-2023');


INSERT INTO location(name, latitude, longitude, country_name)
    VALUES
        ('Atlantis', 38.638609, -9.290472,'Portugal'),
        ('Douro', 41.139867, -8.680607,'Portugal'),
        ('Biscaia', 45.598757, -1.127280,'France'),
        ('Valhala', 13.034177, 14.582046,'Chad'),
        ('Nirvana',40.376759, 0.909885, 'Spain'),
        ('Galeao',-22.831060, -43.169858,'Brazil');


INSERT INTO sailing_certificate(sailor, issue_date, expiry_date, boat_class)
    VALUES
        ('anacletosantos@gmail.com', '01-01-1980','31-12-2030', 'A'),
        ('anacletosantos@gmail.com', '02-02-1999','31-12-2030', '1'),
        ('anacletosantos@gmail.com', '06-09-2000','31-12-2030', '2'),
        ('anacletosantos@gmail.com', '14-10-2010','31-12-2030', '3'),
        ('diogo@gmail.com', '18-02-1980','31-12-2030', 'A'),
        ('diogo@gmail.com', '22-09-1980','31-12-2030', '1'),
        ('mlima@gmail.com', '22-09-1980','31-12-2030', '2'),
        ('ambrosiosantos@hotmail.com', '29-08-1980','31-12-2030', 'A');


INSERT INTO valid_for(issue_date, sailor, max_length, country_name)
    VALUES
        ('01-01-1980','anacletosantos@gmail.com', 65, 'Portugal'),
        ('01-01-1980','anacletosantos@gmail.com', 56, 'Chad'),
        ('02-02-1999','anacletosantos@gmail.com', 74, 'Portugal'),
        ('06-09-2000','anacletosantos@gmail.com', 16, 'Portugal'),
        ('14-10-2010','anacletosantos@gmail.com', 32, 'Portugal'),
        ('18-02-1980','diogo@gmail.com', 24, 'Spain'),
        ('22-09-1980','diogo@gmail.com', 43, 'Spain'),
        ('29-08-1980','ambrosiosantos@hotmail.com', 74, 'Brazil'),
        ('29-08-1980','ambrosiosantos@hotmail.com', 65, 'Spain');


INSERT INTO trip(boat_country, takeoff, cni, reservation_start_date, reservation_end_date,
                 arrival, insurance, from_latitude, from_longitude, to_latitude, to_longitude, skipper)
    VALUES
        ('Portugal', '08-JAN-2023', 'QWER0930A617', '08-JAN-2023', '08-JAN-2023',
         '08-JAN-2023', 'AAA111111', 38.638609, -9.290472, 40.376759, 0.909885, 'anacletosantos@gmail.com'),
        ('Portugal', '08-JAN-2023', 'TGBN6234B811', '08-JAN-2023', '08-JAN-2023',
         '08-JAN-2023', 'BBB111111', 38.638609, -9.290472, 41.139867, -8.680607, 'mlima@gmail.com'),
        ('Portugal', '15-JAN-2023', 'TGBN6234B811', '15-JAN-2023', '30-JAN-2023',
         '20-JAN-2023', 'CCC222222', 38.638609, -9.290472, 45.598757, -1.127280, 'lostmaddie@gmail.com'),
        ('Portugal', '21-JAN-2023', 'TGBN6234B811', '15-JAN-2023', '30-JAN-2023',
         '30-JAN-2023', 'CCC222222', 45.598757, -1.127280, 40.376759, 0.909885, 'lostmaddie@gmail.com'),
        ('Chad', '08-JAN-2023', 'VASC0354A637', '08-JAN-2023', '08-FEB-2023',
         '16-JAN-2023', 'DDD333333', 13.034177, 14.582046, 13.034177, 14.582046, 'ambrosiosantos@hotmail.com'),
        ('Chad', '18-JAN-2023', 'VASC0354A637', '08-JAN-2023', '08-FEB-2023',
         '25-JAN-2023', 'DDD333333', 13.034177, 14.582046, 13.034177, 14.582046, 'diogo@gmail.com'),
        ('Chad', '17-JAN-2023', 'VASC0354A637', '08-JAN-2023', '08-FEB-2023',
         '17-JAN-2023', 'DDD333333', 13.034177, 14.582046, 13.034177, 14.582046, 'mlima@gmail.com');






