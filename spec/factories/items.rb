# == Schema Information
#
# Table name: items
#
#  id             :integer          not null, primary key
#  name           :string(255)      default(""), not null
#  place          :string(255)      default(""), not null
#  attachments    :text             default(""), not null
#  amount         :integer          default(0), not null
#  category       :integer          default(0), not null
#  lending_period :integer          default(0), not null
#  trashed_flag   :boolean          default(FALSE), not null
#  created_at     :datetime
#  updated_at     :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
  end
end
