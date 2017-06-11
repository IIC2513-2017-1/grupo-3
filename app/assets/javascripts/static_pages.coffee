# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->

  Morris.Line
    element: "dishes_chart"
    data: $('#dishes_chart').data('dishes')
    xkey: 'id'
    ykeys: ['created_at']
    labels: ['created_at']

  Morris.Line
    element: "users_chart"
    data: $('#users_chart').data('users')
    xkey: 'id'
    ykeys: ['created_at']
    labels: ['created_at']
