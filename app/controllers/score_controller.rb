class ScoreController < ApplicationController
  before_action :forbid_guest , only: [:show_user_results, :grade_user]

  def show_all
    @results = get_all_results
  end
  def show_user_results
    @results = get_user_results
  end

  def get_all_results
    result = Score.all.map { |score| {
      "id"=> score.id,
      "passed"=>score.passed,
      "user" => User.find(score.user_id).email, #TODO : add username and change there.
      "quiz" => Quiz.find(score.quizz_id).title,
      "grade"=>score.grade
    }}
    return result.sort_by! { |result| result["grade"] }.reverse!
  end

  def get_user_results
    result = Score.where(user: current_user).map { |score| {
      "id" => score.id,
      "passed"=>score.passed,
      "user" => current_user.email, #TODO : add username and change there.
      "quiz" => Quiz.find(score.quizz_id).title,
      "grade"=>score.grade
    }}
    return result.sort_by! { |result| result["id"] }.reverse!
  end

  def grade_user
    current_quiz = Quiz.find(params[:id])
    current_score = session[:tmp_score].to_i || 0
    current_score = 0 unless current_score < 6 #Don't cheat!
    has_passed = current_score >= 3
    Score.create!(user: current_user, grade: current_score, quizz_id: current_quiz.id, passed: has_passed, score: current_score)
    redirect_to "/score/user"
    session[:tmp_score] = nil
  end

end
