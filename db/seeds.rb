# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

Question.destroy_all
Score.destroy_all
Quiz.destroy_all
User.destroy_all

first_quiz = Quiz.create!(title: "Types per generation!", theme: "type")
random_user = User.create!(email: "arrvac@yopmail.com", password: "password")
Question.create!(prompt: "fire", index:1 ,answer: "generation-i", quizz_id: first_quiz.id)
Question.create!(prompt: "fairy", index:2 ,answer: "generation-vi", quizz_id: first_quiz.id)
Question.create!(prompt: "steel", index:3 ,answer: "generation-ii", quizz_id: first_quiz.id)
Question.create!(prompt: "shadow", index:4 ,answer: "generation-iii", quizz_id: first_quiz.id)
Question.create!(prompt: "dark", index:5 ,answer: "generation-iii", quizz_id: first_quiz.id)
second_quiz = Quiz.create!(title: "Pokemons per generation!", theme: "pokemon")
Question.create!(prompt: "Ditto", index:1 ,answer: "generation-i", quizz_id: second_quiz.id)
Question.create!(prompt: "Aegislash", index:2 ,answer: "generation-vi", quizz_id: second_quiz.id)
Question.create!(prompt: "Articuno", index:3 ,answer: "generation-i", quizz_id: second_quiz.id)
Question.create!(prompt: "Porygon-Z", index:4 ,answer: "generation-iv", quizz_id: second_quiz.id)
Question.create!(prompt: "Darkrai", index:5 ,answer: "generation-iv", quizz_id: second_quiz.id)
Score.create!(user_id: random_user.id, passed: true, grade: 5, quizz_id: first_quiz.id)
Score.create!(user_id: random_user.id, passed: false, grade: 2, quizz_id: first_quiz.id)
Score.create!(user_id: random_user.id, passed: true, grade: 4, quizz_id: second_quiz.id)
Score.create!(user_id: random_user.id, passed: false, grade: 1, quizz_id: second_quiz.id)
