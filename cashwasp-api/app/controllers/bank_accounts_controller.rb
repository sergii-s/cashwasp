class BankAccountsController < ApplicationController
  before_action :set_user
  before_action :set_bank_account, only: [:show, :update, :destroy]

  # GET /users/:user_id/bank_accounts
  def index
    @bank_accounts = BankAccount.all
    json_response(@bank_accounts)
  end

  # POST /users/:user_id/bank_accounts
  def create
    @bank_account = @user.bank_accounts.create!(bank_account_params.merge(:account_type => 'personal'))
    json_response(@bank_account, :created)
  end

  # GET /users/:user_id/bank_accounts/:id
  def show
    json_response(@bank_account)
  end

  # PUT /users/:user_id/bank_accounts/:id
  def update
    @bank_account.update(bank_account_params)
    head :no_content
  end

  # DELETE /users/:user_id/bank_accounts/:id
  def destroy
    @bank_account.destroy
    head :no_content
  end

  private

  def bank_account_params
    # whitelist params
    params.permit(:auth, :label, :holder)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_bank_account
    @bank_account = BankAccount.find(params[:id])
  end
end
