class TicTacToe
  #initializes a new board array and when the TicTacToe class is instantiated, sets it to the instance variable @board
  def initialize(board = nil)
   @board = board || Array.new(9, " ")
  end

  #this method desplays the board
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  WIN_COMBINATIONS = [
  [0, 1, 2], #top row win
  [3, 4, 5], #middle row win
  [6, 7, 8], #bottom row win
  [0, 3, 6], #left column win
  [1, 4, 7], #middle column win
  [2, 5, 8], #Right column win
  [0, 4, 8], #upper left to bottom right diagonal win
  [2, 4, 6]]  #upper right to bottom left diagonal win
  #This method lets us see how many turns have gone by

  def input_to_index(input)
     input = input.to_i
     if (input >= 1 and input <= 9)
       input = input - 1
       return (input)
     else
       return (-1)
     end
  end

  def move(position_index, player_token = "X")
     @board[position_index] = player_token
  end

  #this method checks if the refered to position on the board is taken
  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      return false
    else
      return true
    end
  end

  
  #this method tests if the inputed position for the game board is a valid move or not
  #it tests to see if the index value is correct and if the position is taken or not
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)

    if valid_move?(index) == true
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
     @board.count{|token| token == "X" || token == "O"}
  end


  #this method tells us who the current player is based on how many turns have gone by
  def current_player
  turn_count % 2 == 0 ? "X" : "O"
  end

 def won?
   WIN_COMBINATIONS.any? do |win_combination|  #iterating through the WIN_COMBINATIONS constant, to find any cases of true
     if win_combination.all? {|index| @board[index] == "X"}
       return win_combination
     elsif win_combination.all? {|index| @board[index] == "O"}
       return win_combination
     end
   end
 end

 def full? #tests to see if the board is full of player tokens, returns true or false
    @board.all? do |position|
      position == "X" || position == "O"
    end
 end

 def draw?
    !won? && full?
 end

 def over?
    won? || full? || draw?
 end

 def winner
   if won? == false  # returns nil if won? is false
     return nil
   elsif won?.all?{|position| @board[position] == "X"} #if all of the positions returned from wom? contain "X" then returns "X"
     return "X"
   elsif won?.all?{|position| @board[position] == "O"}  #if all of the positions returned from wom? contain "O" then returns "O"
    return "O"
   end
 end

 def play
    while !over? #a while loop that tests for the game to be over, while the game is not over call the turn method.
      turn
    end
    if over?
      if draw? #puts Cat's Game! if a draw
        puts "Cat's Game!"
      else
        puts "Congratulations #{winner}!"
      end
    end
  end


end
