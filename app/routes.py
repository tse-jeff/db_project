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


@app.route('/customerLogin')
def login():
    return render_template('customerLogin.html')


@app.route('/loginAuth', methods=['GET', 'POST'])
def loginAuth():
    # fetch username and password from login form
    email = request.form['email']
    password = request.form['password']

    # create cursor
    cursor = connection.cursor()

    # execute query
    query = 'SELECT * FROM customer WHERE email = %s and password = %s'
    cursor.execute(query, (email, hash_password(password)))

    # fetch data
    data = cursor.fetchone()

    # close cursor
    cursor.close()

    if data:
        session['username'] = email
        return redirect(url_for('index'))
    else:
        error = 'Invalid username or password'
        return render_template('login.html', error=error)


@app.route('/register')
def register():
    return render_template('register.html')


@app.route('/registerAuth', methods=['GET', 'POST'])
def registerAuth():
    # fetch username and password from login form
    username = request.form['username']
    password = request.form['password']
    name = request.form['name']

    # create cursor
    cursor = connection.cursor()

    # execute query
    query = 'INSERT INTO user (username, password, email, phone) ' + \
            'VALUES (%s, %s, %s, %s)'
    cursor.execute(query, (username, hash_password(password), name))

    # commit to database
    connection.commit()

    # close cursor
    cursor.close()

    return redirect(url_for('index'))


@app.route('/logout')
def logout():
    session.pop('username')
    return redirect(url_for('index'))


if __name__ == '__main__':
    app.run(debug=True)
