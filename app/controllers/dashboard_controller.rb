class DashboardController < ApplicationController
  def show
    @github_service     = GithubService.new(current_user)
    @user_info          = @github_service.get_user_info(current_user)
    @starred_repo_count = @github_service.get_starred_repos(current_user).count
    @followers          = @github_service.get_followers(current_user)
    @followees          = @github_service.get_following(current_user)
    @repos              = @github_service.get_repos(current_user)
  end
end
