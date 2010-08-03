class Comment < ActiveRecord::Base
	has_many :products
	
	acts_as_nested_set
  def path_name
    "#{'<ol>' * self.level} #{self.name}"
  end
end
