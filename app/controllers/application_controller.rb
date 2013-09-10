class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  protect_from_forgery
  helper_method :current_project

  private
  #def after_sign_in_path_for
   # redirect projects_path
 # end

  def current_project
    @current_project ||= Project.limit(1).where('id = ?', session[:project_id]).sample
  end
end
