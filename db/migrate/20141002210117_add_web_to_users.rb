class AddWebToUsers < ActiveRecord::Migration
  def change
    add_column :users, :web, :string
  end
end
