ActionController::Routing::Routes.draw do |map|
  map.resources :products do |product|
    product.resources :comments, :except => [:index, :show]
  end

	map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
