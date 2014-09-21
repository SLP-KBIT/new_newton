# == Schema Information
#
# Table name: reserves
#
#  id         :integer          not null, primary key
#  user_id    :integer          default(0), not null
#  item_id    :integer          default(0), not null
#  amount     :integer          not null
#  lent_flag  :boolean          default(FALSE), not null
#  created_at :datetime
#  updated_at :datetime
#

class Reserve < ActiveRecord::Base
  belongs_to :user
  belongs_to :item
  has_one :lend

  def self.id_is( id )
    Reserve.where( id: id.to_i ).first
  end
end
