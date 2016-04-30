# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Group < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true
  has_and_belongs_to_many :users
  has_and_belongs_to_many :companies

  def resume_export
    ResumeExport.from_users self.users
  end

  def to_s
    self.name
  end

end
