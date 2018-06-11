Rails.application.routes.draw do

    get '/' => 'profiles#index'

    devise_for :users
    resources :profiles

end
