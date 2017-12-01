Rails.application.routes.draw do
  get 'profile', to: 'profile#show'
  get 'profile/edit', to: 'profile#edit'
  post 'profile/edit', to: 'profile#update'
  get 'search', to: 'profile#index'
  get 'resaconfirm', to: 'reservations#new'

  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'


  resources :availabilities, only: [:edit, :update]

  resources :reservations, only: [:show, :create, :index, :edit, :update, :destroy]
  mount Attachinary::Engine => "/attachinary"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
