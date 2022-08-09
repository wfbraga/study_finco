FactoryBot.define do
  factory :account do
    name { Faker::Company.name }
    kind { %i[cash savings cheking_account creditcard investment].sample }
    group_id { nil }
    owner_id { nil }
    balance { rand(0..1000) }
  end
end
