TravelClient::Application.routes.draw do
  resources :temps


  	match "/fb", :to => 'get_token#index', :via => :GET

	root :to => 'start#index'
	match '/callback', :to => 'get_token#callback', :via => :GET
	match '/test', :to => 'get_token#test', :via => :GET
	match '/reset', :to => 'reset#index', :via => :GET
	match '/last', :to => 'last#index', :via => :POST
	match '/no_fb', :to => 'no_fb#index', :via => :POST
	match '/wofbseat',:to => 'without_fb#index',:via => :GET
end
