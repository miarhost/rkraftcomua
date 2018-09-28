Rails.application.routes.draw do

  devise_for :admins
  get 'admins' => 'admins#index'
  resources :orders
  resources :line_items
  resources :carts
  devise_for :users
  resources :products
  resources :posts
  resources :subscriptions
  resources :inquiries
  root 'main#home'
  get '/home', to: 'main#home'
  get '/catalog', to: 'main#catalog'
  get 'services', to: 'main#services'
  get '/contacts', to: 'main#contacts'
  get '/gallery', to: 'main#gallery'
  get '/acryllic', to: 'main#acryllic'
  get '/clamshells', to: 'main#clamshells'
  get '/racks', to: 'main#racks'
  get '/mold', to: 'main#mold'
  get '/moldshell', to: 'main#moldshell'
  get '/blinks', to: 'main#blinks'
  get '/accessoires', to: 'main#accessoires'
  
  resources :products do
     get :who_bought, on: :member
  end

  resources :line_items do
    get  :decrement, on: :member
  end

  #do
    #get '/contacts', as: 'inquiries#index'
  #end

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  scope "/:locale" do 
    resources :users
    resources :orders
    resources :line_items
    resources :carts
    resources :products
    resources :subscriptions
    resources :posts
    root 'main#home', as: 'main_home', via: :all
  end 

end
