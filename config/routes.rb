Rails.application.routes.draw do
  # Root path
  root to: "sessions#new"

  # Routes for projects, inventory and employees
  resources :projects
  resources :employees do
    collection do
      get :states
    end
  end
  resources :inventories

  # Registrations Routes
  resources :registrations, path: "registrations", only: [:show, :destroy]
  get "administradores", to: "registrations#index"
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  # Sessions routes
  get "sign_in", to: "sessions#new", as: :sign_in
  post "sign_in", to: "sessions#create"

  resources :sessions, only: [:index, :show, :destroy]
  resource :password, only: [:edit, :update]

  namespace :identity do
    resource :email, only: [:edit, :update]
    resource :email_verification, only: [:show, :create]
    resource :password_reset, only: [:new, :edit, :create, :update]
  end

  # Route for the home page
  get "home_page", to: "home#index"

  # Routes for the "tasks" resource
  resources :tasks do
    member do
      post "assign_equipment"
      post "extract_equipment"
    end
  end
end
