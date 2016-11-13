Rails.application.routes.draw do
  resources :users
  # this is your CRUD routes
  resources :entries
  # this is same as
  #
  #
  #redirect to entries index page, (entries controller index method) 
  root to: 'entries#index'
  #
  # get "/entires", to:'entries#index'
  # post '/entries', to: 'entries#create'
  # get "/entires/new", to:'entries#new'
  # get 'entries/:id/edit', to: 'entries#edit'
  # get 'entreis/:id', to: 'entries#show'
  # put "/entires/:id", to:'entries#update'
  # patch "/entires/:id", to:'entries#update'
  # delete "/entires/:id", to:'entries#destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
