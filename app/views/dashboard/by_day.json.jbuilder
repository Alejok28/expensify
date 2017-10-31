json.array! @expenses do |transaktion, expenses|
  json.type "column"
  json.legendText transaktion.name.titleize
  json.showInLegend true
  json.dataPoints do
    json.array! @dates do |date|
      unless Expense.total(transaktion.expenses.day(date)) == 0
        json.label date.strftime("%d")
        json.y Expense.total(transaktion.expenses.day(date))
      end
    end
  end
end
