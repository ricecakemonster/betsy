Rails.application.routes.draw do
  root to: "products#index"

  resources :merchants, except: [:new] do
    resources :products, except: [:index, :show]
  end
  resources :orders
  patch '/orders/:id/purchase', to: 'orders#purchase', as: 'purchase'
  resources :reviews
  resources :products, only: [:index, :show]

  get "/auth/:provider/callback", to: "sessions#login"
  post '/login', to: 'sessions#login'
  post '/logout', to: 'sessions#logout', as: 'logout'
end
