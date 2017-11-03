# == Schema Information
#
# Table name: transaktions
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :transaktion do
    name { Faker::Lorem.sentence }
  end
end
