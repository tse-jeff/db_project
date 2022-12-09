from flask import Flask, render_template, request, session, redirect, url_for
import sys
import pymysql.cursors
import hashlib

app = Flask(__name__)
sys.path.append('..')
app.config['SECRET_KEY'] = 'secret'

# connect to the database
connection = pymysql.connect(
    host='localhost',
    user='root',
    password='',
    db='db_project',
    charset='utf8mb4',
    cursorclass=pymysql.cursors.DictCursor
)


# using md5 to hash password
def hash_password(password):
    return hashlib.md5(password.encode()).hexdigest()


@app.route('/')
def index():
    if not session.get('username'):
        return render_template('index.html')
    else:
        # refreshes the flights
        purchased_tickets()
        return render_template(
            'index.html',
            username=session.get('username'),
            is_staff=session.get('is_staff'),
            flights=session.get('flights')
        )


# customer routes
@app.route('/customerLogin', methods=['GET', 'POST'])
def login():
    if request.method == 'GET':
        return render_template('customerLogin.html')
    elif request.method == 'POST':
        # fetch username and password from login form
        email = request.form['email']
        password = request.form['password']
        cursor = connection.cursor()

        # execute query
        query = 'SELECT * FROM customer WHERE email = %s and password = %s'

        # TODO: use hash password. not hashing for testing
        # cursor.execute(query, (email, hash_password(password)))
        cursor.execute(query, (email, password))
        data = cursor.fetchone()
        cursor.close()

        if data:
            session['username'] = email
            session['is_staff'] = False

            return redirect(url_for('index'))
        else:
            error = 'Invalid username or password'
            return render_template('customerLogin.html', error=error)


# function to convert all dates to string in a flight
def datetime_to_string(flight):
    flight['departure_date'] = flight['departure_date'].isoformat()
    flight['arrival_date'] = flight['arrival_date'].isoformat()
    if flight['departure_time']:
        flight['departure_time'] = str(flight['departure_time'])
    if flight['arrival_time']:
        flight['arrival_time'] = str(flight['arrival_time'])


def purchased_tickets():
    cursor = connection.cursor()
    query = 'SELECT ticket_id FROM purchase WHERE email = %s'
    cursor.execute(query, session.get('username'))
    ticket_ids = cursor.fetchall()
    session['ticket_ids'] = ticket_ids
    session['total_price'] = 0

    flights = []
    # find all flight_num from ticket_ids
    for ticket_id in ticket_ids:
        query = 'SELECT flight_num FROM ticket WHERE ID = %s'
        cursor.execute(query, ticket_id['ticket_id'])
        flights.append(cursor.fetchone())

    # add flight info to flights
    for flight in flights:
        query = 'SELECT * FROM flight WHERE flight_num = %s'
        cursor.execute(query, flight['flight_num'])
        flight.update(cursor.fetchone())

    # convert all datetime to string
    for flight in flights:
        datetime_to_string(flight)

    # add ticket info to flights
    for flight in flights:
        query = 'SELECT class, sold_price FROM ticket ' + \
                'WHERE flight_num = %s AND customer_email = %s'
        cursor.execute(query, (flight['flight_num'], session['username']))
        flight.update(cursor.fetchone())
        session['total_price'] += flight['sold_price']

    cursor.close()
    session['flights'] = flights


@app.route('/cancel/<ticket_id>')
def cancel(ticket_id):
    cursor = connection.cursor()
    query = 'DELETE FROM purchase WHERE ticket_id = %s'
    cursor.execute(query, ticket_id)
    connection.commit()
    cursor.close()
    return redirect(url_for('index'))


@app.route('/customerRegister', methods=['GET', 'POST'])
def register():
    if request.method == 'GET':
        return render_template('customerRegister.html')
    elif request.method == 'POST':
        # fetch username and password from register form
        email = request.form['email']
        password = request.form['password']
        name = request.form['name']
        cursor = connection.cursor()

        # execute query
        query = 'INSERT INTO customer (email, password, name) ' + \
                'VALUES (%s, %s, %s)'
        try:
            # TODO: use hash password. not hashing for testing
            # cursor.execute(query, (email, hash_password(password), name))
            cursor.execute(query, (email, password, name))
        except pymysql.err.IntegrityError as e:
            connection.rollback()
            return render_template('customerRegister.html', error=e)

        connection.commit()
        cursor.close()
        return redirect(url_for('index'))


# staff routes
@app.route('/staffLogin', methods=['GET', 'POST'])
def staffLogin():
    if request.method == 'GET':
        return render_template('staffLogin.html')
    elif request.method == 'POST':
        # fetch username and password from login form
        username = request.form['username']
        airline = request.form['airline']
        password = request.form['password']
        cursor = connection.cursor()

        # execute query
        query = 'SELECT * FROM airline_staff WHERE username = %s and ' + \
                'airline_name = %s and password = %s'
        # TODO: use hash password. not hashing for testing
        # cursor.execute(query, (username, airline, hash_password(password)))
        cursor.execute(query, (username, airline, password))

        # fetch data
        data = cursor.fetchone()
        cursor.close()

        if data:
            session['username'] = username
            session['is_staff'] = True
            return redirect(url_for('index'))
        else:
            error = 'Invalid username or password'
            return render_template('staffLogin.html', error=error)


@app.route('/staffRegister', methods=['GET', 'POST'])
def staffRegister():
    if request.method == 'GET':
        return render_template('staffRegister.html')
    elif request.method == 'POST':
        # fetch username and password from registration form
        airline = request.form['airline']
        username = request.form['username']
        password = request.form['password']
        first_name = request.form['first_name']
        last_name = request.form['last_name']
        cursor = connection.cursor()

        # execute query
        query = 'INSERT INTO airline_staff ' + \
                '(airline_name, username, password, ' + \
                'first_name, last_name) ' + \
                'VALUES (%s, %s, %s, %s, %s)'

        # try to execute query, if error, rollback
        try:
            # TODO: use hash password. not hashing for testing
            cursor.execute(query, (airline, username, password,
                                   first_name, last_name))
        except pymysql.err.IntegrityError as e:
            connection.rollback()
            # foreign key error means invalid airline name
            if e.args[0] == 1452:
                e = 'Invalid airline name'
            return render_template('staffRegister.html', error=e)

        connection.commit()
        cursor.close()
        return redirect(url_for('index'))


# general routes
@app.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('index'))


@app.route('/search', methods=['GET', 'POST'])
def search():
    if request.method == 'GET':
        return render_template('search.html')
    elif request.method == 'POST':
        print(request.form)
        departure_airport = request.form['departure_airport_code']
        arrival_airport = request.form['arrival_airport_code']
        departure_date = request.form['departure_date']
        arrival_date = request.form['arrival_date']
        
        # search for flights
        cursor = connection.cursor()
        query = 'SELECT * FROM flight'
        # if any of the fields are filled, add WHERE clause
        if departure_airport or arrival_airport or departure_date or arrival_date:
            query += ' WHERE '
        if departure_airport:
            query += 'departure_airport_code = \'%s\' AND ' % departure_airport
        if arrival_airport:
            query += 'arrival_airport_code = \'%s\' AND ' % arrival_airport
        if departure_date:
            query += 'departure_date = \'%s\' AND ' % departure_date
        if arrival_date:
            query += 'arrival_date = \'%s\' AND ' % arrival_date
        # if there is a WHERE clause, remove the last AND
        if departure_airport or arrival_airport or departure_date or arrival_date:
            query = query[:-4]
        
        print(query)

        cursor.execute(query)
        search = cursor.fetchall()
        cursor.close()

        # convert all datetime to string
        for flight in search:
            datetime_to_string(flight)

        session['search'] = search
        return redirect(url_for('flights'))


@app.route('/flights')
def flights():
    return render_template('flights.html', flights=session['search'])
    # return "hello world"


if __name__ == '__main__':
    app.run(debug=True)
