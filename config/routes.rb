Rails.application.routes.draw do
  resources :users
  resources :entries
  resources :sessions, only: [:new, :create]
  # I want to create a route /sessions that responds to delete, I want to send that to controllers sessions and call destroy method
  delete '/sessions', to: 'sessions#destroy', as: 'session'
  #
  # this is your CRUD routes
  # this is same as
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
