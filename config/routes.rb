Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root to: 'home#index'
  get "/quizzes", to: "quiz#list"
  get "/quizz/:id", to: "quiz#intro"
  get "results/:id/:index", to: "score#grade_user"
  get "quizz/:id/:index", to: "question#show_question"
  post "quizz/:id/:index", to: "question#evaluate_answer"
  get "score/all", to: "score#show_all"
  get "score/user", to: "score#show_user_results"
  get "*", to: 'home#index'
  post "question/answer", to: 'question#get_user_answer'
end
