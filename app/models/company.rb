# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Company < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true
  has_and_belongs_to_many :groups
  has_many :users, through: :groups

  def resume_export
    ResumeExport.from_users self.users
  end

  def to_s
    self.name
  end
end
