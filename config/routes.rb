Rails.application.routes.draw do

	root 'events#index'
	#resources :static_pages
   
  	devise_for :users
	resources :events
	resources :users
end
