Rails.application.routes.draw do
  root "home#index"

  get "home" => "home#index"
  get "home/inventario" => "inventario#index"
end
