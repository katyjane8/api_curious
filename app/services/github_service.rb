class GithubService
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def conn(token)
    Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.params["access_token"] = token
    end
  end

  def get_user_info(user)
    response = conn(user.token).get "/user"
    parse_json(response)
  end

  def get_starred_repos(user)
    response = conn(user.token).get "/users/#{user.login}/starred"
    parse_json(response)
  end

  def get_followers(user)
    response = conn(user.token).get "/users/#{user.login}/followers"
    parse_json(response)
  end

  def get_following(user)
    response = conn(user.token).get "/users/#{user.login}/following"
    parse_json(response)
  end

  def get_repos(user)
    response = conn(user.token).get "/user/repos"
    parse_json(response)
  end

  private

    def parse_json(response)
      JSON.parse(response.body)
    end
end
