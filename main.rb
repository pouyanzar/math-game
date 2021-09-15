require './Player'
require './Question'
require './Game'

raw_questions = []
(1..10).each do |index|
  number1 = rand 10
  number2 = rand 10
  raw_questions.push(Question.new(index, "What does #{number1} plus #{number2} equal?", 
  "#{number1 + number2}"))
end

game = Game.new
questions = game.get_questions(raw_questions)
game.start(questions)
