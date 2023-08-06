Rails.application.routes.draw do
  namespace :admin do
    get 'orders/:id' => 'orders#show'
  end
  namespace :admin do
    get '/customers' => 'customers#index'
    get 'customers/:id' =>'customers#show'
    patch 'customers/:id' => 'customers#update'
    get 'customers/:id/edit' => 'customers#edit'
  end
  namespace :admin do
    get '/items' => 'items#index'
    get 'items/new'
    post '/items' => 'items#create'
    get 'items/:id' => 'items#show'
    patch 'items/:id' => 'items#update'
    get 'items/:id/edit' => 'items#edit'
  end
  namespace :admin do
    get '/' => 'homes#top'
  end
  namespace :public do
    get '/' => 'homes#top'
    get '/about' => 'homes#about'
  end
  namespace :public do
    get 'orders/new'
    post 'orders/confirm'
    get 'orders/thanks'
    post '/orders' => 'orders#create'
    get '/orders' => 'orders#index'
    get 'orders/:id' => 'orders#show'
  end
  namespace :public do
    get '/cart_items' => 'cart_items#index'
    patch 'cart_items/:id'  => 'cart_items#update'
    delete 'cart_items/:id' => 'cart_items#destroy'
    delete 'cart_items/:id' => 'cart_items#destroy_all'
    post '/cart_items' => 'cart_items#create'
  end
  namespace :public do
    get 'customers/information' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/update'
    get 'customers/withdraw'
    patch 'customers/withdraw' => 'customers#withdraw_update'
  end
  namespace :public do
    get 'items' => 'items#index'
    get 'items/:id' => 'items#show'
  end

  devise_for :admins,skip: [:registrations,:passwords], controllers: {
    sessions: "admin/sessions"
  }
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  devise_scope :customers do
    resources :sessions, only: [:new,:create,:destroy]
  end

  devise_scope :customers do
    resources :registrations, only: [:new,:create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
