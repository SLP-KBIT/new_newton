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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reserf, :class => 'Reserve' do
  end
end
