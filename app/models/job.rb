class Job < ApplicationRecord
    validates :job_title, presence:true
    validates :location, presence:true
    validates :category, presence:true
end
