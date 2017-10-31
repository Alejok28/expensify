class ExpensesController < ApplicationController
  before_action :set_expenese, only: [:edit, :destroy, :update]

  def index
    @tab = :expenses
    @expenses = filter_params.empty? ? Expense.month(Date.current) : Expense.filters(filter_params)
    @average = Expense.average(@expenses)
    @total = Expense.total(@expenses)
    @categories = Category.all
    @transaktions = Transaktion.all
    @dates = Expense.get_dates.keys
    @expenses = @expenses.order(date_transaction: :asc)
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.create!(expense_params)
  end

  def edit
  end

  def update
    @expense.update(expense_params)
  end

  def destroy
    @expense.destroy
  end

  private

    def filter_params
      params.permit(:date, :category_id, :transaktion_id)
    end

    def expense_params
      params.require(:expense).permit(:concept, :date_transaction, :amount, :category_id, :transaktion_id)
    end

    def set_expenese
      @expense = Expense.find(params[:id])
    end
end
