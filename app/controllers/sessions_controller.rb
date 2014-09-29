class SessionsController < ApplicationController
  before_filter :authenticate_user_and_redirect, :only => [:profile, :setting]
  before_filter :save_login_state, :only => [:login, :login_attempt]  

  def logout
    session[:user_id] = nil
    redirect_to :action => 'login'
  end

  def login
    authorized_user = User.authenticate(params[:username_or_email], params[:login_password])
    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.username}"
      redirect_to(:controller => 'arts', :action => 'index')
    else
      flash[:notice] = "Wrong username or password"
      render "login"
    end
  end
end