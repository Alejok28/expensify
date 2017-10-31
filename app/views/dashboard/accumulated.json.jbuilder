json.array! [@dates_this_month, @dates_last_month] do |dates|
  json.type "area"
  json.dataPoints do
    accumulated = 0
    json.array! dates do |date|
      json.label date
      accumulated += Expense.total(Expense.day(date))
      json.y accumulated
    end
  end
end
