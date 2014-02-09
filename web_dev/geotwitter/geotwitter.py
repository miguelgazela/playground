from flask import Flask
from flask import render_template

import twitter
import json

WORLD_WOEID = 1

twitter_auth = twitter.OAuth(
    token='218804182-mgRGE5K7JU8CgOhcC3BvICoahvPGIyJmvQDTrG6Q',
    token_secret='e1KU101dJLRa5VBLEyaUhQpyyh5g5TC975YSjQIeg',
    consumer_key='jyigk3zwe3BHqNYx9QtbCg',
    consumer_secret='yHh8V3DARbCXvQMeTAY8yzoRa0mksBXlo6zF9i0'
)

twitter_api = twitter.Twitter(auth=twitter_auth)

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')


@app.route('/tweets')
def tweets():
    world_trends = twitter_api.trends.place(_id=WORLD_WOEID)
    return json.dumps(world_trends, indent=1)


if __name__ == "__main__":
    
    app.run(debug=True)