# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
print 'Seeding the Bank'

(1..50).each do |id|
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email
  )
  Group.create(
    name: Faker::Lorem.word,
    owner_id: rand(1..id)
  )

  # Defining ramdomicaly an installment_quantity
  rand_installments_quantity = rand(3..36)

  # Defining ramdomicaly an total_amount
  rand_total_amount = rand(100..100000)

  InstallmentPurchase.create(
    description: Faker::Company.name,
    total_amount: rand_total_amount,
    installments_quantity: rand_installments_quantity,
    installment_amount: rand_total_amount / rand_installments_quantity,
    current_installment: rand(1..rand_installments_quantity),
    due_day: rand(1..20),
    status: %i[active on_hold deactivated].sample,
    group_id: rand(1..id)
  )

  RecurringBill.create(
    description: Faker::Company.name,
    amount: rand(100..300),
    active: %i[active deactivated].sample,
    due_day: rand(1..20),
    group_id: rand(1..id)
  )

  UserGroup.create(
    user_id: rand(1..id),
    group_id: rand(1..id)
  )

  Account.create(
    name: Faker::Company.name,
    kind: %i[cash savings cheking_account creditcard investment].sample,
    group_id: rand(1..id),
    balance: rand(0..1000),
    owner_id: rand(1..id)
  )

  Operation.create(
    description: Faker::Lorem.paragraph,
    kind: %i[debit credit].sample,
    account_id: rand(1..id),
    amount: rand(1..100_000)
  )

  account = Account.find_by(id: rand(1..id))
  AccountDebit.create(
    bank: Faker::Company.name,
    branch: rand(999..10_000).to_s,
    number: "#{rand(11_000..100_000)}-#{%i[a f g h t y].sample}",
    credit_limit: rand(0..10_000),
    account_id: account.id,
    owner_name: account.owner.name,
    owner_id: account.owner.id
  )

  AccountCreditCard.create(
    bank: Faker::Company.name,
    brand: Faker::Commerce.brand,
    last_digits: rand(1000..9999),
    credit_limit: rand(500..10_000),
    owner_name: account.owner.name,
    due_day: rand(1..14),
    expires_at: Time.zone.now + 1.year,
    owner_id: account.owner.id,
    account_id: account.id,
  )

  AccountObjective.create(
    target_name: Faker::Commerce.product_name,
    target_amount: Faker::Commerce.price,
    acomplish_at: Time.zone.now + 1.year,
    owner_name: account.owner.name,
    owner_id: account.owner.id,
    account_id: account.id
  )
  print '.'
end
print "!\nFinished succefuly!\n"
