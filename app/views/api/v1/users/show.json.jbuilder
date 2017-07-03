# frozen_string_literal: true

json.user do

  json.id @user.id
  json.href api_v1_user_url(@user)
  json.email @user.email
  json.first_name @user.first_name
  json.last_name @user.last_name

  json.dishes do

    json.array! @user.dishes do |dish|

      json.id dish.id
      json.href api_v1_dish_url(dish)
      json.name dish.name
      json.price dish.price
      json.description dish.description

    end

  end

end
