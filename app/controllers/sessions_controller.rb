class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user&.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path, notice: 'Login successful.'

    else
      redirect_to(new_session_path, alert: 'Invalid email or password.')
    end
  end

  def destroy
    log_out
    redirect_to root_path, notice: 'Logout successful.'
  end

end
