class Comment < ActiveRecord::Base
	belongs_to :product
	
	acts_as_nested_set
  def path_name
    "#{'<ol>' * self.level} #{self.name}"
  end
end
