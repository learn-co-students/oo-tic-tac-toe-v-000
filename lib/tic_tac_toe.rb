class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left columns
  [1,4,7], #middle columns
  [2,5,8], #right column
  [0,4,8], #diagonals
  [2,4,6] #diagonal
  ]
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
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
    count = 0
    @board.each do |spot|
      if spot == "X" or spot == "O"
        count += 1
      end
    end
    return count
  end

  def current_player
    if turn_count % 2 != 0
      return "O"
    else
      return "X"
    end
  end

  def won?
    empty = @board.all? {|spot| spot == " "}
    full = @board.none? {|spot| spot == " "}
    if empty == true
      return false
    elsif
      WIN_COMBINATIONS.each do |win_combo|
        windex_1 = win_combo[0]
        windex_2 = win_combo[1]
        windex_3 = win_combo[2]

        pos_1 = @board[windex_1]
        pos_2 = @board[windex_2]
        pos_3 = @board[windex_3]

        if pos_1 == pos_2 && pos_1 == pos_3 && pos_1 != " "
          return win_combo
        end
      end
    elsif full == true
      return false
    end
  end

  def full?
    @board.none? {|spot| spot == " "}
  end

  def draw?
    full? && !won?
  end

  def over?
    if !draw? && !won?
      return false
    else
      return true
    end
  end

  def winner
    win_combo = won?
    if won?
      return @board[win_combo[0]]
    else
      return nil
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
