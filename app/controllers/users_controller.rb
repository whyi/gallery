class UsersController < ApplicationController
  before_filter :save_login_state, :only => [:new, :create]

  def new
    @user = User.new 
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      flash[:notice] = "You signed up successfully"
    else
      flash[:danger] = "Failed to sign up"
      render "new"
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end  
end
