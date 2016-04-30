# == Schema Information
#
# Table name: resume_exports
#
#  id         :integer          not null, primary key
#  link       :string
#  uri        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ResumeExport < ActiveRecord::Base
  after_create :gen_link

  require 'rubygems'
  require 'zip'
  def self.from_users(users)
    zfpath = Rails.root.join('public', 'uploads', 'resume-exports', "export-#{DateTime.now.strftime('%Y%m%d-%H%M%S')}-#{SecureRandom.hex(12)}.zip")

    Zip::File.open(zfpath, Zip::File::CREATE) do |zipfile|
      users.uniq.each do |user|
        if user.primary_resume.present?
          zipfile.add("#{user.name}_#{SecureRandom.hex(6)}.pdf", Rails.root.join('public', user.primary_resume.uri))
        end
      end
    end

    ResumeExport.create(uri: zfpath)
  end

  def gen_link
    self.update(link: [*('a'..'z'),*('0'..'9')].shuffle[0,22].join) if self.link.blank?
  end
end
