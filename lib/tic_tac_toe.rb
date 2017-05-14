class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  #constants
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

  @turn_count = 0

  #setters

  #getters

  #methods
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index (user_input)
    user_input = user_input.to_i - 1
  end

  def move(index, token="X")
    @board[index] = token
  end

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      return true
    else
      return false
    end
  end

  def valid_move?(index)
    if !position_taken?(index) && (index >= 0 && index < 9)
      return true
    else
      return false
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter=0
    @board.each do |turn|
      if !(turn == "" || turn == " " || turn == nil)
        counter+=1
      end
    end
    return counter
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combination|
      win_index_1 = combination[0]
      win_index_2 = combination[1]
      win_index_3 = combination[2]

      if (@board[win_index_1] == "X" && @board[win_index_2] == "X" && @board[win_index_3] == "X") || (@board[win_index_1] == "O" && @board[win_index_2] == "O" && @board[win_index_3] == "O")
        return combination # return the win_combination indexes that won.
      end
    end
    return false
  end

  def full?
    if @board.all? {|index| (index=="X" || index =="O")}
      return true
    else
      return false
    end
  end

  def draw?
    if full? && !won?
      return true
    elsif won?
      return false
    else
      return false
    end
  end

  def over?
    if won? || draw?
      return true
    else
      return false
    end
  end

  def winner
    if won? != false
      return @board[won?[0]]
    end
  end

  def play
    until over? == true
      turn
    end
    if won? != false
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end
