FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "John Doe #{n}" }
    sequence(:email) { |n| "jdoe#{n}@example.com" }
    sequence(:username) { |n| "jdoe#{n}" }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
