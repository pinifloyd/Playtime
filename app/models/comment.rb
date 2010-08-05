class Comment < ActiveRecord::Base
	belongs_to :product
	
	acts_as_nested_set :scope => :product
end
