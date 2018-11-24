# frozen_string_literal: true

FactoryBot.define do
  factory :player do
    sequence(:name) { |n| "TEST_NAME#{n}" }
    sequence(:email) { |n| "TEST#{n}@example.com" }
    password { "password" }
  end

end
