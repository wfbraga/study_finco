# frozen_string_literal: true

FactoryBot.define do
  factory :group do
    sequence(:name) { |n| "Grupo de Contas #{n}"}
    owner_id { rand(100) }
  end
end