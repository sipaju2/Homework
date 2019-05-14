from flask import Flask, render_template
from flask_pymongo import PyMongo
import Scrape_mars

app=Flask(__name__)

app.config["MONGO_URI"]='mongodb://localhost:27017'
mongo=PyMongo(app)

@app.route('/')
def index():
    mars=mongo.db.mars.find_one()
    return render_template('index.html', mars=mars)

@app.route('/scrape')
def scrapper():
    mars =mongo.db.mars
    mars_data=scrape_mars.scrappe_all()
    mars.update({},mars_data, upsert=True)
    return "Scrapping Successful"

if __name__=="__main__":
    app.run()

