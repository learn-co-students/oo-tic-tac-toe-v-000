class TicTacToe

  def initialize(board=nil)
    @board = board || Array.new(9, " ")
  end

  def board
    @board
  end

  WIN_COMBINATIONS = [
top_row_win = [0, 1, 2],
middle_row_win = [3, 4, 5],
bottoom_row_win = [6, 7, 8],
first_vertical_win = [0, 3, 6],
second_vertical_win = [1, 4, 7],
third_vertical_win = [2, 5, 8],
top_right_win = [0, 4, 8],
top_left_win = [6, 4, 2 ]
]



  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location, player_token = "X")
    @board[location.to_i - 1] = current_player
  end

  def position_taken?(position)
    !(@board[position.to_i].nil? || board[position.to_i] == " ")
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def turn
    puts "Please enter 1-9"
    position=gets.chomp
    if valid_move?(position)
      move(position)
    else
      turn
    end
    display_board
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect { |combo|
      (@board[combo[0]] == @board[combo[1]] &&
       @board[combo[1]] == @board[combo[2]] &&
       position_taken?(combo[0])) }
  end

  def full?
    @board.all? { |location| location != " "}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    if winning_combo = won?
      @board[winning_combo.first]
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

end
