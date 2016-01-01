class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
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

  def move(location, current_player = "X")
    @board[location.to_i-1] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def turn_count
    count = 0
    @board.each do |turn|
      if turn == "X" or turn == "O"
      count += 1
      end
    end
    count
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    player = current_player
    if valid_move?(input)
      move(input, player)
    else
      turn
    end
    display_board
  end

  def won?
    WIN_COMBINATIONS.detect do |win_array|
      @board[win_array[0]] == "X" && @board[win_array[1]] == "X" && @board[win_array[2]] == "X" or @board[win_array[0]] == "O" && @board[win_array[1]] == "O" && @board[win_array[2]] == "O"
    end
  end

  def isvalid?(index)
    index == "X" or index == "O"
  end

  def full?
    @board.all?{|index| isvalid? index}
  end

  def draw?
    won? == nil && full?
  end

  def over?
    won? or full? or draw?
  end

  def winner
    if won?
      @board[won?[0]]
    end
  end

  # Define your play method below
  def play
    until over?
      turn_count
      turn
      current_player
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!" 
    end
  end

end






