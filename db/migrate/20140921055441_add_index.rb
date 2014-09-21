class AddIndex < ActiveRecord::Migration
  def change
    add_index :lends, :user_id
    add_index :lends, :item_id
    add_index :lends, :reserve_id
    add_index :reserves, :user_id
    add_index :reserves, :item_id
  end
end
