module CurrentUser
  extend ActiveSupport::Concern

  included do
    before_action :set_current_user
  end

  private

  def set_current_user
    header = request.headers["Authorization"]
    token = header.split(" ").last if header

    decoded = JWT::Decoder.call(token)
    @current_user = User.find_by(id: decoded["user_id"]) if decoded
  end
end