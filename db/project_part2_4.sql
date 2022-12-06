SELECT airline_name, flight_num, departure_time, departure_date 
FROM flight
WHERE departure_date > CURDATE() or (
    departure_date = CURDATE() and departure_time > CURTIME()
);

SELECT airline_name, flight_num, departure_time, departure_date
FROM flight
WHERE flight_status = 'Delay';

SELECT customer.name 
FROM customer, ticket
WHERE customer.email = ticket.customer_email;

SELECT ID, airline_name
FROM airplane
WHERE airline_name = 'Jet Blue';