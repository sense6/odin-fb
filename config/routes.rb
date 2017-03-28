Rails.application.routes.draw do
  get 'friendship/create'
  delete 'friendship/destroy'

  get 'invites/create'

  resources :posts

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get "/" => "users/sessions#index"
    get 'show_user' => "users/sessions#show"
  end
end
