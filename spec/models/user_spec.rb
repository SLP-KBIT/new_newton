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

require 'rails_helper'

RSpec.describe User, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
