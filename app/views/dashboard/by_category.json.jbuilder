json.type "pie"
json.dataPoints do
  json.array! @expenses do |category, expenses|
    json.y Expense.total(expenses)
    json.indexLabel category.name.titleize
  end
end
