class InvestmentsController < ApplicationController
  before_action :set_user

  # POST /users/:user_id/bank_accounts
  def invest
    source_account = @user.bank_accounts.find(invest_params[:source])

    destination_account = invest_params[:destination] ? @user.bank_accounts.find(invest_params[:destination]) : @user.bank_accounts.create(auth: "IBAN-NEW-ONE", label: "My Cashwasp+", holder: "BankPostal", account_type: "cashwasp+")

    transfer = Transfer.create(amount: invest_params[:amount], source: source_account, destination: destination_account)
    json_response(transfer, :created)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def invest_params
    # whitelist params
    params.permit(:source, :destination, :amount)
  end
end
