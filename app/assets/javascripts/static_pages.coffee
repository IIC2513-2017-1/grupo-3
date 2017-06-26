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
    element: "dishes1_chart"
    data: $('#dishes1_chart').data('dishes')
    xkey: 'created_at'
    ykeys: ['price']
    labels: ['Price']

  Morris.Line
    element: "dishes2_chart"
    data: $('#dishes2_chart').data('dishes')
    xkey: 'price'
    ykeys: ['times_buyed']
    labels: ['Times Buyed']

  Morris.Line
    element: "orders_chart"
    data: $('#orders_chart').data('orders')
    xkey: 'created_at'
    ykeys: ['final_price']
    labels: ['Total Price']

  Morris.bar
    element: "price_dish_chart"
    data: $('#price_dish_chart').data('dishes')
    xkey: 'total'
    ykeys: ['dish_name']
    labels: ['Dish Name']

  Morris.bar
    element: "price_category_chart"
    data: $('#price_category_chart').data('categories')
    xkey: 'total'
    ykeys: ['category_name']
    labels: ['Category Name']
