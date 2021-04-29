class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  #def valid_move?(index)
  #  if index.between?(0,8) && !position_taken?(@board, index)
  #    puts "true"
  #  else
  #    puts "false"
  #  end
  #end

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8], #last row
  [0,3,6],
  [1,4,7], #middle column
  [2,5,8], #right column
  [0,4,8], #diagional 1
  [2,4,6]]

  def input_to_index(input)
    @input = input.to_i - 1
  end

  def move (index, value)
    @board[index] = value
  end

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      return true
    elsif @board[index] == " "
      return false
    end
  end

  def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
  end

  #def turn
  #  puts "Please enter 1-9:"
  #  input = gets.strip
  #  index = @input
  #  value = current_player(@board)
  #  if valid_move?(@board, index)
  #    move(@board, index, value)
  #    display_board(@board)
  #  else
  #    turn(@board)
  #  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    value = current_player
    if valid_move?(index)
      move(index, value)
      display_board
    else
      turn
    end
  end

  def won?
  WIN_COMBINATIONS.each do |combination|
  win_index_1 = combination[0]
  win_index_2 = combination[1]
  win_index_3 = combination[2]

  position_1 = @board[win_index_1] # load the value of the board at win_index_1
  position_2 = @board[win_index_2] # load the value of the board at win_index_2
  position_3 = @board[win_index_3] # load the value of the board at win_index_3

    if position_1 == "X" && position_2 == "X" && position_3 == "X" && position_taken?(win_index_1)
      return combination # return the win_combination indexes that won.
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O" && position_taken?(win_index_1)
      return combination
    end
    end
    return false
    end

    def full?
      @board.each do |space|
        if space == " "
          return false
        end
      end
    end

    def draw?
      if full? && won? ==false
        return true
      end
    end

    def over?
      if full? || won? || draw?
        return true
      else
        return false
      end
    end

    def winner
      if won? == false
        return nil
      else
        @board[won?[0]]
      end
    end

    def play
      until won? || over? || draw?
        turn
      end
      if won?
        puts "Congratulations #{winner}!"
      else draw?
        puts "Cat's Game!"
      end
    end

end
