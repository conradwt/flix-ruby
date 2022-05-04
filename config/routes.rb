Rails.application.routes.draw do
  root 'movies#index'

  resources :genres

  get 'movies/filter/:filter', to: 'movies#index', as: :filtered_movies

  resources :movies do
    resources :favorites
    resources :reviews
  end

  resource :session, only: %i[new create destroy]
  resolve('Session') { [:session] }

  get 'signin', to: 'sessions#new'

  resources :users
  get 'signup', to: 'users#new'
end
