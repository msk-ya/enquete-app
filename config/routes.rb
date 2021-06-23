Rails.application.routes.draw do
  get 'pages/index'
  get 'pages/new'
  get 'pages/show'
  root "pages#index"
  get "top", to:"enquetes#top"
  post "answer", to: "enquetes#answer"
  
  resources :pages, only: [:index, :new]
 
  resources :forms, only:[:create] do
    member do
      get 'new'
    end
    post :delete, on: :collection
  end

  resources :questions ,only:[:create] do
    member do
     get "show_modal"
     delete :delete
    end
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
  resources :enquetes do
    resources :results, only: [:delete] do
      get :new, on: :collection
    end
  end
  
end
