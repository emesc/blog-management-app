Rails.application.routes.draw do
  devise_for :users
  scope "/admin" do
    resources :users
  end
  root to: "products#index"
  get "subjects",       to: "subjects#index"
  get "subjects(/:id)", to: "subjects#show"
  get "sections",       to: "sections#index"
  # resources :users,     only: [:index, :show, :new, :create, :update]
  resources :products
  resources :roles
end
