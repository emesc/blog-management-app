Rails.application.routes.draw do
  get 'comments/create'

  authenticated :user do
    root to: "products#index", as: :authenticated_root
  end
  root to: "welcome#index"
  devise_for :users
  scope "/admin" do
    resources :users
  end
  # get "subjects",       to: "subjects#index"
  # get "subjects(/:id)", to: "subjects#show"
  # get "sections",       to: "sections#index"
  resources :subjects, only: [:index, :show]
  resources :sections, only: [:index, :show] do
    resources :comments, only: [:create]
  end
  # resources :users,     only: [:index, :show, :new, :create, :update]
  resources :products
  resources :roles

  get "*path", to: redirect("404.html")
end
