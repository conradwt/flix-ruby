Rails.application.routes.draw do
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check
  get "/healthz" => "rails/health#show", as: :rails_health_check

  root 'movies#index'

  resources :genres
  resources :users

  resources :movies do
    resources :reviews
    resources :favorites, only: %i[create destroy]
  end

  get 'movies/filter/:filter' => 'movies#index', as: :filtered_movies

  resource :session, only: %i[new create destroy]
  get 'signup' => 'users#new'
end
