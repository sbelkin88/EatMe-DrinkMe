Rails.application.routes.draw do
  resources :users
  resources :experiences do
    resources :dishes, except: [:index, :show]
  end
  
  root 'welcome#index'

end
