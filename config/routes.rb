Rails.application.routes.draw do
  resources :pizzas
  post 'order/create', to: 'order#create'
  get 'order/show', to: 'order#view'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htm
end
