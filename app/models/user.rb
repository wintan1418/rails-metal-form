class User < ApplicationRecord
    before_save { self.email.downcase! }  
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :username, presence: true, uniqueness:true
    validates :email, presence: true, uniqueness: {case_sensitive: false}, 
    length: {maximum: 50}, format: { with: VALID_EMAIL_REGEX }

    validates :password,presence:true, length: {minimum: 5}
end
