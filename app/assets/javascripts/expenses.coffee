# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class Filters
  constructor: () ->
    $("#filter_date").change(@expenses_by_date)
    $(".categories").on("click", @expenses_by_category)
    $(".transaktions").on("click", @expenses_by_transaktion)

  expenses_by_date: () =>
    date = $("#filter_date").val();
    filter = date
    @url_process("date", date);
    @ajax_request();

  expenses_by_category: (event) =>
    $("#categories").find(".active").removeClass('active')
    element = event.currentTarget
    $(element).addClass('active');
    id = $(element).attr('id').split("-")[1];
    @url_process("category_id", id);
    @ajax_request();

  expenses_by_transaktion: (event) =>
    $("#transaktions").find(".active").removeClass('active')
    element = event.currentTarget
    $(element).addClass('active');
    id = $(element).attr('id').split("-")[1];
    @url_process("transaktion_id", id);
    @ajax_request();

  url_process: (key, value) =>
    pathname = window.location.href;
    if pathname.indexOf(key) != -1
      value_index = pathname.indexOf(key) + key.length + 1;
      if(key == "transaktion_id" || key == "category_id")
        pathname = pathname.substring(0, value_index) + value + pathname.substring(value_index + 1, pathname.length);
      else
        pathname = pathname.substring(0, value_index) + value + pathname.substring(value_index + value.length + 2, pathname.length);
      window.history.pushState("filters", "", pathname);
    else
      if pathname.indexOf("?") == -1
        window.history.pushState("filters", "", pathname + "?" + key + "=" + value);
      else
        window.history.pushState("filters", "", pathname + "&" + key + "=" + value);

  ajax_request: () =>
    $.ajax window.location.href,
      type: 'GET'
      dataType: 'script'



window.Filters = Filters
