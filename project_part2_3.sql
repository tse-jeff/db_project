INSERT INTO Airline(name)
VALUES ("Jet Blue");
INSERT INTO Airline(name)
VALUES ("Spirit");
INSERT INTO Airline(name)
VALUES ("Singapore Airlines");

INSERT INTO Airport(code, name, city)
VALUES ("JFK", "John F. Kennedy International Airport", "New York");
INSERT INTO Airport(code, name, city)
VALUES ("PVG", "Shanghai Pudong International Airport", "Shanghai");
INSERT INTO Airport(code, name, city)
VALUES ("SIN","Singapore Changi Airport","Singapore");

INSERT INTO Customer(name, email, password, building_num, street, city, state, phone_num)
VALUES ("Jeffery Tse", "jeff.tse@nyu.edu", "123456", "33", "North Oxford Street", "Brooklyn", "NY", 6467970228);
INSERT INTO Customer(name, email, password, building_num, street, city, state, phone_num)
VALUES ("Dion Xia", "dion.xia@nyu.edu", "098765", "199", "Bridge Street", "Brooklyn", "NY", 8562818192);
INSERT INTO Customer(name, email, password, building_num, street, city, state, phone_num)
VALUES ("Jennifer Huang", "xiaohonghuang@yahoo.com", "345678", "2", "Overlook Avenue", "Great Neck", "NY", 9173628607);

INSERT INTO Airplane(ID, seat_num, manufacture_company, age_plane, airline_name)
VALUES (747, 250, "Boeing", 2, "Singapore Airlines");
INSERT INTO Airplane(ID, seat_num, manufacture_company, age_plane, airline_name)
VALUES (737, 230, "Boeing", 4, "Jet Blue");
INSERT INTO Airplane(ID, seat_num, manufacture_company, age_plane, airline_name)
VALUES (345, 150, "Airbus", 6, "Spirit");

INSERT INTO Airline_Staff(airline_name, username, password, first_name, last_name, date_of_birth)
VALUES ("Jet Blue", "bobbuild", "135790", "Bob", "Builder", "1995-01-01");

INSERT INTO Flight(airline_name, flight_num, departure_date, departure_time, arrival_date, arrival_time, base_price, id_num, departure_airport_code, arrival_airport_code,flight_status)
VALUES ("Jet Blue", "JB123", "2022-11-5", "07:40:00", "2022-11-6", "12:15:00", 15000.00, "15328", "JFK", "PVG","Delay");
INSERT INTO Flight(airline_name, flight_num, departure_date, departure_time, arrival_date, arrival_time, base_price, id_num, departure_airport_code, arrival_airport_code,flight_status)
VALUES ("Sprit", "SP456", "2022-11-3", "04:50:00", "2022-11-4", "04:30:00", 275.00, "43525", "SIN", "JFK","Delay");
INSERT INTO Flight(airline_name, flight_num, departure_date, departure_time, arrival_date, arrival_time, base_price, id_num, departure_airport_code, arrival_airport_code,flight_status)
VALUES ("Singapore Airlines", "SA495", "2022-11-1", "00:01:00", "2022-11-2", "00:13:00", 9999.00, "19324", "SIN", "PVG","On-time");

INSERT INTO Ticket(ID, customer_email, class, airline_name, flight_num, sold_price, card_type, card_number, name_on_card, expiration_date, purchase_date, purchase_time)
VALUES ("ABC123", "jeff.tse@nyu.edu", "A", "Jet Blue", "JB123", 1500.00, "Debit", "12345678910","Jeffery Tse", "2023-08-02", "2022-10-13", "04:25:00");
INSERT INTO Ticket(ID, customer_email, class, airline_name, flight_num, sold_price, card_type, card_number, name_on_card, expiration_date, purchase_date, purchase_time)
VALUES ("QWE789", "dion.xia@nyu.edu", "B", "Spirit", "SP456", 400.00, "Credit", "0987654321","Dion Xia", "2024-10-12", "2022-10-15", "03:10:00");


INSERT INTO Purchase(email,ticket_id)
VALUES ("jeff.tse@nyu.edu","ABC123");
INSERT INTO Purchase(email,ticket_id)
VALUES ("dion.xia@nyu.edu","QWE789");



