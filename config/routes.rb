Rails.application.routes.draw do
  resources :products

  get 'products/delivery/:id' => 'products#delivery'
end
