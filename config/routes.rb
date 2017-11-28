Rails.application.routes.draw do

  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  resources :user_places do
    resources :availabilities, only: [ :index, :new, :create ]
  end
  resources :availabilitis, only: [:edit, :update, :destroy ]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
