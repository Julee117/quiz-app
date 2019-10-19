class UsersController < ApplicationController
  def index
    @user = current_user
    respond_to do |format|
      format.html
      format.json {render json: @user, status: 200}
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to quizzes_path }
        format.json { render json: @user, status: 201 }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: 422 }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
