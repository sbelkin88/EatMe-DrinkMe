Rails.application.routes.draw do
  resources :users
  resources :experiences do
    resources :restaurants, only: [:show, :new, :create]
    resources :dishes, except: [:index, :show]
  end
  
  root 'welcome#index'

end
