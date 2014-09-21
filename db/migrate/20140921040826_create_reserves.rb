class CreateReserves < ActiveRecord::Migration
  def change
    create_table :reserves do |t|
      t.integer :user_id,       null: false, default: 0
      t.integer :item_id,       null: false, default: 0
      t.integer :amount,        null: false
      t.boolean :lent_flag,     null: false, default: false

      t.timestamps
    end
  end
end
