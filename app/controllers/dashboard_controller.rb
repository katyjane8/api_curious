class DashboardController < ApplicationController
  def show
    @github_service     = GithubService.new(current_user)
    @user_info          = @github_service.get_user_info
    @starred_repo_count = @github_service.get_starred_repos.count
    @followers          = @github_service.get_followers
    @followees          = @github_service.get_following
    @repos              = @github_service.get_repos
    @events             = @github_service.get_events
    @other_events       = @github_service.get_others_events
  end
end
