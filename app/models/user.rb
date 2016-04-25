# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  name             :string
#  email            :string
#  provider         :string
#  oauth_token      :string
#  oauth_expires_at :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  uid              :string
#

class User < ActiveRecord::Base
  before_save :downcase_email
  has_and_belongs_to_many :roles

  validates :email, presence: true

  def self.from_omniauth(auth)
    puts auth.inspect.green
    puts auth.provider
    puts auth.uid

    User.where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.oauth_token = auth.credentials.token[0, 255] if auth.credentials.nil? || auth.credentials.token.blank?
      user.oauth_expires_at = Time.at(auth.credentials.expires_at || 1.days.from_now)

      user.name = auth.info.name
      user.email = auth.info.email || ''
      user.email.downcase! #Make sure email is downcase

      #make sure this user doesn't already exist
      otherUsers = User.where("(email=?) OR (provider=? AND uid=?)", user.email, user.provider, user.uid)
      otherUsers.each do |us|
        return us #if they do exist, log them in instead
      end

      user.save!(:validate => false) #if you try validating it, it might get pissed off that it doesn't have a password (if using devise)

      return user
    end
  end

  def downcase_email
    unless self.email == self.email.downcase
      self.email = self.email.downcase
    end
  end

  def is_super_admin?
    check_roles(:super_admin)
  end
  def is_admin?
    check_roles(:super_admin, :admin)
  end

  def check_roles(*roles)
    roles.each do |role|
      return true if self.roles.include?(Role.where(name: role).first)
    end
    false
  end

  def to_s
    self.name || self.email
  end
end