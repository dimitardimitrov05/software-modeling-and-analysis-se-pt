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
 

INSERT INTO Driver (full_name, phone, city_id) VALUES
(N'Dimitar Kolev',  '+359 87 200 0001', 1),
(N'Stefan Angelov', '+359 87 200 0002', 1),
(N'Lukas Becker',   '+49 160 200 0003', 2),
(N'Jonas Hoffmann', '+49 160 200 0004', 2),
(N'Oliver Taylor',  '+44 7800 200005',  3),
(N'Harry Evans',    '+44 7800 200006',  3),
(N'Louis Bernard',  '+33 7 20 00 00 07', 4),
(N'Hugo Petit',     '+33 7 20 00 00 08', 4),
(N'Javier Lopez',   '+34 700 200 009',  5),
(N'Pablo Sanchez',  '+34 700 200 010',  5),
(N'David Anderson', '+1 917 555 0111',  6),
(N'Robert Thomas',  '+1 917 555 0112',  6);
 

INSERT INTO Vehicle (plate_number, model, driver_id) VALUES
('CB1001AA', N'Toyota Corolla', 1),  ('CB1002AA', N'Skoda Octavia', 2),
('CB1003AA', N'Hyundai Elantra', 3), ('CB1004AA', N'VW Passat', 4),
('CB1005AA', N'Tesla Model 3', 5),   ('CB1006AA', N'Toyota Corolla', 6),
('CB1007AA', N'Skoda Octavia', 7),   ('CB1008AA', N'Hyundai Elantra', 8),
('CB1009AA', N'VW Passat', 9),       ('CB1010AA', N'Tesla Model 3', 10),
('CB1011AA', N'Toyota Corolla', 11), ('CB1012AA', N'Skoda Octavia', 12);
 

INSERT INTO PromoCode (code, discount_percent) VALUES
('WELCOME10', 10),
('FRIEND15',  15),
('SUMMER20',  20),
('WEEKEND25', 25),
('LOYAL30',   30);
 

INSERT INTO RiderPromo (rider_id, promo_id, is_used) VALUES
(1, 1, 0),  (1, 3, 0),
(2, 2, 0),
(3, 1, 0),  (3, 4, 0),  (3, 5, 0),
(4, 3, 0),
(5, 2, 0),  (5, 5, 0),
(6, 1, 0),
(7, 4, 0),
(8, 2, 0),  (8, 3, 0),
(9, 1, 0),  (9, 5, 0),
(10, 3, 0),
(11, 2, 0), (11, 4, 0),
(12, 1, 0),
(13, 5, 0),
(14, 3, 0), (14, 4, 0),
(15, 1, 0), (15, 2, 0),
(16, 4, 0),
(17, 2, 0), (17, 5, 0),
(18, 1, 0), (18, 3, 0),
(19, 5, 0),
(20, 2, 0), (20, 4, 0);
 

insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (11, 11, 11, null, '235 Talisman Point', '9210 Macpherson Pass', 23.34, 0, 'completed', '2026-03-05 16:21:12');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (20, 9, 9, null, '0 Mifflin Place', '51047 Hayes Road', 20.48, 0, 'completed', '2026-04-07 11:54:40');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (3, 7, 7, 4, '79234 Pennsylvania Crossing', '749 Clyde Gallagher Court', 17.36, 0, 'cancelled', '2025-12-13 20:11:47');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (12, 3, 3, 4, '90200 Grover Alley', '08 Blaine Crossing', 9.23, 0, 'cancelled', '2026-05-22 17:50:03');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (17, 7, 7, 1, '711 Mayfield Parkway', '8 Novick Terrace', 14.09, 0, 'completed', '2026-06-14 03:41:32');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (7, 6, 6, 1, '884 Anzinger Junction', '3927 Arrowood Crossing', 9.69, 0, 'completed', '2026-07-25 01:53:56');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (12, 4, 4, null, '0 Maryland Center', '39 Jenna Pass', 12.78, 0, 'completed', '2026-10-13 11:30:56');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (16, 2, 2, null, '8 Holmberg Avenue', '4 Dennis Circle', 14.94, 0, 'completed', '2026-05-28 16:05:32');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (10, 1, 1, 3, '27416 Hanson Plaza', '92216 Vidon Alley', 14.57, 0, 'completed', '2026-05-22 02:17:19');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (19, 1, 1, 3, '35 Melvin Road', '9720 Kennedy Park', 1.98, 0, 'completed', '2025-11-01 20:49:09');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (3, 10, 10, 5, '646 Fulton Lane', '5 Toban Avenue', 22.34, 0, 'completed', '2026-08-19 12:24:26');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (1, 7, 7, null, '9221 Kinsman Road', '19 Trailsway Trail', 6.77, 0, 'completed', '2025-11-10 22:25:01');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (1, 3, 3, 5, '10 Butterfield Circle', '6 Bultman Lane', 13.1, 0, 'completed', '2026-02-26 06:35:21');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (2, 10, 10, null, '7013 Summer Ridge Pass', '376 Melody Circle', 11.29, 0, 'cancelled', '2025-11-11 13:45:37');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (9, 1, 1, 4, '5 Acker Place', '41 Coolidge Place', 9.82, 0, 'completed', '2026-10-13 21:43:37');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (17, 6, 6, null, '45 Spaight Street', '1219 Monument Street', 1.64, 0, 'cancelled', '2026-03-03 05:49:39');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (1, 4, 4, null, '24290 Towne Road', '4396 Vidon Way', 24.54, 0, 'completed', '2025-11-04 12:56:45');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (11, 3, 3, null, '01985 Claremont Hill', '4907 Schmedeman Center', 16.35, 0, 'completed', '2026-04-10 07:39:32');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (15, 7, 7, null, '258 Westridge Center', '37008 Weeping Birch Road', 13.38, 0, 'completed', '2026-04-18 16:05:31');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (6, 7, 7, 2, '315 Laurel Drive', '94958 Hoffman Hill', 23.17, 0, 'completed', '2026-03-02 03:25:42');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (10, 8, 8, 2, '705 3rd Place', '8 Granby Drive', 12.47, 0, 'completed', '2026-02-17 21:21:14');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (4, 1, 1, null, '9 Gerald Road', '3747 North Parkway', 5.35, 0, 'cancelled', '2025-12-09 08:44:18');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (1, 12, 12, null, '79558 Melvin Drive', '70179 Clemons Lane', 21.31, 0, 'completed', '2026-07-31 02:20:05');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (17, 5, 5, 3, '32734 Towne Drive', '13 Farmco Court', 3.66, 0, 'completed', '2025-12-10 03:33:40');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (20, 5, 5, null, '722 Fordem Alley', '7178 Weeping Birch Trail', 24.29, 0, 'completed', '2026-01-14 09:56:25');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (11, 8, 8, null, '5620 Schmedeman Court', '4796 Onsgard Crossing', 8.09, 0, 'completed', '2025-10-21 05:35:26');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (11, 7, 7, 5, '23 Cherokee Avenue', '2057 Bellgrove Trail', 20.54, 0, 'completed', '2026-07-24 15:13:32');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (4, 1, 1, 5, '2700 Heffernan Avenue', '1 Maryland Center', 16.5, 0, 'completed', '2026-04-07 00:25:46');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (18, 7, 7, null, '790 Veith Circle', '13744 Union Drive', 22.35, 0, 'completed', '2026-01-20 00:14:04');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (4, 5, 5, null, '81 Cascade Avenue', '42273 Harper Street', 4.91, 0, 'completed', '2026-10-05 22:37:32');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (4, 5, 5, 2, '30 Red Cloud Park', '177 Dayton Park', 6.5, 0, 'completed', '2026-08-05 02:30:34');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (7, 6, 6, null, '996 1st Parkway', '8 Upham Street', 13.33, 0, 'completed', '2026-08-28 05:34:21');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (6, 1, 1, 3, '2432 Mosinee Crossing', '44245 Oneill Plaza', 15.17, 0, 'completed', '2026-03-27 20:08:41');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (11, 2, 2, null, '87486 Farwell Way', '14 Loeprich Lane', 15.46, 0, 'completed', '2026-06-07 22:33:21');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (1, 9, 9, 2, '44 2nd Junction', '0446 Scoville Terrace', 19.76, 0, 'cancelled', '2025-11-22 08:12:48');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (8, 2, 2, null, '79739 School Junction', '07 Mallard Trail', 3.66, 0, 'completed', '2026-02-04 08:44:25');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (19, 10, 10, null, '85 Raven Street', '39957 Linden Alley', 23.68, 0, 'completed', '2026-08-03 03:23:22');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (18, 12, 12, 4, '34 Mockingbird Park', '8033 Grasskamp Park', 16.78, 0, 'completed', '2026-10-20 00:23:35');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (16, 12, 12, null, '58 Continental Park', '7 La Follette Junction', 4.42, 0, 'completed', '2026-10-06 08:01:38');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (3, 3, 3, null, '14690 Bartillon Alley', '71331 Lotheville Road', 22.29, 0, 'completed', '2026-04-06 11:12:47');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (20, 10, 10, null, '69 Bellgrove Crossing', '21793 Namekagon Place', 16.88, 0, 'completed', '2026-02-27 09:44:32');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (17, 6, 6, null, '93304 Colorado Road', '6 Arapahoe Way', 22.44, 0, 'completed', '2026-01-14 18:30:33');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (7, 2, 2, null, '91487 Golf Center', '921 New Castle Junction', 13.7, 0, 'completed', '2025-11-12 01:12:42');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (6, 1, 1, null, '3459 Division Junction', '69705 Autumn Leaf Alley', 14.26, 0, 'completed', '2026-04-15 19:12:53');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (18, 2, 2, null, '580 Sundown Junction', '4 Sundown Drive', 21.89, 0, 'completed', '2026-01-30 02:25:59');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (12, 8, 8, 4, '450 Sunbrook Court', '114 Dryden Pass', 9.4, 0, 'completed', '2026-10-12 18:24:32');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (8, 12, 12, 5, '607 Shelley Junction', '51 Sunnyside Park', 8.87, 0, 'completed', '2025-12-05 17:14:04');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (2, 4, 4, null, '84 La Follette Parkway', '627 Vera Lane', 16.88, 0, 'completed', '2025-12-05 16:01:43');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (10, 11, 11, null, '8 Granby Terrace', '359 Annamark Alley', 10.9, 0, 'completed', '2026-10-15 12:11:31');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (2, 5, 5, 2, '307 Crest Line Park', '00621 Sherman Street', 16.73, 0, 'completed', '2026-03-12 13:46:31');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (10, 8, 8, null, '01443 Karstens Crossing', '8973 Novick Parkway', 6.83, 0, 'completed', '2025-12-03 03:44:52');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (13, 6, 6, 4, '679 Crownhardt Circle', '6 Nelson Way', 24.94, 0, 'completed', '2025-12-02 21:18:51');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (5, 1, 1, null, '24 Chinook Junction', '1 Park Meadow Court', 19.33, 0, 'completed', '2026-03-06 16:50:19');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (6, 1, 1, 2, '16 Surrey Hill', '1 Lakewood Center', 12.09, 0, 'completed', '2026-03-28 03:00:53');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (18, 2, 2, 4, '9610 Hanover Lane', '12741 Bluestem Lane', 13.7, 0, 'completed', '2026-05-18 20:11:37');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (20, 6, 6, null, '33 Birchwood Point', '794 Tennyson Lane', 16.93, 0, 'completed', '2026-07-16 11:14:00');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (9, 12, 12, 5, '43 Northridge Circle', '67469 Petterle Road', 10.11, 0, 'completed', '2026-01-17 11:23:59');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (16, 2, 2, 5, '98138 Buena Vista Pass', '361 Dottie Road', 16.74, 0, 'completed', '2025-11-24 07:29:51');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (4, 1, 1, null, '915 Maywood Avenue', '03930 West Avenue', 24.15, 0, 'cancelled', '2026-07-10 07:55:19');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (20, 10, 10, null, '026 Orin Center', '53 Fordem Plaza', 12.4, 0, 'completed', '2026-05-31 10:52:56');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (16, 7, 7, null, '75355 Cascade Center', '890 Vermont Center', 21.4, 0, 'completed', '2026-07-13 08:15:01');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (7, 3, 3, null, '2 Westport Parkway', '29 Packers Terrace', 16.89, 0, 'completed', '2026-10-07 20:44:36');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (11, 12, 12, null, '295 Schmedeman Circle', '9 Gerald Place', 10.53, 0, 'completed', '2026-01-22 15:04:33');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (13, 5, 5, 2, '9695 Thierer Trail', '3 Cottonwood Place', 24.89, 0, 'completed', '2026-01-01 06:46:29');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (20, 12, 12, null, '5 Kim Street', '3 Red Cloud Court', 23.79, 0, 'completed', '2026-01-23 09:00:28');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (11, 12, 12, null, '970 Arrowood Alley', '17174 Rutledge Park', 15.0, 0, 'completed', '2025-11-23 15:11:25');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (13, 5, 5, null, '93216 7th Street', '9 Moland Drive', 4.49, 0, 'completed', '2026-06-12 10:17:45');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (15, 12, 12, null, '249 Pierstorff Place', '737 Warner Terrace', 12.6, 0, 'completed', '2026-04-07 12:55:44');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (1, 7, 7, null, '35 Straubel Road', '4 Thompson Street', 4.99, 0, 'completed', '2026-07-03 08:35:55');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (17, 4, 4, null, '88437 Continental Terrace', '5 Anniversary Lane', 2.75, 0, 'completed', '2026-01-15 07:32:06');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (16, 12, 12, 5, '49 Schurz Way', '726 Moland Court', 9.3, 0, 'completed', '2026-07-21 08:29:41');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (18, 6, 6, null, '2934 Ryan Road', '962 Little Fleur Park', 24.66, 0, 'completed', '2026-10-04 19:30:42');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (3, 2, 2, 3, '9247 Corscot Crossing', '5 Fordem Pass', 1.97, 0, 'completed', '2025-12-09 16:16:32');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (10, 3, 3, 1, '68095 Manitowish Center', '6900 Sundown Plaza', 12.06, 0, 'completed', '2025-12-05 08:51:16');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (13, 9, 9, null, '29596 Morrow Crossing', '785 Manley Place', 21.82, 0, 'completed', '2026-04-11 06:29:28');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (13, 4, 4, null, '7 Becker Hill', '6 Comanche Place', 17.06, 0, 'completed', '2026-01-03 12:37:20');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (12, 8, 8, null, '5 Elka Alley', '1628 Summer Ridge Avenue', 18.03, 0, 'completed', '2026-05-24 13:22:10');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (19, 4, 4, 3, '6907 Warrior Road', '73 Hermina Alley', 22.02, 0, 'completed', '2025-11-20 00:23:17');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (10, 7, 7, null, '379 Lakeland Lane', '9 Nelson Trail', 21.17, 0, 'cancelled', '2025-11-14 14:45:27');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (7, 2, 2, 4, '2789 Fieldstone Plaza', '964 Sauthoff Court', 3.2, 0, 'completed', '2026-01-13 11:54:25');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (11, 1, 1, null, '9197 Kropf Pass', '66827 Laurel Circle', 8.37, 0, 'completed', '2025-12-10 01:12:31');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (10, 5, 5, null, '681 Carioca Circle', '8 Dunning Hill', 6.14, 0, 'completed', '2025-11-05 08:36:11');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (8, 3, 3, null, '9184 Riverside Point', '9639 Summit Plaza', 1.23, 0, 'completed', '2025-12-08 21:15:18');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (11, 7, 7, null, '2014 Sage Court', '52 Florence Alley', 2.03, 0, 'completed', '2026-05-25 11:19:57');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (15, 7, 7, null, '4 Jackson Crossing', '15571 Colorado Park', 12.11, 0, 'completed', '2025-10-22 00:56:36');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (16, 7, 7, null, '4 Florence Way', '68387 Hallows Park', 24.9, 0, 'completed', '2026-10-17 10:18:51');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (3, 8, 8, null, '3792 Autumn Leaf Crossing', '568 Northland Center', 1.08, 0, 'completed', '2026-02-03 07:09:50');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (15, 8, 8, null, '3353 Haas Alley', '198 Parkside Pass', 15.25, 0, 'completed', '2025-11-22 23:25:39');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (8, 9, 9, 3, '59388 Maywood Drive', '47975 Meadow Valley Crossing', 21.26, 0, 'completed', '2025-11-30 09:36:03');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (5, 3, 3, 4, '44 Briar Crest Terrace', '74357 Londonderry Avenue', 12.43, 0, 'completed', '2026-10-15 08:02:58');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (10, 6, 6, null, '20 Vermont Center', '02564 Pawling Lane', 1.69, 0, 'completed', '2025-10-31 01:43:08');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (15, 2, 2, 2, '626 Forest Alley', '29817 Forest Dale Circle', 20.9, 0, 'completed', '2026-05-01 19:01:16');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (4, 4, 4, null, '6 Eastwood Crossing', '9 Boyd Junction', 21.95, 0, 'completed', '2026-05-25 13:37:17');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (7, 3, 3, null, '96 Doe Crossing Alley', '0208 Lawn Alley', 3.97, 0, 'completed', '2026-06-29 11:51:01');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (5, 11, 11, null, '809 Mallard Court', '8 Birchwood Crossing', 11.29, 0, 'completed', '2026-04-04 12:14:48');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (3, 1, 1, null, '1 Towne Drive', '91 East Center', 22.11, 0, 'completed', '2025-12-29 05:05:32');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (16, 1, 1, null, '491 Cascade Parkway', '330 Schurz Drive', 2.97, 0, 'completed', '2026-08-28 04:50:54');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (13, 3, 3, 1, '49234 Stuart Lane', '2 Larry Center', 20.9, 0, 'completed', '2025-12-09 22:50:42');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (14, 4, 4, null, '6 South Center', '11159 Sherman Way', 13.37, 0, 'completed', '2026-05-03 19:25:04');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (17, 5, 5, null, '73810 Nevada Hill', '258 West Road', 7.0, 0, 'cancelled', '2026-06-11 09:58:17');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (7, 3, 3, null, '650 Golden Leaf Pass', '11312 Rusk Avenue', 8.45, 0, 'completed', '2026-06-18 00:42:29');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (4, 8, 8, 1, '74 Judy Park', '4379 Pond Terrace', 12.96, 0, 'cancelled', '2025-12-15 20:38:38');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (14, 3, 3, 3, '61 Petterle Alley', '715 Holmberg Street', 9.15, 0, 'completed', '2026-08-07 20:53:54');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (15, 7, 7, 1, '495 Cody Pass', '70653 Pankratz Circle', 10.12, 0, 'completed', '2026-08-15 18:38:49');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (13, 12, 12, null, '20 Crowley Plaza', '937 Briar Crest Lane', 4.4, 0, 'completed', '2025-12-27 08:11:32');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (8, 11, 11, 5, '492 Miller Hill', '4715 Fulton Street', 11.73, 0, 'completed', '2026-03-09 02:56:24');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (20, 3, 3, 4, '50216 Heath Avenue', '44 Lotheville Terrace', 17.64, 0, 'completed', '2026-10-02 03:30:05');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (9, 8, 8, null, '10 Mosinee Court', '24 Manley Lane', 14.37, 0, 'completed', '2026-08-12 15:17:17');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (14, 10, 10, null, '67 Buell Terrace', '18746 Shopko Park', 20.55, 0, 'completed', '2026-07-13 17:53:05');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (3, 2, 2, null, '2846 Carpenter Park', '005 Loomis Terrace', 22.35, 0, 'completed', '2026-07-10 12:16:13');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (19, 3, 3, 4, '812 Luster Alley', '085 Summerview Street', 9.34, 0, 'completed', '2026-03-16 22:51:45');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (11, 8, 8, null, '59523 Nevada Court', '083 Kedzie Trail', 16.97, 0, 'completed', '2026-05-31 17:51:02');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (10, 9, 9, null, '691 Jenna Terrace', '61 Dorton Trail', 9.89, 0, 'completed', '2025-12-19 13:36:18');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (3, 7, 7, null, '9 Oxford Court', '25 Prairieview Trail', 24.42, 0, 'completed', '2026-05-25 19:17:58');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (4, 6, 6, null, '94 Hoffman Circle', '46 Scofield Place', 9.99, 0, 'completed', '2026-05-31 14:35:52');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (12, 7, 7, 4, '16704 Meadow Valley Hill', '16167 Anniversary Crossing', 11.64, 0, 'completed', '2026-08-04 19:59:16');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (12, 5, 5, null, '1414 Evergreen Pass', '78592 Pond Street', 13.89, 0, 'completed', '2026-09-15 19:56:43');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (9, 3, 3, 3, '8 Memorial Street', '549 Hauk Alley', 13.71, 0, 'completed', '2026-02-24 17:42:23');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (10, 3, 3, 3, '8 Old Shore Terrace', '7 Bunting Road', 19.07, 0, 'completed', '2025-11-30 17:56:29');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (19, 12, 12, null, '072 Lien Crossing', '0748 Kropf Pass', 11.67, 0, 'completed', '2025-11-15 07:25:39');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (6, 8, 8, 1, '143 Sachs Pass', '526 Coleman Junction', 15.74, 0, 'completed', '2026-01-17 17:54:36');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (1, 1, 1, 2, '47 Sherman Court', '812 Darwin Road', 12.85, 0, 'completed', '2026-06-22 20:28:28');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (9, 5, 5, null, '7 Hintze Way', '5 Bultman Place', 17.84, 0, 'cancelled', '2026-06-30 20:28:39');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (3, 6, 6, null, '6 Morrow Terrace', '8 Fisk Point', 14.53, 0, 'completed', '2026-01-05 08:37:47');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (16, 8, 8, null, '8 Ramsey Terrace', '89256 Everett Parkway', 17.12, 0, 'completed', '2025-11-09 18:46:02');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (12, 5, 5, null, '9 Burning Wood Circle', '6082 Bluestem Place', 10.37, 0, 'completed', '2026-10-03 14:32:57');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (13, 10, 10, null, '4413 Melody Road', '6 Colorado Point', 11.0, 0, 'completed', '2026-04-19 07:03:17');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (1, 7, 7, 2, '11761 Thierer Hill', '8 Carpenter Pass', 15.53, 0, 'completed', '2026-03-06 18:36:17');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (14, 4, 4, null, '172 Fuller Avenue', '67 Luster Way', 6.9, 0, 'completed', '2026-10-15 21:56:16');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (16, 2, 2, null, '79 Weeping Birch Pass', '758 Fieldstone Center', 23.64, 0, 'cancelled', '2026-06-26 23:25:32');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (10, 9, 9, null, '1411 Forest Terrace', '136 Packers Circle', 24.9, 0, 'completed', '2026-03-12 17:51:31');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (3, 8, 8, null, '8567 Farmco Court', '061 Northland Lane', 3.01, 0, 'completed', '2025-11-03 21:55:43');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (5, 10, 10, null, '450 Logan Plaza', '2 Briar Crest Court', 8.73, 0, 'completed', '2026-09-04 07:04:00');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (17, 2, 2, 5, '67 Sutherland Street', '92594 Valley Edge Parkway', 15.54, 0, 'completed', '2025-11-19 13:04:02');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (11, 6, 6, 5, '2 Pennsylvania Trail', '2398 Village Terrace', 15.31, 0, 'completed', '2026-03-04 23:13:10');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (20, 12, 12, 1, '7 Mallard Junction', '264 Morningstar Street', 9.16, 0, 'completed', '2026-01-04 21:40:21');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (10, 4, 4, null, '7 Boyd Crossing', '8936 Onsgard Crossing', 3.68, 0, 'completed', '2026-03-13 15:49:30');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (20, 6, 6, null, '17287 Briar Crest Lane', '6321 Waubesa Plaza', 13.74, 0, 'completed', '2026-08-30 07:44:41');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (3, 1, 1, 2, '7739 Petterle Road', '57971 Becker Court', 17.01, 0, 'completed', '2026-01-19 06:25:19');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (2, 3, 3, null, '3 Manitowish Center', '12 Morrow Plaza', 12.15, 0, 'completed', '2026-09-09 23:54:39');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (13, 6, 6, 5, '039 Memorial Court', '090 Toban Crossing', 2.14, 0, 'cancelled', '2026-06-14 13:25:26');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (12, 6, 6, null, '88 Esch Street', '07 Lukken Circle', 19.77, 0, 'completed', '2026-05-31 05:00:30');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (12, 11, 11, 2, '124 Huxley Plaza', '6900 Autumn Leaf Trail', 17.66, 0, 'completed', '2025-12-18 20:27:46');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (9, 1, 1, 3, '469 Sycamore Terrace', '46 Arapahoe Terrace', 4.36, 0, 'completed', '2026-10-20 08:08:21');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (15, 4, 4, null, '21 Jackson Way', '6 Carpenter Plaza', 8.51, 0, 'completed', '2026-04-15 16:09:47');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (14, 10, 10, 2, '23 Clyde Gallagher Hill', '1491 Springs Road', 2.62, 0, 'completed', '2026-01-23 12:56:01');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (8, 10, 10, 1, '50143 Lien Circle', '3773 Russell Trail', 12.58, 0, 'completed', '2025-12-09 02:32:11');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (8, 1, 1, 5, '880 Mitchell Hill', '298 Arkansas Junction', 19.04, 0, 'cancelled', '2026-04-24 06:59:57');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (11, 4, 4, 5, '03 Butternut Center', '07 Fuller Junction', 21.29, 0, 'completed', '2026-05-07 15:18:36');
insert into Trip (rider_id, driver_id, vehicle_id, promo_id, pickup_address, dropoff_address, distance_km, fare, status, trip_date) values (17, 8, 8, 3, '3 Gerald Lane', '44738 Becker Point', 10.86, 0, 'completed', '2026-05-13 03:50:49');

UPDATE Trip
SET fare = dbo.fn_CalculateFare(distance_km, promo_id)
WHERE status = 'completed';
 

INSERT INTO Payment (trip_id, amount, method, payment_date)
SELECT trip_id, fare,
       CASE trip_id % 3 WHEN 0 THEN 'card' WHEN 1 THEN 'cash' ELSE 'wallet' END,
       DATEADD(MINUTE, 20, trip_date)
FROM Trip
WHERE status = 'completed';
 

IINSERT INTO Rating (trip_id, score, comment)
SELECT trip_id, trip_id % 3 + 3, N'Good ride'
FROM Trip
WHERE status = 'completed' AND trip_id % 4 <> 0;
 

SELECT 'City' AS table_name, COUNT(*) AS rows_count FROM City
UNION ALL SELECT 'Rider',      COUNT(*) FROM Rider
UNION ALL SELECT 'Driver',     COUNT(*) FROM Driver
UNION ALL SELECT 'Vehicle',    COUNT(*) FROM Vehicle
UNION ALL SELECT 'PromoCode',  COUNT(*) FROM PromoCode
UNION ALL SELECT 'RiderPromo', COUNT(*) FROM RiderPromo
UNION ALL SELECT 'Trip',       COUNT(*) FROM Trip
UNION ALL SELECT 'Payment',    COUNT(*) FROM Payment
UNION ALL SELECT 'Rating',     COUNT(*) FROM Rating;