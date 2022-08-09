FactoryBot.define do
  factory :account_objective do
    target_name { Faker::Commerce.product_name }
    target_amount { Faker::Commerce.price }
    acomplish_at { Time.zone.now + 1.year }
    # account_id {}
    # owner_name {}
    # owner_id {}
  end
end
