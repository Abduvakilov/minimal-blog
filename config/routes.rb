Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }
	root 'posts#index'

  resources :posts do
		resources :comments, only: [:create, :update, :destroy]
	end

	get 'posts/user/:user_id', to: 'posts#user_posts', as: :user_posts

end
