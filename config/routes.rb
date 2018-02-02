Rails.application.routes.draw do

  root to: 'home#index'

  devise_for :users, controllers: {
    # Override the following Devise controllers with our custom versions
    registrations: 'users/registrations',
    passwords: 'users/passwords',
  }
  
  devise_scope :user  do
    get "/imported/:reset_password_token" => "users/passwords#imported", :as => :imported_users, :action => :imported
  end
  resources :users do
    resources :accounts do
      get :openorders
      #get :buylimit
      #get :selllimit
      get :orderhistory
      get :balance
      get :actions

      #get '/buylimit/:market/:quantity/:rate', action: :buylimit, as: :buylimit_order
      #get '/selllimit/:market/:quantity/:rate', action: :selllimit, as: :selllimit_order

      get '/buylimit/:market', action: :buylimit, as: :buylimit_order
      get '/selllimit/:market', action: :selllimit, as: :selllimit_order

      get '/reorder/:uuid', action: :reorder, as: :reorder_order
    end
  end



  namespace :admin do
    resources :users
    resources :accounts
  end

  # form_for is easier to use with a resourceful route
  resources :contact_forms, only: [:create]
  # A non-resourceful route was used to place the contact form at /contact
  get 'contact' => 'contact_forms#new', as: 'contact'
end
