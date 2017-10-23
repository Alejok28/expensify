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

class Expense < ApplicationRecord
  belongs_to :category
  belongs_to :transaktion

  validates_presence_of :amount, :date_transaction, :concept
end
