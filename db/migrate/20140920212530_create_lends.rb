class CreateLends < ActiveRecord::Migration
  def change
    create_table :lends do |t|
      t.integer :user_id,       null: false, default: 0
      t.integer :item_id,       null: false, default: 0
      t.integer :amount,        null: false
      t.integer :status,        null: false, default: 0
      t.boolean :returned_flag, null: false, default: false

      t.timestamps
    end
  end
end
