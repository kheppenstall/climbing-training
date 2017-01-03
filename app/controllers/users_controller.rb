class UsersController < ApplicationController

  skip_before_action :require_login, only: [:new, :create]
  skip_before_action :verify_user, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Account successfully created!"
      redirect_to login_path
    else
      flash[:danger] = @user.errors.full_messages.first
      render :new
    end
  end

  def show
    
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end