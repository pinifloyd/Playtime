class Category < ActiveRecord::Base
  acts_as_nested_set
  
  has_many :products
  
  named_scope :ascend_by_category_name, :order => 'name'
  
  def category_name
    self.name
  end
  
  def to_jstree_json(include_children = false)
    hash = {:data => name,
            :progressive_render => true,
            :attr => {:id => id, :price => "25", :size => "3"}}
    hash[:rel] = "root" if root?
    if children.any?
      hash[:state] = "closed"
    end
    if include_children && children.any?
      hash[:children] = children.all.collect(&:to_jstree_json)      
    end
    hash
  end
  
  def to_jstree_products
    hash = {:data => name, :attr => {:id => id}}
    hash
  end
  
end