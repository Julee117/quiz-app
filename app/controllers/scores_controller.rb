class ScoresController < ApplicationController
  def show
  end

  def create
    @quiz = Quiz.find(params[:quiz])
    if params[:choice].keys.length != @quiz.questions.length
      flash[:alert] = "Please answer all the questions"
      redirect_to quiz_path(@quiz)
    else
      user_score = current_user.get_score(params[:choice])
      @user = current_user
      @user.add_attribute_value(params[:quiz])
      @score = @user.scores.build(quiz_id: params[:quiz], value: user_score.to_i)
      respond_to do |format|
        if @score.save
          format.html { redirect_to users_path }
          format.json {render json: @user, status: 200}
        else
          format.html { redirect_to quiz_path(@quiz) }
          format.json { render json: @score.errors, status: 422 }
        end
      end
    end
  end
end
