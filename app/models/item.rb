# == Schema Information
#
# Table name: items
#
#  id             :integer          not null, primary key
#  name           :string(255)      default(""), not null
#  place          :string(255)      default(""), not null
#  attachments    :text             default(""), not null
#  amount         :integer          not null
#  category       :integer          default(0), not null
#  lending_period :integer          not null
#  trashed_flag   :boolean          default(FALSE), not null
#  created_at     :datetime
#  updated_at     :datetime
#

class Item < ActiveRecord::Base
  validates :name, :place, :amount, :category, :lending_period, presence: true
  validates :amount, :lending_period, numericality: { only_integer: true }
  default_scope -> { where( trashed_flag: false ) }
  scope :id_is, -> ( id ) { where( id: id ).first }

  include Category

  def self.search( keyword )
    if keyword
      Item.where( ['name LIKE ?', "%#{keyword}%"] )
    else
      Item.all
    end
  end
end
