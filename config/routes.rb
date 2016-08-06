Rails.application.routes.draw do
  get 'sessions/new'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  root 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/home', to: 'static_pages#index'
  resources :users
end
