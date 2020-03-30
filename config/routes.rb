Rails.application.routes.draw do
  root to: 'items#new'
  resources :items, only: [:index, :new, :create, :destroy, :edit, :update, :search]
  resources :products, except: :show
end
