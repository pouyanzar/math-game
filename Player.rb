class Player
  
  attr_accessor :name, :life

  def initialize 
    @name = set_player_name
    @life = 3
  end

  def set_player_name
    puts "Enter your name: "
    name = gets.chomp
  end

  def subtract_life(player)
    player.life = player.life - 1
  end

  def check_life(player)
    player[life]
  end
  
end