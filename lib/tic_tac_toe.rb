class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
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

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      return true
    end
    false
  end

  def valid_move?(index)
    return true if index.between?(0,8) && position_taken?(index) == false
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
end

  def current_player
    turn_count % 2 == 0 ? "X":"O"
  end


  def turn
    puts "Select 1-9: "
    input = gets.strip
    index = input_to_index(input)
    token = current_player

    if valid_move?(index) == true
      move(index, token)
      display_board
    else
      turn
    end
  end


end
