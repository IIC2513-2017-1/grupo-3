json.extract! user, :id, :first_name, :last_name, :email, :address, :password, :password_confirmation, :points, :phone, :gender, :birth_date, :avatar, :created_at, :updated_at
json.url user_url(user, format: :json)
