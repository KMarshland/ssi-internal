# == Schema Information
#
# Table name: reimbursements
#
#  id          :integer          not null, primary key
#  status      :string
#  team        :string
#  credit_card :boolean
#  value       :decimal(8, 2)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ReimbursementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
