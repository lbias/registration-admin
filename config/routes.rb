Rails.application.routes.draw do

  devise_for :users

  resources :events

  namespace :admin do
    resources :events
    resources :users
  end

  root "events#index"

  resource :user
end
