# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Role < ActiveRecord::Base

  def to_s
    self.name
  end

  def self.admin
    Role.where(name: 'admin').first
  end
  def self.super_admin
    Role.where(name: 'super_admin').first
  end
end