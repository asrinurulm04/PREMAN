Rails.application.routes.draw do
  
  resources :projects
  resources :teams

  devise_for :users, controllers: {
    registrations: 'registrations',
    confirmations: 'confirmations'
  }

  as :user do
    put '/users/confirmation' => 'confirmations#update', via: :patch, as: :update_user_confirmation
  end

  root to: 'home#index'
end