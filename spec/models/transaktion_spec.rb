# == Schema Information
#
# Table name: transaktions
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Transaktion, type: :model do
  it { should have_many(:expenses) }
end
