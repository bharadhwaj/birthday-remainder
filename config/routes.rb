Rails.application.routes.draw do
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  root 'static_pages#index'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  post '/edit', to: 'friends#search'
  resources :users, :except => [:edit, :update, :destroy, :show]
  resources :friends, :except => [:show]
  match "*path", to: 'static_pages#page_not_found', via: :all
end
