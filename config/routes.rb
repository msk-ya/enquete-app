Rails.application.routes.draw do
  devise_for :users
  get 'pages/index'
  get 'pages/new'
  get 'pages/show'
  root "pages#top"
  get "top", to:"enquetes#top"
  post "answer", to: "enquetes#answer"
  
  resources :pages, only: [:index, :new] do
    collection do
      get :top
      get :area
      get :recently
    end
    
  end
  

  resources :forms, only:[:create] do
    member do
      get 'new'
      get 'add_select'
    end
    post :delete, on: :collection
  end

  resources :questions ,only:[:create] do
    member do
     get "show_modal"
     delete :delete
    end
    post :cancel, on: :collection
    resources :forms, only:[:edit] do
      member do
        get :action
      end
    end
    member do
      get 'new'
    end
  end
  
  resources :results, only:[:create, :show]
  resources :enquetes, except: [:index,:show] do
    post :cancel, on: :collection
    resources :results, only: [:delete] do
      get :new, on: :collection
    end
  end
  get "/enquetes/:user_id/user/index", to: "enquetes#index", as: :enquetes_user_index
  get 'enquetes/icon.jpg',to:"enquetes#img"
  get '/icon.jpg',to:"pages#img"
end
