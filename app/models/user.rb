class User < ApplicationRecord
    before_create { generate_token(:auth_token) }
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
    
    def send_password_reset
        generate_token(:reset_password_token)
        self.reset_password_sent_at = Time.zone.now
        save!
    end
    
    private
    
    def generate_token(column)
      begin
        self[column] = SecureRandom.urlsafe_base64
      end while User.exists?(column => self[column])
    end
end