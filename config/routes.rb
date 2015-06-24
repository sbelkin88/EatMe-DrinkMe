Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions', omniauth_callbacks: "omniauth_callbacks"
  }
  devise_scope :user do
    authenticated :user do
      root :to => 'experiences#index'
    end
    unauthenticated :user do
      root :to => 'devise/registrations#new', as: :unauthenticated_root
    end
  end

  resources :users, only: [:index, :show] do
    member do
      get :following, :followers
    end
    get :feed, on: :collection, to: 'users#myfeed'
  end

  resources :venues, only: [:show, :new, :create]
  resources :experiences do
    resources :dishes, except: [:index]
  end
  post 'search', :to => 'experiences#search'
  resources :relationships,       only: [:create, :destroy]

end