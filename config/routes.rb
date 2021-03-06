Rails.application.routes.draw do
  get 'route_glob/index'

  # map.resources :tasks, :collection => { :completed => :get }, :member => { :complete => :put }

  authenticated :user do
    # root "products#index", as: :authenticated_root
  end
  root "welcome#index"
  # root "subjects#index"
  devise_for :users
  scope "/admin" do
    resources :users
  end
  # get "subjects",       to: "subjects#index"
  # get "subjects(/:id)", to: "subjects#show"
  # get "sections",       to: "sections#index"
  resources :subjects, :products, :roles
  resources :sections do
    # # custom RESTful actions using collection and member blocks
    # collection do
    #   get "completed",   to: :completed#, as: :completed_sections
    # end
    # member do
    #   # separate routes for updating complete marks
    #   # put "complete",    to: :complete, as: :complete
    #   # delete "complete", to: "sections#incomplete", as: :incomplete
    #   # single route and action for updating complete marks
    #   # patch :complete
    # end
    # eliminate above 2 blocks since i dont have multiple member & collection routes
    get   :completed, on: :collection
    patch :complete,  on: :member
    # nest comments resource
    resources :comments, only: [:create]
  end

  # named route
  get "/sections/:year/:month", to: "sections#archive", as: :section_archive

  # catch all route / route globbing
  get '*path', to: "route_glob#index"
end
