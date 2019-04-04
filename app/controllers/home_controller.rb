class HomeController < ApplicationController
  def index
    @user = current_user
    @questions = Answer.can_get_questions?(@user) ? Answer::QUESTIONS : []
  end

  def create_answer
    Answer.create(user: current_user, question_id: 1, answer: params[:answer_question_1])
    Answer.create(user: current_user, question_id: 2, answer: params[:answer_question_2])
    Answer.create(user: current_user, question_id: 3, answer: params[:answer_question_3])
    flash[:success] = "Questions answered succesfully!"
    redirect_to home_path
  end

  def answers
    @user = current_user
    if @user.admin?
      @answers = Answer.all
    else
      flash[:danger] = "Not authorized!"
      redirect_to home_path
    end
  end
end
