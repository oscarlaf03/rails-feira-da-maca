Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products do
    resources :questions, only: [:new, :create,:edit,:update]
  end

  get 'pages/:id', to: 'pages#sales', as: 'sales'
  get 'home_products', to: 'pages#home_products', as: 'home_products'
  get '/load_more', to: 'pages#load_more'

end
