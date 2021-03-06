class UsersController < ApplicationController
  skip_before_action :authorize_request, only: %i[create home]

  # homepage
  def home
    response = 'Welcome to fluid contact repo'
    render json: response
  end

  # POST /signup
  # return authenticated token upon signup
  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    response = { message: Message.account_created, auth_token: auth_token }
    render json: response
    # json_response(response, :created)
  end

  private

  def user_params
    params.permit(
      :username,
      :email,
      :password
    )
  end
end
