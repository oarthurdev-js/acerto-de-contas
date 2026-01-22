module JWT
  class Decoder
    def self.call(token)
      decoded = JWT.decode(token, Rails.application.secret_key_base)[0]
      HashWithIndifferentAccess.new(decoded)
    end
  end
end