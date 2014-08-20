Rails.application.routes.draw do
  resources :profiles, only: [:show, :create]
  resource :profile do
    root 'profiles#yours'
  end

  resources :gists, only: [:new, :create]

  resources :sessions, only: :create
  get 'logout' => 'sessions#destroy', as: :sign_out
  get 'sign_in' => 'sessions#new', as: :sign_in
  get 'sign_up' => 'profiles#new', as: :sign_up

  root 'application#welcome'

  get '*unmatched_route', to: 'application#not_found'
end
