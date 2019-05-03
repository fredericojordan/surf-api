# Waves Report and Forecast System

## Installation:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`

## Running the server:

To start your Phoenix server:

  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

### Scraper:

For `WindguruScraper`, you'll need a webdriver. Here we are using `phantomjs`, but [other options](https://github.com/HashNuke/hound/blob/master/notes/configuring-hound.md) are available.

Installing the webdriver:

  * `brew cask install phantomjs`

Running the webdriver:

  * `phantomjs --wd`
  
