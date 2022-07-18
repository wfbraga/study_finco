# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "Fake user numer  #{n}"}
    email { Faker::Internet.email }
  end
end