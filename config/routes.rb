Rails.application.routes.draw do
  get 'comments/create'

  authenticated :user do
    # root "products#index", as: :authenticated_root
  end
  # root "welcome#index"
  root "subjects#index"
  devise_for :users
  scope "/admin" do
    resources :users
  end
  # get "subjects",       to: "subjects#index"
  # get "subjects(/:id)", to: "subjects#show"
  # get "sections",       to: "sections#index"
  resources :subjects, except: [:new, :create]
  resources :sections, except: [:destroy] do
    resources :comments, only: [:create]
  end
  # resources :users,     only: [:index, :show, :new, :create, :update]
  resources :products
  resources :roles
  # page not found
  get "*path", to: redirect("404.html")

  # named route
  get "/sections/:year/:month", to: "sections#archive", as: :section_archive
end
