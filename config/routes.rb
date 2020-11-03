Rails.application.routes.draw do
  #root：アクセスして一番最初のコントローラへの指示.
  #主にトップページなどに用いられる
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
    end
  end
  
   resources :microposts, only: [:create, :destroy]
   resources :relationships, only: [:create, :destroy]
end
