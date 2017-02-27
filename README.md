# README
[![Code Climate](https://codeclimate.com/github/Dpalazzari/nerd_bay/badges/gpa.svg)](https://codeclimate.com/github/Dpalazzari/nerd_bay)

[Heroku Link](https://nerd-bay.herokuapp.com/)

To get this project up and running locally on your own machine, you must obtain several api_keys from different sites:

1) Get a client id and secret_client from github.
2) You also need an API key from [The movei Database](https://www.themoviedb.org/)
3) Get an API key from [Twitch](https://dev.twitch.tv/)
4) Get an API key from [The News API](https://newsapi.org/)
5) Get an API key from [Open Weather Map API](https://openweathermap.org/api)

Once all relevant API keys have been obtained, add them to your application.yml file using 
```
Figaro install
```
from the command line. This will secure your API keys from outside, prying eyes. Note: Make sure you name all api keys the same as environemtnal variables. If you don't, youll have to update the secrets.yml and the VCR section of the rails_helper.rb file.

Once these things are up and running:

From the terminal:
```
bundle
```
```
rails s
```

That's it...so far. If oyu are having trouble with some of the API calls, it is highly likely the API has been changed. Everyonce in a while, the movie API call will fail. This is due to rate-limiting. It only takes 9 secs for the rate to refresh.

Just refresh the page.
