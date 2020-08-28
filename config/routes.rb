Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'users/new'
  post 'users/new', action: :create, controller: 'users'
  get 'users', action: :index, controller: 'users'
  delete 'users/:id', action: :destroy, controller: 'users'
  get 'users/:id/edit', action: :edit, controller: 'users'
  patch 'users/:id', action: :update, controller: 'users'
  put 'users/:id', action: :update, controller: 'users'

  root 'users#index'
end
