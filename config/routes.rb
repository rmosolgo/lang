Lang::Application.routes.draw do

  root 'sounds#index'
  resources :sounds
  resources :features
  
end
