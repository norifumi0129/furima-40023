Rails.application.routes.draw do
  resources :items do
    resources :orders
  end
  devise_for :users
  root to: 'items#index'
end