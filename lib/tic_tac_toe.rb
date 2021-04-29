class TicTacToe 
  ######### initialize
  def initialize(board = nil)
    @board  = board || Array.new(9, " ")
  end
###### WIN_COMBINATIONS
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  ##### display_board ##########
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
   ######### input_to_index #############
   def input_to_index(user_input)
     user_input.to_i - 1
   end
 ############# move ############
 def move(index,current_player = "X")
   @board[index] = current_player
 end
   ##### position_taken ############
   def position_taken?(index_number)
     if @board[index_number] == " " || @board[index_number] == "" || @board[index_number] == nil
       false
     else
       true
   end
  end

   ############# valid_move? ###################
   def valid_move?(index_number)
     if index_number.between?(0,8) && !position_taken?(index_number)
       true
     end
   end

   ############## turn ##########################

   def turn # 1.call the turn method
   puts "Please enter 1-9:" # 1a. asks for input
   user_input = gets #get input
   index = input_to_index(user_input) #convert input to index
   if valid_move?(index)
     move(index, current_player)
     display_board
   else
    turn
    end
  end

   #################### turn_count  ###################

   def turn_count
   #how many turns have been played?
   turns = 0
   @board.each do |count|
   if count == "X" || count == "O"
     turns += 1
   end
    end
     turns
   end
################ current_player ###############
def current_player 
turn_count % 2 == 0 || turn_count == 0 ? "X" : "O"
end

##################### won? ################################
  def won?
  WIN_COMBINATIONS.detect do |winning_elements|
  if  (@board[winning_elements[0]] == "X" && @board[winning_elements[1]] == "X" && @board[winning_elements[2]] == "X") || 
      (@board[winning_elements[0]] == "O" && @board[winning_elements[1]] == "O" && @board[winning_elements[2]] == "O")
      
       winning_elements
     else
        false
      end
    end     
  end

  ######### full? #################
  def full?
    @board.all? do |i|
      i == "X" || i == "O"
    
    end
  end
  ###### draw? #############
  def draw?
    !won? && full?
  end
  ###### over? #########
  def over?
    won? || draw?
  end
######## winner ################
  def winner
    if won?
      
      return @board[won?[0]]
    end
    end
############# play ############
  def play
    while !over?
      turn
    end
    if won?
      puts  "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end

