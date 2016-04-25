class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:destroy]
  layout 'bare'

  def new
  end

  def signin
    if params[:clear] == 'yes'
      session[:return_url] = '/'
    end
  end

  def create
    params.permit!
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    puts "#{user.id} logged in".green
    puts current_user
    redirect_url = session[:return_url] || '/'
    session[:return_url] = '/'
    if redirect_url.blank? || redirect_url.split('#')[0] == '/' || redirect_url.split('#')[0].blank?
      render 'destroy_window'
    else
      puts redirect_url.inspect.red
      redirect_to redirect_url, notice: "Signed in!"
    end
  end

  def destroy
    session[:user_id] = nil
    if request.method_symbol == :get
      # puts "#{request.method_symbol} !".green
      redirect_to root_url, notice: "Signed out!"
    else
      # puts "Well".green
      render nothing: true
    end
  end

  def failure
    redirect_to root_url, alert: "Authentication failed, please try again."
  end

  private
  def sessions_params
    params.require(:sessions).permit(:name, :phone, :email, :uid, :oauth_token, :email, :provider, :oauth_expires_at)
  end

  def user_params
    params.require(:user).permit(:provider, :uid, :name, :oauthtoken, :oauthexpiresat)
  end
end