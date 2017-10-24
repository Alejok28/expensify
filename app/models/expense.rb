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

  def self.get_dates
    Expense.group_by_month(:date_transaction, format: "%b %Y").count
  end

  def self.filters(params)
    expenses = Expense.all
    if params[:date].present?
      date = Date.parse(params[:date])
      expenses = expenses.where(date_transaction: date.beginning_of_month..date.end_of_month)
    end
    if params[:category_id].present?
      expenses = expenses.where(category_id: params[:category_id])
    end
    if params[:transaktion_id].present?
      expenses = expenses.where(transaktion_id: params[:transaktion_id])
    end
    expenses
  end

  def self.average(expenses)
    expenses.map { |expense| expense[:amount].to_f }.reduce(:+) / expenses.size
  end

  def self.total(expenses)
    expenses.map { |expense| expense[:amount].to_f }.reduce(:+)
  end
end
