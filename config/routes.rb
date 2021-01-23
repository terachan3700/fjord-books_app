Rails.application.routes.draw do
  devise_for :user, :controllers => {
      :registrations => 'devise/registrations',
      :sessions => 'devise/sessions'
  }
  resources :users, only: [:index, :show]

  devise_scope :user do
    get "sign_in", :to => "devise/sessions#new"
    get "sign_out", :to => "devise/sessions#destroy"
  end

  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'books#index'
end
