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

  def move(location, player = "X")
    @location = location.to_i - 1
    @player = player
    @board[@location] = @player
  end

  def position_taken?(position)
    @position = position.to_i
    (@board[@position] == "X" || @board[@position] == "O")
  end

  def valid_move?(position)
    @position = position.to_i - 1
    !position_taken?(@position) && @position.to_i.between?(0,8)
  end

  def turn
    puts "Where would you like to go? Enter 1-9:"
    @user_move = gets.strip

    if valid_move?(@user_move)
      move(@user_move, player = current_player)
    else
      turn
    end
    display_board
  end

  def turn_count
    @board.count{|cell| cell == "X" || cell == "O"}
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |combination|
      if combination.all? {|cell| position_taken?(cell) && @board[cell] == "X"} ||\
        combination.all? {|cell| position_taken?(cell) && @board[cell] == "O"}
        return combination
      end
    end
    return false
  end

  def full?
    @board.none?{|cell| cell.nil? || cell == " "}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    if won? && over?
      if won?.length > 0
        return @board[won?[0]]
      end
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end
end