CREATE DATABASE db_project;
USE db_project;

CREATE TABLE Ticket(
	ID VARCHAR(20) NOT NULL,
	customer_email VARCHAR(255) NOT NULL,
	class VARCHAR(20) NOT NULL,
	airline_name VARCHAR(255) NOT NULL,
	flight_num VARCHAR(20) NOT NULL,
	sold_price INT NOT NULL,
	card_type VARCHAR(20) NOT NULL,
	card_number BIGINT NOT NULL,
	name_on_card VARCHAR(255) NOT NULL,
	expiration_date DATE,
	purchase_date DATE,
	purchase_time TIME, 
	PRIMARY KEY (ID)
);

CREATE TABLE Customer(
	name VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL,
	password VARCHAR(255) NOT NULL,
	building_num INT,
	street VARCHAR(255),
	city VARCHAR(255),
	state VARCHAR(255),
	phone_num BIGINT,
	passport_num VARCHAR(20),
	passport_exp_date DATE,
	passport_country VARCHAR(255),
	date_of_birth DATE,
	PRIMARY KEY (email)
);

CREATE TABLE Purchase(
	email VARCHAR(255) NOT NULL,
	ticket_id VARCHAR(20) NOT NULL,
	FOREIGN KEY (email) REFERENCES Customer(email),
	FOREIGN KEY (ticket_id) REFERENCES Ticket(ID),
	PRIMARY KEY (email,ticket_id)
);

CREATE TABLE Airport(
	code VARCHAR(5) NOT NULL,
	name VARCHAR(255),
	city VARCHAR(255),
	country VARCHAR(255),
	airport_type VARCHAR(50),
	
	PRIMARY KEY (code)
);

CREATE TABLE Airline(
	name VARCHAR(255) NOT NULL,

	PRIMARY KEY (name)
);

CREATE TABLE Flight(
	airline_name VARCHAR(255) NOT NULL,
	flight_num VARCHAR(10) NOT NULL,
	departure_airport_code VARCHAR(10),
	departure_date DATE NOT NULL,
	departure_time TIME NOT NULL,
	arrival_airport_code VARCHAR(10),
	arrival_date DATE NOT NULL,
	arrival_time TIME NOT NULL,
	base_price FLOAT NOT NULL, 
	id_num BIGINT NOT NULL,
	flight_status VARCHAR(255) NOT NULL,

	FOREIGN KEY (airline_name) REFERENCES Airline(name),
	FOREIGN KEY (departure_airport_code) REFERENCES Airport(code),
	FOREIGN KEY (arrival_airport_code) REFERENCES Airport(code),
	PRIMARY KEY (airline_name, flight_num, departure_date, departure_time, departure_airport_code, arrival_airport_code)
);

CREATE TABLE Fly(
	airline_name VARCHAR(255) NOT NULL,
	flight_num VARCHAR(10) NOT NULL,
	departure_time TIME NOT NULL,
	departure_date DATE NOT NULL,
	ticket_id VARCHAR(20) NOT NULL,
	FOREIGN KEY (airline_name, flight_num, departure_date, departure_time) REFERENCES Flight(airline_name, flight_num, departure_date, departure_time),
	FOREIGN KEY (ticket_id) REFERENCES Ticket(ID),
	PRIMARY KEY (airline_name, flight_num, departure_time, departure_date, ticket_id)
);

CREATE TABLE Interact(
	airline_name VARCHAR(255),
	email VARCHAR(255),
	flight_num VARCHAR(10),
	departure_time TIME,
	departure_date DATE,
	rate FLOAT, 
	comment VARCHAR(255),
	
	FOREIGN KEY (email) REFERENCES Customer(email),
	FOREIGN KEY (airline_name, flight_num, departure_date, departure_time) REFERENCES Flight(airline_name, flight_num, departure_date, departure_time),
	PRIMARY KEY (airline_name, email, flight_num, departure_time, departure_date)
);
	
CREATE TABLE Airplane(
	airline_name VARCHAR(255),
	seat_num INT, 
	manufacture_company VARCHAR(255),
	age_plane FLOAT, 
	ID VARCHAR(50) NOT NULL,
	
	foreign key (airline_name) REFERENCES Airline(name),
	PRIMARY KEY (airline_name, ID)
);

CREATE TABLE Airline_Staff(
	airline_name VARCHAR(255) NOT NULL,
	username VARCHAR(255) NOT NULL,
	password VARCHAR(255) NOT NULL,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	date_of_birth DATE,

	FOREIGN KEY (airline_name) REFERENCES Airline(name),
	PRIMARY KEY (username, airline_name)
);

CREATE TABLE Airline_Staff_Phone_Number(
	username VARCHAR(255),
	phone_num BIGINT,
	FOREIGN KEY(username) REFERENCES Airline_Staff(username),
	PRIMARY KEY(username, phone_num)
);

CREATE TABLE Airline_Staff_Email(
    username VARCHAR(255),
    email VARCHAR(255),
    FOREIGN KEY(username) REFERENCES Airline_Staff(username),
    PRIMARY KEY(username, email)
);


