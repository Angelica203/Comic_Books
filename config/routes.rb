Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
get '/comics' to: 'comics#index'
# post '/comics' to: 'comics#create'
# get '/comics/new' to: 'comics#new', as: 'new_comic'

end
