class AddCommentIdToProduct < ActiveRecord::Migration
  def self.up
		add_column :products, :comment_id, 	 :integer
  end

  def self.down
		remove_column :products, :picture_file_name
  end
end
