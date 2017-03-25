Rails.application.routes.draw do
  get 'friendship/create'
  delete 'friendship/destroy'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get "/" => "users/sessions#index"
    get 'show_user' => "users/sessions#show"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
