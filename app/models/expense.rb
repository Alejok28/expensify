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

  scope :today, -> { where(date_transaction: Date.current) }
  scope :day, -> (day) { where(date_transaction: day) }
  scope :yesterday, -> { where(date_transaction: Date.current - 1.day) }
  scope :month, -> (start, end_month = start) { where(date_transaction: start.beginning_of_month..end_month.end_of_month) }
  scope :last_month, -> { where(date_transaction: (Date.current - 1.month).beginning_of_month..(Date.current - 1.month).end_of_month) }

  def self.get_dates(expenses = Expense.all)
    expenses.group_by_month(:date_transaction, format: "%b %Y").count
  end

  def self.filters(params)
    expenses = Expense.all
    if params[:date].present?
      date = Date.parse(params[:date])
      expenses = expenses.month(date, date)
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
    expenses.empty? ? 0 : expenses.map { |expense| expense[:amount].to_f }.reduce(:+) / expenses.size
  end

  def self.total(expenses)
    expenses.empty? ? 0 : expenses.map { |expense| expense[:amount].to_f }.reduce(:+)
  end

  def self.group_by_transaktion(expenses)
    expenses.joins(:transaktion).group_by(&:transaktion)
  end

  def self.group_by_category(expenses)
    expenses.joins(:category).group_by(&:category)
  end
end
