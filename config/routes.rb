Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  root to: 'top#index'
  get 'top/about' => 'top#about'

  resources :cafes, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
  	resources :cafe_comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update] 
  
end
