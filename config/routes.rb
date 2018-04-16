Rails.application.routes.draw do

  mount Lit::Engine => '/lit'
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/  do
  
    root to: 'home#index'
  end

  devise_for :users, controllers: {
    # Override the following Devise controllers with our custom versions
    registrations: 'users/registrations',
    passwords: 'users/passwords',
  }
  
  devise_scope :user  do
    get "/imported/:reset_password_token" => "users/passwords#imported", :as => :imported_users, :action => :imported
  end
  resources :users 



  namespace :admin do
    resources :users
    resources :accounts
  end

  # form_for is easier to use with a resourceful route
  resources :contact_forms, only: [:create]
  # A non-resourceful route was used to place the contact form at /contact
  get 'contact' => 'contact_forms#new', as: 'contact'
end
