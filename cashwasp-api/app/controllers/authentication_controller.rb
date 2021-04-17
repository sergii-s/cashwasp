class AuthenticationController < ApplicationController
  skip_before_action :authorize_request

  def authenticate
    token = AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    json_response(auth_token: token)
  end

  def auth_params
    params.permit(:email, :password)
  end
end
