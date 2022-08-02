class QuestionController < ApplicationController
  require 'net/http'
  require 'net/https'
  def get_from_poke_api(category)
    uri = URI("https://pokeapi.co/api/v2/#{category}/")

    Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
      request = Net::HTTP::Get.new uri
      response = http.request(request).body.to_json
    end
  end


  def show_question
    @array = send_answers_to_user
  end

  def current_quiz
    Quiz.find(params[:id])
  end

  def current_question()
    Question.find_by(quizz_id: current_quiz.id, index: params[:index])
  end

  def get_random_answer_from_pokeapi()
    response = get_from_poke_api(current_quiz.theme)
    response['result'].length
  end

  def send_answers_to_user
    array = [current_question.answer]
    3.times do | i|
      array << "generation #{i}"
    end
    array.shuffle!
  end
end
