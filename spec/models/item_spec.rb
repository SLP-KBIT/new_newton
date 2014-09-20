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

require 'rails_helper'

RSpec.describe Item, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
