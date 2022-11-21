from flask import Flask, render_template
import sys
# import pymysql.cursor

app = Flask(__name__)
sys.path.append('..')


@app.route('/')
def index():
    return render_template('index.html')


if __name__ == '__main__':
    app.run(debug=True)
