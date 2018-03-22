class GithubUser
    attr_reader :name, :login, :image, :followers, :num_of_followers,
                :num_of_following, :starred, :repos

    def initialize(attrs, followers, starred, repos)
      @name             = attrs[:name]
      @login            = attrs[:login]
      @image          = attrs[:avatar_url]
      @num_of_followers = attrs[:followers]
      @num_of_following = attrs[:following]
      @followers        = followers
      @starred          = starred
      @repos            = repos
    end

    def self.create_github_user(current_user)
      service = GithubService.new(current_user)
      profile_info = service.get_user_info(current_user)
      followers = service.get_followers(current_user)
      following = service.get_following(current_user)
      starred = service.get_starred_repos(current_user)
      repos = service.get_repos(current_user)
      GithubUser.new(profile_info, followers, starred, repos)
    end

end
