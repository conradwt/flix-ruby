Rails.application.routes.draw do
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
