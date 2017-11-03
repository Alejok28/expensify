# == Schema Information
#
# Table name: expenses
#
#  id               :integer          not null, primary key
#  concept          :string
#  date_transaction :date
#  amount           :decimal(, )
#  category_id      :integer
#  transaktion_id   :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

FactoryBot.define do
  factory :expense do
    concept { Faker::Lorem.sentence }
    date_transaction { Date.current }
    amount { Faker::Commerce.price }
    category
    transaktion
  end
end
