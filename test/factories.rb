FactoryBot.define do
  factory :user do |f|
    f.sequence(:name) { |n| "Test User#{n}" }
    f.sequence(:email) { |n| "test#{n}@account.com" }
    f.password { "password" }
    f.password_confirmation { |d| d.password }
  end
  factory :job do |f|
    f.sequence(:job_title) { |n| "Job #{n}" }
    f.location { "location" }
    f.category { "category" }    
  end
end