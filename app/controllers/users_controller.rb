class UsersController < ApplicationController
  skip_before_action :authorize_request, only: [:register, :login]

  def register
    user = User.new(user_params)
    if user.save
      render json: { message: 'User created' }, status: :created
    else
      render json: { error: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def login
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      token = encode_token({ user_id: user.id })
      render json: { token: token }
    else
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    end
  end

  private
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
