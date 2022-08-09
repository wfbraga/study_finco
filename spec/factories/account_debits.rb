FactoryBot.define do
  factory :account_debit do
    bank { Faker::Company.name }
    number { "#{rand(11_000..100_000)}-#{%i[a f g h t y].sample}" }
    branch { rand(999..10_000).to_s }
    credit_limit { rand(0..10_000) }
    owner_name { nil }
    owner { nil }
    account { nil }
  end
end
