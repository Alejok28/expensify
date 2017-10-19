class ExpensesController < ApplicationController
  def index
    @expenses = Expense.includes(:transaktion, :category)
    @categories = Category.all
    @transaktions = Transaktion.all
  end
end
