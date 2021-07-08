class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [2,4,6],
    [0,4,8]
  ]

  def initialize
    @board = Array.new(9," ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "   
  end

  def move(position, player)
    @board[position - 1] = player
  end

  def position_taken?(position)
    @board[position] != " "
  end

  def valid_move?(input)
    (1..9).include?(input.to_i) && @board[input.to_i - 1] == " "
  end

  def turn
    input = gets.chomp
    until valid_move?(input)
      puts "Invalid move. Please re-enter."
      # binding.pry
      input = gets.chomp
    end
    move(input.to_i, current_player)
    display_board
  end

  def turn_count
    @board.count { |item| item == "X" || item == "O" }
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |triad|
      (@board[triad[0]] == "X" || @board[triad[0]] == "O") && 
          @board[triad[0]] == @board[triad[1]] && @board[triad[1]] == @board[triad[2]]
    end
  end

  def full?
    !@board.include?(" ")
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    won? ? @board[won?[0]] : nil
  end

  def play
    until over?
      turn
    end
    if draw?
      puts "Cats Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end

end