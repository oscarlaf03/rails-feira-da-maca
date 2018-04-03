Rails.application.routes.draw do
  get 'products/index'

  get 'products/show'

  get 'products/new'

  get 'products/create'

  get 'products/destroy'

  get 'products/update'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
