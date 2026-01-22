module ErrorHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do
      render json: { error: "Registro não encontrado" }, status: :not_found
    end

    rescue_from JWT::DecodeError do
      render json: { error: "Token inválido" }, status: :unauthorized
    end
  end
end
