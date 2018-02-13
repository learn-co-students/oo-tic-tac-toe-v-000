class TicTacToe

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    index = (user_input.to_i) - 1
    return index
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] == " " ? false : true
  end

  def valid_move?(index)
    (index.between?(0, 8) && @board[index] == " ") ? true : false
  end

  def turn_count
    return @board.select{|i| i != " "}.length
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index) == true
      move(index, token = current_player)
      display_board
    else
      turn
    end
  end

  def won?
    if @board != [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    WIN_COMBINATIONS.detect do |combo|
     if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
       return combo
     elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
       return combo
     else
       false
     end
    end
   end
 end

  def full?
    @board.select{|i| i != " "}.length == 9 ? true : false
  end

  def draw?
    full? && !won? ? true : false
  end

  def over?
    won? || full? ? true : false
  end

  def winner
    if combo = won?
      return @board[combo.first]
    else
      return nil
    end
  end

  def play
    until over? || draw?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
