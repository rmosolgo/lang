Lang::Application.routes.draw do

  root 'sounds#index'

  get '/features/:feature_name',
    to: 'features#show_by_name',
    as: 'feature_name',
    constraints: { feature_name: /[a-z_]+/}

  # get '/sounds/:letter',
  #   to: 'sounds#show_by_letter',
  #   as: 'sound_letter' #,
  #   # constraints: { letter: /[^0-9]+/ }

  resources :sounds
  resources :features
  resources :phonemes
  resources :languages do
    resources :phonemes
  end
end
