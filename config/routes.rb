Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root to: 'home#index'
  get "/quizzes", to: "quiz#list"
  get "/quizz/:id", to: "quiz#intro"
  get "quizz/:id/:index", to: "question#show_question"
end
