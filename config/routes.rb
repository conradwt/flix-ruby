Rails.application.routes.draw do
  root 'movies#index'

  resources :genres

  get 'movies/filter/:filter' => 'movies#index', as: :filtered_movies

  resources :movies do
    resources :favorites
    resources :reviews
  end

  resource :session, only: %i[new create destroy]
  get 'signin' => 'sessions#new'

  resources :users
  get 'signup' => 'users#new'
end
