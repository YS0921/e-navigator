Rails.application.routes.draw do
  root to: 'profiles#index'

  devise_for :users
  resources :users do
    resources :interviews do
      collection do
        post "request_mail"
      end
    end
  end
  resources :profiles
end
