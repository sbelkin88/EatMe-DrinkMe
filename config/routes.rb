Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'registrations'
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


