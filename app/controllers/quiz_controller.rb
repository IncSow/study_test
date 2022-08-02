class QuizController < ApplicationController
  before_action :forbid_guest
  def list
    @Quiz = get_all_quizzes

  end
  def intro
    previous_scores = Score.where(quizz_id: params[:id], user_id: current_user.id)
    @attempts = previous_scores.length
    @id = params[:id]
  end

  def get_all_quizzes
    quizzes = Quiz.all.map { |quiz| {"infos"=>quiz, "played"=> Score.where(quizz_id: quiz.id).length}    }
    return quizzes
  end


end
