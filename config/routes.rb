Rails.application.routes.draw do
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  root 'static_pages#index'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  post '/edit', to: 'friends#search'
  resources :users
  resources :friends
end
