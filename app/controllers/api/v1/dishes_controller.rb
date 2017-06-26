module Api::V1
  class DishessController < ApiController
    before_action :authenticate

    def index
      @dishes = Dish.includes(:user).all
    end

    def create
      @dish = @current_user.dishes.build(dish_params)
      return if @dish.save
      render json: { errors: @dish.errors }, status: :unprocessable_entity
    end

    def show
      @dish = Dish.find(params[:id])
    end

    private

      def dish_params
        params.require(:dish).permit(:name, :price, :active, :description,
                                     :times_buyed, :tag_list,
                                     :category_list, @user,
                                     pictures_attributes:
                                     [:id, :image, :_destroy])
      end

    end

  end
