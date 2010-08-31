class Category < ActiveRecord::Base
  acts_as_nested_set
  
  has_many :products
  
  named_scope :ascend_by_category_name, :order => 'name'
  
  def category_name
    self.name
  end
  
  def to_jstree_json(include_children = true)
    hash = {:data => name, :children => [], :progressive_render => true}
    if include_children || children.any?
      hash[:children] = children.all.collect { |c| c.to_jstree_json(false) }
    end
    hash
  end
end