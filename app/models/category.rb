class Category < ActiveRecord::Base
  acts_as_nested_set
  
  has_many :products
  
  named_scope :ascend_by_category_name, :order => 'name'
  
  def category_name
    self.name
  end
  
  def to_jstree_json(include_children = false)
    if root?
      hash = {:data => name, :state => "closed", :progressive_render => true, :correct_state => true, :attr => {:id => id, :rel => "root"}}
    else
      hash = {:data => name, :state => "closed", :progressive_render => true, :correct_state => true, :attr => {:id => id}}
    end
    if include_children && children.any?
      hash[:children] = children.all.collect(&:to_jstree_json)      
    end
    hash
  end  
end