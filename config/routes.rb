Rails.application.routes.draw do

  # Route for the home page
  root to: "home#index"

  # Routes for the different actions
  resources :addresses
  resources :inventories

  #This section of the routes file defines routes for the "tasks" resource, allowing for the dynamic creation of new "assign" and "extract" actions for individual tasks. These actions will be handled by the corresponding "new_assign" and "new_extract" methods in the TasksController. The "member" block specifies that these routes will be nested under the "tasks" resource and will operate on individual task instances.
  resources :tasks do
    member do
      get "extract", to: "tasks#new_extract"
    end
  end

  get "assign_task", to: "tasks#new", as: :assign_task

  #Employee Route Logic for Implementing Dynamic Fields in the Nested Address Form
  resources :employees do
    collection do
      get :states
    end
  end
  resources :projects
end
