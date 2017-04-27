Rails.application.routes.draw do
  root to: "products#index"

  resources :merchants, except: [:new]
# changed to remove new_product_path, delete product_path
  resources :products do
    get 'orders/added_to_cart', to: 'orders#added_to_cart'
    get 'orders/order_id', to: 'orders#merchant_order'
  end
  resources :orders, except: [:new, :show]


  post 'products/:id/add_to_cart', to: 'orders#add_to_cart', as: 'add_to_cart'
  get 'orders/:id/cart', to: 'orders#cart', as: 'cart'
  patch 'orders/:id/update_qty', to: 'orders#update_qty', as: 'update_quantity'
  delete 'orders/:order_id/orderproduct/:orderproduct_id', to: 'orders#remove_from_cart', as: 'remove_from_cart'
  get 'orders/:id/checkout', to: 'orders#checkout', as: 'checkout'
  patch 'orders/:id/purchase', to: 'orders#purchase', as: 'purchase'
  get 'orders/:id/invoice', to: 'orders#invoice', as: 'invoice'
  patch 'orders/:id/cancel', to: 'orders#cancel', as: 'cancel'

  post '/products/:id/review', to: 'products#review', as: 'review'
  resources :reviews

  get "/auth/:provider/callback", to: "merchants#login", as: 'auth_callback'
  post '/login', to: 'merchants#login'
  post '/logout', to: 'merchants#logout', as: 'logout'
end
