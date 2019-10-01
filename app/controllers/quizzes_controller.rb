class QuizzesController < ApplicationController
  def new
    @quiz = Quiz.new
    @quiz.questions.build
    @quiz.questions.each do |question|
      question.choices.build
    end
  end

  def edit
  end

  def create
    @quiz = Quiz.new(quiz_params)

    respond_to do |format|
      if @quiz.save
        format.html { redirect_to quiz_path(@quiz) }
        format.json { render json: @quiz, status: 201 }
      else
        format.html { render :new }
        format.json { render json: @quiz.errors, status: 422 }
      end
    end
  end

  private

  def quiz_params
    params.require(:quiz).permit(:name, questions_attributes: [:id, :content, choices_attributes: [:id, :content, :correct, :question_id]])
  end
end
