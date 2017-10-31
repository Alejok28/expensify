json.array! @expenses do |transaktion, expenses|
  json.type "stackedColumn"
  json.name transaktion.name.titleize
  json.showInLegend true
  json.dataPoints do
    json.array! @dates do |date|
      json.y Expense.total(transaktion.expenses.month(Date.parse(date), Date.parse(date)))
      json.label date
    end
  end
end
