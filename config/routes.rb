Rails.application.routes.draw do

  get "subjects",       to: "subjects#index"
  get "subjects(/:id)", to: "subjects#show"
  get "sections",       to: "sections#index"
  resources :users,     only: [:index, :show, :new, :create]
end
