class Question

  attr_accessor :id, :question, :answer

  def initialize(id, question, answer)
    @id = id
    @question = question
    @answer = answer
  end

  def self.check_answer(user_answer,answer)
    user_answer == answer
  end
end