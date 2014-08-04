Rails.application.routes.draw do
  resources :profiles, only: :show
  resources :gists, only: [:new, :create]
end
