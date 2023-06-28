Rails.application.routes.draw do
  get "home" => "home#index"
  get "home/inventario" => "inventario#index"
end
