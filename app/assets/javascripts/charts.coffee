class Charts
  constructor:() ->
    $(document).on("turbolinks:load", @chart_by_day);
    $(document).on("turbolinks:load", @chart_by_month);
    $(document).on("turbolinks:load", @chart_by_category);
    $(document).on("turbolinks:load", @chart_by_acumulated);

  chart_by_month:() ->
    $.ajax '/last_six_months.json',
      type: 'GET'
      dataType: "json"
      success: (data, textStatus, jqXHR) ->
        chart = new CanvasJS.Chart("last_six_months",
          backgroundColor: "#2F3336"
          data: data
        )
        chart.render();

  chart_by_day:() ->
    $.ajax '/by_day.json',
      type: 'GET'
      dataType: "json"
      success: (data, textStatus, jqXHR) ->
        chart = new CanvasJS.Chart("daily-expenses-chart",
          backgroundColor: "#2F3336"
          data: data
        )
        chart.render();

  chart_by_category:() ->
    $.ajax '/by_category.json',
      type: 'GET'
      dataType: "json"
      success: (data, textStatus, jqXHR) ->
        chart = new CanvasJS.Chart("category-chart",
          backgroundColor: "#2F3336"
          data: [ data ]
        )
        chart.render();

  chart_by_acumulated:() ->
    $.ajax '/accumulated.json',
      type: 'GET'
      dataType: "json"
      success: (data, textStatus, jqXHR) ->
        chart = new CanvasJS.Chart("month-acc",
          backgroundColor: "#2F3336"
          data: data
        )
        chart.render();

window.Charts = Charts
