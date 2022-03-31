class AddRefsToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :user, null: false, foreign_key: true
    add_reference :comments, :post, null: false, foreign_key: true
    rename_column :comments, :user_id, :author_id
    add_index :comments, :user
    add_index :comments, :post

  end
end
