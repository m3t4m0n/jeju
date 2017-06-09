class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nick, :string
    add_column :users, :image, :string
  end
end
