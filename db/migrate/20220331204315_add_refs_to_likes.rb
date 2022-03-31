class AddRefsToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :user, null: false, foreign_key: true
    add_reference :likes, :post, null: false, foreign_key: true
    rename_column :likes, :user_id, :author_id
    add_index :likes, :user
    add_index :likes, :post

  end
end
