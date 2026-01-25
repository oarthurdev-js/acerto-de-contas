module Auth
  class TokenService
    ACCESS_EXPIRATION_TIME = 15.minutes
    REFRESH_EXPIRATION_TIME = 1.month

    def self.generate_tokens(user)
      access_token = JsonWebToken.encode(
        { user_id: user.id },
        ACCESS_EXPIRATION_TIME.from_now
      )

      refresh_token = SecureRandom.uuid

      REDIS.setex(
        redis_key(user_id, refresh_token),
        REFRESH_EXPIRATION_TIME.to_i,
        "1"
      )
      {
        access_token: access_token,
        refresh_token: refresh_token
      }
    end

    def self.valid_refresh?(user_id, refresh_token)
      REDIS.exists?(redis_key(user_id, refresh_token))
    end

    def self.revoke_refresh(user_id, refresh_token)
      REDIS.del(redis_key(user_id, refresh_token))
    end

    def self.redis_key(user_id, refresh_token)
      "refresh_token:#{user_id}:#{refresh_token}"
    end
  end
end
