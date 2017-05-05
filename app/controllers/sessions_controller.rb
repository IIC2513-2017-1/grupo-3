class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or user

    else
      redirect_to new_session_path, alert: 'Invalid email or password.'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path, notice: 'Logout successful.'
  end

end
