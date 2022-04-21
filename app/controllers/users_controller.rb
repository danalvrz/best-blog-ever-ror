class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, :authorize_request, only: :create

  def index
    @users = User.all
  end

  # return authenticated token upon signup
  def create
    user = User.create!(user_params)

    user.confirmed_at = DateTime.now
    user.save

    auth_token = AuthenticateUser.new(user.email, user.password).call
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
  end

  def show
    if params[:id] == 'sign_out'
      sign_out
      redirect_to root_path
    else
      @user = User.find(params[:id])
    end
  end

  private

  def user_params
    params.permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
