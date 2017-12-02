class TicTacToe

WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} \n-----------\n #{@board[3]} | #{@board[4]} | #{@board[5]} \n-----------\n #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, token = "X")
     @board[index] = token
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      return false
    else
      return true
    end
  end

  def valid_move?(index)
    if index.between?(0,8) && !position_taken?(index)
      return true
    else
      return false
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index) == true
      move(index, current_player)
      display_board
    else turn
    end
  end

  def turn_count
    count = 0
    @board.each do |index|
      puts "The number of turns that has been played is #{count}."
      if index == "X" || index == "O"
        count += 1
      end
    end
    count
  end

  def current_player
    turn_count
    if turn_count % 2 == 0
      return "X"
    else turn_count % 2 == 1
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      @board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[0]] == @board[win_combination[2]] && position_taken?(win_combination[0])
    end
  end

  def full?
    @board.all? do |token|
      token == "X" || token == "O"
    end
  end

  def draw?
    full? && !(won?)
  end

  def over?
    won? || draw? || full?
  end

  def winner
    if WIN_COMBINATIONS.include?(won?)
      index = won?[0] #index for board array
      return @board[index]
    end
  end

  def play
    until over?
    turn
    end
    if winner
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cat's Game!"
    end
  end
end
