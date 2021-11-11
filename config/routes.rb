Rails.application.routes.draw do
  resources :projects
  resources :teams
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  devise_for :users, controllers: {
    registrations: 'registrations',
    confirmations: 'confirmations'
  }

  as :user do
    put '/users/confirmation' => 'confirmations#update', via: :patch, as: :update_user_confirmation
  end
end