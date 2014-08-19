Rails.application.routes.draw do
  resources :profiles, only: :show
  resources :gists, only: [:new, :create]

  resource :developer, only: [] do
    root to: 'profiles#yours'
    resources :sessions, only: [:new, :create]
  end

  get '*unmatched_route', to: 'application#not_found'
end
