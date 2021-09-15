require './Player'
require './Question'

class Game
  
  attr_accessor :id, :name, :turn, :players

  def initialize
    @id = rand 100
    @players = [
      Player.new,
      Player.new
    ]
    @turn = players[0]
  end

  def get_questions(raw_questions)
    questions = raw_questions.map do |question|
      {
        id: question.id,
        question: question.question,
        answer: question.answer
      }
    end
    questions
  end

  def set_turn(turn)
    @turn = turn
  end

  def change_turn
    turn_index = players.find_index(turn)
    if turn_index == 0
      set_turn(players[1])
    else
      set_turn(players[0])
    end
  end

  def game_over
    change_turn
    puts "\n#{turn.name} wins with a score of #{turn.life}/3"
    puts "\n------- GAME OVER --------"
    puts "\nGood bye!"
  end

  def start(questions)
    no_winner = true
    while no_winner do
      question_number = rand 10
      puts "\n#{turn.name}: #{questions[question_number][:question]}"
      answer = gets.chomp
      is_currect = Question.check_answer(questions[question_number][:answer], answer)
      if is_currect
        puts "\n#{turn.name}: YES! You are correct!"
      else
        puts "\n#{turn.name}: SERIOUSLY? No!"
        turn.subtract_life(turn) 
      end
      if turn.life == 0
        no_winner = false
        game_over
      else
        change_turn
        puts "\n#{players[0].name}: #{players[0].life}/3 vs #{players[1].name}: #{players[1].life}/3\n"
        puts "\n------- NEW TURN --------"
      end
    end
  end
end
