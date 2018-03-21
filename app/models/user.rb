class User < ApplicationRecord

  def self.update_or_create(auth)
    user = User.find_by(uid: auth[:uid]) || User.new
    user.attributes = {
      uid: auth[:uid],
      login: auth[:login],
      token: auth[:token]
      # name: auth[:name],
      # avatar_url: auth[:avatar_url],
      # repos_url: auth[:repos_url],
      # blog: auth[:blog],
      # location: auth[:location],
      # email: auth[:email],
      # hireable: auth[:hireable],
      # bio: auth[:bio],
      # public_repos: auth[:public_repos],
      # followers: auth[:followers],
      # following: auth[:following]
    }
    user.save!
    user
  end
end
