Rails.application.routes.draw do
    
    root "pages#home"
    get 'pages/home', to: 'pages#home'
    
   #resources :recipes
    get '/recipes', to: 'recipes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
