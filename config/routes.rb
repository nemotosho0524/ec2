Rails.application.routes.draw do


	# get '/users/sign_up', to: redirect('/users/sign_in')
  devise_for :users, :controllers => {
    :sessions => "users/sessions",
    :registrations => "users/registrations",
    :passwords => "users/passwords"
  }
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    resources :users, :only => [:index, :show]
	root 'posts#index'
  resources :categories
	resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
