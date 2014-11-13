class SessionsController < ApplicationController
  before_filter :authenticate_user_and_redirect, :only => [:profile, :setting]
  before_filter :save_login_state, :only => [:login, :login_attempt]

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  def login
  end

  def login_attempt
    authorized_user = User.authenticate(params[:username_or_email], params[:login_password])
    if authorized_user
      session[:user_id] = authorized_user.id
      redirect_to root_path
      flash[:notice] = "You logged in as #{authorized_user.email}"
    else
      redirect_to(:controller => 'sessions', :action => 'login')
      flash[:danger] = "Wrong username or password"
    end
  end
end
