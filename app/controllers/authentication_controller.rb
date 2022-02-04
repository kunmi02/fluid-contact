class AuthenticationController < ApplicationController
  # return auth token once user is authenticated
  def authenticate
    auth_token =
      AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    
    response = { auth_token: auth_token }
    render :json => response
    # json_response(auth_token: auth_token)
  end

  private

  def auth_params
    params.permit(:email, :password)
  end
end