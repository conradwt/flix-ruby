Rails.application.routes.draw do
  get "healthz" => "rails/health#show", as: :rails_health_check

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
