Rails.application.routes.draw do
  root to: 'top#index'
  get 'rank' => 'top#rank', as: :rank

  devise_for :users

  resources :items
  get 'items/:id/delete' => 'items#delete', as: :delete_item

  get   'lends/:id'  => 'lends#show',   as: :lend
  post  'lends'      => 'lends#create', as: :lends
  patch 'lends'      => 'lends#update'
  post  'lends/new'  => 'lends#new'   , as: :new_lend
  post  'lends/edit' => 'lends#edit'  , as: :edit_lend

  get    'reserves/:id'        => 'reserves#show',   as: :reserve
  delete 'reserves/:id'        => 'reserves#destroy'
  post   'reserves'            => 'reserves#create', as: :reserves
  patch  'reserves'            => 'reserves#update'
  post   'reserves/:id/new'    => 'reserves#new'   , as: :new_reserve
  post   'reserves/edit'       => 'reserves#edit'  , as: :edit_reserve
  get    'reserves/:id/delete' => 'reserves#delete', as: :delete_reserve

  get 'history/:id' => 'history#show', as: :history
end
