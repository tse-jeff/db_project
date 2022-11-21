SELECT * FROM flight WHERE departure_time > NOW() and departure_date > NOW();

SELECT * FROM flight WHERE flight_status = 'delayed';

SELECT * FROM customer WHERE email IN (SELECT email FROM purchase);

SELECT * FROM airplane WHERE airline_name = 'Jet Blue';