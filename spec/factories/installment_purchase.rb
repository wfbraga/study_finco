# frozen_string_literal: true

FactoryBot.define do
  # Defining ramdomicaly an installment_quantity
  rand_installments_quantity = rand(3..36)

  # Defining ramdomicaly an total_amount
  rand_total_amount = rand(100..100_000)

  factory :installment_purchase do
    description { Faker::Company.name }
    total_amount { rand(100..100_000) }
    installments_quantity { rand(1..rand_installments_quantity) }
    installment_amount { rand_total_amount / rand_installments_quantity }
    current_installment { rand(1..rand_installments_quantity) }
    due_day { rand(1..20) }
    status { %i[active on_hold deactivated].sample }
  end
end
