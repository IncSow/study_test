class QuestionController < ApplicationController
  require 'net/http'
  require 'net/https'
  before_action :forbid_guest
  def get_from_poke_api(category, index="")
    uri = URI("https://pokeapi.co/api/v2/#{category}/#{index}")
    Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
      request = Net::HTTP::Get.new uri
      http.request(request).body
    end
  end

  #This function works when the theme is "pokemon". Sadly, I did not have time to do more with it. But you can see what I was aiming for.
  def get_random_sprites_from_pokeapi()
    response = get_from_poke_api(current_quiz.theme)
    count = JSON.parse(response)["count"]
    JSON.parse(get_from_poke_api(current_quiz.theme, rand(count)))["sprites"]["front-default"]
  end

  def send_answers_to_user
    array = [current_question.answer]
    other_generations = ["generation-i", "generation-ii", "generation-iii", "generation-iv", "generation-v", "generation-vi"]
    #if current_quiz.theme == 'type'
    3.times do
      random = 1
      while array.include?(other_generations[random])
          random = rand(other_generations.length)
      end
      array << other_generations[random]
    end
    # else
    #   3.times do
    #     array << get_random_sprites_from_pokeapi
    #   end
    # end
    array.shuffle!
  end

  def show_question
    @array = send_answers_to_user
    @question = current_question.prompt
    @question_index = params[:index]
    @theme = current_quiz.theme
  end

  def current_quiz
    Quiz.find(params[:id])
  end

  def current_question()
    if params[:index] == "1"
      session[:tmp_score] = 0 # Separation of concerns ? bouuuh.
    end
    Question.find_by(quizz_id: current_quiz.id, index: params[:index])
  end

  def evaluate_answer
    payload = params["answer"]
    if payload.nil?
      redirect_to "/quizz/#{params[:id]}/#{params[:index]}", :notice => 'You need to submit an answer!.'
      return
    end 
    
    if payload["answer"] == current_question.answer
      session[:tmp_score] += 1 # Why do I still bother with the @score then? Keeping it in as a reminder of my past failures.
    end
    redirect_user
  end

  def redirect_user
    puts "#{params[:index]} is current indexu"
    if params[:index] == "5" # I struggled for fifteen minutes wondering why it wasn't working. I wish I had typechecking for this case, fuck.
      redirect_to("/results/#{params[:id]}/#{params[:index]}")
    else
      redirect_to("/quizz/#{params[:id]}/#{params[:index].to_i+1}")
    end
  end
end
