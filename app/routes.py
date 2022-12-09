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
    return render_template('index.html')


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
        cursor.execute(query, (email, hash_password(password)))
        # cursor.execute(query, (email, password))
        data = cursor.fetchone()
        cursor.close()

        if data:
            session['username'] = email
            return redirect(url_for('index'))
        else:
            error = 'Invalid username or password'
            return render_template('customerLogin.html', error=error)


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
        cursor.execute(query, (email, hash_password(password), name))

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
    session.pop('username')
    return redirect(url_for('index'))


if __name__ == '__main__':
    app.run(debug=True)
