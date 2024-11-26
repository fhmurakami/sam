# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  scope "(:locale)", locale: /pt-BR|en/ do
    resources :collections
    resources :groups
    namespace :user do
      resources :participants
    end
    devise_for :admins, class_name: "User::Admin"
    # Defines the root path route ("/")
    root "home#index"
    get "home/index"
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
