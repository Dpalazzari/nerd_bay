Rails.application.routes.draw do
  root 'home#index'

  resources :users, only: [:new, :create]
  get '/about' => 'about#index'
  get '/dashboard' => 'users#show'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
