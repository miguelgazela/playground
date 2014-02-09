from flask import Flask
from flask import render_template
import requests

app = Flask(__name__)

@app.route('/')
def top_stories():
    r = requests.get('http://hnify.herokuapp.com/get/top')
    return render_template('top_stories.html', stories=r.json()['stories'])


if __name__ == "__main__":
    app.run(debug=True)