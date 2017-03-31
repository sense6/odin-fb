Rails.application.routes.draw do
  get 'friendship/create'
  delete 'friendship/destroy'

  get 'invites/create'

  get 'likes/create'
  delete 'likes/destroy'

  resources :posts, :comments

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get "/" => "posts#index"
    get "/users" => "users/sessions#index"
    get 'show_user' => "users/sessions#show"
  end
end
