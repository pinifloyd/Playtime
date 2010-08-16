ActionController::Routing::Routes.draw do |map|
  map.resources :users

  map.resources :line_items

  map.resources :orders

  map.resources :products do |product|
    product.resources :comments, :except => [:index, :show]
  end

  map.root :controller => :store

	map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
