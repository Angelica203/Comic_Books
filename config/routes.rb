Rails.application.routes.draw do
  root to: 'sessions#welcome'
  get 'auth/:provider/callback', to: 'sessions#omniauth'


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  delete '/logout', to: 'sessions#destroy'
  



  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'

  resources :purchases, only: :index
  resources :comics do 
  resources :purchases, shallow: true     
  end
  resources :users, only: [:new, :create, :show]
  # resources :comics
end
  
# get '/comics/new', to: 'comics#new', as: 'new_comic'
# post '/comics', to: 'comics#create'
# get '/comics/:id', to: 'comics#show', as: 'comic'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
