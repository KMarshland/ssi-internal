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

class Resume < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true

  def to_s
    return 'Untitled' if self.title.blank?
    self.title
  end
end
