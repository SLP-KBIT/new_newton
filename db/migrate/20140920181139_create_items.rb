class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string  :name          , null: false, default: ""
      t.string  :place         , null: false, default: ""
      t.text    :attachments   , null: false, default: ""
      t.integer :amount        , null: false, default: 0
      t.integer :category      , null: false, default: 0
      t.integer :lending_period, null: false, default: 0
      t.boolean :trashed_flag  , null: false, default: false

      t.timestamps
    end
  end
end
