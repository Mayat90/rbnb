Rails.application.routes.draw do
  get 'profile', to: 'profile#show'
  get 'profile/edit', to: 'profile#edit'
  post 'profile/edit', to: 'profile#update'
  # get 'user_places/find', to: 'user_places#find'

  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  resources :user_places do
    resources :availabilities, only: [ :index, :new, :create, :destroy ]
    resources :reservations, only: [:create, :new]
  end
  resources :availabilities, only: [:edit, :update]

  resources :reservations, only: [:show, :index, :edit, :update, :destroy]
  mount Attachinary::Engine => "/attachinary"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
