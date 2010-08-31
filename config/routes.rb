ActionController::Routing::Routes.draw do |map|
  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"
  
  map.resources :user_sessions
  map.resources :users
  map.resources :line_items
  map.resources :orders
  map.resources :categories, :only => [:index, :new, :create, :edit, :update], :collection => {:json_data => :get}
  map.resources :products do |product|
    product.resources :comments, :except => [:index, :show]
  end
  map.root :controller => :store

	map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
