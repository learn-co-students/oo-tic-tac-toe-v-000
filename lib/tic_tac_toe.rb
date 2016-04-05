class TicTacToe
    WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2]]


  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

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
    @board[location] != " " && @board[location] !=""
  end


  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input) && turn_count.even?
      move(input, "X")
    elsif valid_move?(input) && turn_count.odd?
      move(input, "O")
    else
      turn
    end
    display_board
  end

  def turn_count
   counter = 0
    @board.each do |token|
    if token == "X" || token == "O"
       counter += 1
    end
    end
    counter
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
  WIN_COMBINATIONS.detect do |set|
    @board[set[0]] == @board[set[1]] && @board[set[1]] == @board[set[2]] &&
    position_taken?(set[0])
    end
  end

  def full?
    !@board.include?(" " || "")
  end

  def draw?
    !won? && full?
  end

  def over?
    if won? || draw?
      true
    end
  end

  def winner
    if winning_set = won?
      @board[winning_set.first]
    end
  end

  def play
    puts "Players turn"
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end


