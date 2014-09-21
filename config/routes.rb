Rails.application.routes.draw do
  root to: 'top#index'

  devise_for :users

  resources :items
  get 'items/:id/delete' => 'items#delete', as: :delete_item

  post 'lends'     => 'lends#create', as: :lends
  post 'lends/new' => 'lends#new'   , as: :new_lend
end
