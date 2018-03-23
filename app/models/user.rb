class User < ApplicationRecord
  def self.from_omniauth(auth_info)
    user = where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid      = auth_info.uid
      new_user.login    = auth_info.info.nickname
      new_user.token    = auth_info.credentials.token
    end
    verify_current_token(user, auth_info)
    user
  end

  def self.verify_current_token(user, auth_info)
    unless user.token == auth_info.credentials.token
      user.update(token: auth_info.credentials.token)
    end
  end
end
