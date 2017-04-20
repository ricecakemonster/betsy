Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "products#index"

  resources :merchants do
    resources :products, except: [:index, :show]
  end
  resources :orders
  resources :reviews
  resources :products, only: [:index, :show]
end
