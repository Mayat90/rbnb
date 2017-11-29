Rails.application.routes.draw do
  get 'profile/show'

  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  resources :user_places do
    resources :availabilities, only: [ :index, :new, :create, :destroy ]
    # reservations :reservations, only: [ :new, :create]
  end
  resources :availabilities, only: [:edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
