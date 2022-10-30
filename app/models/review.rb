class Review < ApplicationRecord
    belongs_to :job
    belongs_to :user
    
    validates :pros, presence: true
    validates :cons, presence: true
    validates :work_hours, presence: true
end
