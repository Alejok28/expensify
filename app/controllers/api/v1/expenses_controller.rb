module Api
  module V1
    class ExpensesController < ApplicationController
      include Response
      before_action :set_expense, only: [:update, :destroy]

      def index
        @expenses = Expense.all
        json_response(@expenses)
      end

      def create
        @expense = Expense.create!(expense_params)
        json_response(@expense, :created)
      end

      def update
        @expense.update(expense_params)
        json_response(@expense, :updated)
      end

      def destroy
        @expense.destroy
      end

      private

      def expense_params
        params.permit(:concept, :date_transaction, :amount, :category_id, :transaktion_id)
      end

      def set_expense
        @expense = Expense.find(params[:id])
      end
    end
  end
end
