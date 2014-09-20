# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  username           :string(255)      default(""), not null
#  encrypted_password :string(255)      default(""), not null
#  admin_flag         :boolean          default(FALSE), not null
#  created_at         :datetime
#  updated_at         :datetime
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :registerable, :recoverable, :rememberable, :trackable, :validatable
  devise :database_authenticatable
  validates :username, presence: true
  scope :id_is, -> ( id ) { where( id: id ).first }

  def self.search( keyword )
    if keyword
      User.where( ['username LIKE ?', "%#{keyword}%"] )
    else
      User.all
    end
  end

  def is_admin?
    admin_flag
  end
end
