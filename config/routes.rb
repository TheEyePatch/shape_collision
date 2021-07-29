Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #For circles
  post '/add/circle', to: 'circle#create'

  #For Rectangles
  post '/add/rect', to: 'rect#create'

  #Get all both shapes
  get '/get', to: 'shapes#index'
end
