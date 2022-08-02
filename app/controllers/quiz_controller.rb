class QuizController < ApplicationController

  def list
    @Quiz = Quiz.all
  end
  def intro
    previous_scores = Score.where(quizz_id: params[:id], user_id: current_user.id)
    @attempts = previous_scores.length
    @id = params[:id]
  end
end
