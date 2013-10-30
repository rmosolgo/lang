Lang::Application.routes.draw do

  get "/batman/(*redirect_path)", to: "batman#index", constraints: lambda { |request| request.format == "text/html" }


  root 'sounds#index'
  get "/about", to: 'static_pages#about', as: "about"

  get '/features/:feature_name',
    to: 'features#show_by_name',
    as: 'feature_name',
    constraints: { feature_name: /[a-z_]+/}

  resources :sounds
  resources :features
  resources :phonemes
  resources :languages do
    resources :phonemes
  end
end
