Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'auth/:provider/callback', to: 'sessions#omniauth'
  resources :comics do 
   resources :purchases, shallow: true      #only: [:index, :show]
  end
  resources :purchases
  resources :users
  resources :sessions
  root to: "static#home"


  # get '/comics', to: 'comics#index'
  # post '/comics', to: 'comics#create'
  # get '/comics/new', to: 'comics#new', as: 'new_comic'
  # # # get '/comics/popular', to: 'comics#popular', as: 'popular_comics'
  # get '/comics/:id', to: 'comics#show', as: 'comic'
  

end
