INSERT INTO country
    VALUES
        ('Portugal', 'PRT', 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Flag_of_Portugal.svg'),
        ('Brazil', 'BRA', 'https://upload.wikimedia.org/wikipedia/en/thumb/0/05/Flag_of_Brazil.svg/1024px-Flag_of_Brazil.svg.png'),
        ('Spain', 'ESP', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/Bandera_de_Espa%C3%B1a.svg/1024px-Bandera_de_Espa%C3%B1a.svg.png'),
        ('Chad', 'TCD', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Flag_of_Chad.svg/1024px-Flag_of_Chad.svg.png'),
        ('France', 'FRA', 'https://upload.wikimedia.org/wikipedia/commons/b/bc/Flag_of_France_%281794%E2%80%931815%2C_1830%E2%80%931974%2C_2020%E2%80%93present%29.svg');

INSERT INTO boat_class
    VALUES
        ('A', 16),
        ('1', 26),
        ('2', 40),
        ('3', 65);

INSERT INTO boat
    VALUES
        ('Salazar', 'QWER0930A617', 53.15, '3', 'Portugal', 1974),
        ('Blimunda', 'ACBF8428F392', 12, 'A', 'Brazil', 1914),
        ('Baltazar', 'TYUI6230G273', 20, '1', 'Chad', 1900),
        ('Cesário Barata Verde', 'TGBN6234B811', 35, '2', 'Portugal', 1943),
        ('Fernando Contente Pessoa', 'EGAB7654C977', 18, '1', 'Portugal', 1995),
        ('Luís Delgado Camões', 'VASC0354A637', 10, 'A', 'Chad', 2000);

INSERT INTO date_interval
    VALUES
        ('08-JAN-2029 09:00:00', '08-JAN-2029 23:30:00'),
        ('08-JAN-2029 10:00:00', '08-FEB-2029 12:00:00'),
        ('15-JAN-2029 08:30:00', '30-JAN-2029 23:30:00');

INSERT INTO sailor
    VALUES
        ('Santos Ribeiro', 'Anacleto', 'anacletosantos@gmail.com'),
        ('Santos', 'Ambrósio', 'ambrosiosantos@hotmail.com'),
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

INSERT INTO reservation
    VALUES
        ('QWER0930A617','08-JAN-2029 09:00:00', '08-JAN-2029 23:30:00', 'Portugal', 'anacletosantos@gmail.com'),
        ('TGBN6234B811','08-JAN-2029 09:00:00', '08-JAN-2029 23:30:00', 'Portugal', 'lostmaddie@gmail.com'),
        ('TGBN6234B811','15-JAN-2029 08:30:00', '30-JAN-2029 23:30:00', 'Portugal', 'ambrosiosantos@hotmail.com'),
        ('ACBF8428F392','15-JAN-2029 08:30:00', '30-JAN-2029 23:30:00', 'Brazil', 'ambrosiosantos@hotmail.com'),
        ('VASC0354A637','08-JAN-2029 10:00:00', '08-FEB-2029 12:00:00', 'Chad', 'anacletosantos@gmail.com');

INSERT INTO authorised
    VALUES
        ('anacletosantos@gmail.com', 'Portugal', 'QWER0930A617', '08-JAN-2029 09:00:00', '08-JAN-2029 23:30:00'),
        ('diogo@gmail.com', 'Portugal', 'QWER0930A617', '08-JAN-2029 09:00:00', '08-JAN-2029 23:30:00'),

        ('lostmaddie@gmail.com','Portugal','TGBN6234B811', '08-JAN-2029 09:00:00', '08-JAN-2029 23:30:00'),
        ('mlima@gmail.com','Portugal','TGBN6234B811', '08-JAN-2029 09:00:00', '08-JAN-2029 23:30:00'),

        ('lostmaddie@gmail.com','Portugal','TGBN6234B811', '15-JAN-2029 08:30:00', '30-JAN-2029 23:30:00'),
        ('ambrosiosantos@hotmail.com','Portugal','TGBN6234B811', '15-JAN-2029 08:30:00', '30-JAN-2029 23:30:00'),

        ('ambrosiosantos@hotmail.com','Brazil','ACBF8428F392','15-JAN-2029 08:30:00', '30-JAN-2029 23:30:00'),
        ('mlima@gmail.com','Brazil','ACBF8428F392','15-JAN-2029 08:30:00', '30-JAN-2029 23:30:00'),

        ('anacletosantos@gmail.com','Chad','VASC0354A637','08-JAN-2029 10:00:00', '08-FEB-2029 12:00:00'),
        ('mlima@gmail.com','Chad','VASC0354A637','08-JAN-2029 10:00:00', '08-FEB-2029 12:00:00'),
        ('ambrosiosantos@hotmail.com','Chad','VASC0354A637','08-JAN-2029 10:00:00', '08-FEB-2029 12:00:00'),
        ('lostmaddie@gmail.com','Chad','VASC0354A637','08-JAN-2029 10:00:00', '08-FEB-2029 12:00:00'),
        ('diogo@gmail.com','Chad','VASC0354A637','08-JAN-2029 10:00:00', '08-FEB-2029 12:00:00');

INSERT INTO location
    VALUES
        ('Atlantis', 38.638609, -9.290472,'Portugal'),
        ('Douro', 41.139867, -8.680607,'Portugal'),
        ('Biscaia', 45.598757, -1.127280,'France'),
        ('Valhala', 13.034177, 14.582046,'Chad'),
        ('Nirvana',40.376759, 0.909885, 'Spain'),
        ('Galeão',-22.831060, -43.169858,'Brazil');

INSERT INTO sailing_certificate
    VALUES
        ('anacletosantos@gmail.com', '01-01-1980','31-12-2030', 'A'),
        ('anacletosantos@gmail.com', '02-02-1999','31-12-2030', '1'),
        ('anacletosantos@gmail.com', '06-09-2000','31-12-2030', '2'),
        ('anacletosantos@gmail.com', '14-10-2010','31-12-2030', '3'),
        ('diogo@gmail.com', '18-02-1980','31-12-2030', 'A'),
        ('diogo@gmail.com', '22-09-1980','31-12-2030', '1'),
        ('mlima@gmail.com', '22-09-1980','31-12-2030', '2'),
        ('ambrosiosantos@hotmail.com', '29-08-1980','31-12-2030', 'A');

INSERT INTO valid_for
    VALUES
        ('01-01-1980','anacletosantos@gmail.com', 'Portugal'),
        ('01-01-1980','anacletosantos@gmail.com', 'Chad'),
        ('02-02-1999','anacletosantos@gmail.com', 'Portugal'),
        ('06-09-2000','anacletosantos@gmail.com', 'Portugal'),
        ('14-10-2010','anacletosantos@gmail.com', 'Portugal'),
        ('18-02-1980','diogo@gmail.com', 'Spain'),
        ('22-09-1980','diogo@gmail.com', 'Spain'),
        ('29-08-1980','ambrosiosantos@hotmail.com', 'Brazil'),
        ('29-08-1980','ambrosiosantos@hotmail.com', 'Spain');

INSERT INTO trip
    VALUES
        ('Portugal', '08-JAN-2029 10:00:00', 'QWER0930A617', '08-JAN-2029 09:00:00', '08-JAN-2029 23:30:00',
         '08-JAN-2029 22:00:00', 'AAA111111', 38.638609, -9.290472, 40.376759, 0.909885, 'anacletosantos@gmail.com'),

        ('Portugal', '08-JAN-2029 09:10:00', 'TGBN6234B811', '08-JAN-2029 09:00:00', '08-JAN-2029 23:30:00',
         '08-JAN-2029 23:20:00', 'BBB111111', 38.638609, -9.290472, 41.139867, -8.680607, 'mlima@gmail.com'),

        ('Portugal', '15-JAN-2029 09:00:00', 'TGBN6234B811', '15-JAN-2029 08:30:00', '30-JAN-2029 23:30:00',
         '20-JAN-2029 23:00:00', 'CCC222222', 38.638609, -9.290472, 45.598757, -1.127280, 'lostmaddie@gmail.com'),
        ('Portugal', '21-JAN-2029 09:00:00', 'TGBN6234B811', '15-JAN-2029 08:30:00', '30-JAN-2029 23:30:00',
         '30-JAN-2029 12:00:00', 'CCC222222', 45.598757, -1.127280, 40.376759, 0.909885, 'lostmaddie@gmail.com'),

        ('Chad', '08-JAN-2029 19:00:00', 'VASC0354A637', '08-JAN-2029 10:00:00', '08-FEB-2029 12:00:00',
         '16-JAN-2029 05:00:00', 'DDD333333', 13.034177, 14.582046, 13.034177, 14.582046, 'ambrosiosantos@hotmail.com'),
        ('Chad', '18-JAN-2029 19:00:00', 'VASC0354A637', '08-JAN-2029 10:00:00', '08-FEB-2029 12:00:00',
         '25-JAN-2029 05:00:00', 'DDD333333', 13.034177, 14.582046, 13.034177, 14.582046, 'diogo@gmail.com'),
        ('Chad', '30-JAN-2029 19:00:00', 'VASC0354A637', '08-JAN-2029 10:00:00', '08-FEB-2029 12:00:00',
         '6-FEB-2029 05:00:00', 'DDD333333', 13.034177, 14.582046, 13.034177, 14.582046, 'mlima@gmail.com');