class ApplicationController < ActionController::API
  
  before_action :authenticate_request
  include CurrentUser
  include ErrorHandler

  private

  def authenticate_request
    header = request.headers["Authorization"]
    token = header.split(" ").last if header

    begin
      decoded = JsonWebToken.decode(token)
      @current_user = User.find(decoded["user_id"]) if decoded
    rescue
      render json: {error: "Não autorizado"}, status: :unauthorized unless @current_user
    end
  end
end
