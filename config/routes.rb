Rails.application.routes.draw do

  devise_for :users

  resources :events

  namespace :admin do
    resources :events do
      resources :tickets, :controller => "event_tickets"
    end
    resources :users do
      resource :profile, :controller => "user_profiles"
    end
  end

  root "events#index"

  resource :user
end
