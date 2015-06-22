Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'registrations'
    sessions: 'users/sessions', omniauth_callbacks: "omniauth_callbacks"
  }

  resources :users, only: [:index, :show] do
    member do
      get :following, :followers
    end
    get :feed, on: :collection, to: 'users#myfeed'
  end

  resources :venues, only: [:show, :new, :create]
  resources :experiences do
    resources :dishes
  end
  post 'search', :to => 'experiences#search'
  root 'welcome#index'
  resources :relationships,       only: [:create, :destroy]

end


