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
#

require 'rails_helper'

RSpec.describe Lend, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
