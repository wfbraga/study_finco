FactoryBot.define do
  factory :account_credit_card do
    bank { Faker::Company.name }
    brand { Faker::Commerce.brand }
    credit_limit { 1000 }
    owner_name { '' }
    last_digits { 1 }
    due_day { 5 }
    expires_at { "2028-07-25" }
  end
end
