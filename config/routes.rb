Rails.application.routes.draw do
  root to: 'items#new'
  resources :items, only: [:index, :new, :create, :destroy, :edit, :update]
  resources :products, except: :show
end
