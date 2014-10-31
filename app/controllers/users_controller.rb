class UsersController < ApplicationController
  before_filter :save_login_state, :only => [:new, :create]

  def new
    if Rails.env.production?
      redirect_to root_path
      flash[:danger] = "Sign up is not available on production!"
    end
  end

  def create
    if Rails.env.production?
      redirect_to root_path
      flash[:danger] = "Sign up is not available on production!"
    else
      @user = User.new(user_params)
      if @user.save!
        session[:user_id] = @user.id
        redirect_to root_path
        flash[:notice] = "You signed up successfully"
      else
        flash[:danger] = "Failed to sign up"
        render "new"
      end
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end  
end
