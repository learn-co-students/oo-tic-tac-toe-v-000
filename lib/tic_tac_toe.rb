class TicTacToe

  def initialize(board = nil)
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    #horizontal
    [0,1,2],
    [3,4,5],
    [6,7,8],
    #vertical
    [0,3,6],
    [1,4,7],
    [2,5,8],
    #diagonal
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
    integer = user_input.to_i
    integer - 1
  end

  def move(index, token)
    @board[index] = token
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if position_taken?(index) || index.between?(0,8) == false
      return false
    else
      return true
    end
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      token = current_player()
      move(index, token)
      display_board()
    else
      turn()
    end
  end

  def turn_count
    @board.count do |taken|
      taken == "X" || taken == "O"
    end
  end

  def current_player
    if turn_count() % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.select do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_1 =="X" && position_2 =="X" && position_3 == "X" || position_1 =="O" && position_2 =="O" && position_3 == "O"
        return win_combination
      end
    end

    if @board == [" "," "," "," "," "," "," "," "," "]
      return nil
    end

  end

  def full?
    @board.none? {|board_index| board_index == " " }
  end

  def draw?
    full?() && !won?()
  end

  def over?
    won?() || draw?() || full?()
  end

  def winner
    if won?()
      extract_index = won?()[0]
      return @board[extract_index]
    else
      return nil
    end
  end

  def play()
    if !over?()
      turn()
      play()
    end

    if won?()
      if winner()["X"]
        puts "Congratulations X!"
      elsif winner()["O"]
        puts "Congratulations O!"
      end
    elsif draw?()
      puts "Cat's Game!"
    end
  end

end
