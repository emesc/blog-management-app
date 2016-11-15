Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "subjects",       to: "subjects#index"
  get "subjects(/:id)", to: "subjects#show"
  get "sections",       to: "sections#index"
end
