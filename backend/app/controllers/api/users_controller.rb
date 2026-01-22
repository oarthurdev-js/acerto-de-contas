module Api
  module V1
    class UsersController < ApplicationController
      include Authenticable

      skip_before_action :authenticate_request, only: :create

  def create

    @user = User.new(user_params)

    if @user.save
      render json: {message: "Usuário criado com sucesso!"}, status: :created
    else
      render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def me
    render json: @current_user, status: :ok
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :cnpj, :password, :password_confirmation)
  end
    end
  end
end
