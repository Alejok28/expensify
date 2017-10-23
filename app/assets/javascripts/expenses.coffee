# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class Filters
  constructor: () ->
    $("#filter_date").change(@expenses_by_date)

  expenses_by_date: () ->
    date = $("#filter_date").val();
    $.ajax '/filters',
      type: 'GET'
      data: filters: {
        date: date
        }
      success: (data, textStatus, jqXHR) ->
        console.log(data)

window.Filters = Filters
