Rails.application.routes.draw do
  root 'home#index'

  get '/auth/github/callback' => 'github#create'

  get '/top_twitch' => 'home#top_streamer'
  get '/twitch_call' => 'home#twitch_call'
  get '/movies_call' => 'home#movie_call'
  get '/ign_call' => 'home#ign_call'
  get '/hacker_call' => 'home#hackers'
  get '/espn_call' => 'home#espn'
  get '/reddit_call' => 'home#reddit'
  get '/weather' => 'users#weather'
  get 'youtube' => 'users#youtube'

  resources :users, only: [:new, :create]
  get '/dashboard' => 'users#show'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
