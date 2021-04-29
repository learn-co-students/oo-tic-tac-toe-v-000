class TicTacToe
  def initialize
    @board = Array.new(9," ")
  end
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
  ]
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def input_to_index(number)
    number = number.to_i - 1
  end
  def move(index, token)
    @board[index] = token
  end
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  def valid_move?(index)
    !position_taken?(index) && index.between?(0, 8)
  end
  def turn
    puts "Please enter 1-9:"
    token = current_player
    number = gets.strip
    index = input_to_index(number)
    if valid_move?(index)
      move(index, token)
      display_board
    else
      turn
    end
  end
  def turn_count
    counter = 0
    @board.each do |token|
      if token == "X" || token == "O"
        counter += 1
      end
    end
    return counter
  end
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  def won?
    WIN_COMBINATIONS.each do |win|
      if win.all? {|position| @board[position] == "X"}
        return win
      elsif win.all? {|position| @board[position] == "O"}
        return win
      end
    end
    return false
  end
  def full?
    @board.all? { |index| index == "X" || index == "O"}
  end
  def draw?
    !won? && full?
  end
  def over?
    if won?
      return true
    elsif draw?
      return true
    end
  end
  def winner
    win_array = won?
    if win_array == false
      return nil
    elsif win_array.all? { |index| @board[index] == "X" }
      return "X"
    elsif win_array.all? { |index| @board[index] == "O" }
      return "O"
    end
  end
  def play
    until over?
      turn
    end
    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
