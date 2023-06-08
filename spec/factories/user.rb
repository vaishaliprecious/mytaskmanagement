# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:firstname) { |n| "FirstName#{n}" }
    sequence(:lastname) { |n| "LAstName#{n}" }
    sequence(:email) { |n| "email#{n}@email.com" }
    password { 'password' }
    user_type { :admin }
  end
end
