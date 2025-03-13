Rails.application.routes.draw do
  get "products/index"
  get "products/new"
  get "products/create"
  get "products/edit"
  get "products/update"
  get "products/destroy"
  devise_for :admins, controllers: { sessions: "admins/sessions", registrations: "admins/registrations" }
  # Đảm bảo sign_out hoạt động với phương thức DELETE
  devise_scope :admin do
  get "/admins/sign_out", to: "admins/sessions#destroy", as: :admin_logout
end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  get "customers/edit_customer", to: "customers#edit_customer", as: "edit_customer"
  post "customers/manage_customer", to: "customers#manage_customer", as: "manage_customer"
  get "roles/:id/permissions", to: "roles#permissions", as: "permissions"
  post "roles/:id/store_permissions", to: "roles#store_permissions", as: "store_permissions"

  resources :roles
  resources :staff_users
  resources :customers, only: [ :edit, :update ]
  resources :dashboard, only: [ :index ]
  resources :products
  root "dashboard#index"
end
