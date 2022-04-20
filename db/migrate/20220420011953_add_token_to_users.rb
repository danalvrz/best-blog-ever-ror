class AddTokenToUsers < ActiveRecord::Migration[7.0]
    def change
      add_column :users, :auth_token, :string, null: true
    end
  end