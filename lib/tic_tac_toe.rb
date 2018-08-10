class TicTacToe

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Mid row
    [6,7,8], # Bottom row
    [0,3,6], # Left col
    [1,4,7], # Mid col
    [2,5,8], # Right col
    [0,4,8], # Left diagonal
    [2,4,6]  # Right diagonal
  ]

  def display_board()
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    return (input.to_i) - 1
  end

  def move(index, token)
    @board[index] = token
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    # Check if index is within 0-8
    if index < 0 || index > 8
      return false
    # Check if position is taken
    elsif position_taken?(index)
      return false
    else
      return true
    end
  end

  def turn()
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      token = current_player
      move(index, token)
      display_board
    else
      turn()
    end
  end

  def turn_count()
    counter = 0
    @board.each do |token|
      if token == "X" || token == "O"
        counter += 1
      end
    end
    return counter
  end

  def current_player()
    if turn_count.even?
      return "X"
    end
    return "O"
  end

  def won?()
    WIN_COMBINATIONS.each do | win_combination |
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1] # load the value of the board at win_index_1
      position_2 = @board[win_index_2] # load the value of the board at win_index_2
      position_3 = @board[win_index_3] # load the value of the board at win_index_3

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination # return the win_combination indexes that won.
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
    return false
  end

  def full?()
    all_full = @board.all? do |number|
      number != " "
    end
  end

  def draw?()
    if won? || !(full?)
      false
    else
      true
    end
  end

  def over?()
    return won? || full? || draw?
  end

  def winner()
    if won?
      return @board[won?()[0]]
    else
      return nil
    end
  end

  def play()
    while !(over?)
      turn()
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
