Wikiproject::Application.routes.draw do
  
  resources :wikis do
   	resources :collaborators
  end
  
  resources :charges, only: [:new, :create]

  devise_for :users
  	resources :users, only: [:update]
  get "welcome/index"
  get "welcome/about"
  
  root to: 'welcome#index'
end
