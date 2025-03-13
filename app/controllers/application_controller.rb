class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :admin_not_authorized

  def admin_not_authorized
      flash[:alert] = "You are not authorized Person to perform this action."
      redirect_to root_path
  end

  def pundit_user
        current_admin
  end
end
