FactoryBot.define do
  factory :operation do
    description { Faker::Lorem.paragraph }
    kind { %i[debit credit].sample }
    account { nil }
    amount { rand(1..100_000) }
  end
end
