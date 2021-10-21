class ApplicationController < ActionController::Base
  # redirecting to appropriate url based on role
  def user_url(user)
    if user.admin?
      dashboard_path
    else
      root_path
    end
  end
end
