class User < ApplicationRecord
    has_many :reviews, dependent: :destroy
    
    has_secure_password
    validates :name, presence: :true
    validates :email, format: { with: /@/, message: "Must have an @" }, uniqueness: true
    
    def self.new_from_hash(user_hash)
        user = User.new user_hash
        user.password_digest = 0
        user
    end
    
    def has_password?
        self.password_digest.nil? || self.password_digest != '0'
    end 
    
    def generate_password_token!
        self.reset_password_token = generate_token
        self.reset_password_sent_at = Time.now.utc
        save!
    end
    
    def password_token_valid?
        (self.reset_password_sent_at + 4.hours) > Time.now.utc
    end
    
    def reset_password!(password)
        self.reset_password_token = nil
        self.password = password
        save!
    end
    
    private
    
    def generate_token
        SecureRandom.hex(10)
    end
end
