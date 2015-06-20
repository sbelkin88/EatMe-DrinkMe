Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :users
  resources :venues, only: [:show, :new, :create]
  resources :experiences do
    resources :dishes
  end
  post 'search', :to => 'experiences#search'
  root 'welcome#index'

end
