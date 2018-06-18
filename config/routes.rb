Rails.application.routes.draw do
  root to: 'profiles#index'

  devise_for :users
  resources :users do
    resources :interviews
  end
  resources :profiles
end
