class AddReserveIdToLend < ActiveRecord::Migration
  def change
    add_column :lends, :reserve_id, :integer, null: false, default: 0
  end
end
