# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    user
    category
    title { 'test 1' }
    description { '11111111111' }
    user_id { 1 }
    category_id { 1 }
  end
end
