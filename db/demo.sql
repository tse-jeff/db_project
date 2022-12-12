-- add airline (United)
INSERT INTO airline(name)
VALUES ("United");

-- add airline staff
INSERT INTO airline_staff(airline_name, username, password, first_name, last_name, date_of_birth)
VALUES ("United", "admin", "abcd", "Roe", "Jones", "1978-05-25");

-- add airline staff phone number
INSERT INTO airline_staff_phone_number(username, phone_num)
VALUES ("admin", 111-2222-3333);
INSERT INTO airline_staff_phone_number(username, phone_num)
VALUES ("admin", 444-5555-6666);

-- add airline staff email
INSERT INTO airline_staff_email(username, email)
VALUES ("admin", "staff@nyu.edu");

-- add airplane
INSERT INTO airplane(airline_name, seat_num, manufacture_company, age_plane, ID)
VALUES ("United", 4, "Boeing", 10, "1");
INSERT INTO airplane(airline_name, seat_num, manufacture_company, age_plane, ID)
VALUES ("United", 4, "Airbus", 12, "2");
INSERT INTO airplane(airline_name, seat_num, manufacture_company, age_plane, ID)
VALUES ("United", 50, "Boeing", 8, "3");

-- add airports
INSERT INTO airport(code, city, country, airport_type)
VALUES ("JFK", "NYC", "USA", "Both");
INSERT INTO airport(code, city, country, airport_type)
VALUES ("BOS", "Boston", "USA", "Both");
INSERT INTO airport(code, city, country, airport_type)
VALUES ("PVG", "Shanghai", "China", "Both");
INSERT INTO airport(code, city, country, airport_type)
VALUES ("BEI", "Beijing", "China", "Both");
INSERT INTO airport(code, city, country, airport_type)
VALUES ("SFO", "San Francisco", "USA", "Both");
INSERT INTO airport(code, city, country, airport_type)
VALUES ("LAX", "Los Angeles", "USA", "Both");
INSERT INTO airport(code, city, country, airport_type)
VALUES ("HKA", "Hong Kong", "China", "Both");
INSERT INTO airport(code, city, country, airport_type)
VALUES ("SHEN", "Shenzhen", "China", "Both");

-- add customers
INSERT INTO customer(email, password, name, building_num, street, city, state, phone_num, passport_num, passport_exp_date, passport_country, date_of_birth)
VALUES ("testcustomer@nyu.edu", "1234", "Test Customer 1", 1555, "Jay St", "Brooklyn", "New York", 123-4321-4321, "54321", "2025-12-24", "USA", "1999-12-19");
INSERT INTO customer(email, password, name, building_num, street, city, state, phone_num, passport_num, passport_exp_date, passport_country, date_of_birth)
VALUES ("user1@nyu.edu", "1234", "User 1", 5405, "Jay st", "Brooklyn", "New York", 123-4322-4322, "54322", "2025-12-25", "USA", "1999-11-19");
INSERT INTO customer(email, password, name, building_num, street, city, state, phone_num, passport_num, passport_exp_date, passport_country, date_of_birth)
VALUES ("user2@nyu.edu", "1234", "User 2", 1702, "Jay st", "Brooklyn", "New York", 123-4323-4323, "54323", "2025-10-24", "USA", "1999-10-19");
INSERT INTO customer(email, password, name, building_num, street, city, state, phone_num, passport_num, passport_exp_date, passport_country, date_of_birth)
VALUES ("user3@nyu.edu", "1234", "User 3", 1890, "Jay st", "Brooklyn", "New York", 123-4324-4324, "54324", "2025-09-24", "USA", "1999-09-19");

-- add flights
INSERT INTO flight(airline_name, flight_num, departure_airport_code, departure_date, departure_time, arrival_airport_code, arrival_date, arrival_time, base_price, flight_status, id_num)
VALUES ("United", 102, "SFO", "2022-09-12", "13:25:25", "LAX", "2022-09-12", "16:50:25", 300, "on-time", "3");
INSERT INTO flight(airline_name, flight_num, departure_airport_code, departure_date, departure_time, arrival_airport_code, arrival_date, arrival_time, base_price, flight_status, id_num)
VALUES ("United", 104, "PVG", "2022-10-04", "13:25:25", "BEI", "2022-10-04", "16:50:25", 300, "on-time", "3");
INSERT INTO flight(airline_name, flight_num, departure_airport_code, departure_date, departure_time, arrival_airport_code, arrival_date, arrival_time, base_price, flight_status, id_num)
VALUES ("United", 106, "SFO", "2022-08-04", "13:25:25", "LAX", "2022-08-04", "16:50:25", 350, "delayed", "3");
INSERT INTO flight(airline_name, flight_num, departure_airport_code, departure_date, departure_time, arrival_airport_code, arrival_date, arrival_time, base_price, flight_status, id_num)
VALUES ("United", 205, "SFO", "2023-02-04", "13:25:25", "LAX", "2023-02-04", "16:50:25", 400, "on-time", "2");
INSERT INTO flight(airline_name, flight_num, departure_airport_code, departure_date, departure_time, arrival_airport_code, arrival_date, arrival_time, base_price, flight_status, id_num)
VALUES ("United", 207, "LAX", "2023-03-04", "13:25:25", "SFO", "2023-03-04", "16:50:25", 300, "on-time", "2");
INSERT INTO flight(airline_name, flight_num, departure_airport_code, departure_date, departure_time, arrival_airport_code, arrival_date, arrival_time, base_price, flight_status, id_num)
VALUES ("United", 134, "JFK", "2022-07-12", "13:25:25", "BOS", "2022-07-12", "16:50:25", 300, "delayed", "3");
INSERT INTO flight(airline_name, flight_num, departure_airport_code, departure_date, departure_time, arrival_airport_code, arrival_date, arrival_time, base_price, flight_status, id_num)
VALUES ("United", 296, "PVG", "2022-12-30", "13:25:25", "SFO", "2022-12-30", "16:50:25", 3000, "on-time", "1");
INSERT INTO flight(airline_name, flight_num, departure_airport_code, departure_date, departure_time, arrival_airport_code, arrival_date, arrival_time, base_price, flight_status, id_num)
VALUES ("United", 715, "PVG", "2022-09-28", "10:25:25", "BEI", "2022-09-28", "13:50:25", 500, "delayed", "1");
INSERT INTO flight(airline_name, flight_num, departure_airport_code, departure_date, departure_time, arrival_airport_code, arrival_date, arrival_time, base_price, flight_status, id_num)
VALUES ("United", 839, "SHEN", "2021-12-26", "13:25:25", "BEI", "2021-12-26", "16:50:25",300, "on-time", "3");

-- add tickets
INSERT INTO Ticket(ID, airline_name, flight_num)
VALUES (1, "United", "102"),
         (2, "United", "102"),
         (3, "United", "102"),
         (4, "United", "104"),
         (5, "United", "104"),
         (6, "United", "106"),
         (7, "United", "106"),
         (8, "United", "839"),
         (9, "United", "102"),
         (11, "United", 134),
         (12, "United", 715),
         (14, "United", 206),
         (15, "United", 206),
         (16, "United", 206),
         (17, "United", 207),
         (18, "United", 207),
         (19, "United", 296),
         (20, "United", 296);

-- add purchases
INSERT INTO Purchase(ticket_ID, email)
VALUES (1, "testcustomer@nyu.edu"),
(2, "user1@nyu.edu"),
(3, "user2@nyu.edu"),
(4, "user1@nyu.edu"),
(5, "testcustomer@nyu.edu"),
(6, "testcustomer@nyu.edu"),
(7, "user3@nyu.edu"),
(8, "user3@nyu.edu"),
(9, "user3@nyu.edu"),
(11, "user3@nyu.edu"),
(12, "testcustomer@nyu.edu"),
(14, "user3@nyu.edu"),
(15, "user1@nyu.edu"),
(16, "user2@nyu.edu"),
(17, "user1@nyu.edu"),
(18, "testcustomer@nyu.edu"),
(19, "user1@nyu.edu"),
(20, "testcustomer@nyu.edu");

-- update tickets purchased with customer info
UPDATE Ticket
SET customer_email = "testcustomer@nyu.edu", 
purchase_date = "2022-08-0r", 
purchase_time = "11:55:55", 
sold_price = 300, 
card_type = "credit",
card_number = "1111-2222-3333-4444",
name_on_card = "Test Customer 1",
expiration_date = "2023-03"
WHERE ID = 1;

UPDATE Ticket
SET customer_email = "user1@nyu.edu",
purchase_date = "2022-08-03",
purchase_time = "11:55:55",
sold_price = 300,
card_type = "credit",
card_number = "1111-2222-3333-5555",
name_on_card = "User 1",
expiration_date = "2023-03"
WHERE ID = 2;

UPDATE Ticket
SET customer_email = "user2@nyu.edu",
purchase_date = "2022-09-04",
purchase_time = "11:55:55",
sold_price = 300,
card_type = "credit",
card_number = "1111-2222-3333-5555",
name_on_card = "User 2",
expiration_date = "2023-03"
WHERE ID = 3;

UPDATE Ticket
SET customer_email = "user1@nyu.edu",
purchase_date = "2022-08-21",
purchase_time = "11:55:55",
sold_price = 300,
card_type = "credit",
card_number = "1111-2222-3333-5555",
name_on_card = "User 1",
expiration_date = "2023-03"
WHERE ID = 4;

UPDATE Ticket
SET customer_email = "testcustomer@nyu.edu",
purchase_date = "2022-09-28",
purchase_time = "11:55:55",
sold_price = 300,
card_type = "credit",
card_number = "1111-2222-3333-4444",
name_on_card = "Test Customer 1",
expiration_date = "2023-03"
WHERE ID = 5;

UPDATE Ticket
SET customer_email = "testcustomer@nyu.edu",
purchase_date = "2022-08-02",
purchase_time = "11:55:55",
sold_price = 350,
card_type = "credit",
card_number = "1111-2222-3333-4444",
name_on_card = "Test Customer 1",
expiration_date = "2023-03"
WHERE ID = 6;

UPDATE Ticket
SET customer_email = "user3@nyu.edu",
purchase_date = "2022-07-03",
purchase_time = "11:55:55",
sold_price = 350,
card_type = "credit",
card_number = "1111-2222-3333-5555",
name_on_card = "User 3",
expiration_date = "2023-03"
WHERE ID = 7;

UPDATE Ticket
SET customer_email = "user3@nyu.edu",
purchase_date = "2022-12-03",
purchase_time = "11:55:55",
sold_price = 300,
card_type = "credit",
card_number = "1111-2222-3333-5555",
name_on_card = "User 3",
expiration_date = "2023-03"
WHERE ID = 8;

UPDATE Ticket
SET customer_email = "user3@nyu.edu",
purchase_date = "2022-07-04",
purchase_time = "11:55:55",
sold_price = 300,
card_type = "credit",
card_number = "1111-2222-3333-5555",
name_on_card = "User 3",
expiration_date = "2023-03"
WHERE ID = 9;

UPDATE Ticket
SET customer_email = "user3@nyu.edu",
purchase_date = "2022-05-23",
purchase_time = "11:55:55",
sold_price = 300,
card_type = "credit",
card_number = "1111-2222-3333-5555",
name_on_card = "User 3",
expiration_date = "2023-03"
WHERE ID = 11;

UPDATE Ticket
SET customer_email = "testcustomer@nyu.edu",
purchase_date = "2022-05-02",
purchase_time = "11:55:55",
sold_price = 500,
card_type = "credit",
card_number = "1111-2222-3333-4444",
name_on_card = "Test Customer 1",
expiration_date = "2023-03"
WHERE ID = 12;

UPDATE Ticket
SET customer_email = "user3@nyu.edu",
purchase_date = "2022-11-20",
purchase_time = "11:55:55",
sold_price = 400,
card_type = "credit",
card_number = "1111-2222-3333-5555",
name_on_card = "User 3",
expiration_date = "2023-03"
WHERE ID = 14;

UPDATE Ticket
SET customer_email = "user1@nyu.edu",
purchase_date = "2022-11-21",
purchase_time = "11:55:55",
sold_price = 400,
card_type = "credit",
card_number = "1111-2222-3333-5555",
name_on_card = "User 1",
expiration_date = "2023-03"
WHERE ID = 15;

UPDATE Ticket
SET customer_email = "user2@nyu.edu",
purchase_date = "2022-09-19",
purchase_time = "11:55:55",
sold_price = 400,
card_type = "credit",
card_number = "1111-2222-3333-5555",
name_on_card = "User 2",
expiration_date = "2023-03"
WHERE ID = 16;

UPDATE Ticket
SET customer_email = "user1@nyu.edu",
purchase_date = "2022-09-11",
purchase_time = "11:55:55",
sold_price = 300,
card_type = "credit",
card_number = "1111-2222-3333-5555",
name_on_card = "User 1",
expiration_date = "2023-03"
WHERE ID = 17;

UPDATE Ticket
SET customer_email = "testcustomer@nyu.edu",
purchase_date = "2022-09-25",
purchase_time = "11:55:55",
sold_price = 300,
card_type = "credit",
card_number = "1111-2222-3333-4444",
name_on_card = "Test Customer 1",
expiration_date = "2023-03"
WHERE ID = 18;

UPDATE Ticket
SET customer_email = "user1@nyu.edu",
purchase_date = "2022-11-22",
purchase_time = "11:55:55",
sold_price = 3000,
card_type = "credit",
card_number = "1111-2222-3333-4444",
name_on_card = "Test Customer 1",
expiration_date = "2023-03"
WHERE ID = 19;

UPDATE Ticket
SET customer_email = "testcustomer@nyu.edu",
purchase_date = "2022-07-12",
purchase_time = "11:55:55",
sold_price = 3000,
card_type = "credit",
card_number = "1111-2222-3333-4444",
name_on_card = "Test Customer 1",
expiration_date = "2023-03"
WHERE ID = 20;


-- add interactions
INSERT INTO Interact (email, airline_name, flight_num, departure_date, departure_time, rate, comment)
VALUES ("testcustomer@nyu.edu", "United", "102", "2022-09-12", "13:25:25", 4, "Very Comfortable"),
("user1@nyu.edu", "United", "102", "2022-09-12", "13:25:25", 5, "Relaxing, check-in and onboarding very professional"),
("user2@nyu.edu", "United", "102", "2022-09-12", "13:25:25", 3, "Satisfied andwill usethe same flight again"),
("testcustomer@nyu.edu", "United", "104", "2022-10-04", "13:25:25", 1, "Customer Care services are not good"),
("user1@nyu.edu", "United", "104", "2022-10-04", "13:25:25", 5, "Comfortable journey and Professional");
