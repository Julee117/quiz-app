class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show, :edit, :update]

  def index
    @quizzes = Quiz.all
    respond_to do |format|
      format.html
      format.json { render json: @quizzes, status: 200 }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @quiz, include: 'questions.choices', status: 200 }
    end
  end

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

  def update
    respond_to do |format|
      if @quiz.update(quiz_params)
        format.html { redirect_to quiz_path(@quiz) }
        format.json { render json: @quiz, status: 200 }
      else
        format.html { render :edit }
        format.json { render json: @quiz.errors, status: 404 }
      end
    end
  end

  private

  def set_quiz
    @quiz = Quiz.find(params[:id])
  end

  def quiz_params
    params.require(:quiz).permit(:name, questions_attributes: [:_destroy, :id, :content, choices_attributes: [:_destroy, :id, :content, :correct, :question_id]])
  end
end
