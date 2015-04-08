class User < ActiveRecord::Base
  has_many :settings
  has_many :notes
  has_many :links
  has_many :feeds
  has_secure_password

  before_create :set_token

  private
    def set_token
      return if token.present?
      self.token = generate_token
    end

    def generate_token
      SecureRandom.uuid.gsub(/\-/,'')
    end
end


