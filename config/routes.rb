Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
	root 'home#top'
	get 'home/about'
	devise_for :users
	resources :users,only: [:show,:index,:edit,:update]
	resources :books,except: [:new] do
    # bookに対してcomments, favoriteの関係なので書き分ける
		resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
	end
end