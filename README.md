# README
[![Code Climate](https://codeclimate.com/github/Dpalazzari/nerd_bay/badges/gpa.svg)](https://codeclimate.com/github/Dpalazzari/nerd_bay)

[Heroku Link](https://nerd-bay.herokuapp.com/)

# What is Nerd Bay?

Nerd Bay is a personal project I built to demonstrate my abilites to consume, test, and present API consumption. My initial goal was to put as many API calls on one page as I could, all while having load times under 400 ms. I wanted to have relevant informaiton taken from the web, from multiple places where a 'Nerd' may visit, and grant said Nerd the convenience of having all that information accessible in ONE place.

There are about 10 API's used in this project. In the future, I plan to add more information to the home page. Most of the current API requests make use of Faraday and API Keys (depending on the website, listed below). The particular API's used are detailed further down this README, but for now, know that most of the code for the API's looks like this:

```
class MovieService

  def self.now_playing
    JSON.parse(response_now_playing.body, symbolize_names: true)[:results]
  end

  def self.response_now_playing
    conn.get do |req|
      req.params['api_key'] = ENV['movie_key']
    end
  end

  def self.conn
    Faraday.new(:url => 'https://api.themoviedb.org/3/movie/now_playing') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

end
```

The final aspect I had fun implementing was my Youtube Web Scraper. This file visits youtube (In incognito mode - took a while for me to figure out) and pulls down the unique identifier of the most trending video on youtube. Readers can view this file [here](https://github.com/Dpalazzari/nerd_bay/blob/master/app/site_models/youtube_scraper.rb). This particular aspect of the project took a good second to make the request, so I saved the output in Rails.Cache and updated the cache (thanks [Heroku](https://elements.heroku.com/addons/scheduler)) once a day. 

## Known issues

When visiting the [website](https://nerd-bay.herokuapp.com/), In order to view information, the users clicks on buttons in the footer. Each button, once clicked, makes an AJAX request to the apps particular controller method that renders a partial HTML element within a hidden DIV tag on the home page.

Controller method example:

```
def movie_call
    @movies = HomePageAttributes.new.movies
    render partial: 'shared/movies'
  end
```

The bug becomes known seemingly randomly when using the website. When clicking the button AGAIN, the div contents should all be hidden. This works 90% of the time (the user has the power to reveal/hide content at will). Sometimes the hide feature does not work though. The content will be present in its div tag, but will be un-removable.

A strange bug; if you think you have a solution, go ahead and make a PR.

# Get Nerd Bay Running Locally

To get this project up and running locally on your own machine, you must obtain several api_keys from different sites:

1) Get a client id and secret_client from github.

2) You also need an API key from [The movie Database](https://www.themoviedb.org/)

3) Get an API key from [Twitch](https://dev.twitch.tv/)

4) Get an API key from [The News API](https://newsapi.org/)

5) Get an API key from [Open Weather Map API](https://openweathermap.org/api)


Once all relevant API keys have been obtained, add them to your application.yml file using 
```
Figaro install
```
from the command line. This will secure your API keys from outside, prying eyes. Note: Make sure you name all api keys the same as environmental variables in the secrets.yml file. If you don't, you'll have to update the secrets.yml and the VCR section of the rails_helper.rb file.

Once these things are up and running:

From the terminal:
```
bundle
```
```
rake db:{create, migrate, test:prepare}
```
```
rails s
```

That's it...so far. If you are having trouble with some of the API calls, it is highly likely the API has been changed. Everyonce in a while, the movie API call will fail. This is due to rate-limiting. It only takes 9 secs for the rate to refresh.

Just refresh the page.
