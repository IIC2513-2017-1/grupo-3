# frozen_string_literal: true

json.dish do
  json.id @dish.id
  json.href api_v1_dish_url(@dish)
  json.name @dish.name
  json.price @dish.price
  json.description @dish.description
  json.user do
    json.id @dish.user.id
    json.href api_v1_user_url(@dish.user)
    json.email @dish.user.email
    json.first_name @dish.user.first_name
    json.last_name @dish.user.last_name
  end
end
