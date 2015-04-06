class User < ActiveRecord::Base
  has_many :settings
  has_many :notes
  has_many :links
  has_secure_password

  before_create :generate_token

  def generate_token
    return if token.present?
    begin
      self.token = SecureRandom.uuid.gsub(/\-/,'')
    end while self.class.exists?(token: token)
    #line about checks that there is noone else with the same token
  end
end
