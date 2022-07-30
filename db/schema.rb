# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_07_25_145007) do

  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'account_credit_cards', force: :cascade do |t|
    t.string 'bank', null: false
    t.string 'brand', null: false
    t.integer 'last_digits'
    t.float 'credit_limit', default: 0.0, null: false
    t.string 'owner_name'
    t.integer 'due_day'
    t.date 'expires_at'
    t.bigint 'account_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'owner_id', null: false
    t.index ['account_id'], name: 'index_account_credit_cards_on_account_id'
    t.index ['owner_id'], name: 'index_account_credit_cards_on_owner_id'
  end

  create_table 'account_debits', force: :cascade do |t|
    t.string 'bank', null: false
    t.string 'branch'
    t.string 'number', null: false
    t.decimal 'credit_limit', precision: 10, scale: 2, default: '0.0', null: false
    t.string 'owner_name'
    t.bigint 'account_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'owner_id', null: false
    t.index ['account_id'], name: 'index_account_debits_on_account_id'
    t.index ['owner_id'], name: 'index_account_debits_on_owner_id'
  end

  create_table 'accounts', force: :cascade do |t|
    t.string 'name', null: false
    t.integer 'kind', null: false
    t.bigint 'group_id', null: false
    t.decimal 'balance', precision: 10, scale: 2, default: '0.0', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'owner_id', null: false
    t.index ['group_id'], name: 'index_accounts_on_group_id'
    t.index ['owner_id'], name: 'index_accounts_on_owner_id'
  end

  create_table 'groups', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'owner_id', null: false
    t.index ['owner_id'], name: 'index_groups_on_owner_id'
  end

  create_table 'installment_purchases', force: :cascade do |t|
    t.string 'description', null: false
    t.decimal 'total_amount', precision: 10, scale: 2, null: false
    t.decimal 'installment_amount', precision: 10, scale: 2, null: false
    t.integer 'installments_quantity', null: false
    t.integer 'current_installment', null: false
    t.integer 'due_day', null: false
    t.integer 'status', null: false
    t.bigint 'group_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['group_id'], name: 'index_installment_purchases_on_group_id'
  end

  create_table 'operations', force: :cascade do |t|
    t.string 'description'
    t.integer 'kind', null: false
    t.bigint 'account_id', null: false
    t.decimal 'amount', precision: 10, scale: 2, null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['account_id'], name: 'index_operations_on_account_id'
  end

  create_table 'recurring_bills', force: :cascade do |t|
    t.string 'description', null: false
    t.decimal 'amount', precision: 10, scale: 2, null: false
    t.integer 'active', default: 1, null: false
    t.integer 'due_day', null: false
    t.bigint 'group_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['group_id'], name: 'index_recurring_bills_on_group_id'
  end

  create_table 'user_groups', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'group_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['group_id'], name: 'index_user_groups_on_group_id'
    t.index ['user_id'], name: 'index_user_groups_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'email', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
  end

  add_foreign_key 'account_credit_cards', 'accounts'
  add_foreign_key 'account_credit_cards', 'users', column: 'owner_id'
  add_foreign_key 'account_debits', 'accounts'
  add_foreign_key 'account_debits', 'users', column: 'owner_id'
  add_foreign_key 'accounts', 'groups'
  add_foreign_key 'accounts', 'users', column: 'owner_id'
  add_foreign_key 'groups', 'users', column: 'owner_id'
  add_foreign_key 'installment_purchases', 'groups'
  add_foreign_key 'operations', 'accounts'
  add_foreign_key 'recurring_bills', 'groups'
  add_foreign_key 'user_groups', 'groups'
  add_foreign_key 'user_groups', 'users'
end
