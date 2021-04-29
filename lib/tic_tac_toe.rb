class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

  def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    return "#{user_input}".to_i - 1
  end

  def move(index, token = "X")
    return @board[index] = token
  end

  def position_taken?(index)
    !(@board[index] == " " || @board[index] == "" || @board[index] == nil)
  end

  def valid_move?(index)
    !(position_taken?(index)) && index.between?(0, 8)
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, token = current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do | move |
      if move == "X" || move == "O"
        puts counter += 1
      end
    end
    counter #This should be the number of turns
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do | win_combination |
        (@board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X")||
        (@board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O")
    end
  end

  def full?
    @board.all? do |spot|
      (spot == "X") || (spot == "O")
    end
  end

  def draw?
    if (!full? && !won?) || won?
      false
    elsif full?
      true
    end
  end

  def over?
    draw? || full? || won?
  end

  def winner
    won = won? #get the indexes of the winning player
    if won # if it did not return false, you can also use an array check
      @board[won[0]] # return the item on the board at the winning index
    end
  end

  def play
    token = current_player
    until over?
      turn
    end
    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    else
      puts "Cat's Game!"
    end
  end
end
