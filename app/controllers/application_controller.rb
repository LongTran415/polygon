class ApplicationController < ActionController::Base
  # serves as controller for entire application ex: user auth
  # for every route in app
  #
  protect_from_forgery with: :exception # built-in security features CSFR token 
end
