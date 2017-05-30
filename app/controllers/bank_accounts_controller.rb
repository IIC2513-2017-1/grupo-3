class BankAccountController < ApplicationController
  before_action :set_bank_account, only: [:show, :edit, :update, :destroy]
  before_action :is_admin, only: [:index, :destroy]

  def new
    @bank_account = current_user.bank_account.new
  end

  # POST /bank_accountes
  # POST /bank_accountes.json
  def create
    @bank_account = BankAccount.new(bank_account_params)
    @bank_account.user_id = current_user.id

    respond_to do |format|
      if @bank_account.save
        if params[:images]
          params[:images].each { |image|
            @bank_account.pictures.create(image: image)
          }
        end
        format.html { redirect_to current_user, notice: 'Bank Account was successfully created.' }
        format.json { render :show, status: :created, location: @bank_account }
      else
        format.html { render :new }
        format.json { render json: @bank_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bank_accounts/1
  # PATCH/PUT /bank_account/1.json
  def update
    respond_to do |format|
      if @bank_account.update(bank_account_params)
        format.html { redirect_to @bank_account, notice: 'Bank account was successfully updated.' }
        format.json { render :show, status: :ok, location: @bank_account }
      else
        format.html { render :edit }
        format.json { render json: @bank_account.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bank_account
      @bank_account = BankAccount.find(params[:id])
    end

    def is_admin
      redirect_to(bank_accountes_path) unless admin?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bank_account_params
      params.require(:bank_account).permit(:type, :account, :id_card_number, :bank, :user_id, @user)
    end


end
