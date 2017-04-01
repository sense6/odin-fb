Rails.application.routes.draw do
  get 'friendship/create'
  delete 'friendship/destroy'

  get 'invites/create'

  get 'likes/create'
  delete 'likes/destroy'

  resources :posts, :comments

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    :omniauth_callbacks => "users/omniauth_callbacks"
  }
  devise_scope :user do
    get "/" => "posts#index"
    get "/users" => "users/sessions#index"
    get 'show_user/:id', to: "users/sessions#show", as: 'show_user'
  end
end
