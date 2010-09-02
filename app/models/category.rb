class Category < ActiveRecord::Base
  acts_as_nested_set
  
  has_many :products
  
  named_scope :ascend_by_category_name, :order => 'name'
  
  def category_name
    self.name
  end
  
  def to_jstree_json(include_children = false)
    hash = {:data => name,
            :children => [],
            :attr => {:id => id, :price => "25", :size => "3"}}
    hash[:attr][:rel] = "root" if root?
    
    if children.any?
      hash[:state] = "closed"
    end
    
    if products.any?
      hash[:children] += products.all.collect(&:to_jstree_products)
    end
    
    if  children.any?
      hash[:children] += children.all.collect(&:to_jstree_json)      
    end
    
    hash
  end  
end