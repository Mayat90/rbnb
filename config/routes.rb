Rails.application.routes.draw do
  get 'profile', to: 'profile#show'

  get 'profile/edit', to: 'profile#edit'
  post 'profile/edit', to: 'profile#update'

  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  resources :user_places do
    resources :availabilities, only: [ :index, :new, :create, :destroy ]
    # reservations :reservations, only: [ :new, :create]
    resources :reservations, only: [:show, :create, :new]
  end
  resources :availabilities, only: [:edit, :update]


  mount Attachinary::Engine => "/attachinary"
  resources :reservations, only: [ :index, :edit, :update, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
