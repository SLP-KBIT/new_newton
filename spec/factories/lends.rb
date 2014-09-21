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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lend do
  end
end
