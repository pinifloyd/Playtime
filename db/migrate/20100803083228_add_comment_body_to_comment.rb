class AddCommentBodyToComment < ActiveRecord::Migration
  def self.up
    add_column :comments, :comment_body, :text
  end

  def self.down
    remove_column :comments, :comment_body
  end
end
