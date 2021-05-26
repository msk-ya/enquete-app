Rails.application.routes.draw do
  root "enquetes#index"
  resources :forms
  resources :questions
  resources :enquetes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
