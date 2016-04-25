class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :is_super_admin?
  helper_method :is_admin?
  helper_method :is_logged_in?

  def current_user
    # session[:user_id] = 1
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def is_super_admin?
    current_user && current_user.is_super_admin?
  end
  def is_admin?
    current_user && current_user.is_admin?
  end
  def is_logged_in?
    current_user.present?
  end

  def requires_super_admin
    requires_that is_super_admin?
  end
  def requires_admin
    requires_that is_admin?
  end
  def requires_student
    requires_that is_student?
  end
  def requires_logged_in
    requires_that is_logged_in?
  end


  def requires_that(thing, message='Admins Only')
    if thing
      true
    else
      flash[:error] = message
      session[:return_url] = request.env['PATH_INFO']
      if is_logged_in? || request.format == 'json'
        redirect_to "/permissions.#{request.format.symbol}"
      else
        redirect_to '/auth/google_oauth2'
      end
      false #this keeps it from doing anything else
    end
  end
end
