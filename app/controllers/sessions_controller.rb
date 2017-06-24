class SessionsController < ApplicationController
  def new; end

  def create
    if auth_hash.present?
      @user = User.find_or_create_from_auth_hash(auth_hash)
      session[:user_id] = @user.id
      redirect_back_or dishes_path
    else
      @user = User.find_by(email: params[:session][:email].downcase)
      if @user&.authenticate(params[:session][:password])
        if @user.activated?
          log_in @user
          params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
          redirect_back_or dishes_path
        else
          message  = 'Account not activated. '
          message += 'Check your email for the activation link.'
          flash[:warning] = message
          redirect_to root_url
        end
      else
        redirect_to new_session_path, alert: 'Invalid email or password.'
      end
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path, notice: 'Logout successful.'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
