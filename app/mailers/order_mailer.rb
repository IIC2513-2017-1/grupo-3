class OrderMailer < ApplicationMailer

  def user_order(user)
    @user = user
    mail to: user.email, subject: "[Eats] Order confirmed"
  end

  def cook_order(customer, cook)
    @customer = customer
    @cook = cook
    mail to: cook.email, subject: "[Eats] You have recieved a new order"
  end

end
