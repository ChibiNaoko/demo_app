Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/new'

  get 'users/new'

  root 'static_pages#home'
  get 'help' => 'static_pages#help'
  get 'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :entries
  resources :comments
  resources :relationships,       only: [:create, :destroy]


end
