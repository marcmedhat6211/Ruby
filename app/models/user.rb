class User < ApplicationRecord
    EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\Z/i
    validates :username, presence: true, uniqueness: true, length: { :in => 3..20 }
    validates :email, presence: true, uniqueness: true, format: EMAIL_REGEX
    validates :password, confirmation: true
    validates_length_of :password, in: 4..20, on: :create
    attr_accessor :username, :email, :password, :password_confirmation
    


    before_save :encrypt_password
    after_save :clear_password

    def encrypt_password
        if encrypted_password.present?
            self.salt = BCrypt::Engine.generate_salt
            self.encrypted_password = BCrypt::Engine.hash_secret(encrypted_password,salt)
        end
    end

    def clear_password
        self.encrypted_password = nil
    end
end
