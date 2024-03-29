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
  # :recoverable, :rememberable, :trackable, :validatable
  devise :database_authenticatable, :registerable, :validatable
  validates :username, presence: true
  validates :username, uniqueness: true, if: -> { self.username.present? }
  has_many :lends
  has_many :reserves

  def self.id_is( id )
    User.where( id: id.to_i ).first
  end

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

  def lending
    lends.where( returned_flag: false )
  end

  def returned
    lends.where( returned_flag: true )
  end

  def reserving
    reserves.where( lent_flag: false )
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
