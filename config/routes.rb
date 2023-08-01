Rails.application.routes.draw do
  resources :addresses
  # Route for the home page
  root to: "home#index"

  # Routes for the different actions
  resources :inventories
  resources :employees
  get "/equipo", to: "equipo#index", as: "asignar_equipo"
  get "/admin", to: "admin#index", as: "asignar_admin"
  get "/extraccion", to: "extraccion#index", as: "extraccion"
  resources :projects
end

#Investigar Resource and Resources
#Investigar Resource Member and Resource Collections
