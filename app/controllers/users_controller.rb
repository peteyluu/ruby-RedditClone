class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      redirect_to subs_url
    else
      flash.now[:errors] = "Username and/or Password Invalid!"
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end