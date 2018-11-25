class Game
  attr_accessor :user_turn, :total_actions, :new_player
  
  def initialize
    @user_turn = 'X'
    @total_actions = 0
    @new_player
  end

  def winning_patterns
    return [ 
        [1,2,3], [4,5,6], [7,8,9],
        [1,4,7], [2,5,8], [3,6,9], 
        [1,5,9], [3,5,7]
      ] 
  end

  def is_winner(player)
    winning_patterns.each do |pattern|
      intersected = pattern & player.actions
      if intersected.length == 3
        return true
      end
    end
    return false
  end

  def is_finished(player)
    if is_winner(player) == true
      puts "Hurray... #{player.name} Won !"
      return true
    end

    if @total_actions == 9
      puts 'Game Draw...'
      return true
    end
    return false
  end


  def start(playerX, playerY)
    player = @new_player
    player = playerX if player.nil?

    @new_player = play_and_switch(playerX, playerY)
    
    if is_finished(player) === false 
      draw_board(playerX, playerY)
      play(playerX, playerY)
      start(playerX, playerY)
    else
      draw_board(playerX, playerY, 1)
      player.score_increase 
      puts "\nCurrent Score of player #{playerX.name} is #{playerX.score}\nCurrent Score of player #{playerY.name} is #{playerY.score}" 
    end
  end

  def play_and_switch(playerX, playerY)
    if @user_turn == 'Y'
      @user_turn = 'X'
      playerY
    else
      @user_turn = 'Y'
      playerX
    end
  end

  def play(playerX, playerY)
    option = 0
    game_option = 9
    while !(1..game_option).include?(option.to_i)
      puts "\n\n" + @new_player.name + ": Please select position from 1 to #{game_option}:"
      input = gets.chomp.to_i
      option = 0
      option = input if is_valid_input(input, playerX, playerY) === true
    end

    @new_player.actions.push(option.to_i) 
    @new_player.actions = @new_player.actions.sort
    @total_actions += 1
    option
  end

  def is_valid_input(input, playerX, playerY)
    if !playerX.actions.include?(input) && !playerY.actions.include?(input) 
      return true
    else 
      puts "Sorry, already selected"
      return false
    end
  end

  def draw_header(is_finished)
    line = ''
    (0..60).each do |a|
      line += '='
    end

    puts "\n" + line
    if @total_actions == 0
      puts "\n" + line
      puts "\t\tGame Started"
    elsif is_finished == 1
      puts "\t\tGame Finished"
    else 
      puts "\t\tGame (#{@total_actions+1} Turn)"
    end
    puts line + "\n\n"
  end 


  def draw_board(playerX, playerY, is_finished=0)
    draw_header(is_finished)

    count = 1
    string = ''
    (1..3).each do |i|
      string = "\t\t\t\n"
      (1..3).each do |y|
        position = count
        position = playerX.user_type if playerX.actions.include?(count)
        position = playerY.user_type if playerY.actions.include?(count)
        string += "\t|\t" + position.to_s
        count += 1
      end
      puts string + "\t|\n\n"
    end
  end
end
