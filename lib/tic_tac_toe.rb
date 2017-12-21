class TicTacToe

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def initialize(board = [" "," "," "," "," "," "," "," "," "])
    @board = board
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(move)
    move = move.to_i - 1
  end

  def position_taken?(index)
    !(@board[index] == " " || @board[index] == nil)
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    index = input_to_index(gets.strip)
    if valid_move?(index)
      move(index, current_player)
    else
      turn
    end
    display_board
  end

  def won?
    WIN_COMBINATIONS.each do |index|
      if (@board[index[0]] == "X" && @board[index[1]] == "X" && @board[index[2]] == "X") ||
        (@board[index[0]] == "O" && @board[index[1]] == "O" && @board[index[2]] == "O")
        return index
      end
    end
    return
    false
  end

  def full?
    @board.none? {|i| i == " "}
  end

  def draw?
    if full? && !won?
      true
    end
  end

  def over?
    won? || full? || draw?
  end

  def winner
    if winner = won?
      @board[winner[0]]
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
