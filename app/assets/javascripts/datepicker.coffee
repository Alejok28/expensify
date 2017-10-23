class DatePicker

  initialize_calendar: () ->
    $("#expense_date_transaction").datepicker
      dateFormat: "dd-mm-yy"
      maxDate: 0

window.DatePicker = DatePicker
