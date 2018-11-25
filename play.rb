require_relative 'game.rb'
require_relative 'player.rb'

class Play

  def start
    selections = Game.new
    puts "\n1st Player Name: "
    playerX = Player.new(gets.chomp.capitalize, 'X')

    puts "\n2nd Player Name: "
    playerY = Player.new(gets.chomp.capitalize, 'O')

    selections.start(playerX, playerY)
  end

end

game_initialize = Play.new
game_initialize.start
