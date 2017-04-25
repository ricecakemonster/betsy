Rails.application.routes.draw do
  root to: "products#index"

  resources :merchants, except: [:new]
# changed to remove new_product_path, delete product_path
  resources :products do
    get 'orders/added_to_cart', to: 'orders#added_to_cart'
  end
  resources :orders, except: [:new, :show]
  post '/products/:id/add_to_cart', to: 'orders#add_to_cart', as: 'add_to_cart'
  get '/orders/:id/cart', to: 'orders#cart', as: 'cart'
  patch '/orders/:id/update_qty', to: 'orders#update_qty', as: 'update_quantity'
  # patch '/orders/:id/purchase', to: 'orders#purchase', as: 'purchase'
  # get '/orders/:id/payment', to: 'orders#payment', as: 'payment'
  delete '/orders/:order_id/orderproduct/:orderproduct_id', to: 'orders#remove_from_cart', as: 'remove_from_cart'

  post '/products/:id/review', to: 'products#review', as: 'review'
  resources :reviews


  get "/auth/:provider/callback", to: "sessions#login"
  post '/login', to: 'sessions#login'
  post '/logout', to: 'sessions#logout', as: 'logout'
end
