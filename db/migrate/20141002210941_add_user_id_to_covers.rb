class AddUserIdToCovers < ActiveRecord::Migration
  def change
    add_column :covers, :user_id, :integer
    add_index :covers, :user_id
  end
end
