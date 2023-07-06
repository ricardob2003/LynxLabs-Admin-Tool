Rails.application.routes.draw do
  # Route for the home page
  root to: "home#index"

  # Routes for the different actions
  get "/inventario", to: "inventario#index", as: "home_inventario"
  resources :empleados
  get "/equipo", to: "equipo#index", as: "asignar_equipo"
  get "/admin", to: "admin#index", as: "asignar_admin"
  get "/extraccion", to: "extraccion#index", as: "extraccion"
  resources :proyectos
end

#Investigar Resource and Resources
#Investigar Resource Member and Resource Collections
