module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :autenticate_request, only: [:create]

      def create
        user = User.new(user_params)

        if user.save
          render json: {message: "Usuário criado com sucesso"}, status: :created
        else
          render json: {message: "Erro ao criar usuário"}, status: :unprocessable_entity
        end
      end

      def me
        render json: @current_user, status: :ok
      end

      private

      def user_params
        params.require(:user).permit(
          :name,
          :email,
          :password,
          :password_confirmation,
          :cnpj
        )
      end
    end
  end
end