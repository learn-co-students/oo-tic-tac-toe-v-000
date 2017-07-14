class TicTacToe
  # instance means initialized copy of this class
  def initialize(board = Array.new(9," "))
    @board  = board
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move (index, characters)
    @board[index] = characters
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(index)
    if !position_taken?(index) && index.between?(0,8)
      true
    end
  end

  def turn
    puts "Please enter 1-9:"
    users_input = gets.strip
    index = input_to_index(users_input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else valid_move?(index)
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |element|
      if element == "X" || element == "O"
        counter += 1
      end
    end
     counter
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
       return win_combination
      else
        false
      end
    end
    false
  end

  def full?
    @board.all? do |i|
      i != " "
    end
  end

  def draw?
    if !won? && full?
      true
    end
  end
  def over?
    if draw? || won?
      true
    end
  end

  def winner
    if !won?
  return nil
    elsif (@board[won?[0]] == "X")
      return "X"
    elsif (@board[won?[0]] == "O")
      return "O"
   end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    end
    if draw?
      puts "Cat's Game!"
    end
   end
end
