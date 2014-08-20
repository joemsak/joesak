Rails.application.routes.draw do
  resources :profiles, only: [:show, :new, :create]
  resource :profile do
    root 'profiles#yours'
  end

  resources :gists, only: [:new, :create]
  resources :sessions, only: [:new, :create]
  resources :profiles, only: [:new, :create]

  root 'application#welcome'

  get '*unmatched_route', to: 'application#not_found'
end
