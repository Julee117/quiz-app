class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to users_path
    else
      flash[:alert] = "Invalid email/password"
      render :new
    end
  end

  def destroy
    if session[:user_id]
      session.delete(:user_id)
      redirect_to "/login"
    else
      redirect_to users_path
    end
  end
end
