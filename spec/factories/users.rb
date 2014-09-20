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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  end
end
