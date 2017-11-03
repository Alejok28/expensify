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

require 'rails_helper'

RSpec.describe Expense, type: :model do
  it { should belong_to(:category) }
  it { should belong_to(:transaktion) }
  it { should validate_presence_of(:amount) }
  it { should validate_presence_of(:date_transaction) }
  it { should validate_presence_of(:concept) }

end
