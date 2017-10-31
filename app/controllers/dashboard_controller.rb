class DashboardController < ApplicationController
  def index
    @tab = :dashboard
    @today = Expense.total(Expense.today)
    @yesterday = Expense.total(Expense.yesterday)
    @month = Expense.total(Expense.month(Date.current))
    @last_month = Expense.total(Expense.last_month)
  end

  def last_six_months
    expenses = Expense.month(Date.current - 6.months, Date.current)
    @dates = Expense.get_dates(expenses).keys
    @expenses = Expense.group_by_transaktion(expenses)
  end

  def by_day
    expenses = Expense.month(Date.current)
    @dates = expenses.group_by_day(:date_transaction).count.keys
    @expenses = Expense.group_by_transaktion(expenses)
  end

  def by_category
    expenses = Expense.month(Date.current)
    @expenses = Expense.group_by_category(expenses)
  end

  def accumulated
    @this_month_expenses = Expense.month(Date.current)
    @last_month_expenses = Expense.last_month
    @dates_this_month = @this_month_expenses.group_by_day(:date_transaction).count.keys
    @dates_last_month = @last_month_expenses.group_by_day(:date_transaction).count.keys
  end
end
