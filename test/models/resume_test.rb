# == Schema Information
#
# Table name: resumes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  title      :string
#  uri        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ResumeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
