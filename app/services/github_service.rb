class GithubService
  attr_reader :user, :other_user

  def initialize(user)
    @user = user
  end

  def conn(token)
    Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.params["access_token"] = token
    end
  end

  def get_user_info
    response = conn(user.token).get "/user"
    parse_json(response)
  end

  def get_starred_repos
    response = conn(user.token).get "/users/#{user.login}/starred"
    parse_json(response)
  end

  def get_followers
    response = conn(user.token).get "/users/#{user.login}/followers"
    parse_json(response)
  end

  def get_following
    response = conn(user.token).get "/users/#{user.login}/following"
    parse_json(response)
  end

  def get_repos
    response = conn(user.token).get "/user/repos"
    parse_json(response)
  end

  def get_events
    response = conn(user.token).get "/users/#{user.login}/events"
    events = parse_json(response)
    push_events = events.select do |event|
      event["type"] == "PushEvent"
    end
    push_events.map do |event|
       { repo_name: event["repo"]["name"], message: event["payload"]["commits"].first["message"] }
     end
  end

  # def get_others_events
  #   response = conn(user.token).get "/users/#{other_user.login}/events"
  #   events = parse_json(response)
  #   push_events = events.select do |event|
  #     event["type"] == "PushEvent"
  #   end
  #   push_events.map do |event|
  #      { repo_name: event["repo"]["name"], message: event["payload"]["commits"].first["message"] }
  #    end
  # end

  private

    def parse_json(response)
      JSON.parse(response.body)
    end
end
