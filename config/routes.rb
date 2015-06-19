Rails.application.routes.draw do
  resources :users
  resources :venues, only: [:show, :new, :create]
  resources :experiences do
    resources :dishes
  end
  
  root 'welcome#index'

end
