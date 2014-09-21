Rails.application.routes.draw do
  root to: 'top#index'

  devise_for :users
  resources :users, only: %w( show )

  resources :items
  get 'items/:id/delete' => 'items#delete', as: :delete_item

  post  'lends'      => 'lends#create', as: :lends
  patch 'lends'      => 'lends#update'
  post  'lends/new'  => 'lends#new'   , as: :new_lend
  post  'lends/edit' => 'lends#edit'  , as: :edit_lend
end
