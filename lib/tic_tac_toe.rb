class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  WIN_COMBINATIONS = [[0,1,2],[0,3,6],[0,4,8],[1,4,7],[2,5,8],[2,4,6],[3,4,5],[6,7,8]]

  def won?
    WIN_COMBINATIONS.detect do|win|
      if @board[win[0]] == "X" && @board[win[1]] == "X" && @board[win[2]] == "X"
        true
      elsif @board[win[0]] == "O" && @board[win[1]] == "O" && @board[win[2]] == "O"
        true
        return win
      end
    end
  end

  def full?
    @board.all? do |space|
      if space == "X" || space == "O"
        true
      end
    end
  end

  def draw?
    if !!full? && !won?
      true
    end
  end

  def over?
    if !!draw? || !!won? || !!full?
      true
    end
  end

  def winner
    @board[won?[0]] if won?
  end

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

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, player)
    @board[index] = player
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

  def play
  while !over?
    turn
  end
  if winner == "X"
    puts "Congratulations X!"
  elsif winner == "O"
    puts "Congratulations O!"
  elsif !!draw?
    puts "Cat's Game!"
  end
 end
end
