class Category < ActiveRecord::Base
  acts_as_nested_set
  
  has_many :products
  
  named_scope :ascend_by_category_name, :order => 'name'
  
  def category_name
    self.name
  end
end