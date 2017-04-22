Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "products#index"

  resources :merchants do
    resources :products, except: [:index, :show]
  end

  resources :products, only: [:index, :show]
  resources :products do
    get 'orders/new', to: 'orders#new'
  end
  resources :orders, except: [:new]
  post '/products/:id/add_to_cart', to: 'orders#add_to_cart', as: 'add_to_cart'
  patch '/orders/:id/purchase', to: 'orders#purchase', as: 'purchase'
  get '/orders/:id/payment', to: 'orders#payment', as: 'payment'
  resources :reviews



end
