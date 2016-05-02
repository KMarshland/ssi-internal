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

class Reimbursement < ActiveRecord::Base
  has_many :file_uploads
end
