Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :comics, only:[:index, :new, :create,:show, :edit, :update, :destroy]

  # get '/comics', to: 'comics#index'
  # post '/comics', to: 'comics#create'
  # get '/comics/new', to: 'comics#new', as: 'new_comic'
  # # # get '/comics/popular', to: 'comics#popular', as: 'popular_comics'
  # get '/comics/:id', to: 'comics#show', as: 'comic'


end
