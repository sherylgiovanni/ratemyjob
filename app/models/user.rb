class User < ApplicationRecord
    has_many :reviews, dependent: :destroy
    
    has_secure_password
    validates :name, presence: :true
    validates :email, format: { with: /@/, message: "Must have an @" }, uniqueness: true
end
