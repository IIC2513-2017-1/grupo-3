class CooksController < ApplicationController
  before_action :set_cook, only: [:show, :edit, :update, :destroy]

  # GET /cooks
  # GET /cooks.json
  def index
    @cooks = Cook.all
  end

  # GET /cooks/1
  # GET /cooks/1.json
  def show
  end

  # GET /cooks/new
  def new
    @cook = Cook.new
  end

  # GET /cooks/1/edit
  def edit
  end

  # POST /cooks
  # POST /cooks.json
  def create
    @cook = Cook.new(cook_params)

    respond_to do |format|
      if @cook.save
        format.html { redirect_to @cook, notice: 'Cook was successfully created.' }
        format.json { render :show, status: :created, location: @cook }
      else
        format.html { render :new }
        format.json { render json: @cook.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cooks/1
  # PATCH/PUT /cooks/1.json
  def update
    respond_to do |format|
      if @cook.update(cook_params)
        format.html { redirect_to @cook, notice: 'Cook was successfully updated.' }
        format.json { render :show, status: :ok, location: @cook }
      else
        format.html { render :edit }
        format.json { render json: @cook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cooks/1
  # DELETE /cooks/1.json
  def destroy
    @cook.destroy
    respond_to do |format|
      format.html { redirect_to cooks_url, notice: 'Cook was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cook
      @cook = Cook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cook_params
      params.require(:cook).permit(:fist_name, :last_name, :visible, :email, :address, :score, :phone, :gender, :seal, :birth_date)
    end
end
