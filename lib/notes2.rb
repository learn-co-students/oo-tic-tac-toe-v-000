
rspec spec/01_tic_tac_toe_spec.rb  
rspec spec/02_play_spec.rb   
rspec spec/03_cli_spec.rb    
spec_helper.rb



########################################
########### gets to 3, won't stop ######

  def play
    until over?
    turn
    end
      if over? && won?
        puts "Congratulations " + @board[(won?)[0]]+"!"
      else over? && draw?
        puts "Cats Game!"
      end
    end


########################################
########### gets to 3, won't stop ######

  def play
    until over?
    turn
    end
      if won?
        puts "Congratulations " + @board[(won?)[0]]+"!"
      end
      else draw?
        puts "Cats Game!"
      end

########################################
########################################
######## stops & gets to 4 #############
## just because of the count < 4
## turn is still not happening

def play
  count = 0
  while count < 4 && over? == false
  turn 
  over?
  count +=1
    end
  if won?
    puts "Congratulations " + @board[(won?)[0]]+"!"
  else draw?
    puts "Cats Game!"
  end
end
########################################
########################################
######## stops & gets to 5 #############
def play
  count = 0
  while count < 3 && over? == false
  turn 
  over?
  count +=1
    end
  if won?
    puts "Congratulations " + @board[(won?)[0]]+"!"
  if draw?
    puts "Cats Game!"
  end
  end
end
########################################
########### gets to 3, won't stop ######

def play
  while over? == false #|| turn_count < 10
  turn 
  over?
    end
  if won?
    puts "Congratulations " + @board[(won?)[0]]+"!"
  else draw?
    puts "Cats Game!"
  end
end

########### gets to 3, won't stop ######
  # def play
  #   until over?
  #   turn
  #   end
  #   if won?
  #     puts "Congratulations " + @board[(won?)[0]]+"!"
  #   else draw?
  #     puts "Cats Game!"
  #   end
  # end
########################################
########################################


      # asks for players input on a turn of the game
      # checks if the game is over after every turn (FAILED - 1)
      # plays the first turn of the game (FAILED - 2)
      # plays the first few turns of the game (FAILED - 3)
      # checks if the game is won after every turn (FAILED - 4)
      # checks if the game is draw after every turn (FAILED - 5)
      # stops playing if someone has won (FAILED - 6)
      # congratulates the winner X (FAILED - 7)
      # congratulates the winner O (FAILED - 8)
      # stops playing in a draw (FAILED - 9)
      # prints "Cats Game!" on a draw (FAILED - 10)
      # plays through an entire game (FAILED - 11)

