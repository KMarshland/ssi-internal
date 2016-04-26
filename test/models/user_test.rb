# == Schema Information
#
# Table name: users
#
#  id                :integer          not null, primary key
#  name              :string
#  email             :string
#  provider          :string
#  oauth_token       :string
#  oauth_expires_at  :datetime
#  uid               :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  primary_resume_id :integer
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
