# == Schema Information
#
# Table name: file_uploads
#
#  id         :integer          not null, primary key
#  name       :string
#  size       :integer
#  uri        :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class FileUploadTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
