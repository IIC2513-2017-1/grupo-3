class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :logged_in?, only: [:edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :is_admin, only: [:index]
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
      @user = User.find(params[:id])
      @hash = Gmaps4rails.build_markers(@user) do |user, marker|
        marker.lat user.latitude
        marker.lng user.longitude
        marker.title user.name
      end
      @dishes = Dish.all
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.account_activation(@user).deliver_now
      flash[:info] = "Please check your email to activate your account."
      @user.generate_api_token_and_save
      redirect_to root_url
    else
      render 'new'
      # format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      params[:user].delete(:password) if params[:user][:password].blank?
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
        format.js   { render nothing: true }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_help_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def toggle_visible
    @user = User.find(params[:id])
    if @user.visible.nil?
      @user.update_attributes(visible: true)
    else
      @user.toggle!(:visible)
    end
    if @user.visible
      @user.dishes.update_all(active: true)
    else
      @user.dishes.update_all(active: false)
    end
    respond_to do |format|
      format.json { head :no_content }
      format.js   { render :layout => false }
      if @user.visible
        flash[:info] = "You are now able to recieve orders"
      else
        flash[:info] = "You are not recieving orders from now"
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :address, :latitude,
        :longitude, :password, :password_confirmation, :points, :phone, :gender, :birth_date,
        :avatar, :role)
    end

    def is_admin
      redirect_to(root_url) unless admin?
    end

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
