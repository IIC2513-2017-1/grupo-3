class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :reviewer?, only: [:edit, :update, :destroy]
  before_action :is_admin, only: [:index, :show]

  include ApplicationHelper

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @dish = Dish.find(params[:dish_id])
    @review = @dish.reviews.build
    # @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @dish = Dish.find(@review.dish_id)
    respond_to do |format|
      if @review.save
        format.html { redirect_to @dish, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
        format.js
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    @dish = Dish.find(@review.dish_id)
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @dish, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @dish  = Dish.find(@review.dish_id)
    @review.destroy
    respond_to do |format|
      format.html { redirect_to @dish, notice: 'Review was successfully destroyed' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    def is_admin
      redirect_to(dishes_path) unless admin?
    end

    def reviewer?
      redirect_to(dishes_path) unless current_user.id == @review.user_id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:title, :body, :forks, :dish_id, :user_id, @dish, current_user)
    end

    def new_release
      respond_to do |format|
        format.html
        format.js
      end
    end
end
