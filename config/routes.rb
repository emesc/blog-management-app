Rails.application.routes.draw do
  authenticated :user do
    root to: "products#index", as: :authenticated_root
  end
  root to: "welcome#index"
  devise_for :users
  scope "/admin" do
    resources :users
  end
  get "subjects",       to: "subjects#index"
  get "subjects(/:id)", to: "subjects#show"
  get "sections",       to: "sections#index"
  # resources :users,     only: [:index, :show, :new, :create, :update]
  resources :products
  resources :roles

  get "*path", to: redirect("404.html")
end
