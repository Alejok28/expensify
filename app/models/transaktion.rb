# == Schema Information
#
# Table name: transaktions
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Transaktion < ApplicationRecord
  has_many :expenses
end
