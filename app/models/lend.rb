# == Schema Information
#
# Table name: lends
#
#  id            :integer          not null, primary key
#  user_id       :integer          default(0), not null
#  item_id       :integer          default(0), not null
#  amount        :integer          not null
#  status        :integer          default(0), not null
#  returned_flag :boolean          default(FALSE), not null
#  created_at    :datetime
#  updated_at    :datetime
#  reserve_id    :integer          default(0), not null
#

class Lend < ActiveRecord::Base
  belongs_to :user
  belongs_to :item
  belongs_to :reserve

  include Status

  def self.id_is( id )
    Lend.where( id: id.to_i ).first
  end
end
