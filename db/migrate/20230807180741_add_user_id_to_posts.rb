class AddUserIdToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :user_id, :bigint
    add_foreign_key :posts, :users
  end
end
