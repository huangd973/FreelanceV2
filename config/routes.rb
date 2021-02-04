Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"
  get "home", to: "home#index"

  resources :projects
  resources :categories
  resources :developers, only: [:index, :new ,:create]

  get '/projects' => 'projects#search', :as => 'search_page'

  get '/accept' => 'developers#accept', :as => 'accept'
end
