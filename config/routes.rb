Rails.application.routes.draw do
  root to: 'sessions#welcome'

  get '/signup', to: 'users#new'



  resources :comics do 
  resources :purchases, shallow: true      #only: [:index, :show]
  end
  resources :users
  resources :sessions 
  





  get 'auth/:provider/callback', to: 'sessions#omniauth'

  

  # get '/comics', to: 'comics#index'
  # post '/comics', to: 'comics#create'
  # get '/comics/new', to: 'comics#new', as: 'new_comic'
  # # # get '/comics/popular', to: 'comics#popular', as: 'popular_comics'
  # get '/comics/:id', to: 'comics#show', as: 'comic'
  

end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
