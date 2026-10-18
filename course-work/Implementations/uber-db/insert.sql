SET NOCOUNT ON;
 
INSERT INTO City (name, country) VALUES
(N'Sofia',    N'Bulgaria'),
(N'Berlin',   N'Germany'),
(N'London',   N'United Kingdom'),
(N'Paris',    N'France'),
(N'Madrid',   N'Spain'),
(N'New York', N'United States');
 

INSERT INTO Rider (full_name, email, phone) VALUES
(N'Ivan Petrov',      'ivan.petrov@mail.com',      '+359 88 100 0001'),
(N'Maria Georgieva',  'maria.georgieva@mail.com',  '+359 88 100 0002'),
(N'Georgi Dimitrov',  'georgi.dimitrov@mail.com',  '+359 88 100 0003'),
(N'Elena Ivanova',    'elena.ivanova@mail.com',    '+359 88 100 0004'),
(N'Nikolay Stoyanov', 'nikolay.stoyanov@mail.com', '+359 88 100 0005'),
(N'Anna Koleva',      'anna.koleva@mail.com',      '+359 88 100 0006'),
(N'Petar Todorov',    'petar.todorov@mail.com',    '+359 88 100 0007'),
(N'Sofia Marinova',   'sofia.marinova@mail.com',   '+359 88 100 0008'),
(N'Hans Mueller',     'hans.mueller@mail.com',     '+49 151 100 0009'),
(N'Anna Schmidt',     'anna.schmidt@mail.com',     '+49 151 100 0010'),
(N'James Wilson',     'james.wilson@mail.com',     '+44 7700 100011'),
(N'Emily Brown',      'emily.brown@mail.com',      '+44 7700 100012'),
(N'Pierre Dubois',    'pierre.dubois@mail.com',    '+33 6 10 00 00 13'),
(N'Camille Martin',   'camille.martin@mail.com',   '+33 6 10 00 00 14'),
(N'Carlos Garcia',    'carlos.garcia@mail.com',    '+34 600 100 015'),
(N'Lucia Fernandez',  'lucia.fernandez@mail.com',  '+34 600 100 016'),
(N'John Smith',       'john.smith@mail.com',       '+1 212 555 0117'),
(N'Sarah Johnson',    'sarah.johnson@mail.com',    '+1 212 555 0118'),
(N'Michael Davis',    'michael.davis@mail.com',    '+1 212 555 0119'),
(N'Jessica Miller',   'jessica.miller@mail.com',   '+1 212 555 0120');
 

INSERT INTO Driver (full_name, phone, city_id)
SELECT v.full_name, v.phone, c.city_id
FROM (VALUES
    (N'Dimitar Kolev',     '+359 87 200 0001', N'Sofia'),
    (N'Stefan Angelov',    '+359 87 200 0002', N'Sofia'),
    (N'Lukas Becker',      '+49 160 200 0003', N'Berlin'),
    (N'Jonas Hoffmann',    '+49 160 200 0004', N'Berlin'),
    (N'Oliver Taylor',     '+44 7800 200005',  N'London'),
    (N'Harry Evans',       '+44 7800 200006',  N'London'),
    (N'Louis Bernard',     '+33 7 20 00 00 07', N'Paris'),
    (N'Hugo Petit',        '+33 7 20 00 00 08', N'Paris'),
    (N'Javier Lopez',      '+34 700 200 009',  N'Madrid'),
    (N'Pablo Sanchez',     '+34 700 200 010',  N'Madrid'),
    (N'David Anderson',    '+1 917 555 0111',  N'New York'),
    (N'Robert Thomas',     '+1 917 555 0112',  N'New York')
) AS v(full_name, phone, city_name)
JOIN City c ON c.name = v.city_name;
 

INSERT INTO Vehicle (plate_number, model, driver_id)
SELECT 'UB' + RIGHT('0000' + CAST(driver_id AS VARCHAR(10)), 4) + 'A',
       CHOOSE(driver_id % 5 + 1, N'Toyota Corolla', N'Skoda Octavia', N'Hyundai Elantra', N'VW Passat', N'Tesla Model 3'),
       driver_id
FROM Driver;
 
INSERT INTO Vehicle (plate_number, model, driver_id)
SELECT 'UB' + RIGHT('0000' + CAST(driver_id AS VARCHAR(10)), 4) + 'B',
       CHOOSE((driver_id + 2) % 5 + 1, N'Toyota Corolla', N'Skoda Octavia', N'Hyundai Elantra', N'VW Passat', N'Tesla Model 3'),
       driver_id
FROM Driver
WHERE driver_id % 4 = 0;
 

INSERT INTO PromoCode (code, discount_percent) VALUES
('WELCOME10', 10),
('FRIEND15',  15),
('SUMMER20',  20),
('WEEKEND25', 25),
('LOYAL30',   30);
 

INSERT INTO RiderPromo (rider_id, promo_id, is_used)
SELECT r.rider_id, p.promo_id, 0
FROM Rider r
CROSS JOIN PromoCode p
WHERE ABS(CHECKSUM(r.rider_id * 100 + p.promo_id) % 100) < 45;
 

DECLARE @trip_count INT = 400;
DECLARE @i          INT = 1;
DECLARE @rider_id   INT;
DECLARE @driver_id  INT;
DECLARE @vehicle_id INT;
DECLARE @promo_id   INT;
DECLARE @distance   DECIMAL(6,2);
DECLARE @status     NVARCHAR(20);
DECLARE @fare       DECIMAL(8,2);
DECLARE @trip_date  DATETIME2;
DECLARE @a          INT;
DECLARE @b          INT;
 
WHILE @i <= @trip_count
BEGIN
    SELECT TOP 1 @rider_id = rider_id FROM Rider ORDER BY NEWID();
    SELECT TOP 1 @vehicle_id = vehicle_id, @driver_id = driver_id FROM Vehicle ORDER BY NEWID();
 
    SET @promo_id = NULL;
    IF ABS(CHECKSUM(NEWID()) % 100) < 35
        SELECT TOP 1 @promo_id = promo_id
        FROM RiderPromo
        WHERE rider_id = @rider_id
        ORDER BY NEWID();
 
    SET @distance  = CAST(1 + (ABS(CHECKSUM(NEWID()) % 250) / 10.0) AS DECIMAL(6,2));
    SET @trip_date = DATEADD(MINUTE, -ABS(CHECKSUM(NEWID()) % 525600), SYSDATETIME());
    SET @status    = CASE WHEN ABS(CHECKSUM(NEWID()) % 100) < 90 THEN 'completed' ELSE 'cancelled' END;
    SET @fare      = CASE WHEN @status = 'completed' THEN dbo.fn_CalculateFare(@distance, @promo_id) ELSE 0 END;
 
    SET @a = ABS(CHECKSUM(NEWID()) % 8);
    SET @b = (@a + 1 + ABS(CHECKSUM(NEWID()) % 7)) % 8;
 
    INSERT INTO Trip (rider_id, driver_id, vehicle_id, promo_id,
                      pickup_address, dropoff_address,
                      distance_km, fare, status, trip_date)
    VALUES (@rider_id, @driver_id, @vehicle_id, @promo_id,
            CHOOSE(@a + 1, N'Central Station', N'Airport Terminal 1', N'City Mall', N'University Campus',
                           N'Old Town Square', N'Business Park', N'Riverside Park', N'Hospital Entrance'),
            CHOOSE(@b + 1, N'Central Station', N'Airport Terminal 1', N'City Mall', N'University Campus',
                           N'Old Town Square', N'Business Park', N'Riverside Park', N'Hospital Entrance'),
            @distance, @fare, @status, @trip_date);
 
    SET @i += 1;
END;
 

UPDATE rp
SET is_used = 1
FROM RiderPromo rp
WHERE EXISTS (
    SELECT 1 FROM Trip t
    WHERE t.rider_id = rp.rider_id
      AND t.promo_id = rp.promo_id
      AND t.status = 'completed'
);
 

INSERT INTO Payment (trip_id, amount, method, payment_date)
SELECT t.trip_id,
       t.fare,
       CHOOSE(ABS(CHECKSUM(t.trip_id * 31 + 5) % 3) + 1, 'card', 'cash', 'wallet'),
       DATEADD(MINUTE, 20, t.trip_date)
FROM Trip t
WHERE t.status = 'completed';
 

INSERT INTO Rating (trip_id, score, comment)
SELECT t.trip_id,
       s.score,
       CASE s.score
            WHEN 5 THEN N'Great driver, clean car'
            WHEN 4 THEN N'Good ride'
            WHEN 3 THEN N'Okay'
            WHEN 2 THEN N'Late pickup'
            ELSE N'Bad experience'
       END
FROM Trip t
CROSS APPLY (
    SELECT CASE
               WHEN ABS(CHECKSUM(t.trip_id * 17 + 3) % 100) < 55 THEN 5
               WHEN ABS(CHECKSUM(t.trip_id * 17 + 3) % 100) < 80 THEN 4
               WHEN ABS(CHECKSUM(t.trip_id * 17 + 3) % 100) < 92 THEN 3
               WHEN ABS(CHECKSUM(t.trip_id * 17 + 3) % 100) < 97 THEN 2
               ELSE 1
           END AS score
) s
WHERE t.status = 'completed'
  AND ABS(CHECKSUM(t.trip_id * 7 + 11) % 100) < 80;
GO
 

SELECT 'City' AS table_name, COUNT(*) AS rows_count FROM City
UNION ALL SELECT 'Rider',      COUNT(*) FROM Rider
UNION ALL SELECT 'Driver',     COUNT(*) FROM Driver
UNION ALL SELECT 'Vehicle',    COUNT(*) FROM Vehicle
UNION ALL SELECT 'PromoCode',  COUNT(*) FROM PromoCode
UNION ALL SELECT 'RiderPromo', COUNT(*) FROM RiderPromo
UNION ALL SELECT 'Trip',       COUNT(*) FROM Trip
UNION ALL SELECT 'Payment',    COUNT(*) FROM Payment
UNION ALL SELECT 'Rating',     COUNT(*) FROM Rating;