class Comment < ActiveRecord::Base  
	belongs_to :product
  acts_as_nested_set :scope => :product 
  
  validates_presence_of :name, :comment_body
end
