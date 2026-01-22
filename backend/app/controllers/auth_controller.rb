class AuthController < ApplicationController
  include Authenticable

  skip_before_action :authenticate_request, only: :login

  def login
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      token = JWT::Encoder.call({user_id: user.id})
      render json: {token: token}
    else
      render json: {error: "Credenciais inválidas"}, status: :unauthorized
    end
  end
end
