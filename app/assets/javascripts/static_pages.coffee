# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->

  Morris.Line
    element: "users_chart"
    data: $('#users_chart').data('users')
    xkey: 'created_at'
    ykeys: ['quantity']
    labels: ['Quantity']

  Morris.Line
    element: "dishes_chart"
    data: $('#dishes_chart').data('dishes')
    xkey: 'created_at'
    ykeys: ['price']
    labels: ['Price']

  Morris.Line
    element: "orders_chart"
    data: $('#orders_chart').data('orders')
    xkey: 'created_at'
    ykeys: ['final_price']
    labels: ['Total Price']
