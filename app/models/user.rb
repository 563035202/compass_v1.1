class User < ActiveRecord::Base
  before_save { self.email = email.downcase }	
validates :name,  presence: true, length: { maximum: 15, minimum: 2}
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, presence: true, length: { maximum: 50 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }


validates :password, presence: true, length: { minimum: 4 }
has_secure_password
end
