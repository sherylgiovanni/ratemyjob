class Job < ApplicationRecord
    has_many :reviews, dependent: :destroy
    validates :job_title, presence:true
    validates :location, presence:true
    validates :category, presence:true
end
