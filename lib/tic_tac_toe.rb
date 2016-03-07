class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3 ,6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2],
  ]

  def display_board
    puts row1 = " #{@board[0]} " + "|" + " #{@board[1]} " + "|" + " #{@board[2]} "
    puts row2 = "-----------"
    puts row3 = " #{@board[3]} " + "|" + " #{@board[4]} " + "|" + " #{@board[5]} "
    puts row2 = "-----------"
    puts row5 = " #{@board[6]} " + "|" + " #{@board[7]} " + "|" + " #{@board[8]} "
  end

  def move(position, value="X") 
  #this method marks selects a position on the board. It uses the board array, a positon (which
  # is translated into an index of the array), and a value to mark on the board. 
    @board[position.to_i - 1] = value
  end

  def position_taken?(position)
    !(@board[position.to_i] == " " || @board[position.to_i].nil?)
  end

  def valid_move?(position)
    !position_taken?(position.to_i-1) && position.to_i.between?(1, 9)
  end

  def turn_count
    @board.count{|x| x != " "}
  end

  def current_player
    if turn_count % 2 == 1
      "O"
     else
      "X"
    end
  end

  def turn
  # combine the #display_board, #move, #valid_move?, and #position_taken? methods to create a full turn
    print "It's #{current_player}\'s move. "
    puts "Please enter 1-9:"
    input = gets.chomp.strip.to_i
    until valid_move?(input) == true #keep asking the player to make a move until they make a valid selection
      print "That's not a valid move. "
      puts "Please enter 1-9:"
      input = gets.chomp.strip.to_i
      valid_move?(input)
    end
    value = current_player #find out who the current player is, then pass it to #move
    move(input, value)
    display_board
  end

  # DEFINE OTHER GAME METHODS #

  def full? #check if the board is full
    @board.each_with_index do |position, index|
      if position_taken?(index) == false 
        return false
      end
    end
    return true
  end

  def won? #check if a player won  the game by comparing the board to win combinations
    WIN_COMBINATIONS.each do |combo| #for each win combination, check if the number located at combo[index] is occuped on the board
      if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
        return combo
      elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
        return combo
      else
        false
      end
    end
    return false
  end 

  def draw? #check if there is a draw
    won? == false && full?
  end

  def over? #check if the game is over
    won? != false || draw?
  end 

  def winner #return the winner
    if won? != false
      combo = won?
      @board[combo[0]]
    end
  end

  def play
    display_board
    until over?
      turn
    end
    if won?!= false
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cats Game!"
      else
        nil
    end
  end

end