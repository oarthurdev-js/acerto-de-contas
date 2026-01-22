module Authenticable
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_request
  end

  private

  def authenticate_request
    header = request.headers["Authorization"]
    token = header.split(" ").last if header

    begin
      decoded = JWT::Decoder.call(token)
      @current_user = User.find(decoded["user_id"])
    rescue
      render json: {error: "Não autorizado"}, status: :unauthorized
    end
  end
end